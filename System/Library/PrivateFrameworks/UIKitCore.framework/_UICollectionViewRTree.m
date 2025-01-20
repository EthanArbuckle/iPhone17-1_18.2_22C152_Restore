@interface _UICollectionViewRTree
- (_UICollectionViewRTree)init;
- (id).cxx_construct;
- (uint64_t)insertFrame:(CGFloat)a3 forElement:(CGFloat)a4;
- (void)removeAttributesWithFramesIntersectingFrame:(float64_t)a3;
@end

@implementation _UICollectionViewRTree

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (uint64_t)insertFrame:(CGFloat)a3 forElement:(CGFloat)a4
{
  if (result)
  {
    uint64_t v7 = result;
    if (CGRectIsNull(*(CGRect *)&a3)) {
      return 0;
    }
    v42.origin.x = a3;
    v42.size.width = a5;
    v42.origin.y = a4;
    v42.size.height = a6;
    if (CGRectIsInfinite(v42))
    {
      return 0;
    }
    else
    {
      v9.f64[0] = a3;
      v8.f64[0] = a5;
      v9.f64[1] = a4;
      v8.f64[1] = a6;
      float64x2_t v10 = vaddq_f64(v9, vminnmq_f64(v8, (float64x2_t)0));
      __asm { FMOV            V2.2D, #6.0 }
      float64x2_t v16 = vmulq_f64(v10, _Q2);
      float64x2_t v17 = vmulq_f64(vabsq_f64(v8), _Q2);
      float64x2_t v18 = vrndaq_f64(v16);
      float64x2_t v19 = vrndaq_f64(v17);
      float64x2_t v20 = (float64x2_t)vdupq_n_s64(0x3F43A92A30553262uLL);
      int8x16_t v21 = (int8x16_t)vcgtq_f64(v20, vabdq_f64(v16, v18));
      int8x16_t v22 = (int8x16_t)vcgtq_f64(v20, vabdq_f64(v17, v19));
      uint64_t v23 = *(void *)(v7 + 8);
      uint64_t v24 = *(void *)a2;
      long long v35 = *(_OWORD *)(a2 + 8);
      long long v25 = *(_OWORD *)(a2 + 24);
      *(void *)(a2 + 24) = 0;
      *(void *)(a2 + 32) = 0;
      uint64_t v26 = *(void *)(v7 + 8);
      v27 = *(std::__shared_weak_count **)(v7 + 16);
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      __n128 v28 = (__n128)vbslq_s8(v21, (int8x16_t)v18, (int8x16_t)v16);
      __n128 v29 = (__n128)vbslq_s8(v22, (int8x16_t)v19, (int8x16_t)v17);
      v38 = v27;
      uint64_t v39 = v24;
      long long v40 = v35;
      long long v41 = v25;
      uint64_t v37 = v26;
      if (v27) {
        atomic_fetch_add_explicit(&v27->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      _UIRTreeContainerNode<_UICollectionViewRTreeElement>::addChild(&v36, v23, &v39, &v37, v28, v29);
      if (v38) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v38);
      }

      v30 = *(std::__shared_weak_count **)(v7 + 16);
      *(_OWORD *)(v7 + 8) = v36;
      if (v30) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v30);
      }
      if (v27) {
        std::__shared_weak_count::__release_shared[abi:nn180100](v27);
      }
      return 1;
    }
  }
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_root.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (_UICollectionViewRTree)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UICollectionViewRTree;
  v2 = [(_UICollectionViewRTree *)&v7 init];
  if (v2)
  {
    v3 = (char *)operator new(0xB0uLL);
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    *(void *)v3 = &unk_1ED0BEA20;
    *((void *)v3 + 5) = 0;
    *((void *)v3 + 6) = 0;
    *((void *)v3 + 4) = &unk_1ED0BE9E0;
    *(_OWORD *)(v3 + 72) = 0u;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 88) = 0u;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_OWORD *)(v3 + 120) = 0u;
    *((void *)v3 + 17) = 0;
    _UIRTreeContainerNode<_UICollectionViewRTreeElement>::commonInit((int64x2_t *)v3 + 2);
    v6[0] = v3 + 32;
    v6[1] = v3;
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::__enable_weak_this[abi:nn180100]<_UIRTreeContainerNode<unsigned long>,_UIRTreeContainerNode<unsigned long>,void>((uint64_t)v6, (void *)v3 + 5, (uint64_t)(v3 + 32));
    cntrl = (std::__shared_weak_count *)v2->_root.__cntrl_;
    v2->_root.__ptr_ = v3 + 32;
    v2->_root.__cntrl_ = (__shared_weak_count *)v3;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:nn180100](cntrl);
    }
  }
  return v2;
}

- (void)removeAttributesWithFramesIntersectingFrame:(float64_t)a3
{
  if (a1)
  {
    a2.f64[1] = a3;
    a4.f64[1] = a5;
    float64x2_t v5 = vaddq_f64(a2, vminnmq_f64(a4, (float64x2_t)0));
    float64x2_t v6 = vabsq_f64(a4);
    __asm { FMOV            V2.2D, #6.0 }
    float64x2_t v12 = vmulq_f64(v5, _Q2);
    float64x2_t v13 = vmulq_f64(v6, _Q2);
    float64x2_t v14 = vrndaq_f64(v12);
    float64x2_t v15 = vrndaq_f64(v13);
    float64x2_t v16 = (float64x2_t)vdupq_n_s64(0x3F43A92A30553262uLL);
    float64x2_t v17 = *(int64x2_t **)(a1 + 8);
    v18[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v16, vabdq_f64(v12, v14)), (int8x16_t)v14, (int8x16_t)v12);
    v18[1] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v16, vabdq_f64(v13, v15)), (int8x16_t)v15, (int8x16_t)v13);
    _UIRTreeContainerNode<_UICollectionViewRTreeElement>::removeElementsIntersecting(v17, v18);
  }
}

@end