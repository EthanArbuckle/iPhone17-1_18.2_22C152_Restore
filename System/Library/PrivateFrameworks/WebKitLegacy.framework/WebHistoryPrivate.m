@interface WebHistoryPrivate
+ (void)initialize;
- (BOOL)addItem:(id)a3 discardDuplicate:(BOOL)a4;
- (BOOL)containsURL:(id)a3;
- (BOOL)findKey:(int64_t *)a3 forDay:(double)a4;
- (BOOL)loadFromURL:(id)a3 collectDiscardedItemsInto:(id)a4 error:(id *)a5;
- (BOOL)loadHistoryGutsFromURL:(id)a3 savedItemsCount:(int *)a4 collectDiscardedItemsInto:(id)a5 error:(id *)a6;
- (BOOL)removeAllItems;
- (BOOL)removeItem:(id)a3;
- (BOOL)removeItemForURLString:(id)a3;
- (BOOL)removeItemFromDateCaches:(id)a3;
- (BOOL)removeItems:(id)a3;
- (BOOL)saveToURL:(id)a3 error:(id *)a4;
- (WebHistoryPrivate)init;
- (id).cxx_construct;
- (id)ageLimitDate;
- (id)allItems;
- (id)data;
- (id)itemForURL:(id)a3;
- (id)itemForURLString:(id)a3;
- (id)orderedItemsLastVisitedOnDay:(id)a3;
- (id)orderedLastVisitedDays;
- (id)visitedURL:(id)a3 withTitle:(id)a4;
- (int)historyAgeInDaysLimit;
- (int)historyItemLimit;
- (void)addItemToDateCaches:(id)a3;
- (void)addItems:(id)a3;
- (void)addVisitedLinksToVisitedLinkStore:(void *)a3;
- (void)insertItem:(id)a3 forDateKey:(int64_t)a4;
- (void)rebuildHistoryByDayIfNeeded:(id)a3;
- (void)setHistoryAgeInDaysLimit:(int)a3;
- (void)setHistoryItemLimit:(int)a3;
@end

@implementation WebHistoryPrivate

+ (void)initialize
{
  v2 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v2 registerDefaults:&unk_1F3C9CA80];
}

- (WebHistoryPrivate)init
{
  v13.receiver = self;
  v13.super_class = (Class)WebHistoryPrivate;
  v2 = [(WebHistoryPrivate *)&v13 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    m_ptr = v2->_entriesByURL.m_ptr;
    v2->_entriesByURL.m_ptr = v3;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    v5 = (void *)WTF::fastMalloc((WTF *)8);
    void *v5 = 0;
    value = (WTF *)v2->_entriesByDate.__ptr_.__value_;
    v2->_entriesByDate.__ptr_.__value_ = v5;
    if (value)
    {
      uint64_t v8 = *(void *)value;
      if (*(void *)value)
      {
        uint64_t v9 = *(unsigned int *)(v8 - 4);
        if (v9)
        {
          v10 = (const void **)(v8 + 8);
          do
          {
            if (*(v10 - 1) != (const void *)-1)
            {
              v11 = *v10;
              *v10 = 0;
              if (v11) {
                CFRelease(v11);
              }
            }
            v10 += 2;
            --v9;
          }
          while (v9);
        }
        WTF::fastFree((WTF *)(v8 - 16), v6);
      }
      WTF::fastFree(value, v6);
    }
  }
  return v2;
}

- (BOOL)findKey:(int64_t *)a3 forDay:(double)a4
{
  double v6 = *(double *)&beginningOfDay(double)::cachedBeginningOfDay;
  if (*(double *)&beginningOfDay(double)::cachedBeginningOfDay > a4
    || *(double *)&beginningOfDay(double)::cachedBeginningOfNextDay <= a4)
  {
    uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v9 = (void *)[MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
    double v21 = 0.0;
    id v22 = 0;
    [v9 rangeOfUnit:16 startDate:&v22 interval:&v21 forDate:v8];
    [v22 timeIntervalSinceReferenceDate];
    double v6 = v10;
    beginningOfDay(double)::cachedBeginningOfDay = *(void *)&v10;
    *(double *)&beginningOfDay(double)::cachedBeginningOfNextDay = v10 + v21;
  }
  uint64_t v11 = (uint64_t)v6;
  *a3 = (uint64_t)v6;
  uint64_t v12 = *(void *)self->_entriesByDate.__ptr_.__value_;
  if (!v12) {
    return 0;
  }
  int v13 = *(_DWORD *)(v12 - 8);
  unint64_t v14 = (~(v11 << 32) + v11) ^ ((unint64_t)(~(v11 << 32) + v11) >> 22);
  unint64_t v15 = 9 * ((v14 + ~(v14 << 13)) ^ ((v14 + ~(v14 << 13)) >> 8));
  unint64_t v16 = (v15 ^ (v15 >> 15)) + ~((v15 ^ (v15 >> 15)) << 27);
  unsigned int v17 = v13 & ((v16 >> 31) ^ v16);
  uint64_t v18 = *(void *)(v12 + 16 * v17);
  if (v18 == v11) {
    return 1;
  }
  int v20 = 1;
  do
  {
    BOOL result = v18 != 0;
    if (!v18) {
      break;
    }
    unsigned int v17 = (v17 + v20) & v13;
    uint64_t v18 = *(void *)(v12 + 16 * v17);
    ++v20;
  }
  while (v18 != v11);
  return result;
}

- (void)insertItem:(id)a3 forDateKey:(int64_t)a4
{
  uint64_t v5 = *(void *)self->_entriesByDate.__ptr_.__value_;
  if (!v5)
  {
LABEL_8:
    unint64_t v14 = 0;
    goto LABEL_9;
  }
  unsigned int v6 = *(_DWORD *)(v5 - 8);
  unint64_t v7 = (~(a4 << 32) + a4) ^ ((unint64_t)(~(a4 << 32) + a4) >> 22);
  unint64_t v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
  unint64_t v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
  uint64_t v10 = v6 & ((v9 >> 31) ^ v9);
  uint64_t v11 = *(void *)(v5 + 16 * v10);
  if (v11 != a4)
  {
    int v12 = 1;
    while (v11)
    {
      uint64_t v10 = (v10 + v12) & v6;
      uint64_t v11 = *(void *)(v5 + 16 * v10);
      ++v12;
      if (v11 == a4) {
        goto LABEL_6;
      }
    }
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v13 = v5 + 16 * v10;
  unint64_t v14 = *(void **)(v13 + 8);
  if (v14)
  {
    CFRetain(*(CFTypeRef *)(v13 + 8));
    CFRelease(v14);
  }
LABEL_9:
  [a3 lastVisitedTimeInterval];
  double v16 = v15;
  unsigned int v17 = [v14 count];
  if (v17)
  {
    objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", 0), "lastVisitedTimeInterval");
    uint64_t v18 = 0;
    if (v19 >= v16)
    {
      objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", v17 - 1), "lastVisitedTimeInterval");
      if (v20 >= v16)
      {
        uint64_t v18 = v17;
      }
      else
      {
        LODWORD(v18) = 0;
        do
        {
          unsigned int v21 = v18 + ((v17 - v18) >> 1);
          objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", v21), "lastVisitedTimeInterval");
          if (v22 >= v16) {
            uint64_t v18 = v21 + 1;
          }
          else {
            uint64_t v18 = v18;
          }
          if (v22 < v16) {
            unsigned int v17 = v21;
          }
        }
        while (v18 < v17);
      }
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
  [v14 insertObject:a3 atIndex:v18];
}

- (BOOL)removeItemFromDateCaches:(id)a3
{
  uint64_t v24 = 0;
  [a3 lastVisitedTimeInterval];
  BOOL v5 = -[WebHistoryPrivate findKey:forDay:](self, "findKey:forDay:", &v24);
  if (v5)
  {
    uint64_t v6 = *(void *)self->_entriesByDate.__ptr_.__value_;
    if (v6)
    {
      unsigned int v7 = *(_DWORD *)(v6 - 8);
      unint64_t v8 = (v24 + ~(v24 << 32)) ^ ((unint64_t)(v24 + ~(v24 << 32)) >> 22);
      unint64_t v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
      unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
      uint64_t v11 = v7 & ((v10 >> 31) ^ v10);
      uint64_t v12 = *(void *)(v6 + 16 * v11);
      if (v12 == v24)
      {
LABEL_7:
        unint64_t v14 = (void *)(v6 + 16 * v11);
      }
      else
      {
        int v13 = 1;
        while (v12)
        {
          uint64_t v11 = (v11 + v13) & v7;
          uint64_t v12 = *(void *)(v6 + 16 * v11);
          ++v13;
          if (v12 == v24) {
            goto LABEL_7;
          }
        }
        unint64_t v14 = (void *)(v6 + 16 * *(unsigned int *)(v6 - 4));
      }
    }
    else
    {
      unint64_t v14 = 0;
    }
    double v15 = (void *)v14[1];
    [v15 removeObjectIdenticalTo:a3];
    if (![v15 count])
    {
      value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
      if (*value)
      {
        if ((void *)(*value + 16 * *(unsigned int *)(*value - 4)) == v14) {
          goto LABEL_27;
        }
      }
      else if (!v14)
      {
        goto LABEL_27;
      }
      unsigned int v17 = (const void *)v14[1];
      *unint64_t v14 = -1;
      v14[1] = 0;
      if (v17) {
        CFRelease(v17);
      }
      ++*(_DWORD *)(*value - 16);
      if (*value)
      {
        --*(_DWORD *)(*value - 12);
        uint64_t v18 = *value;
        if (!*value)
        {
LABEL_27:
          m_ptr = self->_orderedLastVisitedDays.m_ptr;
          self->_orderedLastVisitedDays.m_ptr = 0;
          if (m_ptr) {
            CFRelease(m_ptr);
          }
          return v5;
        }
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
        uint64_t v18 = *value;
        if (!*value) {
          goto LABEL_27;
        }
      }
      unsigned int v19 = 6 * *(_DWORD *)(v18 - 12);
      unsigned int v20 = *(_DWORD *)(v18 - 4);
      if (v19 < v20 && v20 >= 9) {
        WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(value, v20 >> 1);
      }
      goto LABEL_27;
    }
  }
  return v5;
}

- (BOOL)removeItemForURLString:(id)a3
{
  uint64_t v5 = objc_msgSend(self->_entriesByURL.m_ptr, "objectForKey:");
  if (!v5) {
    return v5 != 0;
  }
  [self->_entriesByURL.m_ptr removeObjectForKey:a3];
  [(WebHistoryPrivate *)self removeItemFromDateCaches:v5];
  if ([self->_entriesByURL.m_ptr count]) {
    return v5 != 0;
  }
  WebVisitedLinkStore::removeAllVisitedLinks(0, v6);
  return v5 != 0;
}

- (void)addItemToDateCaches:(id)a3
{
  uint64_t v25 = 0;
  id v26 = a3;
  [a3 lastVisitedTimeInterval];
  if (-[WebHistoryPrivate findKey:forDay:](self, "findKey:forDay:", &v25))
  {
    [(WebHistoryPrivate *)self insertItem:a3 forDateKey:v25];
    return;
  }
  uint64_t v5 = (const void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v26 count:1];
  value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
  uint64_t v7 = *value;
  if (*value
    || (WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash((uint64_t *)self->_entriesByDate.__ptr_.__value_, 8u), (uint64_t v7 = *value) != 0))
  {
    int v8 = *(_DWORD *)(v7 - 8);
  }
  else
  {
    int v8 = 0;
  }
  uint64_t v9 = v25;
  unint64_t v10 = (v25 + ~(v25 << 32)) ^ ((unint64_t)(v25 + ~(v25 << 32)) >> 22);
  unint64_t v11 = 9 * ((v10 + ~(v10 << 13)) ^ ((v10 + ~(v10 << 13)) >> 8));
  unint64_t v12 = (v11 ^ (v11 >> 15)) + ~((v11 ^ (v11 >> 15)) << 27);
  unsigned int v13 = v8 & ((v12 >> 31) ^ v12);
  unint64_t v14 = (void *)(v7 + 16 * v13);
  uint64_t v15 = *v14;
  if (*v14)
  {
    double v16 = 0;
    int v17 = 1;
    while (v15 != v25)
    {
      if (v15 == -1) {
        double v16 = v14;
      }
      unsigned int v13 = (v13 + v17) & v8;
      unint64_t v14 = (void *)(v7 + 16 * v13);
      uint64_t v15 = *v14;
      ++v17;
      if (!*v14)
      {
        if (v16)
        {
          *double v16 = 0;
          v16[1] = 0;
          --*(_DWORD *)(*value - 16);
          unint64_t v14 = v16;
        }
        goto LABEL_15;
      }
    }
    if (v5) {
      CFRetain(v5);
    }
    v23 = (const void *)v14[1];
    v14[1] = v5;
    if (v23) {
      CFRelease(v23);
    }
    goto LABEL_34;
  }
LABEL_15:
  *unint64_t v14 = v9;
  if (v5) {
    CFRetain(v5);
  }
  uint64_t v18 = (const void *)v14[1];
  v14[1] = v5;
  if (v18) {
    CFRelease(v18);
  }
  if (*value)
  {
    ++*(_DWORD *)(*value - 12);
    uint64_t v19 = *value;
    if (*value) {
      goto LABEL_21;
    }
  }
  else
  {
    MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
    uint64_t v19 = *value;
    if (*value)
    {
LABEL_21:
      uint64_t v20 = (*(_DWORD *)(v19 - 16) + *(_DWORD *)(v19 - 12));
      unint64_t v21 = *(unsigned int *)(v19 - 4);
      if (v21 <= 0x400) {
        goto LABEL_22;
      }
LABEL_31:
      if (v21 <= 2 * v20) {
        goto LABEL_32;
      }
      goto LABEL_34;
    }
  }
  uint64_t v20 = *(unsigned int *)(v19 - 16);
  unint64_t v21 = *(unsigned int *)(v19 - 4);
  if (v21 > 0x400) {
    goto LABEL_31;
  }
LABEL_22:
  if (3 * v21 <= 4 * v20)
  {
    if (!v21)
    {
      unsigned int v22 = 8;
LABEL_33:
      WTF::HashTable<unsigned long,WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<unsigned long,WTF::RetainPtr<objc_object *>>>,WTF::DefaultHash<unsigned long>,WTF::HashMap<unsigned long,WTF::RetainPtr<objc_object *>,WTF::DefaultHash<unsigned long>,WTF::HashTraits<unsigned long>,WTF::HashTraits<WTF::RetainPtr<objc_object *>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<unsigned long>>::rehash(value, v22);
      goto LABEL_34;
    }
LABEL_32:
    unsigned int v22 = v21 << (6 * *(_DWORD *)(v19 - 12) >= (2 * v21));
    goto LABEL_33;
  }
LABEL_34:
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (id)visitedURL:(id)a3 withTitle:(id)a4
{
  uint64_t v6 = objc_msgSend(a3, "_web_originalDataAsString");
  if (v6) {
    uint64_t v7 = (__CFString *)v6;
  }
  else {
    uint64_t v7 = &stru_1F3C7DA90;
  }
  int v8 = (WebHistoryItem *)[self->_entriesByURL.m_ptr objectForKey:v7];
  if (v8)
  {
    uint64_t v9 = v8;
    CFRetain(v8);
    [(WebHistoryPrivate *)self removeItemFromDateCaches:v9];
    [(WebHistoryItem *)v9 _visitedWithTitle:a4];
  }
  else
  {
    unint64_t v10 = [WebHistoryItem alloc];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    uint64_t v9 = -[WebHistoryItem initWithURLString:title:lastVisitedTimeInterval:](v10, "initWithURLString:title:lastVisitedTimeInterval:", v7, a4);
    [self->_entriesByURL.m_ptr setObject:v9 forKey:v7];
  }
  [(WebHistoryPrivate *)self addItemToDateCaches:v9];
  unint64_t v11 = (void *)CFMakeCollectable(v9);
  return v11;
}

- (BOOL)addItem:(id)a3 discardDuplicate:(BOOL)a4
{
  uint64_t v7 = [a3 URLString];
  int v8 = (void *)[self->_entriesByURL.m_ptr objectForKey:v7];
  if (v8)
  {
    uint64_t v9 = v8;
    CFRetain(v8);
    if (a4
      || ([v9 lastVisitedTimeInterval], double v11 = v10,
                                                       [a3 lastVisitedTimeInterval],
                                                       v11 >= v12))
    {
      BOOL v13 = 0;
    }
    else
    {
      [(WebHistoryPrivate *)self removeItemForURLString:v7];
      [(WebHistoryPrivate *)self addItemToDateCaches:a3];
      [self->_entriesByURL.m_ptr setObject:a3 forKey:v7];
      BOOL v13 = 1;
    }
    CFRelease(v9);
  }
  else
  {
    [(WebHistoryPrivate *)self addItemToDateCaches:a3];
    [self->_entriesByURL.m_ptr setObject:a3 forKey:v7];
    return 1;
  }
  return v13;
}

- (void)rebuildHistoryByDayIfNeeded:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)self->_entriesByDate.__ptr_.__value_;
  if (v5)
  {
    uint64_t v6 = *(unsigned int *)(v5 - 4);
    uint64_t v7 = v5 + 16 * v6;
    if (!*(_DWORD *)(v5 - 12))
    {
      uint64_t v8 = v5 + 16 * v6;
      uint64_t v7 = v8;
      goto LABEL_10;
    }
    uint64_t v8 = *(void *)self->_entriesByDate.__ptr_.__value_;
    if (v6)
    {
      uint64_t v9 = 16 * v6;
      uint64_t v8 = *(void *)self->_entriesByDate.__ptr_.__value_;
      while ((unint64_t)(*(void *)v8 + 1) <= 1)
      {
        v8 += 16;
        v9 -= 16;
        if (!v9)
        {
          uint64_t v8 = v7;
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  if (!v5)
  {
    uint64_t v10 = 0;
    double v12 = 0;
    v39 = 0;
    uint64_t v40 = 0;
    if (!v8) {
      goto LABEL_16;
    }
    goto LABEL_19;
  }
LABEL_10:
  uint64_t v10 = v5 + 16 * *(unsigned int *)(v5 - 4);
  v39 = 0;
  uint64_t v40 = 0;
  uint64_t v11 = *(unsigned int *)(v5 - 12);
  if (!v11)
  {
    double v12 = 0;
    if (v10 == v8) {
      goto LABEL_16;
    }
LABEL_19:
    unsigned int v15 = 0;
    do
    {
      uint64_t v16 = *(void *)(v8 + 8);
      if (v16) {
        CFRetain(*(CFTypeRef *)(v8 + 8));
      }
      *((void *)v12 + v15) = v16;
      uint64_t v17 = v8 + 16;
      uint64_t v8 = v7;
      if (v17 != v7)
      {
        uint64_t v8 = v17;
        while ((unint64_t)(*(void *)v8 + 1) <= 1)
        {
          v8 += 16;
          if (v8 == v7)
          {
            uint64_t v8 = v7;
            break;
          }
        }
      }
      ++v15;
    }
    while (v8 != v10);
    HIDWORD(v40) = v15;
    value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
    uint64_t v14 = *value;
    if (!*value) {
      goto LABEL_36;
    }
    goto LABEL_29;
  }
  if (v11 >> 29)
  {
    __break(0xC471u);
    return;
  }
  double v12 = (WTF *)WTF::fastMalloc((WTF *)(8 * v11));
  LODWORD(v40) = v11;
  v39 = v12;
  if (v10 != v8) {
    goto LABEL_19;
  }
LABEL_16:
  value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
  uint64_t v14 = *value;
  if (*value)
  {
LABEL_29:
    uint64_t *value = 0;
    uint64_t v18 = *(unsigned int *)(v14 - 4);
    if (v18)
    {
      uint64_t v19 = (const void **)(v14 + 8);
      do
      {
        if (*(v19 - 1) != (const void *)-1)
        {
          uint64_t v20 = *v19;
          *uint64_t v19 = 0;
          if (v20) {
            CFRelease(v20);
          }
        }
        v19 += 2;
        --v18;
      }
      while (v18);
    }
    WTF::fastFree((WTF *)(v14 - 16), (void *)a2);
  }
LABEL_36:
  m_ptr = self->_entriesByURL.m_ptr;
  self->_entriesByURL.m_ptr = 0;
  unsigned int v22 = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (v22) {
    CFRelease(v22);
  }
  uint64_t v23 = [m_ptr allValues];
  [a3 _sendNotification:WebHistoryAllItemsRemovedNotification entries:v23];
  if (m_ptr) {
    CFRetain(m_ptr);
  }
  uint64_t v24 = self->_entriesByURL.m_ptr;
  self->_entriesByURL.m_ptr = m_ptr;
  if (v24) {
    CFRelease(v24);
  }
  if (HIDWORD(v40))
  {
    unint64_t v25 = 0;
    do
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v26 = (void *)*((void *)v39 + v25);
      uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v36 != v28) {
              objc_enumerationMutation(v26);
            }
            [(WebHistoryPrivate *)self addItemToDateCaches:*(void *)(*((void *)&v35 + 1) + 8 * i)];
          }
          uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v41 count:16];
        }
        while (v27);
      }
      ++v25;
    }
    while (v25 < HIDWORD(v40));
  }
  [a3 _sendNotification:WebHistoryItemsAddedNotification entries:v23];
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  if (HIDWORD(v40))
  {
    v31 = v39;
    uint64_t v32 = 8 * HIDWORD(v40);
    do
    {
      v33 = *(const void **)v31;
      *(void *)v31 = 0;
      if (v33) {
        CFRelease(v33);
      }
      v31 = (WTF *)((char *)v31 + 8);
      v32 -= 8;
    }
    while (v32);
  }
  v34 = v39;
  if (v39)
  {
    v39 = 0;
    LODWORD(v40) = 0;
    WTF::fastFree(v34, v30);
  }
}

- (BOOL)removeItem:(id)a3
{
  uint64_t v5 = [a3 URLString];
  id v6 = (id)[self->_entriesByURL.m_ptr objectForKey:v5];
  if (v6 != a3) {
    return 0;
  }
  [(WebHistoryPrivate *)self removeItemForURLString:v5];
  return v6 == a3;
}

- (BOOL)removeItems:(id)a3
{
  uint64_t v5 = [a3 count];
  if (v5)
  {
    uint64_t v6 = 0;
    do
      -[WebHistoryPrivate removeItem:](self, "removeItem:", [a3 objectAtIndex:v6++]);
    while (v5 != v6);
  }
  return v5 != 0;
}

- (BOOL)removeAllItems
{
  value = (uint64_t *)self->_entriesByDate.__ptr_.__value_;
  uint64_t v3 = *value;
  if (!*value || !*(_DWORD *)(v3 - 12)) {
    return 0;
  }
  uint64_t *value = 0;
  uint64_t v5 = *(unsigned int *)(v3 - 4);
  if (v5)
  {
    uint64_t v6 = (const void **)(v3 + 8);
    do
    {
      if (*(v6 - 1) != (const void *)-1)
      {
        uint64_t v7 = *v6;
        void *v6 = 0;
        if (v7) {
          CFRelease(v7);
        }
      }
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  WTF::fastFree((WTF *)(v3 - 16), (void *)a2);
  [self->_entriesByURL.m_ptr removeAllObjects];
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)m_ptr, v9);
  return 1;
}

- (void)addItems:(id)a3
{
  v4 = (void *)[a3 reverseObjectEnumerator];
  uint64_t v5 = [v4 nextObject];
  if (v5)
  {
    uint64_t v6 = v5;
    do
    {
      [(WebHistoryPrivate *)self addItem:v6 discardDuplicate:0];
      uint64_t v6 = [v4 nextObject];
    }
    while (v6);
  }
}

- (id)orderedLastVisitedDays
{
  if (self->_orderedLastVisitedDays.m_ptr) {
    return self->_orderedLastVisitedDays.m_ptr;
  }
  uint64_t v3 = *(void *)self->_entriesByDate.__ptr_.__value_;
  if (v3)
  {
    uint64_t v4 = *(unsigned int *)(v3 - 12);
    if (v4)
    {
      if (v4 >> 30)
      {
LABEL_48:
        __break(0xC471u);
        JUMPOUT(0x1E144BF40);
      }
      uint64_t v5 = (void *)WTF::fastMalloc((WTF *)(4 * v4));
      uint64_t v6 = *(void **)self->_entriesByDate.__ptr_.__value_;
      if (v6)
      {
        uint64_t v7 = *((unsigned int *)v6 - 1);
        uint64_t v8 = &v6[2 * v7];
        if (*((_DWORD *)v6 - 3))
        {
          if (v7)
          {
            uint64_t v9 = 16 * v7;
            while ((unint64_t)(*v6 + 1) <= 1)
            {
              v6 += 2;
              v9 -= 16;
              if (!v9)
              {
                uint64_t v6 = v8;
                break;
              }
            }
          }
          if (v8 != v6)
          {
            unsigned int v10 = 0;
            LODWORD(v11) = v4;
            do
            {
              if (v10 == v11)
              {
                unint64_t v12 = v11 + ((unint64_t)v11 >> 2);
                if (v12 >= 0x10) {
                  unint64_t v13 = v12 + 1;
                }
                else {
                  unint64_t v13 = 16;
                }
                if (v13 <= (unint64_t)v10 + 1) {
                  unint64_t v11 = v10 + 1;
                }
                else {
                  unint64_t v11 = v13;
                }
                if (v11 >> 30) {
                  goto LABEL_48;
                }
                uint64_t v14 = (void *)WTF::fastMalloc((WTF *)(4 * v11));
                memcpy(v14, v5, 4 * v10);
                if (v5)
                {
                  if (v14 == v5)
                  {
                    LODWORD(v11) = 0;
                    uint64_t v14 = 0;
                  }
                  WTF::fastFree((WTF *)v5, v15);
                }
                uint64_t v5 = v14;
              }
              uint64_t v17 = *v6;
              uint64_t v16 = v6 + 2;
              *((_DWORD *)v5 + v10) = v17;
              uint64_t v18 = v8;
              if (v16 != v8)
              {
                uint64_t v18 = v16;
                while ((unint64_t)(*v18 + 1) <= 1)
                {
                  v18 += 2;
                  if (v18 == v8)
                  {
                    uint64_t v18 = v8;
                    break;
                  }
                }
              }
              ++v10;
              uint64_t v6 = v18;
            }
            while (v18 != v8);
            goto LABEL_38;
          }
        }
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  unsigned int v10 = 0;
LABEL_38:
  std::__sort<std::__less<int,int> &,int *>();
  uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v10];
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = v20;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v22 = v10 - 1;
  if ((int)(v10 - 1) >= 0)
  {
    do
    {
      uint64_t v24 = (const void *)[objc_alloc(MEMORY[0x1E4F28B78]) initWithTimeIntervalSinceReferenceDate:(double)*((int *)v5 + v22)];
      [self->_orderedLastVisitedDays.m_ptr addObject:v24];
      if (v24) {
        CFRelease(v24);
      }
    }
    while (v22-- > 0);
    goto LABEL_46;
  }
  if (v5) {
LABEL_46:
  }
    WTF::fastFree((WTF *)v5, v19);
  return self->_orderedLastVisitedDays.m_ptr;
}

- (id)orderedItemsLastVisitedOnDay:(id)a3
{
  uint64_t v15 = 0;
  [a3 timeIntervalSinceReferenceDate];
  uint64_t v4 = 0;
  if (!-[WebHistoryPrivate findKey:forDay:](self, "findKey:forDay:", &v15)) {
    return v4;
  }
  uint64_t v5 = *(void *)self->_entriesByDate.__ptr_.__value_;
  if (v5)
  {
    unsigned int v6 = *(_DWORD *)(v5 - 8);
    unint64_t v7 = (v15 + ~(v15 << 32)) ^ ((unint64_t)(v15 + ~(v15 << 32)) >> 22);
    unint64_t v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    unint64_t v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    uint64_t v10 = v6 & ((v9 >> 31) ^ v9);
    uint64_t v11 = *(void *)(v5 + 16 * v10);
    if (v11 != v15)
    {
      int v12 = 1;
      while (v11)
      {
        uint64_t v10 = (v10 + v12) & v6;
        uint64_t v11 = *(void *)(v5 + 16 * v10);
        ++v12;
        if (v11 == v15) {
          goto LABEL_7;
        }
      }
      return 0;
    }
LABEL_7:
    uint64_t v13 = v5 + 16 * v10;
    uint64_t v4 = *(void **)(v13 + 8);
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v13 + 8));
      CFRelease(v4);
    }
    return v4;
  }
  return 0;
}

- (id)itemForURLString:(id)a3
{
  return (id)[self->_entriesByURL.m_ptr objectForKey:a3];
}

- (BOOL)containsURL:(id)a3
{
  return -[WebHistoryPrivate itemForURLString:](self, "itemForURLString:", objc_msgSend(a3, "_web_originalDataAsString")) != 0;
}

- (id)itemForURL:(id)a3
{
  uint64_t v4 = objc_msgSend(a3, "_web_originalDataAsString");
  return [(WebHistoryPrivate *)self itemForURLString:v4];
}

- (id)allItems
{
  return (id)[self->_entriesByURL.m_ptr allValues];
}

- (void)setHistoryAgeInDaysLimit:(int)a3
{
  self->ageInDaysLimitSet = 1;
  self->ageInDaysLimit = a3;
}

- (int)historyAgeInDaysLimit
{
  if (self->ageInDaysLimitSet) {
    return self->ageInDaysLimit;
  }
  else {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"WebKitHistoryAgeInDaysLimit");
  }
}

- (void)setHistoryItemLimit:(int)a3
{
  self->itemLimitSet = 1;
  self->itemLimit = a3;
}

- (int)historyItemLimit
{
  if (self->itemLimitSet) {
    return self->itemLimit;
  }
  else {
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "integerForKey:", @"WebKitHistoryItemLimit");
  }
}

- (id)ageLimitDate
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F28B78] calendarDate];
  uint64_t v4 = -[(WebHistoryPrivate *)self historyAgeInDaysLimit];
  return (id)[v3 dateByAddingYears:0 months:0 days:v4 hours:0 minutes:0 seconds:0];
}

- (BOOL)loadHistoryGutsFromURL:(id)a3 savedItemsCount:(int *)a4 collectDiscardedItemsInto:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  *a4 = 0;
  if ([a3 isFileURL])
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfFile:", objc_msgSend(a3, "path"));
    uint64_t v10 = (void *)v9;
    if (!v9) {
      return v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
LABEL_9:
    uint64_t v9 = [v10 objectForKey:@"WebHistoryFileVersion"];
    if (!v9) {
      return v9;
    }
    int v12 = (void *)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      LOBYTE(v9) = 0;
      return v9;
    }
    if ((int)[v12 intValue] > 1) {
      goto LABEL_12;
    }
    uint64_t v13 = (void *)[v10 objectForKey:@"WebHistoryDates"];
    int v29 = [(WebHistoryPrivate *)self historyItemLimit];
    objc_msgSend(-[WebHistoryPrivate ageLimitDate](self, "ageLimitDate"), "timeIntervalSinceReferenceDate");
    double v15 = v14;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v16 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v16) {
      goto LABEL_34;
    }
    BOOL v17 = 0;
    BOOL v18 = 0;
    uint64_t v19 = *(void *)v33;
LABEL_17:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v33 != v19) {
        objc_enumerationMutation(v13);
      }
      uint64_t v21 = *(void *)(*((void *)&v32 + 1) + 8 * v20);
      uint64_t v22 = (void *)MEMORY[0x1E4E4B3F0]();
      id v23 = [[WebHistoryItem alloc] initFromDictionaryRepresentation:v21];
      if ([v23 URLString])
      {
        if (v17)
        {
          BOOL v17 = 1;
        }
        else
        {
          [v23 lastVisitedTimeInterval];
          BOOL v17 = v24 <= v15;
          if (v24 > v15 && !v18)
          {
            BOOL v25 = [(WebHistoryPrivate *)self addItem:v23 discardDuplicate:1];
            int v26 = *a4;
            if (v25) {
              *a4 = ++v26;
            }
            BOOL v17 = 0;
            BOOL v18 = v26 == v29;
            if (!v23) {
              goto LABEL_27;
            }
LABEL_26:
            CFRelease(v23);
            goto LABEL_27;
          }
        }
        [a5 addObject:v23];
      }
      if (v23) {
        goto LABEL_26;
      }
LABEL_27:
      if (v16 == ++v20)
      {
        uint64_t v27 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        uint64_t v16 = v27;
        if (!v27)
        {
LABEL_34:
          LOBYTE(v9) = 1;
          return v9;
        }
        goto LABEL_17;
      }
    }
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x1E4F18D80], "sendSynchronousRequest:returningResponse:error:", objc_msgSend(MEMORY[0x1E4F18DA8], "requestWithURL:", a3), 0, a6);
  if ([v11 length])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:v11 options:0 format:0 error:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v10 = 0;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_9;
    }
  }
LABEL_12:
  LOBYTE(v9) = 0;
  return v9;
}

- (BOOL)loadFromURL:(id)a3 collectDiscardedItemsInto:(id)a4 error:(id *)a5
{
  int v6 = 0;
  return [(WebHistoryPrivate *)self loadHistoryGutsFromURL:a3 savedItemsCount:&v6 collectDiscardedItemsInto:a4 error:a5];
}

- (id)data
{
  value = self->_entriesByDate.__ptr_.__value_;
  if (!*value || !*(_DWORD *)(*value - 12))
  {
    if (_MergedGlobals_17 == 1) {
      return (id)qword_1EB3A9788;
    }
    id v10 = objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    qword_1EB3A9788 = (uint64_t)v10;
    _MergedGlobals_17 = 1;
    return v10;
  }
  HistoryPropertyListWriter::HistoryPropertyListWriter((HistoryPropertyListWriter *)v29);
  v29[0] = &unk_1F3C7CF48;
  long long v32 = (void **)value;
  long long v33 = 0;
  uint64_t v34 = 0;
  if (*value)
  {
    uint64_t v3 = *(unsigned int *)(*value - 12);
    if (v3)
    {
      if (v3 >> 30)
      {
LABEL_53:
        __break(0xC471u);
        JUMPOUT(0x1E144C8E8);
      }
      uint64_t v4 = (WTF *)WTF::fastMalloc((WTF *)(4 * v3));
      LODWORD(v34) = v3;
      long long v33 = v4;
      uint64_t v5 = *v32;
      if (*v32)
      {
        uint64_t v6 = *((unsigned int *)v5 - 1);
        unint64_t v7 = &v5[2 * v6];
        if (*((_DWORD *)v5 - 3))
        {
          if (v6)
          {
            uint64_t v8 = 16 * v6;
            while ((unint64_t)(*v5 + 1) <= 1)
            {
              v5 += 2;
              v8 -= 16;
              if (!v8)
              {
                uint64_t v5 = v7;
                break;
              }
            }
          }
          unsigned int v9 = HIDWORD(v34);
          if (v7 != v5)
          {
            do
            {
              unint64_t v11 = v9;
              if (v9 == v34)
              {
                unint64_t v12 = v9 + 1;
                unint64_t v13 = v11 + (v11 >> 2);
                if (v13 >= 0x10) {
                  unint64_t v14 = v13 + 1;
                }
                else {
                  unint64_t v14 = 16;
                }
                if (v14 <= v12) {
                  unint64_t v15 = v11 + 1;
                }
                else {
                  unint64_t v15 = v14;
                }
                if (v15 >> 30) {
                  goto LABEL_53;
                }
                uint64_t v16 = (WTF *)WTF::fastMalloc((WTF *)(4 * v15));
                LODWORD(v34) = v15;
                long long v33 = v16;
                memcpy(v16, v4, 4 * v11);
                if (v4)
                {
                  if (v33 == v4)
                  {
                    long long v33 = 0;
                    LODWORD(v34) = 0;
                  }
                  WTF::fastFree(v4, v17);
                }
                uint64_t v4 = v33;
                BOOL v18 = (_DWORD *)((char *)v33 + 4 * HIDWORD(v34));
              }
              else
              {
                BOOL v18 = (_DWORD *)((char *)v4 + 4 * v9);
              }
              uint64_t v20 = *v5;
              uint64_t v19 = v5 + 2;
              *BOOL v18 = v20;
              unsigned int v9 = ++HIDWORD(v34);
              uint64_t v21 = v7;
              if (v19 != v7)
              {
                uint64_t v21 = v19;
                while ((unint64_t)(*v21 + 1) <= 1)
                {
                  v21 += 2;
                  if (v21 == v7)
                  {
                    uint64_t v21 = v7;
                    break;
                  }
                }
              }
              uint64_t v5 = v21;
            }
            while (v21 != v7);
          }
        }
      }
    }
  }
  std::__sort<std::__less<int,int> &,int *>();
  BinaryPropertyListWriter::writePropertyList((BinaryPropertyListWriter *)v29);
  uint64_t v22 = bytes;
  if (!bytes) {
    goto LABEL_45;
  }
  bytes = 0;
  CFDataRef v23 = CFDataCreateWithBytesNoCopy(0, v22, length, 0);
  CFDataRef v24 = v23;
  if (!v23)
  {
    CFAllocatorDeallocate(0, v22);
LABEL_45:
    CFDataRef v24 = 0;
    char v25 = 1;
    goto LABEL_46;
  }
  CFRetain(v23);
  char v25 = 0;
LABEL_46:
  id v10 = (id)CFMakeCollectable(v24);
  if ((v25 & 1) == 0) {
    CFRelease(v24);
  }
  v29[0] = &unk_1F3C7CF48;
  uint64_t v27 = v33;
  if (v33)
  {
    long long v33 = 0;
    LODWORD(v34) = 0;
    WTF::fastFree(v27, v26);
  }
  HistoryPropertyListWriter::~HistoryPropertyListWriter((HistoryPropertyListWriter *)v29, v26);
  return v10;
}

- (BOOL)saveToURL:(id)a3 error:(id *)a4
{
  id v6 = [(WebHistoryPrivate *)self data];
  return [v6 writeToURL:a3 options:0 error:a4];
}

- (void)addVisitedLinksToVisitedLinkStore:(void *)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  m_ptr = self->_entriesByURL.m_ptr;
  uint64_t v5 = [m_ptr countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(m_ptr);
        }
        WebVisitedLinkStore::addVisitedLink((WTF *)a3, *(__CFString **)(*((void *)&v9 + 1) + 8 * i));
      }
      uint64_t v6 = [m_ptr countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_orderedLastVisitedDays.m_ptr;
  self->_orderedLastVisitedDays.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  value = (WTF *)self->_entriesByDate.__ptr_.__value_;
  self->_entriesByDate.__ptr_.__value_ = 0;
  if (value)
  {
    uint64_t v5 = *(void *)value;
    if (*(void *)value)
    {
      uint64_t v6 = *(unsigned int *)(v5 - 4);
      if (v6)
      {
        uint64_t v7 = (const void **)(v5 + 8);
        do
        {
          if (*(v7 - 1) != (const void *)-1)
          {
            uint64_t v8 = *v7;
            *uint64_t v7 = 0;
            if (v8) {
              CFRelease(v8);
            }
          }
          v7 += 2;
          --v6;
        }
        while (v6);
      }
      WTF::fastFree((WTF *)(v5 - 16), (void *)a2);
    }
    WTF::fastFree(value, (void *)a2);
  }
  long long v9 = self->_entriesByURL.m_ptr;
  self->_entriesByURL.m_ptr = 0;
  if (v9)
  {
    CFRelease(v9);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end