@interface WebFixedPositionContent
- (BOOL)hasFixedOrStickyPositionLayers;
- (WebFixedPositionContent)initWithWebView:(id)a3;
- (void)dealloc;
- (void)didFinishScrollingOrZooming;
- (void)overflowScrollPositionForLayer:(id)a3 changedTo:(CGPoint)a4;
- (void)scrollOrZoomChanged:(CGRect)a3;
- (void)setViewportConstrainedLayers:(void *)a3 stickyContainerMap:(const void *)a4;
@end

@implementation WebFixedPositionContent

- (WebFixedPositionContent)initWithWebView:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WebFixedPositionContent;
  v4 = [(WebFixedPositionContent *)&v7 init];
  if (v4)
  {
    v5 = (void *)WTF::fastMalloc((WTF *)0x10);
    void *v5 = a3;
    v5[1] = 0;
    v4->_private = v5;
  }
  return v4;
}

- (void)dealloc
{
  v3 = (WTF *)self->_private;
  if (v3)
  {
    uint64_t v4 = *((void *)v3 + 1);
    if (v4)
    {
      uint64_t v5 = *(unsigned int *)(v4 - 4);
      if (v5)
      {
        uint64_t v6 = *((void *)v3 + 1);
        do
        {
          objc_super v7 = *(const void **)v6;
          if (*(void *)v6 != -1)
          {
            v8 = *(WTF **)(v6 + 8);
            *(void *)(v6 + 8) = 0;
            if (v8)
            {
              uint64_t v9 = *((void *)v8 + 1);
              *((void *)v8 + 1) = 0;
              if (v9) {
                (*(void (**)(uint64_t, SEL))(*(void *)v9 + 8))(v9, a2);
              }
              WTF::fastFree(v8, (void *)a2);
              objc_super v7 = *(const void **)v6;
            }
            *(void *)uint64_t v6 = 0;
            if (v7) {
              CFRelease(v7);
            }
          }
          v6 += 16;
          --v5;
        }
        while (v5);
      }
      WTF::fastFree((WTF *)(v4 - 16), (void *)a2);
    }
    WTF::fastFree(v3, (void *)a2);
  }
  v10.receiver = self;
  v10.super_class = (Class)WebFixedPositionContent;
  [(WebFixedPositionContent *)&v10 dealloc];
}

- (void)scrollOrZoomChanged:(CGRect)a3
{
  char v4 = 0;
  CGRect v35 = a3;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v4, 1u, memory_order_acquire, memory_order_acquire);
  if (v4)
  {
    MEMORY[0x1E4E44220](webFixedPositionContentDataLock, a2);
    uint64_t v5 = (void *)*((void *)self->_private + 1);
    if (!v5) {
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v5 = (void *)*((void *)self->_private + 1);
    if (!v5) {
      goto LABEL_13;
    }
  }
  uint64_t v6 = *((unsigned int *)v5 - 1);
  objc_super v7 = &v5[2 * v6];
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
    while (v5 != v7)
    {
      objc_super v10 = (void *)*v5;
      v11 = *(float **)(v5[1] + 8);
      int v12 = (*(uint64_t (**)(float *, SEL))(*(void *)v11 + 16))(v11, a2);
      if (v12)
      {
        if (v12 == 1)
        {
          WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v34, &v35);
          WebCore::StickyPositionViewportConstraints::layerPositionForConstrainingRect((WebCore::StickyPositionViewportConstraints *)v11, (const WebCore::FloatRect *)v34);
          float v14 = v13;
          float v16 = v15;
          [v10 bounds];
          double v18 = v17;
          double v20 = v19;
          [v10 anchorPoint];
          objc_msgSend(v10, "setPosition:", (float)(v14 - v11[2]) + v21 * v18, (float)(v16 - v11[3]) + v22 * v20);
        }
      }
      else
      {
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v34, &v35);
        WebCore::FixedPositionViewportConstraints::layerPositionForViewportRect((WebCore::FixedPositionViewportConstraints *)v11, (const WebCore::FloatRect *)v34);
        float v24 = v23;
        float v26 = v25;
        [v10 bounds];
        double v28 = v27;
        double v30 = v29;
        [v10 anchorPoint];
        objc_msgSend(v10, "setPosition:", (float)(v24 - v11[2]) + v31 * v28, (float)(v26 - v11[3]) + v32 * v30);
      }
      v33 = v5 + 2;
      uint64_t v5 = v7;
      if (v33 != v7)
      {
        uint64_t v5 = v33;
        while ((unint64_t)(*v5 + 1) <= 1)
        {
          v5 += 2;
          if (v5 == v7)
          {
            uint64_t v5 = v7;
            break;
          }
        }
      }
    }
  }
LABEL_13:
  int v9 = 1;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v9, 0, memory_order_release, memory_order_relaxed);
  if (v9 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
  }
}

- (void)overflowScrollPositionForLayer:(id)a3 changedTo:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  char v8 = 0;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v8, 1u, memory_order_acquire, memory_order_acquire);
  if (v8)
  {
    MEMORY[0x1E4E44220](webFixedPositionContentDataLock, a2);
    int v9 = (void *)*((void *)self->_private + 1);
    if (!v9) {
      goto LABEL_23;
    }
  }
  else
  {
    int v9 = (void *)*((void *)self->_private + 1);
    if (!v9) {
      goto LABEL_23;
    }
  }
  uint64_t v10 = *((unsigned int *)v9 - 1);
  v11 = &v9[2 * v10];
  if (*((_DWORD *)v9 - 3))
  {
    if (v10)
    {
      uint64_t v12 = 16 * v10;
      while ((unint64_t)(*v9 + 1) <= 1)
      {
        v9 += 2;
        v12 -= 16;
        if (!v12)
        {
          int v9 = v11;
          break;
        }
      }
    }
    if (v11 != v9)
    {
      float v13 = x;
      float v14 = y;
      do
      {
        uint64_t v15 = v9[1];
        if (*(id *)v15 == a3)
        {
          float v16 = (void *)*v9;
          uint64_t v17 = *(void *)(v15 + 8);
          *(float *)double v30 = v13;
          *(float *)&v30[1] = v14;
          uint64_t v31 = *(void *)(v17 + 44);
          WebCore::StickyPositionViewportConstraints::layerPositionForConstrainingRect((WebCore::StickyPositionViewportConstraints *)v17, (const WebCore::FloatRect *)v30);
          float v19 = v18;
          float v21 = v20;
          [v16 bounds];
          double v23 = v22;
          double v25 = v24;
          [v16 anchorPoint];
          objc_msgSend(v16, "setPosition:", (float)(v19 - *(float *)(v17 + 8)) + v26 * v23, (float)(v21 - *(float *)(v17 + 12)) + v27 * v25);
        }
        double v28 = v9 + 2;
        int v9 = v11;
        if (v28 != v11)
        {
          int v9 = v28;
          while ((unint64_t)(*v9 + 1) <= 1)
          {
            v9 += 2;
            if (v9 == v11)
            {
              int v9 = v11;
              break;
            }
          }
        }
      }
      while (v9 != v11);
    }
  }
LABEL_23:
  int v29 = 1;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v29, 0, memory_order_release, memory_order_relaxed);
  if (v29 != 1) {
    WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
  }
}

- (void)didFinishScrollingOrZooming
{
}

uint64_t __54__WebFixedPositionContent_didFinishScrollingOrZooming__block_invoke(uint64_t a1)
{
  uint64_t result = [**(id **)(*(void *)(a1 + 32) + 8) _mainCoreFrame];
  if (result)
  {
    return MEMORY[0x1F416C198]();
  }
  return result;
}

- (void)setViewportConstrainedLayers:(void *)a3 stickyContainerMap:(const void *)a4
{
  char v7 = 0;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v7, 1u, memory_order_acquire, memory_order_acquire);
  if (v7)
  {
    MEMORY[0x1E4E44220](webFixedPositionContentDataLock, a2);
    char v8 = self->_private;
    uint64_t v9 = v8[1];
    if (!v9) {
      goto LABEL_14;
    }
  }
  else
  {
    char v8 = self->_private;
    uint64_t v9 = v8[1];
    if (!v9) {
      goto LABEL_14;
    }
  }
  v8[1] = 0;
  uint64_t v10 = *(unsigned int *)(v9 - 4);
  if (v10)
  {
    uint64_t v11 = v9;
    do
    {
      uint64_t v12 = *(const void **)v11;
      if (*(void *)v11 != -1)
      {
        float v13 = *(WTF **)(v11 + 8);
        *(void *)(v11 + 8) = 0;
        if (v13)
        {
          uint64_t v14 = *((void *)v13 + 1);
          *((void *)v13 + 1) = 0;
          if (v14) {
            (*(void (**)(uint64_t, SEL))(*(void *)v14 + 8))(v14, a2);
          }
          WTF::fastFree(v13, (void *)a2);
          uint64_t v12 = *(const void **)v11;
        }
        *(void *)uint64_t v11 = 0;
        if (v12) {
          CFRelease(v12);
        }
      }
      v11 += 16;
      --v10;
    }
    while (v10);
  }
  WTF::fastFree((WTF *)(v9 - 16), (void *)a2);
LABEL_14:
  uint64_t v15 = *(const void ***)a3;
  if (!*(void *)a3)
  {
    float v18 = 0;
    uint64_t v17 = 0;
    goto LABEL_23;
  }
  uint64_t v16 = *((unsigned int *)v15 - 1);
  uint64_t v17 = &v15[2 * v16];
  if (!*((_DWORD *)v15 - 3))
  {
    float v18 = &v15[2 * v16];
    uint64_t v17 = v18;
    if (!v15) {
      goto LABEL_27;
    }
LABEL_24:
    float v20 = &v15[2 * *((unsigned int *)v15 - 1)];
    if (v20 != v18) {
      goto LABEL_30;
    }
    goto LABEL_80;
  }
  float v18 = *(const void ***)a3;
  if (!v16)
  {
LABEL_23:
    if (!v15) {
      goto LABEL_27;
    }
    goto LABEL_24;
  }
  uint64_t v19 = 16 * v16;
  float v18 = *(const void ***)a3;
  do
  {
    if ((unint64_t)*v18 + 1 > 1) {
      goto LABEL_23;
    }
    v18 += 2;
    v19 -= 16;
  }
  while (v19);
  float v18 = v17;
  if (v15) {
    goto LABEL_24;
  }
LABEL_27:
  float v20 = 0;
  if (v18)
  {
    while (1)
    {
LABEL_30:
      float v21 = *v18;
      double v22 = (void *)WTF::fastMalloc((WTF *)0x10);
      double v24 = v22;
      *double v22 = 0;
      v22[1] = 0;
      v58 = v22;
      uint64_t v25 = *(void *)a4;
      uint64_t v26 = ~((void)v21 << 32);
      if (!*(void *)a4) {
        goto LABEL_36;
      }
      unsigned int v27 = *(_DWORD *)(v25 - 8);
      unint64_t v28 = (((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22))
          + ~((((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22)) << 13);
      unint64_t v29 = (9 * (v28 ^ (v28 >> 8))) ^ ((9 * (v28 ^ (v28 >> 8))) >> 15);
      uint64_t v30 = v27 & (((v29 + ~(v29 << 27)) >> 31) ^ (v29 + ~(v29 << 27)));
      uint64_t v31 = *(const void **)(v25 + 16 * v30);
      if (v31 == v21) {
        break;
      }
      int v32 = 1;
      while (v31)
      {
        uint64_t v30 = (v30 + v32) & v27;
        uint64_t v31 = *(const void **)(v25 + 16 * v30);
        ++v32;
        if (v31 == v21) {
          goto LABEL_35;
        }
      }
      v56 = v18[1];
      v18[1] = 0;
      uint64_t v34 = v22[1];
      *double v24 = 0;
      v24[1] = v56;
      if (v34) {
        goto LABEL_37;
      }
LABEL_38:
      CGRect v35 = self->_private;
      if (v21) {
        CFRetain(v21);
      }
      uint64_t v38 = v35[1];
      v37 = v35 + 1;
      uint64_t v36 = v38;
      if (v38
        || (WTF::HashTable<WTF::RetainPtr<CALayer>,WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashMap<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashTraits<WTF::RetainPtr<CALayer>>,WTF::HashTraits<std::unique_ptr<ViewportConstrainedLayerData>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<CALayer>>>::rehash(v37, 8u), (uint64_t v36 = *v37) != 0))
      {
        int v39 = *(_DWORD *)(v36 - 8);
      }
      else
      {
        int v39 = 0;
      }
      unint64_t v40 = (((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22))
          + ~((((unint64_t)v21 + v26) ^ (((unint64_t)v21 + v26) >> 22)) << 13);
      unint64_t v41 = (9 * (v40 ^ (v40 >> 8))) ^ ((9 * (v40 ^ (v40 >> 8))) >> 15);
      unsigned int v42 = v39 & (((v41 + ~(v41 << 27)) >> 31) ^ (v41 + ~(v41 << 27)));
      v43 = (void *)(v36 + 16 * v42);
      v44 = (const void *)*v43;
      if (*v43)
      {
        v45 = 0;
        int v46 = 1;
        while (v44 != v21)
        {
          if (v44 == (const void *)-1) {
            v45 = v43;
          }
          unsigned int v42 = (v42 + v46) & v39;
          v43 = (void *)(v36 + 16 * v42);
          v44 = (const void *)*v43;
          ++v46;
          if (!*v43)
          {
            if (v45)
            {
              void *v45 = 0;
              v45[1] = 0;
              --*(_DWORD *)(*v37 - 16);
              v43 = v45;
            }
            goto LABEL_51;
          }
        }
        v53 = (WTF *)v43[1];
        v43[1] = v24;
        if (v53)
        {
          uint64_t v54 = *((void *)v53 + 1);
          *((void *)v53 + 1) = 0;
          if (v54) {
            (*(void (**)(uint64_t))(*(void *)v54 + 8))(v54);
          }
          WTF::fastFree(v53, v23);
        }
        if (v21) {
          CFRelease(v21);
        }
        goto LABEL_72;
      }
LABEL_51:
      void *v43 = v21;
      v47 = (WTF *)v43[1];
      v43[1] = v58;
      if (v47)
      {
        uint64_t v48 = *((void *)v47 + 1);
        *((void *)v47 + 1) = 0;
        if (v48) {
          (*(void (**)(uint64_t))(*(void *)v48 + 8))(v48);
        }
        WTF::fastFree(v47, v23);
      }
      if (*v37)
      {
        ++*(_DWORD *)(*v37 - 12);
        uint64_t v49 = *v37;
        if (*v37) {
          goto LABEL_57;
        }
      }
      else
      {
        MEMORY[0xFFFFFFFFFFFFFFF4] = 1;
        uint64_t v49 = *v37;
        if (*v37)
        {
LABEL_57:
          uint64_t v50 = (*(_DWORD *)(v49 - 16) + *(_DWORD *)(v49 - 12));
          unint64_t v51 = *(unsigned int *)(v49 - 4);
          if (v51 > 0x400) {
            goto LABEL_69;
          }
          goto LABEL_58;
        }
      }
      uint64_t v50 = *(unsigned int *)(v49 - 16);
      unint64_t v51 = *(unsigned int *)(v49 - 4);
      if (v51 > 0x400)
      {
LABEL_69:
        if (v51 <= 2 * v50) {
          goto LABEL_70;
        }
        goto LABEL_72;
      }
LABEL_58:
      if (3 * v51 <= 4 * v50)
      {
        if (v51) {
LABEL_70:
        }
          unsigned int v52 = v51 << (6 * *(_DWORD *)(v49 - 12) >= (2 * v51));
        else {
          unsigned int v52 = 8;
        }
        WTF::HashTable<WTF::RetainPtr<CALayer>,WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>>>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashMap<WTF::RetainPtr<CALayer>,std::unique_ptr<ViewportConstrainedLayerData>,WTF::DefaultHash<WTF::RetainPtr<CALayer>>,WTF::HashTraits<WTF::RetainPtr<CALayer>>,WTF::HashTraits<std::unique_ptr<ViewportConstrainedLayerData>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::RetainPtr<CALayer>>>::rehash(v37, v52);
      }
LABEL_72:
      v55 = v18 + 2;
      float v18 = v17;
      if (v55 != v17)
      {
        float v18 = v55;
        while ((unint64_t)*v18 + 1 <= 1)
        {
          v18 += 2;
          if (v18 == v17)
          {
            float v18 = v17;
            break;
          }
        }
      }
      if (v18 == v20) {
        goto LABEL_80;
      }
    }
LABEL_35:
    uint64_t v25 = *(void *)(v25 + 16 * v30 + 8);
LABEL_36:
    v33 = v18[1];
    v18[1] = 0;
    uint64_t v34 = v22[1];
    *double v24 = v25;
    v24[1] = v33;
    if (!v34) {
      goto LABEL_38;
    }
LABEL_37:
    (*(void (**)(uint64_t))(*(void *)v34 + 8))(v34);
    goto LABEL_38;
  }
LABEL_80:
  int v57 = 1;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v57, 0, memory_order_release, memory_order_relaxed);
  if (v57 != 1)
  {
    WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
  }
}

- (BOOL)hasFixedOrStickyPositionLayers
{
  char v3 = 0;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v3, 1u, memory_order_acquire, memory_order_acquire);
  if (!v3)
  {
    uint64_t v4 = *((void *)self->_private + 1);
    if (v4) {
      goto LABEL_3;
    }
LABEL_6:
    BOOL v5 = 0;
    int v8 = 1;
    atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v8, 0, memory_order_release, memory_order_relaxed);
    if (v8 == 1) {
      return v5;
    }
    goto LABEL_7;
  }
  MEMORY[0x1E4E44220](webFixedPositionContentDataLock, a2);
  uint64_t v4 = *((void *)self->_private + 1);
  if (!v4) {
    goto LABEL_6;
  }
LABEL_3:
  BOOL v5 = *(_DWORD *)(v4 - 12) != 0;
  int v6 = 1;
  atomic_compare_exchange_strong_explicit(webFixedPositionContentDataLock, (unsigned __int8 *)&v6, 0, memory_order_release, memory_order_relaxed);
  if (v6 == 1) {
    return v5;
  }
LABEL_7:
  WTF::Lock::unlockSlow((WTF::Lock *)webFixedPositionContentDataLock);
  return v5;
}

@end