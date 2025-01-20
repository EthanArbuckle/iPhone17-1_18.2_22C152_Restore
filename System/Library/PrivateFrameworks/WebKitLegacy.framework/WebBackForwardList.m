@interface WebBackForwardList
- (BOOL)containsItem:(WebHistoryItem *)item;
- (NSArray)backListWithLimit:(int)limit;
- (NSArray)forwardListWithLimit:(int)limit;
- (NSUInteger)pageCacheSize;
- (WebBackForwardList)init;
- (WebBackForwardList)initWithBackForwardList:(void *)a3;
- (WebHistoryItem)backItem;
- (WebHistoryItem)currentItem;
- (WebHistoryItem)forwardItem;
- (WebHistoryItem)itemAtIndex:(int)index;
- (id)description;
- (id)dictionaryRepresentation;
- (int)backListCount;
- (int)capacity;
- (int)forwardListCount;
- (void)_close;
- (void)addItem:(WebHistoryItem *)item;
- (void)dealloc;
- (void)goBack;
- (void)goForward;
- (void)goToItem:(WebHistoryItem *)item;
- (void)removeItem:(id)a3;
- (void)setCapacity:(int)capacity;
- (void)setPageCacheSize:(NSUInteger)size;
- (void)setToMatchDictionaryRepresentation:(id)a3;
@end

@implementation WebBackForwardList

- (WebBackForwardList)initWithBackForwardList:(void *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)WebBackForwardList;
  v4 = [(WebBackForwardList *)&v28 init];
  v5 = v4;
  if (v4)
  {
    v6 = *(uint64_t **)a3;
    *(void *)a3 = 0;
    v4->_private = (WebBackForwardListPrivate *)v6;
    if (_MergedGlobals_8)
    {
      uint64_t v7 = v6[2];
      if (!v7) {
        goto LABEL_4;
      }
    }
    else
    {
      qword_1EB3A9670 = 0;
      _MergedGlobals_8 = 1;
      uint64_t v7 = v6[2];
      if (!v7)
      {
LABEL_4:
        uint64_t v7 = WTF::fastCompactMalloc((WTF *)0x10);
        *(_DWORD *)uint64_t v7 = 1;
        *(void *)(v7 + 8) = v6;
        v9 = (unsigned int *)v6[2];
        v6[2] = v7;
        if (v9)
        {
          if (atomic_fetch_add((atomic_uint *volatile)v9, 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, v9);
            WTF::fastFree((WTF *)v9, v8);
          }
          uint64_t v7 = v6[2];
        }
      }
    }
    atomic_fetch_add((atomic_uint *volatile)v7, 1u);
    uint64_t v10 = qword_1EB3A9670;
    if (qword_1EB3A9670
      || (WTF::HashTable<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>>,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebBackForwardList *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>>::rehash(8u),
          (uint64_t v10 = qword_1EB3A9670) != 0))
    {
      unsigned int v11 = *(_DWORD *)(v10 - 8);
    }
    else
    {
      unsigned int v11 = 0;
    }
    v12 = 0;
    uint64_t v13 = *(void *)(v7 + 8);
    unint64_t v14 = (~(v13 << 32) + v13) ^ ((unint64_t)(~(v13 << 32) + v13) >> 22);
    unint64_t v15 = 9 * ((v14 + ~(v14 << 13)) ^ ((v14 + ~(v14 << 13)) >> 8));
    unint64_t v16 = (v15 ^ (v15 >> 15)) + ~((v15 ^ (v15 >> 15)) << 27);
    int v17 = (v16 >> 31) ^ v16;
    for (int i = 1; ; ++i)
    {
      uint64_t v19 = v17 & v11;
      v20 = (uint64_t *)(v10 + 16 * v19);
      uint64_t v21 = *v20;
      if (*v20 == -1)
      {
        v12 = (uint64_t *)(v10 + 16 * v19);
      }
      else
      {
        if (!v21)
        {
          if (v12)
          {
            uint64_t *v12 = 0;
            v12[1] = 0;
            --*(_DWORD *)(v10 - 16);
            uint64_t *v12 = v7;
            v12[1] = (uint64_t)v5;
            uint64_t v23 = qword_1EB3A9670;
            if (qword_1EB3A9670) {
              goto LABEL_22;
            }
LABEL_28:
            *(_DWORD *)(v23 - 12) = 1;
            uint64_t v24 = qword_1EB3A9670;
            if (!qword_1EB3A9670) {
              goto LABEL_29;
            }
LABEL_23:
            uint64_t v25 = (*(_DWORD *)(v24 - 16) + *(_DWORD *)(v24 - 12));
            unint64_t v26 = *(unsigned int *)(v24 - 4);
            if (v26 <= 0x400) {
              goto LABEL_24;
            }
LABEL_30:
            if (v26 > 2 * v25) {
              return v5;
            }
            goto LABEL_32;
          }
          uint64_t *v20 = v7;
          v20[1] = (uint64_t)v5;
          uint64_t v23 = qword_1EB3A9670;
          if (!qword_1EB3A9670) {
            goto LABEL_28;
          }
LABEL_22:
          ++*(_DWORD *)(v23 - 12);
          uint64_t v24 = qword_1EB3A9670;
          if (qword_1EB3A9670) {
            goto LABEL_23;
          }
LABEL_29:
          uint64_t v25 = *(unsigned int *)(v24 - 16);
          unint64_t v26 = *(unsigned int *)(v24 - 4);
          if (v26 > 0x400) {
            goto LABEL_30;
          }
LABEL_24:
          if (3 * v26 > 4 * v25) {
            return v5;
          }
          if (v26) {
LABEL_32:
          }
            unsigned int v27 = v26 << (6 * *(_DWORD *)(v24 - 12) >= (2 * v26));
          else {
            unsigned int v27 = 8;
          }
          WTF::HashTable<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>>,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebBackForwardList *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>>::rehash(v27);
          return v5;
        }
        if (*(void *)(v21 + 8) == v13)
        {
          *(void *)(v10 + 16 * v19 + 8) = v5;
          if (v7 && atomic_fetch_add((atomic_uint *volatile)v7, 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, (unsigned int *)v7);
            WTF::fastFree((WTF *)v7, v12);
            return v5;
          }
          return v5;
        }
      }
      int v17 = i + v19;
    }
  }
  return v5;
}

- (WebBackForwardList)init
{
  uint64_t v3 = WTF::fastMalloc((WTF *)0x48);
  *(_DWORD *)(v3 + 8) = 1;
  *(void *)(v3 + 16) = 0;
  *(void *)uint64_t v3 = &unk_1F3C78540;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  *(void *)(v3 + 56) = 0x64FFFFFFFFLL;
  *(_WORD *)(v3 + 64) = 257;
  uint64_t v7 = (_DWORD *)v3;
  v4 = [(WebBackForwardList *)self initWithBackForwardList:&v7];
  v5 = v7;
  uint64_t v7 = 0;
  if (!v5) {
    return v4;
  }
  if (v5[2] != 1)
  {
    --v5[2];
    return v4;
  }
  (*(void (**)(_DWORD *))(*(void *)v5 + 8))(v5);
  return v4;
}

- (void)dealloc
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    if (!self) {
      goto LABEL_28;
    }
    v5 = self->_private;
    if (!v5) {
      goto LABEL_28;
    }
    if (_MergedGlobals_8)
    {
      p_superclass = WebDatabaseManager.superclass;
      if (qword_1EB3A9670)
      {
        int v7 = *(_DWORD *)(qword_1EB3A9670 - 8);
        unint64_t v8 = ((unint64_t)v5 + ~((void)v5 << 32)) ^ (((unint64_t)v5 + ~((void)v5 << 32)) >> 22);
        unint64_t v9 = 9 * ((v8 + ~(v8 << 13)) ^ ((v8 + ~(v8 << 13)) >> 8));
        unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
        unsigned int v11 = v7 & ((v10 >> 31) ^ v10);
        for (int i = 1; ; ++i)
        {
          uint64_t v13 = *(void *)(qword_1EB3A9670 + 16 * v11);
          if (v13 != -1)
          {
            if (!v13) {
              goto LABEL_24;
            }
            if (*(WebBackForwardListPrivate **)(v13 + 8) == v5) {
              break;
            }
          }
          unsigned int v11 = (v11 + i) & v7;
        }
        if (v11 != *(_DWORD *)(qword_1EB3A9670 - 4))
        {
          unint64_t v14 = (void *)(qword_1EB3A9670 + 16 * v11);
          *unint64_t v14 = 0;
          if (atomic_fetch_add((atomic_uint *volatile)v13, 0xFFFFFFFF) == 1)
          {
            atomic_store(1u, (unsigned int *)v13);
            v22 = v14;
            WTF::fastFree((WTF *)v13, v4);
            unint64_t v14 = v22;
            p_superclass = (__objc2_class **)(WebDatabaseManager + 8);
          }
          *unint64_t v14 = -1;
          unint64_t v15 = p_superclass[206];
          ++LODWORD(v15[-1].vtable);
          if (v15) {
            int v16 = HIDWORD(v15[-1].vtable) - 1;
          }
          else {
            int v16 = -1;
          }
          HIDWORD(v15[-1].vtable) = v16;
          int v17 = p_superclass[206];
          if (v17)
          {
            unsigned int v18 = 6 * HIDWORD(v17[-1].vtable);
            unsigned int info_high = HIDWORD(v17[-1].info);
            if (v18 < info_high && info_high >= 9) {
              WTF::HashTable<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *>>,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>,WebBackForwardList *,WTF::DefaultHash<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>,WTF::HashTraits<WebBackForwardList *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<BackForwardList,WTF::DefaultWeakPtrImpl>>>::rehash(info_high >> 1);
            }
          }
        }
      }
LABEL_24:
      int v21 = *((_DWORD *)v5 + 2) - 1;
      if (*((_DWORD *)v5 + 2) != 1) {
        goto LABEL_25;
      }
    }
    else
    {
      qword_1EB3A9670 = 0;
      _MergedGlobals_8 = 1;
      int v21 = *((_DWORD *)v5 + 2) - 1;
      if (*((_DWORD *)v5 + 2) != 1)
      {
LABEL_25:
        *((_DWORD *)v5 + 2) = v21;
LABEL_28:
        v23.receiver = self;
        v23.super_class = (Class)WebBackForwardList;
        [(WebBackForwardList *)&v23 dealloc];
        return;
      }
    }
    (*(void (**)(WebBackForwardListPrivate *))(*(void *)v5 + 8))(v5);
    goto LABEL_28;
  }
}

- (void)_close
{
}

- (void)addItem:(WebHistoryItem *)item
{
  uint64_t v5 = [*((id *)self->_private + 3) mainFrame];
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(v5 + 8) + 8);
    if (v6)
    {
      int v7 = self->_private;
      uint64_t v8 = *(void *)(v6 + 32);
      uint64_t v9 = *(void *)(v6 + 40);
      m_ptr = item->_private->_historyItem.m_ptr;
      ++*(_DWORD *)m_ptr;
      unint64_t v15 = m_ptr;
      (*(void (**)(WebBackForwardListPrivate *, uint64_t, uint64_t, HistoryItem **))(*(void *)v7 + 16))(v7, v8, v9, &v15);
      unsigned int v11 = v15;
      unint64_t v15 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 1)
        {
          uint64_t v13 = (WTF *)MEMORY[0x1E4E44A30]();
          WTF::fastFree(v13, v14);
        }
        else
        {
          --*(_DWORD *)v11;
        }
      }
      goto LABEL_7;
    }
  }
  if (item) {
LABEL_7:
  }
    CFRetain(item);
  CFTypeRef v12 = (id)CFMakeCollectable(item);
}

- (void)removeItem:(id)a3
{
  if (a3)
  {
    if (self)
    {
      uint64_t v3 = self->_private;
      uint64_t v4 = *((unsigned int *)v3 + 11);
      if (!v4) {
        return;
      }
    }
    else
    {
      uint64_t v3 = 0;
      uint64_t v4 = MEMORY[0x2C];
      if (!MEMORY[0x2C]) {
        return;
      }
    }
    uint64_t v5 = 0;
    uint64_t v6 = *(_DWORD **)(*((void *)a3 + 1) + 8);
    uint64_t v7 = *((void *)v3 + 4);
    uint64_t v8 = v7 + 8;
    while (*(_DWORD **)(v7 + 8 * v5) != v6)
    {
      ++v5;
      v8 += 8;
      if (v4 == v5) {
        return;
      }
    }
    *(void *)(v7 + 8 * v5) = 0;
    if (*v6 == 1)
    {
      uint64_t v9 = (WTF *)MEMORY[0x1E4E44A30](v6, a2);
      WTF::fastFree(v9, v10);
      uint64_t v4 = *((unsigned int *)v3 + 11);
    }
    else
    {
      --*v6;
    }
    memmove((void *)(v7 + 8 * v5), (const void *)(v7 + 8 * v5 + 8), *((void *)v3 + 4) + 8 * v4 - v8);
    --*((_DWORD *)v3 + 11);
    WTF::HashSet<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>,WTF::DefaultHash<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>>,WTF::HashTraits<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>>,WTF::HashTableTraits>::remove<WTF::RefPtr<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>>((uint64_t *)v3 + 6, (uint64_t)v6);
    unsigned int v11 = *((_DWORD *)v3 + 14);
    if (v11 != -1 && v11 >= v5)
    {
      if (v11 > v5 || (v12 = *((_DWORD *)v3 + 11) > v11, unsigned int v11 = *((_DWORD *)v3 + 11), !v12)) {
        *((_DWORD *)v3 + 14) = v11 - 1;
      }
    }
  }
}

- (id)dictionaryRepresentation
{
  v11[3] = *MEMORY[0x1E4F143B8];
  if (self) {
    v2 = self->_private;
  }
  else {
    v2 = 0;
  }
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*((unsigned int *)v2 + 11)];
  uint64_t v4 = *((unsigned int *)v2 + 11);
  if (v4)
  {
    uint64_t v5 = (WebCore::HistoryItem **)*((void *)v2 + 4);
    uint64_t v6 = 8 * v4;
    do
    {
      uint64_t v7 = [(WebCore::HistoryItem *)kit(*v5) dictionaryRepresentationIncludingChildren:0];
      if (v7) {
        [v3 addObject:v7];
      }
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  v11[0] = v3;
  v10[0] = @"entries";
  v10[1] = @"current";
  v11[1] = [NSNumber numberWithUnsignedInt:*((unsigned int *)v2 + 14)];
  v10[2] = @"capacity";
  v11[2] = [NSNumber numberWithInt:*((unsigned int *)v2 + 15)];
  uint64_t v8 = (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:3];
  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

- (void)setToMatchDictionaryRepresentation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (self) {
    uint64_t v4 = self->_private;
  }
  else {
    uint64_t v4 = 0;
  }
  BackForwardList::setCapacity((uint64_t)v4, objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"capacity", a3), "unsignedIntValue"));
  uint64_t v5 = [*((id *)self->_private + 3) mainFrame];
  if (!v5) {
    goto LABEL_23;
  }
  uint64_t v6 = *(void *)(*(void *)(v5 + 8) + 8);
  if (!v6) {
    goto LABEL_23;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = (void *)[v22 objectForKey:@"entries"];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (!v8) {
    goto LABEL_23;
  }
  uint64_t v9 = *(void *)v25;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void *)(v6 + 32);
      uint64_t v12 = *(void *)(v6 + 40);
      uint64_t v13 = [[WebHistoryItem alloc] initFromDictionaryRepresentation:*(void *)(*((void *)&v24 + 1) + 8 * i)];
      unint64_t v14 = v13;
      if (v13) {
        unint64_t v15 = *(_DWORD **)(v13[1] + 8);
      }
      else {
        unint64_t v15 = 0;
      }
      ++*v15;
      objc_super v23 = v15;
      (*(void (**)(WebBackForwardListPrivate *, uint64_t, uint64_t, _DWORD **))(*(void *)v4 + 16))(v4, v11, v12, &v23);
      int v16 = v23;
      objc_super v23 = 0;
      if (!v16) {
        goto LABEL_18;
      }
      if (*v16 != 1)
      {
        --*v16;
LABEL_18:
        if (!v14) {
          continue;
        }
LABEL_19:
        CFRelease(v14);
        continue;
      }
      int v17 = (WTF *)MEMORY[0x1E4E44A30]();
      WTF::fastFree(v17, v18);
      if (v14) {
        goto LABEL_19;
      }
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
  }
  while (v8);
LABEL_23:
  unsigned int v19 = objc_msgSend((id)objc_msgSend(v22, "objectForKey:", @"current"), "unsignedIntValue");
  unsigned int v20 = *((_DWORD *)v4 + 11);
  if (v20 <= v19) {
    unsigned int v21 = v20 - 1;
  }
  else {
    unsigned int v21 = v19;
  }
  *((_DWORD *)v4 + 14) = v21;
}

- (BOOL)containsItem:(WebHistoryItem *)item
{
  if (!item) {
    return 0;
  }
  uint64_t v3 = *((void *)self->_private + 6);
  if (!v3) {
    return 0;
  }
  m_ptr = item->_private->_historyItem.m_ptr;
  int v5 = *(_DWORD *)(v3 - 8);
  unint64_t v6 = ((unint64_t)m_ptr + ~((void)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((void)m_ptr << 32)) >> 22);
  unint64_t v7 = 9 * ((v6 + ~(v6 << 13)) ^ ((v6 + ~(v6 << 13)) >> 8));
  unint64_t v8 = (v7 ^ (v7 >> 15)) + ~((v7 ^ (v7 >> 15)) << 27);
  unsigned int v9 = v5 & ((v8 >> 31) ^ v8);
  unint64_t v10 = *(HistoryItem **)(v3 + 8 * v9);
  if (v10 == m_ptr) {
    return 1;
  }
  int v11 = 1;
  do
  {
    BOOL result = v10 != 0;
    if (!v10) {
      break;
    }
    unsigned int v9 = (v9 + v11) & v5;
    unint64_t v10 = *(HistoryItem **)(v3 + 8 * v9);
    ++v11;
  }
  while (v10 != m_ptr);
  return result;
}

- (void)goBack
{
  if (self)
  {
    v2 = self->_private;
    int v3 = *((_DWORD *)v2 + 14);
    if (!v3) {
      return;
    }
  }
  else
  {
    v2 = 0;
    int v3 = MEMORY[0x38];
    if (!MEMORY[0x38]) {
      return;
    }
  }
  *((_DWORD *)v2 + 14) = v3 - 1;
}

- (void)goForward
{
  v2 = self->_private;
  unint64_t v3 = *((unsigned int *)v2 + 14);
  if ((unint64_t)*((unsigned int *)v2 + 11) - 1 > v3) {
    *((_DWORD *)v2 + 14) = v3 + 1;
  }
}

- (void)goToItem:(WebHistoryItem *)item
{
  if (item)
  {
    if (self) {
      self = (WebBackForwardList *)self->_private;
    }
    (*((void (**)(WebBackForwardList *, HistoryItem *))self->super.isa + 3))(self, item->_private->_historyItem.m_ptr);
  }
}

- (WebHistoryItem)backItem
{
  if (self)
  {
    v2 = self->_private;
    int value = (int)v2[1]._redirectURLs.__ptr_.__value_;
    if ((value + 1) < 2)
    {
LABEL_3:
      uint64_t v4 = 0;
      goto LABEL_7;
    }
  }
  else
  {
    v2 = 0;
    int value = MEMORY[0x38];
    if ((MEMORY[0x38] + 1) < 2) {
      goto LABEL_3;
    }
  }
  unsigned int v5 = value - 1;
  if (HIDWORD(v2[1]._historyItem.m_ptr) <= v5)
  {
    __break(0xC471u);
    return self;
  }
  uint64_t v4 = (WebCore::HistoryItem *)*((void *)v2[1].super.isa + v5);
  ++*(_DWORD *)v4;
LABEL_7:
  unint64_t v6 = kit(v4);
  unint64_t v7 = v6;
  if (v6) {
    CFRetain(v6);
  }
  self = (id)CFMakeCollectable(v7);
  unint64_t v8 = self;
  if (v4)
  {
    if (*(_DWORD *)v4 == 1)
    {
      unsigned int v9 = (WTF *)MEMORY[0x1E4E44A30](v4);
      WTF::fastFree(v9, v10);
      return v8;
    }
    else
    {
      --*(_DWORD *)v4;
    }
  }
  return self;
}

- (WebHistoryItem)currentItem
{
  if (!self)
  {
    v2 = 0;
    uint64_t value_low = MEMORY[0x38];
    if (MEMORY[0x38] != -1) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v4 = 0;
    goto LABEL_7;
  }
  v2 = self->_private;
  uint64_t value_low = LODWORD(v2[1]._redirectURLs.__ptr_.__value_);
  if (value_low == -1) {
    goto LABEL_6;
  }
LABEL_3:
  if (HIDWORD(v2[1]._historyItem.m_ptr) <= value_low)
  {
    __break(0xC471u);
    return self;
  }
  uint64_t v4 = (WebCore::HistoryItem *)*((void *)v2[1].super.isa + value_low);
  ++*(_DWORD *)v4;
LABEL_7:
  unsigned int v5 = kit(v4);
  unint64_t v6 = v5;
  if (v5) {
    CFRetain(v5);
  }
  self = (id)CFMakeCollectable(v6);
  unint64_t v7 = self;
  if (v4)
  {
    if (*(_DWORD *)v4 == 1)
    {
      unint64_t v8 = (WTF *)MEMORY[0x1E4E44A30](v4);
      WTF::fastFree(v8, v9);
      return v7;
    }
    else
    {
      --*(_DWORD *)v4;
    }
  }
  return self;
}

- (WebHistoryItem)forwardItem
{
  if (self)
  {
    v2 = self->_private;
    uint64_t m_ptr_high = HIDWORD(v2[1]._historyItem.m_ptr);
    if (!m_ptr_high) {
      goto LABEL_8;
    }
  }
  else
  {
    v2 = 0;
    uint64_t m_ptr_high = MEMORY[0x2C];
    if (!MEMORY[0x2C])
    {
LABEL_8:
      unint64_t v6 = 0;
      goto LABEL_9;
    }
  }
  unint64_t value_low = LODWORD(v2[1]._redirectURLs.__ptr_.__value_);
  if (m_ptr_high - 1 <= value_low) {
    goto LABEL_8;
  }
  unsigned int v5 = value_low + 1;
  if (m_ptr_high <= v5)
  {
    __break(0xC471u);
    return self;
  }
  unint64_t v6 = (WebCore::HistoryItem *)*((void *)v2[1].super.isa + v5);
  ++*(_DWORD *)v6;
LABEL_9:
  unint64_t v7 = kit(v6);
  unint64_t v8 = v7;
  if (v7) {
    CFRetain(v7);
  }
  self = (id)CFMakeCollectable(v8);
  unsigned int v9 = self;
  if (v6)
  {
    if (*(_DWORD *)v6 == 1)
    {
      unint64_t v10 = (WTF *)MEMORY[0x1E4E44A30](v6);
      WTF::fastFree(v10, v11);
      return v9;
    }
    else
    {
      --*(_DWORD *)v6;
    }
  }
  return self;
}

- (NSArray)backListWithLimit:(int)limit
{
  int v17 = 0;
  uint64_t v18 = 0;
  if (self) {
    self = (WebBackForwardList *)self->_private;
  }
  BackForwardList::backListWithLimit((WTF *)self, *(void **)&limit, (uint64_t)&v17);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = (void *)[v3 initWithCapacity:HIDWORD(v18)];
  if (HIDWORD(v18))
  {
    unsigned int v5 = (WebCore::HistoryItem **)v17;
    uint64_t v6 = 8 * HIDWORD(v18);
    do
    {
      unint64_t v7 = kit(*v5);
      if (v7) {
        [v4 addObject:v7];
      }
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  unsigned int v9 = (id)CFMakeCollectable(v4);
  if (HIDWORD(v18))
  {
    unint64_t v10 = v17;
    uint64_t v11 = 8 * HIDWORD(v18);
    do
    {
      unint64_t v14 = *(_DWORD **)v10;
      *(void *)unint64_t v10 = 0;
      if (v14)
      {
        if (*v14 == 1)
        {
          uint64_t v12 = (WTF *)MEMORY[0x1E4E44A30]();
          WTF::fastFree(v12, v13);
        }
        else
        {
          --*v14;
        }
      }
      unint64_t v10 = (WTF *)((char *)v10 + 8);
      v11 -= 8;
    }
    while (v11);
  }
  unint64_t v15 = v17;
  if (v17)
  {
    int v17 = 0;
    LODWORD(v18) = 0;
    WTF::fastFree(v15, v8);
  }
  return v9;
}

- (NSArray)forwardListWithLimit:(int)limit
{
  int v17 = 0;
  uint64_t v18 = 0;
  if (self) {
    self = (WebBackForwardList *)self->_private;
  }
  BackForwardList::forwardListWithLimit((WTF *)self, *(void **)&limit, (uint64_t)&v17);
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = (void *)[v3 initWithCapacity:HIDWORD(v18)];
  if (HIDWORD(v18))
  {
    unsigned int v5 = (WebCore::HistoryItem **)v17;
    uint64_t v6 = 8 * HIDWORD(v18);
    do
    {
      unint64_t v7 = kit(*v5);
      if (v7) {
        [v4 addObject:v7];
      }
      ++v5;
      v6 -= 8;
    }
    while (v6);
  }
  unsigned int v9 = (id)CFMakeCollectable(v4);
  if (HIDWORD(v18))
  {
    unint64_t v10 = v17;
    uint64_t v11 = 8 * HIDWORD(v18);
    do
    {
      unint64_t v14 = *(_DWORD **)v10;
      *(void *)unint64_t v10 = 0;
      if (v14)
      {
        if (*v14 == 1)
        {
          uint64_t v12 = (WTF *)MEMORY[0x1E4E44A30]();
          WTF::fastFree(v12, v13);
        }
        else
        {
          --*v14;
        }
      }
      unint64_t v10 = (WTF *)((char *)v10 + 8);
      v11 -= 8;
    }
    while (v11);
  }
  unint64_t v15 = v17;
  if (v17)
  {
    int v17 = 0;
    LODWORD(v18) = 0;
    WTF::fastFree(v15, v8);
  }
  return v9;
}

- (int)capacity
{
  return *((_DWORD *)self->_private + 15);
}

- (void)setCapacity:(int)capacity
{
  if (self) {
    self = (WebBackForwardList *)self->_private;
  }
  BackForwardList::setCapacity((uint64_t)self, capacity);
}

- (id)description
{
  id v3 = (void *)[MEMORY[0x1E4F28E78] stringWithCapacity:512];
  [v3 appendString:@"\n--------------------------------------------\n"];
  [v3 appendString:@"WebBackForwardList:\n"];
  uint64_t v4 = self->_private;
  LODWORD(v5) = *((_DWORD *)v4 + 11);
  if (v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = *((void *)v4 + 4);
      unint64_t v8 = *(_DWORD **)(v7 + 8 * v6);
      uint64_t v9 = *((unsigned int *)v4 + 14);
      if (v9 == -1)
      {
        unint64_t v10 = 0;
      }
      else
      {
        if (v5 <= v9) {
          goto LABEL_15;
        }
        unint64_t v10 = *(_DWORD **)(v7 + 8 * v9);
        int v11 = (*v10)++;
        if (v11)
        {
          *unint64_t v10 = v11;
        }
        else
        {
          uint64_t v12 = (WTF *)MEMORY[0x1E4E44A30](v10);
          WTF::fastFree(v12, v13);
        }
      }
      if (v10 == v8) {
        unint64_t v14 = @" >>>";
      }
      else {
        unint64_t v14 = @"    ";
      }
      [v3 appendString:v14];
      [v3 appendFormat:@"%2d "], v6);
      int v15 = [v3 length];
      if (v6 >= *((unsigned int *)v4 + 11))
      {
LABEL_15:
        __break(0xC471u);
        JUMPOUT(0x1E13CB0E0);
      }
      int v16 = v15;
      objc_msgSend(v3, "appendString:", -[WebCore::HistoryItem description](kit(*(WebCore::HistoryItem **)(*((void *)v4 + 4) + 8 * v6)), "description"));
      objc_msgSend(v3, "replaceOccurrencesOfString:withString:options:range:", @"\n", @"\n        ", 0, v16, objc_msgSend(v3, "length") - v16);
      [v3 appendString:@"\n"];
      ++v6;
      unint64_t v5 = *((unsigned int *)v4 + 11);
    }
    while (v6 < v5);
  }
  [v3 appendString:@"\n--------------------------------------------\n"];
  return v3;
}

- (void)setPageCacheSize:(NSUInteger)size
{
  [*((id *)self->_private + 3) setUsesPageCache:size != 0];
}

- (NSUInteger)pageCacheSize
{
  v2 = (WebCore::BackForwardCache *)[*((id *)self->_private + 3) usesPageCache];
  if (v2) {
    return *(unsigned int *)(WebCore::BackForwardCache::singleton(v2) + 24);
  }
  else {
    return 0;
  }
}

- (int)backListCount
{
  return (*(uint64_t (**)(void))(*(void *)self->_private + 40))();
}

- (int)forwardListCount
{
  return (*(uint64_t (**)(void))(*(void *)self->_private + 48))();
}

- (WebHistoryItem)itemAtIndex:(int)index
{
  (*(void (**)(WebCore::HistoryItem **__return_ptr))(*(void *)self->_private + 32))(&v10);
  id v3 = kit(v10);
  uint64_t v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  unint64_t v5 = (id)CFMakeCollectable(v4);
  unint64_t v6 = v10;
  unint64_t v10 = 0;
  if (!v6) {
    return v5;
  }
  if (*(_DWORD *)v6 != 1)
  {
    --*(_DWORD *)v6;
    return v5;
  }
  unint64_t v8 = (WTF *)MEMORY[0x1E4E44A30]();
  WTF::fastFree(v8, v9);
  return v5;
}

@end