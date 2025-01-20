@interface _UIRTree
- (CGRect)_frameForIndex:(unint64_t)a3;
- (_UIRTree)init;
- (id).cxx_construct;
- (id)allIndexes;
- (id)description;
- (uint64_t)enumerateFramesWithBlock:(uint64_t)result;
- (void)insertFrame:(CGFloat)a3 forIndex:(CGFloat)a4;
@end

@implementation _UIRTree

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (void)insertFrame:(CGFloat)a3 forIndex:(CGFloat)a4
{
  if (result)
  {
    v7 = result;
    if (CGRectIsNull(*(CGRect *)&a3))
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:sel_insertFrame_forIndex_, v7, @"_UIRTree.mm", 603, @"Invalid parameter not satisfying: %@", @"!CGRectIsNull(frame)" object file lineNumber description];
    }
    v30.origin.x = a3;
    v30.size.width = a5;
    v30.origin.y = a4;
    v30.size.height = a6;
    if (CGRectIsInfinite(v30))
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:sel_insertFrame_forIndex_, v7, @"_UIRTree.mm", 604, @"Invalid parameter not satisfying: %@", @"!CGRectIsInfinite(frame)" object file lineNumber description];
    }
    v9.f64[0] = a3;
    v8.f64[0] = a5;
    v9.f64[1] = a4;
    v8.f64[1] = a6;
    float64x2_t v10 = vaddq_f64(v9, vminnmq_f64(v8, (float64x2_t)0));
    float64x2_t v11 = vabsq_f64(v8);
    uint64_t v12 = v7[1];
    v13 = (std::__shared_weak_count *)v7[2];
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      uint64_t v28 = v12;
      v29 = v13;
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    else
    {
      uint64_t v28 = v7[1];
      v29 = 0;
    }
    _UIRTreeContainerNode<unsigned long>::addChild(&v27, v12, a2, &v28, v10, v11);
    if (v29) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v29);
    }
    v14 = (std::__shared_weak_count *)v7[2];
    *(_OWORD *)(v7 + 1) = v27;
    if (v14) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v14);
    }
    if (v13) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v13);
    }
    result = (void *)v7[5];
    uint64_t v15 = v7[3];
    if (result)
    {
      v16 = v7 + 4;
      uint64_t v17 = v7[4];
      if (v17 + v15 != a2)
      {
LABEL_17:
        result = (void *)[result addIndex:a2];
        if (v7[3] != 0x7FFFFFFFFFFFFFFFLL)
        {
          v7[3] = 0x7FFFFFFFFFFFFFFFLL;
          v7[4] = 0;
        }
        return result;
      }
    }
    else
    {
      if (v15 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7[3] = a2;
        v7[4] = 1;
        return result;
      }
      v16 = v7 + 4;
      uint64_t v17 = v7[4];
      if (v17 + v15 != a2)
      {
        id v18 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        v19 = (void *)v7[5];
        v7[5] = v18;

        uint64_t v20 = v7[3];
        result = (void *)v7[5];
        if (v20 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(result, "addIndexesInRange:", v20, v7[4]);
          result = (void *)v7[5];
        }
        goto LABEL_17;
      }
    }
    void *v16 = v17 + 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allIndexes, 0);
  cntrl = self->_root.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:nn180100]((std::__shared_weak_count *)cntrl);
  }
}

- (_UIRTree)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UIRTree;
  v2 = [(_UIRTree *)&v8 init];
  if (v2)
  {
    v3 = (char *)operator new(0xB0uLL);
    *((void *)v3 + 1) = 0;
    *((void *)v3 + 2) = 0;
    *(void *)v3 = &unk_1ED0BEA58;
    *((void *)v3 + 5) = 0;
    *((void *)v3 + 6) = 0;
    *(_OWORD *)(v3 + 72) = 0u;
    *((void *)v3 + 4) = &unk_1ED0BEA00;
    *(_OWORD *)(v3 + 56) = 0u;
    *(_OWORD *)(v3 + 88) = 0u;
    *(_OWORD *)(v3 + 104) = 0u;
    *(_OWORD *)(v3 + 120) = 0u;
    *((void *)v3 + 17) = 0;
    _UIRTreeContainerNode<unsigned long>::commonInit((int64x2_t *)v3 + 2);
    v7[0] = v3 + 32;
    v7[1] = v3;
    std::shared_ptr<_UIRTreeContainerNode<unsigned long>>::__enable_weak_this[abi:nn180100]<_UIRTreeContainerNode<unsigned long>,_UIRTreeContainerNode<unsigned long>,void>((uint64_t)v7, (void *)v3 + 5, (uint64_t)(v3 + 32));
    v4 = (std::__shared_weak_count *)*((void *)v2 + 2);
    *((void *)v2 + 1) = v3 + 32;
    *((void *)v2 + 2) = v3;
    if (v4) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v4);
    }
    v5 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = 0;

    *(_OWORD *)(v2 + 24) = xmmword_186B93450;
  }
  return (_UIRTree *)v2;
}

- (id)description
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__34;
  uint64_t v15 = __Block_byref_object_dispose__34;
  id v16 = (id)[@"{" mutableCopy];
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __23___UIRTree_description__block_invoke;
  v9[3] = &unk_1E52E18E8;
  v9[4] = v10;
  v9[5] = &v11;
  -[_UIRTree enumerateFramesWithBlock:]((uint64_t)self, (uint64_t)v9);
  [(id)v12[5] appendString:@"}"];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[_UIRTree allIndexes]((id *)&self->super.isa);
  v7 = [v3 stringWithFormat:@"<%@ %p indexes=%@ frames=%@>", v5, self, v6, v12[5]];;

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (uint64_t)enumerateFramesWithBlock:(uint64_t)result
{
  if (result)
  {
    char v4 = 0;
    uint64_t v2 = *(void *)(result + 8);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __37___UIRTree_enumerateFramesWithBlock___block_invoke;
    v3[3] = &unk_1E52E1910;
    v3[4] = a2;
    return _UIRTreeContainerNode<unsigned long>::enumerate(v2, &v4, (uint64_t)v3);
  }
  return result;
}

- (id)allIndexes
{
  if (a1)
  {
    uint64_t v2 = a1;
    a1 = (id *)a1[5];
    if (!a1)
    {
      id v3 = v2[3];
      if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        a1 = (id *)objc_alloc_init(MEMORY[0x1E4F28D60]);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", v3, v2[4]);
        a1 = (id *)objc_claimAutoreleasedReturnValue();
      }
    }
    uint64_t v1 = vars8;
  }
  return a1;
}

- (CGRect)_frameForIndex:(unint64_t)a3
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x5012000000;
  id v16 = __Block_byref_object_copy__37;
  uint64_t v17 = __Block_byref_object_dispose__38;
  id v18 = &unk_186D7DBA7;
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  long long v19 = *MEMORY[0x1E4F1DB20];
  long long v20 = v3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __27___UIRTree__frameForIndex___block_invoke;
  v12[3] = &unk_1E52E1938;
  v12[4] = &v13;
  v12[5] = a3;
  -[_UIRTree enumerateFramesWithBlock:]((uint64_t)self, (uint64_t)v12);
  double v4 = v14[6];
  double v5 = v14[7];
  double v6 = v14[8];
  double v7 = v14[9];
  _Block_object_dispose(&v13, 8);
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

@end