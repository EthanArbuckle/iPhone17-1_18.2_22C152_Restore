@interface WebHistoryItem
+ (id)entryWithURL:(id)a3;
- (BOOL)_hasCachedPageExpired;
- (BOOL)_isInBackForwardCache;
- (BOOL)_scaleIsInitial;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTargetItem;
- (BOOL)lastVisitWasFailure;
- (CGPoint)_scrollPoint;
- (CGPoint)scrollPoint;
- (NSString)URLString;
- (NSString)alternateTitle;
- (NSString)originalURLString;
- (NSString)title;
- (NSTimeInterval)lastVisitedTimeInterval;
- (WebHistoryItem)init;
- (WebHistoryItem)initWithURL:(id)a3 title:(id)a4;
- (WebHistoryItem)initWithURLString:(NSString *)URLString title:(NSString *)title lastVisitedTimeInterval:(NSTimeInterval)time;
- (WebHistoryItem)initWithURLString:(id)a3 title:(id)a4 displayTitle:(id)a5 lastVisitedTimeInterval:(double)a6;
- (WebHistoryItem)initWithWebCoreHistoryItem:(void *)a3;
- (float)_scale;
- (id)RSSFeedReferrer;
- (id)URL;
- (id)_redirectURLs;
- (id)_viewportArguments;
- (id)children;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dictionaryRepresentationIncludingChildren:(BOOL)a3;
- (id)initFromDictionaryRepresentation:(id)a3;
- (id)target;
- (unint64_t)hash;
- (void)_setScale:(float)a3 isInitial:(BOOL)a4;
- (void)_setScrollPoint:(CGPoint)a3;
- (void)_setViewportArguments:(id)a3;
- (void)_visitedWithTitle:(id)a3;
- (void)dealloc;
- (void)setAlternateTitle:(NSString *)alternateTitle;
- (void)setRSSFeedReferrer:(id)a3;
- (void)setTitle:(id)a3;
- (void)setViewState:(id)a3;
@end

@implementation WebHistoryItem

- (WebHistoryItem)init
{
  {
    uint64_t v3 = LegacyHistoryItemClient::singleton(void)::client;
  }
  else
  {
    uint64_t v3 = WTF::fastMalloc((WTF *)0x10);
    *(_DWORD *)(v3 + 8) = 1;
    *(void *)uint64_t v3 = &unk_1F3C792B0;
    LegacyHistoryItemClient::singleton(void)::client = v3;
  }
  v15 = 0;
  v16 = 0;
  v14 = 0;
  uint64_t v4 = WTF::fastMalloc((WTF *)0x1D0);
  v18[0] = 0;
  v18[16] = 0;
  MEMORY[0x1E4E44A20](v4, v3, &v16, &v15, &v14, v18);
  v17 = (_DWORD *)v4;
  v6 = [(WebHistoryItem *)self initWithWebCoreHistoryItem:&v17];
  v7 = v17;
  v17 = 0;
  if (v7)
  {
    if (*v7 == 1)
    {
      v12 = (WTF *)MEMORY[0x1E4E44A30]();
      WTF::fastFree(v12, v13);
      v8 = v14;
      v14 = 0;
      if (!v8) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    --*v7;
  }
  v8 = v14;
  v14 = 0;
  if (!v8) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v8 == 2) {
    WTF::StringImpl::destroy(v8, v5);
  }
  else {
    *(_DWORD *)v8 -= 2;
  }
LABEL_10:
  v9 = v15;
  v15 = 0;
  if (!v9) {
    goto LABEL_13;
  }
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
LABEL_13:
    v10 = v16;
    v16 = 0;
    if (!v10) {
      return v6;
    }
    goto LABEL_16;
  }
  WTF::StringImpl::destroy(v9, v5);
  v10 = v16;
  v16 = 0;
  if (!v10) {
    return v6;
  }
LABEL_16:
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return v6;
  }
  WTF::StringImpl::destroy(v10, v5);
  return v6;
}

- (WebHistoryItem)initWithURLString:(NSString *)URLString title:(NSString *)title lastVisitedTimeInterval:(NSTimeInterval)time
{
  v7 = URLString;
  {
    uint64_t v9 = LegacyHistoryItemClient::singleton(void)::client;
  }
  else
  {
    uint64_t v21 = WTF::fastMalloc((WTF *)0x10);
    v7 = URLString;
    uint64_t v9 = v21;
    *(_DWORD *)(v21 + 8) = 1;
    *(void *)uint64_t v21 = &unk_1F3C792B0;
    LegacyHistoryItemClient::singleton(void)::client = v21;
  }
  MEMORY[0x1E4E442D0](&v24, v7);
  MEMORY[0x1E4E442D0](&v23, title);
  v22 = 0;
  uint64_t v10 = WTF::fastMalloc((WTF *)0x1D0);
  v26[0] = 0;
  v26[16] = 0;
  MEMORY[0x1E4E44A20](v10, v9, &v24, &v23, &v22, v26);
  v25 = (_DWORD *)v10;
  v12 = [(WebHistoryItem *)self initWithWebCoreHistoryItem:&v25];
  v13 = v25;
  v25 = 0;
  if (v13)
  {
    if (*v13 == 1)
    {
      v18 = (WTF *)MEMORY[0x1E4E44A30]();
      WTF::fastFree(v18, v19);
      v14 = v22;
      v22 = 0;
      if (!v14) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    --*v13;
  }
  v14 = v22;
  v22 = 0;
  if (!v14) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v14 == 2) {
    WTF::StringImpl::destroy(v14, v11);
  }
  else {
    *(_DWORD *)v14 -= 2;
  }
LABEL_10:
  v15 = v23;
  v23 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
    {
      WTF::StringImpl::destroy(v15, v11);
      v16 = v24;
      v24 = 0;
      if (!v16) {
        goto LABEL_19;
      }
      goto LABEL_16;
    }
    *(_DWORD *)v15 -= 2;
  }
  v16 = v24;
  v24 = 0;
  if (!v16) {
    goto LABEL_19;
  }
LABEL_16:
  if (*(_DWORD *)v16 == 2) {
    WTF::StringImpl::destroy(v16, v11);
  }
  else {
    *(_DWORD *)v16 -= 2;
  }
LABEL_19:
  v12->_private->_lastVisitedTime = time;
  return v12;
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (_MergedGlobals_18)
    {
      p_superclass = WebDatabaseManager.superclass;
      if (!qword_1EB3A97A0) {
        goto LABEL_22;
      }
      m_ptr = self->_private->_historyItem.m_ptr;
      int v7 = *(_DWORD *)(qword_1EB3A97A0 - 8);
      unint64_t v8 = ((unint64_t)m_ptr + ~((void)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((void)m_ptr << 32)) >> 22);
      unint64_t v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
      unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
      unsigned int v11 = v7 & ((v10 >> 31) ^ v10);
      for (i = 1; ; unsigned int v11 = (v11 + i++) & v7)
      {
        uint64_t v13 = *(void *)(qword_1EB3A97A0 + 16 * v11);
        if (v13 != -1)
        {
          if (!v13) {
            goto LABEL_22;
          }
          if (*(HistoryItem **)(v13 + 8) == m_ptr) {
            break;
          }
        }
      }
      if (v11 == *(_DWORD *)(qword_1EB3A97A0 - 4)) {
        goto LABEL_22;
      }
      v14 = (void *)(qword_1EB3A97A0 + 16 * v11);
      void *v14 = 0;
      if (atomic_fetch_add((atomic_uint *volatile)v13, 0xFFFFFFFF) == 1)
      {
        atomic_store(1u, (unsigned int *)v13);
        v20 = v14;
        WTF::fastFree((WTF *)v13, v4);
        v14 = v20;
        p_superclass = (__objc2_class **)(WebDatabaseManager + 8);
      }
      void *v14 = -1;
      v15 = p_superclass[244];
      ++LODWORD(v15[-1].vtable);
      if (v15)
      {
        --HIDWORD(v15[-1].vtable);
        v16 = p_superclass[244];
        if (!v16) {
          goto LABEL_22;
        }
LABEL_16:
        unsigned int v17 = 6 * HIDWORD(v16[-1].vtable);
        unsigned int info_high = HIDWORD(v16[-1].info);
        if (v17 < info_high && info_high >= 9) {
          WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(info_high >> 1);
        }
        goto LABEL_22;
      }
      MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
      v16 = p_superclass[244];
      if (v16) {
        goto LABEL_16;
      }
    }
    else
    {
      qword_1EB3A97A0 = 0;
      _MergedGlobals_18 = 1;
    }
LABEL_22:

    v21.receiver = self;
    v21.super_class = (Class)WebHistoryItem;
    [(WebHistoryItem *)&v21 dealloc];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  WebCore::HistoryItem::copy((uint64_t *)&v31, (WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  v5 = (void *)[v4 initWithWebCoreHistoryItem:&v31];
  v6 = v31;
  v31 = 0;
  if (v6)
  {
    if (*v6 == 1)
    {
      int v7 = (WTF *)MEMORY[0x1E4E44A30]();
      WTF::fastFree(v7, v8);
    }
    else
    {
      --*v6;
    }
  }
  *(double *)(v5[1] + 16) = self->_private->_lastVisitedTime;
  if (_MergedGlobals_18)
  {
    uint64_t v9 = *(void *)(v5[1] + 8);
    uint64_t v10 = *(void *)(v9 + 8);
    if (!v10) {
      goto LABEL_7;
    }
  }
  else
  {
    qword_1EB3A97A0 = 0;
    _MergedGlobals_18 = 1;
    uint64_t v9 = *(void *)(v5[1] + 8);
    uint64_t v10 = *(void *)(v9 + 8);
    if (!v10)
    {
LABEL_7:
      uint64_t v10 = WTF::fastCompactMalloc((WTF *)0x10);
      *(_DWORD *)uint64_t v10 = 1;
      *(void *)(v10 + 8) = v9;
      v12 = *(unsigned int **)(v9 + 8);
      *(void *)(v9 + 8) = v10;
      if (v12)
      {
        if (atomic_fetch_add((atomic_uint *volatile)v12, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, v12);
          WTF::fastFree((WTF *)v12, v11);
        }
        uint64_t v10 = *(void *)(v9 + 8);
      }
    }
  }
  atomic_fetch_add((atomic_uint *volatile)v10, 1u);
  uint64_t v13 = qword_1EB3A97A0;
  if (qword_1EB3A97A0
    || (WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(8u),
        (uint64_t v13 = qword_1EB3A97A0) != 0))
  {
    unsigned int v14 = *(_DWORD *)(v13 - 8);
  }
  else
  {
    unsigned int v14 = 0;
  }
  v15 = 0;
  uint64_t v16 = *(void *)(v10 + 8);
  unint64_t v17 = (~(v16 << 32) + v16) ^ ((unint64_t)(~(v16 << 32) + v16) >> 22);
  unint64_t v18 = 9 * ((v17 + ~(v17 << 13)) ^ ((v17 + ~(v17 << 13)) >> 8));
  unint64_t v19 = (v18 ^ (v18 >> 15)) + ~((v18 ^ (v18 >> 15)) << 27);
  int v20 = (v19 >> 31) ^ v19;
  for (int i = 1; ; ++i)
  {
    uint64_t v22 = v20 & v14;
    v23 = (uint64_t *)(v13 + 16 * v22);
    uint64_t v24 = *v23;
    if (*v23 == -1)
    {
      v15 = (uint64_t *)(v13 + 16 * v22);
      goto LABEL_16;
    }
    if (!v24)
    {
      if (v15)
      {
        uint64_t *v15 = 0;
        v15[1] = 0;
        --*(_DWORD *)(v13 - 16);
        uint64_t *v15 = v10;
        v15[1] = (uint64_t)v5;
        uint64_t v26 = qword_1EB3A97A0;
        if (qword_1EB3A97A0) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t *v23 = v10;
        v23[1] = (uint64_t)v5;
        uint64_t v26 = qword_1EB3A97A0;
        if (qword_1EB3A97A0)
        {
LABEL_25:
          ++*(_DWORD *)(v26 - 12);
          uint64_t v27 = qword_1EB3A97A0;
          if (qword_1EB3A97A0) {
            goto LABEL_26;
          }
          goto LABEL_32;
        }
      }
      *(_DWORD *)(v26 - 12) = 1;
      uint64_t v27 = qword_1EB3A97A0;
      if (qword_1EB3A97A0)
      {
LABEL_26:
        uint64_t v28 = (*(_DWORD *)(v27 - 16) + *(_DWORD *)(v27 - 12));
        unint64_t v29 = *(unsigned int *)(v27 - 4);
        if (v29 <= 0x400) {
          goto LABEL_27;
        }
        goto LABEL_33;
      }
LABEL_32:
      uint64_t v28 = *(unsigned int *)(v27 - 16);
      unint64_t v29 = *(unsigned int *)(v27 - 4);
      if (v29 <= 0x400)
      {
LABEL_27:
        if (3 * v29 > 4 * v28) {
          return v5;
        }
        if (!v29)
        {
          unsigned int v30 = 8;
LABEL_35:
          WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(v30);
          return v5;
        }
LABEL_34:
        unsigned int v30 = v29 << (6 * *(_DWORD *)(v27 - 12) >= (2 * v29));
        goto LABEL_35;
      }
LABEL_33:
      if (v29 > 2 * v28) {
        return v5;
      }
      goto LABEL_34;
    }
    if (*(void *)(v24 + 8) == v16) {
      break;
    }
LABEL_16:
    int v20 = i + v22;
  }
  *(void *)(v13 + 16 * v22 + 8) = v5;
  if (v10 && atomic_fetch_add((atomic_uint *volatile)v10, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)v10);
    WTF::fastFree((WTF *)v10, v15);
    return v5;
  }
  return v5;
}

- (NSString)URLString
{
  uint64_t v2 = *(void *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!v2 || !*(_DWORD *)(v2 + 4)) {
    return 0;
  }
  return (NSString *)WTF::StringImpl::operator NSString *();
}

- (NSString)originalURLString
{
  uint64_t v2 = *(void *)WebCore::HistoryItem::originalURLString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!v2 || !*(_DWORD *)(v2 + 4)) {
    return 0;
  }
  return (NSString *)WTF::StringImpl::operator NSString *();
}

- (NSString)title
{
  uint64_t v2 = *(void *)WebCore::HistoryItem::title((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!v2 || !*(_DWORD *)(v2 + 4)) {
    return 0;
  }
  return (NSString *)WTF::StringImpl::operator NSString *();
}

- (void)setAlternateTitle:(NSString *)alternateTitle
{
  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1E4E442D0](&v6, alternateTitle);
  WebCore::HistoryItem::setAlternateTitle((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v6);
  v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (NSString)alternateTitle
{
  uint64_t v2 = *(void *)WebCore::HistoryItem::alternateTitle((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!v2 || !*(_DWORD *)(v2 + 4)) {
    return 0;
  }
  return (NSString *)WTF::StringImpl::operator NSString *();
}

- (NSTimeInterval)lastVisitedTimeInterval
{
  return self->_private->_lastVisitedTime;
}

- (unint64_t)hash
{
  if (*(void *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr))
  {
    uint64_t v2 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else
  {
    uint64_t v2 = &stru_1F3C7DA90;
  }
  return [(__CFString *)v2 hash];
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    v6 = (WTF **)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
    int v7 = *(const WTF::StringImpl **)WebCore::HistoryItem::urlString(*(WebCore::HistoryItem **)(*((void *)a3 + 1) + 8));
    uint64_t v9 = *v6;
    LOBYTE(v5) = WTF::equal(v9, v7, v8);
  }
  return v5;
}

- (id)description
{
  m_ptr = self->_private->_historyItem.m_ptr;
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v15.receiver = self;
  v15.super_class = (Class)WebHistoryItem;
  id v4 = [(WebHistoryItem *)&v15 description];
  if (*(void *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)m_ptr)) {
    int v5 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    int v5 = &stru_1F3C7DA90;
  }
  v6 = (void *)[v3 stringWithFormat:@"%@ %@", v4, v5];
  uint64_t v7 = *(void *)WebCore::HistoryItem::target((WebCore::HistoryItem *)m_ptr);
  if (v7 && *(_DWORD *)(v7 + 4))
  {
    if (*(void *)WebCore::HistoryItem::target((WebCore::HistoryItem *)m_ptr)) {
      unint64_t v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      unint64_t v8 = &stru_1F3C7DA90;
    }
    [v6 appendFormat:@" in \"%@\"", v8];
  }
  if (WebCore::HistoryItem::isTargetItem((WebCore::HistoryItem *)m_ptr)) {
    [v6 appendString:@" *target*"];
  }
  if (WebCore::HistoryItem::formData((WebCore::HistoryItem *)m_ptr)) {
    [v6 appendString:@" *POST*"];
  }
  if (!*(_DWORD *)(WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr) + 12)) {
    return v6;
  }
  uint64_t v9 = WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr);
  id result = (id)[v6 length];
  int v11 = (int)result;
  uint64_t v12 = *(unsigned int *)(v9 + 12);
  if (!v12)
  {
LABEL_19:
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\n    ", 0, v11, objc_msgSend(v6, "length") - v11);
    return v6;
  }
  unint64_t v13 = 0;
  while (v13 < *(unsigned int *)(v9 + 12))
  {
    unsigned int v14 = kit(*(WebCore::HistoryItem **)(*(void *)v9 + 8 * v13));
    [v6 appendString:@"\n"];
    id result = (id)objc_msgSend(v6, "appendString:", -[WebCore::HistoryItem description](v14, "description"));
    if (v12 == ++v13) {
      goto LABEL_19;
    }
  }
  __break(0xC471u);
  return result;
}

+ (id)entryWithURL:(id)a3
{
  uint64_t v3 = (void *)CFMakeCollectable((CFTypeRef)[objc_alloc((Class)a1) initWithURL:a3 title:0]);
  return v3;
}

- (WebHistoryItem)initWithURLString:(id)a3 title:(id)a4 displayTitle:(id)a5 lastVisitedTimeInterval:(double)a6
{
  id v9 = a3;
  {
    uint64_t v11 = LegacyHistoryItemClient::singleton(void)::client;
  }
  else
  {
    uint64_t v23 = WTF::fastMalloc((WTF *)0x10);
    id v9 = a3;
    uint64_t v11 = v23;
    *(_DWORD *)(v23 + 8) = 1;
    *(void *)uint64_t v23 = &unk_1F3C792B0;
    LegacyHistoryItemClient::singleton(void)::client = v23;
  }
  MEMORY[0x1E4E442D0](&v26, v9);
  MEMORY[0x1E4E442D0](&v25, a4);
  MEMORY[0x1E4E442D0](&v24, a5);
  uint64_t v12 = WTF::fastMalloc((WTF *)0x1D0);
  v28[0] = 0;
  v28[16] = 0;
  MEMORY[0x1E4E44A20](v12, v11, &v26, &v25, &v24, v28);
  uint64_t v27 = (_DWORD *)v12;
  unsigned int v14 = [(WebHistoryItem *)self initWithWebCoreHistoryItem:&v27];
  objc_super v15 = v27;
  uint64_t v27 = 0;
  if (v15)
  {
    if (*v15 == 1)
    {
      int v20 = (WTF *)MEMORY[0x1E4E44A30]();
      WTF::fastFree(v20, v21);
      uint64_t v16 = v24;
      uint64_t v24 = 0;
      if (!v16) {
        goto LABEL_10;
      }
      goto LABEL_7;
    }
    --*v15;
  }
  uint64_t v16 = v24;
  uint64_t v24 = 0;
  if (!v16) {
    goto LABEL_10;
  }
LABEL_7:
  if (*(_DWORD *)v16 == 2) {
    WTF::StringImpl::destroy(v16, v13);
  }
  else {
    *(_DWORD *)v16 -= 2;
  }
LABEL_10:
  unint64_t v17 = v25;
  v25 = 0;
  if (!v17) {
    goto LABEL_13;
  }
  if (*(_DWORD *)v17 != 2)
  {
    *(_DWORD *)v17 -= 2;
LABEL_13:
    unint64_t v18 = v26;
    uint64_t v26 = 0;
    if (!v18) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  WTF::StringImpl::destroy(v17, v13);
  unint64_t v18 = v26;
  uint64_t v26 = 0;
  if (!v18) {
    goto LABEL_18;
  }
LABEL_16:
  if (*(_DWORD *)v18 == 2)
  {
    WTF::StringImpl::destroy(v18, v13);
    if (!v14) {
      return v14;
    }
    goto LABEL_19;
  }
  *(_DWORD *)v18 -= 2;
LABEL_18:
  if (v14) {
LABEL_19:
  }
    v14->_private->_lastVisitedTime = a6;
  return v14;
}

- (WebHistoryItem)initWithWebCoreHistoryItem:(void *)a3
{
  v32.receiver = self;
  v32.super_class = (Class)WebHistoryItem;
  id v4 = [(WebHistoryItem *)&v32 init];
  if (v4)
  {
    int v5 = objc_alloc_init(WebHistoryItemPrivate);
    v4->_private = v5;
    v6 = *(HistoryItem **)a3;
    *(void *)a3 = 0;
    m_ptr = v5->_historyItem.m_ptr;
    v5->_historyItem.m_ptr = v6;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 1)
      {
        unsigned int v30 = (WTF *)MEMORY[0x1E4E44A30]();
        WTF::fastFree(v30, v31);
        if (_MergedGlobals_18)
        {
LABEL_6:
          unint64_t v8 = v4->_private->_historyItem.m_ptr;
          uint64_t v9 = *((void *)v8 + 1);
          if (!v9) {
            goto LABEL_7;
          }
          goto LABEL_11;
        }
LABEL_31:
        qword_1EB3A97A0 = 0;
        _MergedGlobals_18 = 1;
        unint64_t v8 = v4->_private->_historyItem.m_ptr;
        uint64_t v9 = *((void *)v8 + 1);
        if (!v9)
        {
LABEL_7:
          uint64_t v9 = WTF::fastCompactMalloc((WTF *)0x10);
          *(_DWORD *)uint64_t v9 = 1;
          *(void *)(v9 + 8) = v8;
          uint64_t v11 = (unsigned int *)*((void *)v8 + 1);
          *((void *)v8 + 1) = v9;
          if (v11)
          {
            if (atomic_fetch_add((atomic_uint *volatile)v11, 0xFFFFFFFF) == 1)
            {
              atomic_store(1u, v11);
              WTF::fastFree((WTF *)v11, v10);
            }
            uint64_t v9 = *((void *)v8 + 1);
          }
        }
LABEL_11:
        atomic_fetch_add((atomic_uint *volatile)v9, 1u);
        uint64_t v12 = qword_1EB3A97A0;
        if (qword_1EB3A97A0
          || (WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(8u),
              (uint64_t v12 = qword_1EB3A97A0) != 0))
        {
          unsigned int v13 = *(_DWORD *)(v12 - 8);
        }
        else
        {
          unsigned int v13 = 0;
        }
        unsigned int v14 = 0;
        uint64_t v15 = *(void *)(v9 + 8);
        unint64_t v16 = (~(v15 << 32) + v15) ^ ((unint64_t)(~(v15 << 32) + v15) >> 22);
        unint64_t v17 = 9 * ((v16 + ~(v16 << 13)) ^ ((v16 + ~(v16 << 13)) >> 8));
        unint64_t v18 = (v17 ^ (v17 >> 15)) + ~((v17 ^ (v17 >> 15)) << 27);
        int v19 = (v18 >> 31) ^ v18;
        for (int i = 1; ; ++i)
        {
          uint64_t v21 = v19 & v13;
          uint64_t v22 = (uint64_t *)(v12 + 16 * v21);
          uint64_t v23 = *v22;
          if (*v22 == -1)
          {
            unsigned int v14 = (uint64_t *)(v12 + 16 * v21);
          }
          else
          {
            if (!v23)
            {
              if (v14)
              {
                uint64_t *v14 = 0;
                v14[1] = 0;
                --*(_DWORD *)(v12 - 16);
                uint64_t *v14 = v9;
                v14[1] = (uint64_t)v4;
                uint64_t v25 = qword_1EB3A97A0;
                if (qword_1EB3A97A0) {
                  goto LABEL_25;
                }
LABEL_34:
                *(_DWORD *)(v25 - 12) = 1;
                uint64_t v26 = qword_1EB3A97A0;
                if (!qword_1EB3A97A0) {
                  goto LABEL_35;
                }
LABEL_26:
                uint64_t v27 = (*(_DWORD *)(v26 - 16) + *(_DWORD *)(v26 - 12));
                unint64_t v28 = *(unsigned int *)(v26 - 4);
                if (v28 <= 0x400) {
                  goto LABEL_27;
                }
LABEL_36:
                if (v28 > 2 * v27) {
                  return v4;
                }
                goto LABEL_38;
              }
              uint64_t *v22 = v9;
              v22[1] = (uint64_t)v4;
              uint64_t v25 = qword_1EB3A97A0;
              if (!qword_1EB3A97A0) {
                goto LABEL_34;
              }
LABEL_25:
              ++*(_DWORD *)(v25 - 12);
              uint64_t v26 = qword_1EB3A97A0;
              if (qword_1EB3A97A0) {
                goto LABEL_26;
              }
LABEL_35:
              uint64_t v27 = *(unsigned int *)(v26 - 16);
              unint64_t v28 = *(unsigned int *)(v26 - 4);
              if (v28 > 0x400) {
                goto LABEL_36;
              }
LABEL_27:
              if (3 * v28 > 4 * v27) {
                return v4;
              }
              if (v28) {
LABEL_38:
              }
                unsigned int v29 = v28 << (6 * *(_DWORD *)(v26 - 12) >= (2 * v28));
              else {
                unsigned int v29 = 8;
              }
              WTF::HashTable<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>,WebHistoryItem *,WTF::DefaultHash<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebHistoryItem *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::HistoryItem,WTF::DefaultWeakPtrImpl>>>::rehash(v29);
              return v4;
            }
            if (*(void *)(v23 + 8) == v15)
            {
              *(void *)(v12 + 16 * v21 + 8) = v4;
              if (v9 && atomic_fetch_add((atomic_uint *volatile)v9, 0xFFFFFFFF) == 1)
              {
                atomic_store(1u, (unsigned int *)v9);
                WTF::fastFree((WTF *)v9, v14);
                return v4;
              }
              return v4;
            }
          }
          int v19 = i + v21;
        }
      }
      --*(_DWORD *)m_ptr;
    }
    if (_MergedGlobals_18) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1E4E442D0](&v6, a3);
  WebCore::HistoryItem::setTitle((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v6);
  int v5 = v6;
  v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (void)setViewState:(id)a3
{
}

- (id)initFromDictionaryRepresentation:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  int v5 = objc_msgSend(a3, "_webkit_stringForKey:", &stru_1F3C7DA90);
  uint64_t v6 = objc_msgSend(a3, "_webkit_stringForKey:", @"title");
  uint64_t v7 = objc_msgSend(a3, "_webkit_stringForKey:", @"lastVisitedDate");
  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }
  uint64_t v10 = -[WebHistoryItem initWithURLString:title:displayTitle:lastVisitedTimeInterval:](self, "initWithURLString:title:displayTitle:lastVisitedTimeInterval:", v5, v6, objc_msgSend(a3, "_webkit_stringForKey:", @"displayTitle"), v9);
  if (([v5 canBeConvertedToEncoding:5] & 1) == 0)
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "_webkit_URLWithUserTypedString:", v5), "_web_originalDataAsString");
    m_ptr = (WebCore::HistoryItem *)v10->_private->_historyItem.m_ptr;
    MEMORY[0x1E4E442D0](&v61, v11);
    WebCore::HistoryItem::setURLString(m_ptr, (const WTF::String *)&v61);
    unsigned int v14 = (WTF::StringImpl *)v61;
    IntPoint v61 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2) {
        WTF::StringImpl::destroy(v14, v13);
      }
      else {
        *(_DWORD *)v14 -= 2;
      }
    }
    uint64_t v15 = (WebCore::HistoryItem *)v10->_private->_historyItem.m_ptr;
    MEMORY[0x1E4E442D0](&v61, v11);
    WebCore::HistoryItem::setOriginalURLString(v15, (const WTF::String *)&v61);
    unint64_t v17 = (WTF::StringImpl *)v61;
    IntPoint v61 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v16);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
  }
  if (objc_msgSend(a3, "_webkit_BOOLForKey:", @"lastVisitWasFailure")) {
    *((unsigned char *)v10->_private->_historyItem.m_ptr + 144) = 1;
  }
  unint64_t v18 = objc_msgSend(a3, "_webkit_arrayForKey:", @"redirectURLs");
  if (v18)
  {
    WTF::makeVector<WTF::String>(v18, (uint64_t)&v61);
    uint64_t v19 = WTF::fastMalloc((WTF *)0x10);
    *(void *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = 0;
    IntPoint v21 = v61;
    IntPoint v61 = 0;
    *(IntPoint *)uint64_t v19 = v21;
    v21.var0 = v62;
    int v62 = 0;
    *(_DWORD *)(v19 + 8) = v21.var0;
    v21.var0 = v63;
    unsigned int v63 = 0;
    *(_DWORD *)(v19 + 12) = v21.var0;
    uint64_t v22 = v10->_private;
    value = (WTF *)v22->_redirectURLs.__ptr_.__value_;
    v22->_redirectURLs.__ptr_.__value_ = (void *)v19;
    if (value)
    {
      uint64_t v24 = *((unsigned int *)value + 3);
      if (v24)
      {
        uint64_t v25 = *(WTF::StringImpl ***)value;
        uint64_t v26 = 8 * v24;
        do
        {
          uint64_t v27 = *v25;
          WTF::StringImpl *v25 = 0;
          if (v27)
          {
            if (*(_DWORD *)v27 == 2) {
              WTF::StringImpl::destroy(v27, v20);
            }
            else {
              *(_DWORD *)v27 -= 2;
            }
          }
          ++v25;
          v26 -= 8;
        }
        while (v26);
      }
      unint64_t v28 = *(WTF **)value;
      if (*(void *)value)
      {
        *(void *)value = 0;
        *((_DWORD *)value + 2) = 0;
        WTF::fastFree(v28, v20);
      }
      WTF::fastFree(value, v20);
    }
    if (v63)
    {
      unsigned int v29 = (WTF::StringImpl **)v61;
      uint64_t v30 = 8 * v63;
      do
      {
        v31 = *v29;
        *unsigned int v29 = 0;
        if (v31)
        {
          if (*(_DWORD *)v31 == 2) {
            WTF::StringImpl::destroy(v31, v20);
          }
          else {
            *(_DWORD *)v31 -= 2;
          }
        }
        ++v29;
        v30 -= 8;
      }
      while (v30);
    }
    objc_super v32 = (WTF *)v61;
    if (v61)
    {
      IntPoint v61 = 0;
      int v62 = 0;
      WTF::fastFree(v32, v20);
    }
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v33 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"children", 0), "reverseObjectEnumerator");
  uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v64 count:16];
  if (v34)
  {
    uint64_t v35 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v58 != v35) {
          objc_enumerationMutation(v33);
        }
        v39 = [[WebHistoryItem alloc] initFromDictionaryRepresentation:*(void *)(*((void *)&v57 + 1) + 8 * i)];
        v40 = *(_DWORD **)(v39[1] + 8);
        ++*v40;
        IntPoint v61 = (IntPoint)v40;
        WebCore::HistoryItem::addChildItem();
        v41 = (_DWORD *)v61;
        IntPoint v61 = 0;
        if (v41)
        {
          if (*v41 == 1)
          {
            v37 = (WTF *)MEMORY[0x1E4E44A30]();
            WTF::fastFree(v37, v38);
          }
          else
          {
            --*v41;
          }
        }
        CFRelease(v39);
      }
      uint64_t v34 = [v33 countByEnumeratingWithState:&v57 objects:v64 count:16];
    }
    while (v34);
  }
  v42 = (void *)[a3 objectForKey:@"scale"];
  uint64_t v43 = [a3 objectForKey:@"scaleIsInitial"];
  if (v42)
  {
    v44 = (void *)v43;
    if (v43)
    {
      v45 = v10->_private->_historyItem.m_ptr;
      [v42 floatValue];
      int v47 = v46;
      char v48 = [v44 BOOLValue];
      *((_DWORD *)v45 + 69) = v47;
      *((unsigned char *)v45 + 280) = v48;
    }
  }
  uint64_t v49 = [a3 objectForKey:@"WebViewportArguments"];
  if (v49) {
    [(WebHistoryItem *)v10 _setViewportArguments:v49];
  }
  v50 = (void *)[a3 objectForKey:@"scrollPointX"];
  uint64_t v51 = [a3 objectForKey:@"scrollPointY"];
  if (v50)
  {
    v52 = (void *)v51;
    if (v51)
    {
      v53 = (WebCore::HistoryItem *)v10->_private->_historyItem.m_ptr;
      int v54 = [v50 intValue];
      int v55 = [v52 intValue];
      v61.var0 = v54;
      v61.var1 = v55;
      WebCore::HistoryItem::setScrollPosition(v53, &v61);
    }
  }
  return v10;
}

- (CGPoint)scrollPoint
{
  uint64_t v2 = WebCore::HistoryItem::scrollPosition((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  MEMORY[0x1F41762F0](v2);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_visitedWithTitle:(id)a3
{
  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1E4E442D0](&v8, a3);
  WebCore::HistoryItem::setTitle((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v8);
  uint64_t v6 = v8;
  double v8 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy(v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_private->_lastVisitedTime = v7;
}

- (WebHistoryItem)initWithURL:(id)a3 title:(id)a4
{
  uint64_t v6 = objc_msgSend(a3, "_web_originalDataAsString");
  return [(WebHistoryItem *)self initWithURLString:v6 title:a4 lastVisitedTimeInterval:0.0];
}

- (id)dictionaryRepresentation
{
  return [(WebHistoryItem *)self dictionaryRepresentationIncludingChildren:1];
}

- (id)dictionaryRepresentationIncludingChildren:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:8];
  m_ptr = self->_private->_historyItem.m_ptr;
  uint64_t v7 = *(void *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)m_ptr);
  if (v7 && *(_DWORD *)(v7 + 4))
  {
    if (*(void *)WebCore::HistoryItem::urlString((WebCore::HistoryItem *)m_ptr)) {
      double v8 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      double v8 = &stru_1F3C7DA90;
    }
    [v5 setObject:v8 forKey:&stru_1F3C7DA90];
  }
  uint64_t v9 = *(void *)WebCore::HistoryItem::title((WebCore::HistoryItem *)m_ptr);
  if (v9 && *(_DWORD *)(v9 + 4))
  {
    if (*(void *)WebCore::HistoryItem::title((WebCore::HistoryItem *)m_ptr)) {
      uint64_t v10 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v10 = &stru_1F3C7DA90;
    }
    [v5 setObject:v10 forKey:@"title"];
  }
  uint64_t v11 = WebCore::HistoryItem::alternateTitle((WebCore::HistoryItem *)m_ptr);
  if (*(void *)v11 && *(_DWORD *)(*(void *)v11 + 4))
  {
    if (*(void *)WebCore::HistoryItem::alternateTitle((WebCore::HistoryItem *)m_ptr)) {
      uint64_t v12 = (__CFString *)WTF::StringImpl::operator NSString *();
    }
    else {
      uint64_t v12 = &stru_1F3C7DA90;
    }
    [v5 setObject:v12 forKey:@"displayTitle"];
  }
  double lastVisitedTime = self->_private->_lastVisitedTime;
  if (lastVisitedTime != 0.0) {
    [v5 setObject:objc_msgSend(NSString, "stringWithFormat:", @"%.1lf", *(void *)&self->_private->_lastVisitedTime), @"lastVisitedDate" forKey];
  }
  if (*((unsigned char *)m_ptr + 144)) {
    [v5 setObject:MEMORY[0x1E4F1CC38] forKey:@"lastVisitWasFailure"];
  }
  value = self->_private->_redirectURLs.__ptr_.__value_;
  if (value)
  {
    WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>((uint64_t *)&v25, (uint64_t)value);
    uint64_t v15 = v25;
    [v5 setObject:v25 forKey:@"redirectURLs"];
    if (v15) {
      CFRelease(v15);
    }
  }
  if (!v3 || !*(_DWORD *)(WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr) + 12)) {
    goto LABEL_33;
  }
  uint64_t v16 = WebCore::HistoryItem::children((WebCore::HistoryItem *)m_ptr);
  id result = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:*(unsigned int *)(v16 + 12)];
  id v18 = result;
  int v19 = *(_DWORD *)(v16 + 12);
  unint64_t v20 = (v19 - 1);
  if (v19 - 1 < 0)
  {
LABEL_32:
    [v5 setObject:v18 forKey:@"children"];
LABEL_33:
    LODWORD(lastVisitedTime) = *((_DWORD *)self->_private->_historyItem.m_ptr + 69);
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithFloat:", lastVisitedTime), @"scale");
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", *((unsigned __int8 *)self->_private->_historyItem.m_ptr + 280)), @"scaleIsInitial");
    id v22 = [(WebHistoryItem *)self _viewportArguments];
    if (v22) {
      [v5 setObject:v22 forKey:@"WebViewportArguments"];
    }
    uint64_t v23 = (unsigned int *)WebCore::HistoryItem::scrollPosition((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
    uint64_t v24 = v23[1];
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", *v23), @"scrollPointX");
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", v24), @"scrollPointY");
    return v5;
  }
  while (v20 < *(unsigned int *)(v16 + 12))
  {
    id result = (id)objc_msgSend(v18, "addObject:", -[WebCore::HistoryItem dictionaryRepresentation](kit(*(WebCore::HistoryItem **)(*(void *)v16 + 8 * v20)), "dictionaryRepresentation"));
    if ((uint64_t)v20-- <= 0) {
      goto LABEL_32;
    }
  }
  __break(0xC471u);
  return result;
}

- (id)target
{
  uint64_t v2 = *(void *)WebCore::HistoryItem::target((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!v2 || !*(_DWORD *)(v2 + 4)) {
    return 0;
  }
  return (id)WTF::StringImpl::operator NSString *();
}

- (BOOL)isTargetItem
{
  return WebCore::HistoryItem::isTargetItem((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
}

- (id)RSSFeedReferrer
{
  uint64_t v2 = *(void *)WebCore::HistoryItem::referrer((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!v2 || !*(_DWORD *)(v2 + 4)) {
    return 0;
  }
  return (id)WTF::StringImpl::operator NSString *();
}

- (void)setRSSFeedReferrer:(id)a3
{
  m_ptr = self->_private->_historyItem.m_ptr;
  MEMORY[0x1E4E442D0](&v6, a3);
  WebCore::HistoryItem::setReferrer((WebCore::HistoryItem *)m_ptr, (const WTF::String *)&v6);
  int v5 = v6;
  uint64_t v6 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2) {
      WTF::StringImpl::destroy(v5, v4);
    }
    else {
      *(_DWORD *)v5 -= 2;
    }
  }
}

- (id)children
{
  uint64_t v2 = WebCore::HistoryItem::children((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  if (!*(_DWORD *)(v2 + 12)) {
    return 0;
  }
  uint64_t v3 = v2;
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v2 + 12)];
  uint64_t v5 = *(unsigned int *)(v3 + 12);
  if (v5)
  {
    uint64_t v6 = *(WebCore::HistoryItem ***)v3;
    uint64_t v7 = 8 * v5;
    do
    {
      double v8 = kit(*v6);
      if (v8) {
        [v4 addObject:v8];
      }
      ++v6;
      v7 -= 8;
    }
    while (v7);
  }
  uint64_t v9 = (void *)CFMakeCollectable(v4);
  return v9;
}

- (id)URL
{
  WebCore::HistoryItem::url((uint64_t *)&v7, (WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  uint64_t v3 = v7;
  if (!v7) {
    return 0;
  }
  if (*((_DWORD *)v7 + 1))
  {
    double v4 = (void *)WTF::URL::operator NSURL *();
    uint64_t v3 = v7;
    uint64_t v7 = 0;
    if (!v3) {
      return v4;
    }
    int v5 = *(_DWORD *)v3 - 2;
    if (*(_DWORD *)v3 != 2)
    {
LABEL_5:
      *(_DWORD *)uint64_t v3 = v5;
      return v4;
    }
  }
  else
  {
    double v4 = 0;
    uint64_t v7 = 0;
    int v5 = *(_DWORD *)v3 - 2;
    if (*(_DWORD *)v3 != 2) {
      goto LABEL_5;
    }
  }
  WTF::StringImpl::destroy(v3, v2);
  return v4;
}

- (BOOL)lastVisitWasFailure
{
  return *((unsigned char *)self->_private->_historyItem.m_ptr + 144);
}

- (id)_redirectURLs
{
  value = self->_private->_redirectURLs.__ptr_.__value_;
  if (!value) {
    return 0;
  }
  WTF::createNSArray<WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc> &>((uint64_t *)&cf, (uint64_t)value);
  uint64_t v3 = (void *)CFMakeCollectable(cf);
  return v3;
}

- (void)_setScale:(float)a3 isInitial:(BOOL)a4
{
  m_ptr = self->_private->_historyItem.m_ptr;
  *((float *)m_ptr + 69) = a3;
  *((unsigned char *)m_ptr + 280) = a4;
}

- (float)_scale
{
  return *((float *)self->_private->_historyItem.m_ptr + 69);
}

- (BOOL)_scaleIsInitial
{
  return *((unsigned char *)self->_private->_historyItem.m_ptr + 280);
}

- (id)_viewportArguments
{
  m_ptr = self->_private->_historyItem.m_ptr;
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  LODWORD(v4) = *((_DWORD *)m_ptr + 74);
  uint64_t v5 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v5 forKey:WebViewportInitialScaleKey];
  LODWORD(v6) = *((_DWORD *)m_ptr + 75);
  uint64_t v7 = [NSNumber numberWithFloat:v6];
  [v3 setObject:v7 forKey:WebViewportMinimumScaleKey];
  LODWORD(v8) = *((_DWORD *)m_ptr + 76);
  uint64_t v9 = [NSNumber numberWithFloat:v8];
  [v3 setObject:v9 forKey:WebViewportMaximumScaleKey];
  LODWORD(v10) = *((_DWORD *)m_ptr + 72);
  uint64_t v11 = [NSNumber numberWithFloat:v10];
  [v3 setObject:v11 forKey:WebViewportWidthKey];
  LODWORD(v12) = *((_DWORD *)m_ptr + 73);
  uint64_t v13 = [NSNumber numberWithFloat:v12];
  [v3 setObject:v13 forKey:WebViewportHeightKey];
  LODWORD(v14) = *((_DWORD *)m_ptr + 77);
  uint64_t v15 = [NSNumber numberWithFloat:v14];
  [v3 setObject:v15 forKey:WebViewportUserScalableKey];
  LODWORD(v16) = *((_DWORD *)m_ptr + 79);
  uint64_t v17 = [NSNumber numberWithFloat:v16];
  [v3 setObject:v17 forKey:WebViewportShrinkToFitKey];
  return v3;
}

- (void)_setViewportArguments:(id)a3
{
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportInitialScaleKey), "floatValue");
  int v6 = v5;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportMinimumScaleKey), "floatValue");
  int v8 = v7;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportMaximumScaleKey), "floatValue");
  int v10 = v9;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportWidthKey), "floatValue");
  int v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportHeightKey), "floatValue");
  int v14 = v13;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportUserScalableKey), "floatValue");
  int v16 = v15;
  objc_msgSend((id)objc_msgSend(a3, "objectForKey:", WebViewportShrinkToFitKey), "floatValue");
  m_ptr = self->_private->_historyItem.m_ptr;
  *((unsigned char *)m_ptr + 284) = 0;
  *((_DWORD *)m_ptr + 72) = v12;
  *((_DWORD *)m_ptr + 73) = v14;
  *((_DWORD *)m_ptr + 74) = v6;
  *((_DWORD *)m_ptr + 75) = v8;
  *((_DWORD *)m_ptr + 76) = v10;
  *((_DWORD *)m_ptr + 77) = v16;
  *((_DWORD *)m_ptr + 78) = -1082130432;
  *((_DWORD *)m_ptr + 79) = v18;
  *((_WORD *)m_ptr + 160) = 0;
}

- (CGPoint)_scrollPoint
{
  uint64_t v2 = WebCore::HistoryItem::scrollPosition((WebCore::HistoryItem *)self->_private->_historyItem.m_ptr);
  MEMORY[0x1F41762F0](v2);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_setScrollPoint:(CGPoint)a3
{
  CGPoint v5 = a3;
  m_ptr = self->_private->_historyItem.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v4, &v5);
  WebCore::HistoryItem::setScrollPosition((WebCore::HistoryItem *)m_ptr, &v4);
}

- (BOOL)_isInBackForwardCache
{
  return *((void *)self->_private->_historyItem.m_ptr + 25) != 0;
}

- (BOOL)_hasCachedPageExpired
{
  return MEMORY[0x1F41742B8](self->_private->_historyItem.m_ptr, a2);
}

@end