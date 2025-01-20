@interface WebScriptWorld
+ (id)findOrCreateWorld:(void *)a3;
+ (id)scriptWorldForGlobalContext:(OpaqueJSContext *)a3;
+ (id)scriptWorldForJavaScriptContext:(id)a3;
+ (id)standardWorld;
+ (id)world;
- (WebScriptWorld)init;
- (WebScriptWorld)initWithWorld:(void *)a3;
- (void)dealloc;
- (void)unregisterWorld;
@end

@implementation WebScriptWorld

- (WebScriptWorld)initWithWorld:(void *)a3
{
  v33.receiver = self;
  v33.super_class = (Class)WebScriptWorld;
  v4 = [(WebScriptWorld *)&v33 init];
  if (!v4) {
    return v4;
  }
  v6 = objc_alloc_init(WebScriptWorldPrivate);
  v4->_private = v6;
  v7 = *(DOMWrapperWorld **)a3;
  *(void *)a3 = 0;
  m_ptr = v6->world.m_ptr;
  v6->world.m_ptr = v7;
  if (!m_ptr)
  {
LABEL_5:
    if (byte_1EB3A96AA == 1) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  if (*(_DWORD *)m_ptr != 1)
  {
    --*(_DWORD *)m_ptr;
    goto LABEL_5;
  }
  v13 = (WTF *)MEMORY[0x1E4E45A10]();
  WTF::fastFree(v13, v14);
  if (byte_1EB3A96AA == 1)
  {
LABEL_6:
    v9 = (uint64_t *)qword_1EB3A96C0;
    v10 = v4->_private->world.m_ptr;
    v11 = (WTF *)*((void *)v10 + 1);
    if (!v11) {
      goto LABEL_7;
    }
    goto LABEL_14;
  }
LABEL_11:
  v9 = (uint64_t *)WTF::fastMalloc((WTF *)8);
  uint64_t *v9 = 0;
  qword_1EB3A96C0 = (uint64_t)v9;
  byte_1EB3A96AA = 1;
  v10 = v4->_private->world.m_ptr;
  v11 = (WTF *)*((void *)v10 + 1);
  if (!v11)
  {
LABEL_7:
    v11 = (WTF *)WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v11 = 1;
    *((void *)v11 + 1) = v10;
    v12 = (WTF *)*((void *)v10 + 1);
    *((void *)v10 + 1) = v11;
    if (v12)
    {
      if (*(_DWORD *)v12 == 1)
      {
        WTF::fastFree(v12, v5);
        v11 = (WTF *)*((void *)v10 + 1);
      }
      else
      {
        --*(_DWORD *)v12;
      }
    }
  }
LABEL_14:
  ++*(_DWORD *)v11;
  uint64_t v15 = *v9;
  if (*v9
    || (WTF::HashTable<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WebScriptWorld *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>>::rehash(v9, 8u), (uint64_t v15 = *v9) != 0))
  {
    int v16 = *(_DWORD *)(v15 - 8);
  }
  else
  {
    int v16 = 0;
  }
  v17 = 0;
  uint64_t v18 = *((void *)v11 + 1);
  unint64_t v19 = (~(v18 << 32) + v18) ^ ((unint64_t)(~(v18 << 32) + v18) >> 22);
  unint64_t v20 = 9 * ((v19 + ~(v19 << 13)) ^ ((v19 + ~(v19 << 13)) >> 8));
  unint64_t v21 = (v20 ^ (v20 >> 15)) + ~((v20 ^ (v20 >> 15)) << 27);
  unsigned int v22 = (v21 >> 31) ^ v21;
  for (int i = 1; ; ++i)
  {
    unsigned int v24 = v22 & v16;
    v25 = (WTF **)(v15 + 16 * v24);
    v26 = *v25;
    if (*v25 == (WTF *)-1)
    {
      v17 = (WTF **)(v15 + 16 * v24);
      goto LABEL_19;
    }
    if (!v26)
    {
      if (v17)
      {
        *v17 = 0;
        v17[1] = 0;
        --*(_DWORD *)(*v9 - 16);
        *v17 = v11;
        v17[1] = (WTF *)v4;
        uint64_t v28 = *v9;
        if (*v9) {
          goto LABEL_28;
        }
      }
      else
      {
        *v25 = v11;
        v25[1] = (WTF *)v4;
        uint64_t v28 = *v9;
        if (*v9)
        {
LABEL_28:
          ++*(_DWORD *)(v28 - 12);
          uint64_t v29 = *v9;
          if (*v9) {
            goto LABEL_29;
          }
          goto LABEL_35;
        }
      }
      *(_DWORD *)(v28 - 12) = 1;
      uint64_t v29 = *v9;
      if (*v9)
      {
LABEL_29:
        uint64_t v30 = (*(_DWORD *)(v29 - 16) + *(_DWORD *)(v29 - 12));
        unint64_t v31 = *(unsigned int *)(v29 - 4);
        if (v31 <= 0x400) {
          goto LABEL_30;
        }
        goto LABEL_36;
      }
LABEL_35:
      uint64_t v30 = *(unsigned int *)(v29 - 16);
      unint64_t v31 = *(unsigned int *)(v29 - 4);
      if (v31 <= 0x400)
      {
LABEL_30:
        if (3 * v31 > 4 * v30) {
          return v4;
        }
        if (!v31)
        {
          unsigned int v32 = 8;
LABEL_38:
          WTF::HashTable<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WebScriptWorld *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>>::rehash(v9, v32);
          return v4;
        }
LABEL_37:
        unsigned int v32 = v31 << (6 * *(_DWORD *)(v29 - 12) >= (2 * v31));
        goto LABEL_38;
      }
LABEL_36:
      if (v31 > 2 * v30) {
        return v4;
      }
      goto LABEL_37;
    }
    if (*((void *)v26 + 1) == v18) {
      break;
    }
LABEL_19:
    unsigned int v22 = i + v24;
  }
  if (*(_DWORD *)v11 != 1)
  {
    --*(_DWORD *)v11;
    return v4;
  }
  WTF::fastFree(v11, v5);
  return v4;
}

- (WebScriptWorld)init
{
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  WebCore::ScriptController::createWorld();
  v4 = [(WebScriptWorld *)self initWithWorld:&v11];
  v5 = v11;
  v11 = 0;
  if (v5)
  {
    if (*v5 == 1)
    {
      v8 = (WTF *)MEMORY[0x1E4E45A10]();
      WTF::fastFree(v8, v9);
      v6 = v10;
      if (!v10) {
        return v4;
      }
      goto LABEL_5;
    }
    --*v5;
  }
  v6 = v10;
  if (!v10) {
    return v4;
  }
LABEL_5:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return v4;
}

- (void)unregisterWorld
{
}

- (void)dealloc
{
  if ((byte_1EB3A96AA & 1) == 0)
  {
    uint64_t v18 = (void *)WTF::fastMalloc((WTF *)8);
    *uint64_t v18 = 0;
    qword_1EB3A96C0 = (uint64_t)v18;
    byte_1EB3A96AA = 1;
    goto LABEL_22;
  }
  v3 = (uint64_t *)qword_1EB3A96C0;
  uint64_t v4 = *(void *)qword_1EB3A96C0;
  if (*(void *)qword_1EB3A96C0)
  {
    m_ptr = self->_private->world.m_ptr;
    int v6 = *(_DWORD *)(v4 - 8);
    unint64_t v7 = ((unint64_t)m_ptr + ~((void)m_ptr << 32)) ^ (((unint64_t)m_ptr + ~((void)m_ptr << 32)) >> 22);
    unint64_t v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    unint64_t v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    unsigned int v10 = v6 & ((v9 >> 31) ^ v9);
    for (int i = 1; ; ++i)
    {
      v12 = *(WTF **)(v4 + 16 * v10);
      if (v12 != (WTF *)-1)
      {
        if (!v12) {
          goto LABEL_22;
        }
        if (*((DOMWrapperWorld **)v12 + 1) == m_ptr) {
          break;
        }
      }
      unsigned int v10 = (v10 + i) & v6;
    }
    if (v10 != *(_DWORD *)(v4 - 4))
    {
      v13 = (void *)(v4 + 16 * v10);
      void *v13 = 0;
      if (*(_DWORD *)v12 == 1) {
        WTF::fastFree(v12, (void *)a2);
      }
      else {
        --*(_DWORD *)v12;
      }
      void *v13 = -1;
      ++*(_DWORD *)(*v3 - 16);
      if (*v3)
      {
        --*(_DWORD *)(*v3 - 12);
        uint64_t v14 = *v3;
        if (!*v3) {
          goto LABEL_22;
        }
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = -1;
        uint64_t v14 = *v3;
        if (!*v3) {
          goto LABEL_22;
        }
      }
      unsigned int v15 = 6 * *(_DWORD *)(v14 - 12);
      unsigned int v16 = *(_DWORD *)(v14 - 4);
      if (v15 < v16 && v16 >= 9) {
        WTF::HashTable<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *>>,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashMap<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>,WebScriptWorld *,WTF::DefaultHash<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>,WTF::HashTraits<WebScriptWorld *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::WeakRef<WebCore::DOMWrapperWorld,WTF::SingleThreadWeakPtrImpl>>>::rehash(v3, v16 >> 1);
      }
    }
  }
LABEL_22:

  self->_private = 0;
  v19.receiver = self;
  v19.super_class = (Class)WebScriptWorld;
  [(WebScriptWorld *)&v19 dealloc];
}

+ (id)standardWorld
{
  if (_MergedGlobals_10 == 1) {
    return (id)qword_1EB3A96B0;
  }
  v3 = [WebScriptWorld alloc];
  uint64_t v4 = (_DWORD *)WebCore::mainThreadNormalWorld((WebCore *)v3);
  ++*v4;
  int v6 = v4;
  v5 = [(WebScriptWorld *)v3 initWithWorld:&v6];
  WTF::Ref<WebCore::DOMWrapperWorld,WTF::RawPtrTraits<WebCore::DOMWrapperWorld>,WTF::DefaultRefDerefTraits<WebCore::DOMWrapperWorld>>::~Ref(&v6);
  id result = v5;
  qword_1EB3A96B0 = (uint64_t)v5;
  _MergedGlobals_10 = 1;
  return result;
}

+ (id)world
{
  v2 = (void *)CFMakeCollectable(objc_alloc_init((Class)a1));
  return v2;
}

+ (id)scriptWorldForGlobalContext:(OpaqueJSContext *)a3
{
  return (id)[a1 findOrCreateWorld:*((void *)a3 + 426)];
}

+ (id)scriptWorldForJavaScriptContext:(id)a3
{
  uint64_t v4 = [a3 JSGlobalContextRef];
  return (id)[a1 scriptWorldForGlobalContext:v4];
}

+ (id)findOrCreateWorld:(void *)a3
{
  if ((void *)WebCore::mainThreadNormalWorld((WebCore *)a1) == a3)
  {
    return (id)[a1 standardWorld];
  }
  else
  {
    if (byte_1EB3A96AA)
    {
      uint64_t v5 = *(void *)qword_1EB3A96C0;
      if (*(void *)qword_1EB3A96C0)
      {
        int v6 = *(_DWORD *)(v5 - 8);
        unint64_t v7 = ((unint64_t)a3 + ~((void)a3 << 32)) ^ (((unint64_t)a3 + ~((void)a3 << 32)) >> 22);
        unint64_t v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
        unint64_t v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
        unsigned int v10 = v6 & ((v9 >> 31) ^ v9);
        for (int i = 1; ; ++i)
        {
          uint64_t v12 = v10;
          uint64_t v13 = *(void *)(v5 + 16 * v10);
          if (v13 != -1)
          {
            if (!v13) {
              goto LABEL_15;
            }
            if (*(void **)(v13 + 8) == a3) {
              break;
            }
          }
          unsigned int v10 = (v12 + i) & v6;
        }
        CFTypeRef v14 = *(CFTypeRef *)(v5 + 16 * v12 + 8);
        if (v14) {
          return (id)v14;
        }
      }
    }
    else
    {
      unsigned int v16 = (void *)WTF::fastMalloc((WTF *)8);
      *unsigned int v16 = 0;
      qword_1EB3A96C0 = (uint64_t)v16;
      byte_1EB3A96AA = 1;
    }
LABEL_15:
    id v17 = objc_alloc((Class)a1);
    ++*(_DWORD *)a3;
    unint64_t v21 = a3;
    CFTypeRef v14 = (id)CFMakeCollectable((CFTypeRef)[v17 initWithWorld:&v21]);
    uint64_t v18 = v21;
    unint64_t v21 = 0;
    if (!v18) {
      return (id)v14;
    }
    if (*v18 == 1)
    {
      objc_super v19 = (WTF *)MEMORY[0x1E4E45A10]();
      WTF::fastFree(v19, v20);
    }
    else
    {
      --*v18;
    }
    return (id)v14;
  }
}

@end