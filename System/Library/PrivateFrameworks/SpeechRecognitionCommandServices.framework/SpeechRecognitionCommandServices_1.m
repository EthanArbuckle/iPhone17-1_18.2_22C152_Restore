uint64_t fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::NumArcs(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  if ((fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::HasArcs((uint64_t)a1, a2) & 1) == 0)(*(void (**)(void *, uint64_t))(*a1 + 40))(a1, a2); {
  v4 = a1[15];
  }
  if (*(_DWORD *)(v4 + 92) == a2) {
    v5 = v4 + 96;
  }
  else {
    v5 = *(void *)(v4 + 8) + 8 * ((int)a2 + 1);
  }
  return (uint64_t)(*(void *)(*(void *)v5 + 32) - *(void *)(*(void *)v5 + 24)) >> 4;
}

uint64_t fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::NumInputEpsilons(void *a1, uint64_t a2)
{
  if ((fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::HasArcs((uint64_t)a1, a2) & 1) == 0)(*(void (**)(void *, uint64_t))(*a1 + 40))(a1, a2); {
  uint64_t v4 = a1[15];
  }
  if (*(_DWORD *)(v4 + 92) == a2) {
    uint64_t v5 = v4 + 96;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 8) + 8 * ((int)a2 + 1);
  }
  return *(void *)(*(void *)v5 + 8);
}

uint64_t fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::NumOutputEpsilons(void *a1, uint64_t a2)
{
  if ((fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::HasArcs((uint64_t)a1, a2) & 1) == 0)(*(void (**)(void *, uint64_t))(*a1 + 40))(a1, a2); {
  uint64_t v4 = a1[15];
  }
  if (*(_DWORD *)(v4 + 92) == a2) {
    uint64_t v5 = v4 + 96;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 8) + 8 * ((int)a2 + 1);
  }
  return *(void *)(*(void *)v5 + 16);
}

void *fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::DeterminizeFst(void *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (a3)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32))(v4);
    std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::shared_ptr[abi:ne180100]<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,void>(&v8, v5);
  }
  uint64_t v6 = *(void *)(a2 + 16);
  if (v6) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
  }
  a1[1] = v4;
  a1[2] = v6;
  *a1 = &unk_26EE2DA48;
  return a1;
}

void std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::shared_ptr[abi:ne180100]<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_23AC2037C(_Unwind_Exception *exception_object)
{
  if (v1) {
    std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::shared_ptr[abi:ne180100]<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,void>();
  }
  _Unwind_Resume(exception_object);
}

void std::__shared_ptr_pointer<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>> *,std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::__shared_ptr_default_delete<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>,std::allocator<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23ECC24B0);
}

uint64_t std::__shared_ptr_pointer<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>> *,std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::__shared_ptr_default_delete<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>,std::allocator<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(void))(*(void *)result + 8))();
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>> *,std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::__shared_ptr_default_delete<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>,std::allocator<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

void fst::StateIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::~StateIterator()
{
}

uint64_t fst::CacheStateIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::Done(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v2 < *(_DWORD *)(v3 + 64)) {
    return 0;
  }
  uint64_t v5 = fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::MinUnexpandedState(v3);
  if ((int)v5 >= *(_DWORD *)(*(void *)(a1 + 16) + 64)) {
    return 1;
  }
  uint64_t v6 = v5;
  do
  {
    fst::ArcIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::ArcIterator(&v20, *(void *)(a1 + 8), v6);
    unint64_t v7 = v21;
    uint64_t v8 = *(void *)(v20 + 24);
    uint64_t v9 = *(void *)(v20 + 32) - v8;
    uint64_t v10 = *(void *)(a1 + 16);
    if (v21 < v9 >> 4)
    {
      uint64_t v11 = v9 >> 4;
      int v12 = *(_DWORD *)(v10 + 64);
      v13 = (int *)(v8 + 16 * v21 + 12);
      do
      {
        int v15 = *v13;
        v13 += 4;
        int v14 = v15;
        if (v12 <= v15)
        {
          int v12 = v14 + 1;
          *(_DWORD *)(v10 + 64) = v14 + 1;
        }
        ++v7;
      }
      while (v11 != v7);
      unint64_t v21 = v11;
    }
    fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::SetExpandedState(v10, v6);
    int v16 = *(_DWORD *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 16);
    int v18 = *(_DWORD *)(v17 + 64);
    --*(_DWORD *)(v20 + 60);
    BOOL v4 = v16 >= v18;
    if (v16 < v18) {
      break;
    }
    uint64_t v6 = fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::MinUnexpandedState(v17);
  }
  while ((int)v6 < *(_DWORD *)(*(void *)(a1 + 16) + 64));
  return v4;
}

void sub_23AC20570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t fst::CacheStateIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::Value(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t fst::CacheStateIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::Next(uint64_t result)
{
  return result;
}

uint64_t fst::CacheStateIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::Reset(uint64_t result)
{
  *(_DWORD *)(result + ++*(_DWORD *)(result + 24) = 0;
  return result;
}

void fst::CacheStateIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::~CacheStateIterator()
{
}

void *fst::ArcIterator<fst::DeterminizeFst<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::ArcIterator(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  a1[1] = 0;
  MutableState = fst::GCCacheStore<fst::FirstCacheStore<fst::VectorCacheStore<fst::CacheState<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>,fst::PoolAllocator<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::GetMutableState(*(void *)(v6 + 120), a3);
  *a1 = MutableState;
  ++*((_DWORD *)MutableState + 15);
  if ((fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::HasArcs(*(void *)(a2 + 8), a3) & 1) == 0)(*(void (**)(void, uint64_t))(**(void **)(a2 + 8) + 40))(*(void *)(a2 + 8), a3); {
  return a1;
  }
}

void sub_23AC20650(_Unwind_Exception *a1)
{
  --*(_DWORD *)(*(void *)v1 + 60);
  _Unwind_Resume(a1);
}

uint64_t fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::InitArcIterator(uint64_t a1, uint64_t a2, void *a3)
{
  if ((fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::HasArcs(a1, a2) & 1) == 0)(*(void (**)(uint64_t, uint64_t))(*(void *)a1 + 40))(a1, a2); {
  return fst::internal::CacheBaseImpl<fst::CacheState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::PoolAllocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::InitArcIterator(a1, a2, a3);
  }
}

int *fst::ComputeTotalWeight<fst::ArcTpl<fst::TropicalWeightTpl<float>>>@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, int *a4@<X8>)
{
  if (a3)
  {
    if ((*(int (**)(uint64_t))(*(void *)a1 + 16))(a1) >= (unint64_t)((a2[1] - *a2) >> 2)) {
      uint64_t result = fst::TropicalWeightTpl<float>::Zero();
    }
    else {
      uint64_t result = (int *)(*a2 + 4 * (*(int (**)(uint64_t))(*(void *)a1 + 16))(a1));
    }
    *a4 = *result;
  }
  else
  {
    uint64_t result = fst::TropicalWeightTpl<float>::Zero();
    float v8 = *(float *)result;
    *a4 = *result;
    uint64_t v9 = *a2;
    if (a2[1] != *a2)
    {
      unint64_t v10 = 0;
      do
      {
        uint64_t result = (int *)(*(void *(**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)a1 + 24))(&v14, a1, v10);
        float v11 = *(float *)(v9 + 4 * v10);
        if (v11 == -INFINITY || *(float *)&v14 >= -INFINITY && *(float *)&v14 <= -INFINITY)
        {
          uint64_t result = fst::TropicalWeightTpl<float>::NoWeight();
          float v12 = *(float *)result;
        }
        else
        {
          BOOL v13 = *(float *)&v14 == INFINITY || v11 == INFINITY;
          float v12 = v11 + *(float *)&v14;
          if (v13) {
            float v12 = INFINITY;
          }
        }
        if (v8 == -INFINITY || v12 >= -INFINITY && v12 <= -INFINITY)
        {
          uint64_t result = fst::TropicalWeightTpl<float>::NoWeight();
          float v8 = *(float *)result;
        }
        else if (v8 >= v12)
        {
          float v8 = v12;
        }
        *(float *)a4 = v8;
        ++v10;
        uint64_t v9 = *a2;
      }
      while (v10 < (a2[1] - *a2) >> 2);
    }
  }
  return result;
}

uint64_t fst::Reweight<fst::ArcTpl<fst::TropicalWeightTpl<float>>>(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*a1 + 136))(a1);
  if (!result) {
    return result;
  }
  uint64_t v68 = 0;
  int v69 = 0;
  signed int v70 = 0;
  (*(void (**)(uint64_t *, uint64_t *))(*a1 + 112))(a1, &v68);
LABEL_3:
  if (v68)
  {
    if ((*(unsigned int (**)(uint64_t))(*(void *)v68 + 16))(v68)) {
      goto LABEL_90;
    }
    if (v68)
    {
      int v7 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 24))(v68);
      goto LABEL_9;
    }
  }
  else if (v70 >= v69)
  {
    goto LABEL_90;
  }
  int v7 = v70;
LABEL_9:
  uint64_t v8 = v7;
  uint64_t v9 = *a2;
  if (v7 != (a2[1] - *a2) >> 2)
  {
    unint64_t v10 = fst::TropicalWeightTpl<float>::Zero();
    LODWORD(v64) = 0;
    LODWORD(v64) = *(_DWORD *)(v9 + 4 * v8);
    LODWORD(v67) = 0;
    LODWORD(v67) = *v10;
    v11.n128_u32[0] = v64;
    if (*(float *)&v64 == *(float *)&v67) {
      goto LABEL_49;
    }
    (*(void (**)(uint64_t *, uint64_t, uint64_t *, float))(*a1 + 272))(a1, v8, &v67, *(float *)&v64);
    while (1)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)v67 + 16))(v67))
      {
        if (v67) {
          (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
        }
        if (a3)
        {
LABEL_49:
          if (a3 == 1)
          {
            (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t, __n128))(*a1 + 24))(&v64, a1, v8, v11);
            float v21 = *(float *)(v9 + 4 * v8);
            if (v21 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
            {
              float v22 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
            }
            else
            {
              BOOL v25 = *(float *)&v64 == INFINITY || v21 == INFINITY;
              float v22 = v21 + *(float *)&v64;
              if (v25) {
                float v22 = INFINITY;
              }
            }
            float v62 = v22;
            (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v8, &v62);
          }
        }
        else
        {
          (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v8);
          if (*(float *)&v64 == -INFINITY || (float v23 = *(float *)(v9 + 4 * v8), v23 >= -INFINITY) && v23 <= -INFINITY)
          {
            float v24 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
          }
          else
          {
            float v24 = *(float *)&v64 - v23;
            if (*(float *)&v64 == INFINITY) {
              float v24 = INFINITY;
            }
            if (v23 == INFINITY) {
              float v24 = NAN;
            }
          }
          float v63 = v24;
          (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v8, &v63);
        }
        if (v68) {
          (*(void (**)(uint64_t))(*(void *)v68 + 32))(v68);
        }
        else {
          ++v70;
        }
        goto LABEL_3;
      }
      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v67 + 24))(v67);
      uint64_t v64 = *(void *)v12;
      float v65 = *(float *)(v12 + 8);
      int v66 = *(_DWORD *)(v12 + 12);
      uint64_t v13 = v66;
      uint64_t v14 = *a2;
      if (v66 < (unint64_t)((a2[1] - *a2) >> 2))
      {
        int v15 = fst::TropicalWeightTpl<float>::Zero();
        float v72 = 0.0;
        float v72 = *(float *)(v14 + 4 * v13);
        float v71 = 0.0;
        float v71 = *(float *)v15;
        if (v72 != v71) {
          break;
        }
      }
LABEL_45:
      (*(void (**)(uint64_t))(*(void *)v67 + 32))(v67);
    }
    if (a3)
    {
      if (a3 != 1)
      {
LABEL_44:
        (*(void (**)(uint64_t, uint64_t *))(*(void *)v67 + 80))(v67, &v64);
        goto LABEL_45;
      }
      float v16 = *(float *)(v9 + 4 * v8);
      if (v16 == -INFINITY || v65 >= -INFINITY && v65 <= -INFINITY)
      {
        float v17 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
      }
      else
      {
        float v17 = INFINITY;
        if (v16 == INFINITY || v65 == INFINITY)
        {
LABEL_36:
          float v19 = *(float *)(v14 + 4 * v13);
          if (v19 >= -INFINITY && v19 <= -INFINITY) {
            goto LABEL_38;
          }
LABEL_39:
          if (v19 == INFINITY)
          {
            float v20 = NAN;
          }
          else
          {
            float v20 = INFINITY;
            if (v17 != INFINITY) {
              float v20 = v17 - v19;
            }
          }
          goto LABEL_43;
        }
        float v17 = v16 + v65;
      }
      if (v17 != -INFINITY) {
        goto LABEL_36;
      }
LABEL_38:
      float v20 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
LABEL_43:
      float v65 = v20;
      goto LABEL_44;
    }
    if (v65 == -INFINITY || (float v18 = *(float *)(v14 + 4 * v13), v18 >= -INFINITY) && v18 <= -INFINITY)
    {
      float v17 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
    }
    else
    {
      float v17 = INFINITY;
      if (v65 == INFINITY || v18 == INFINITY) {
        goto LABEL_29;
      }
      float v17 = v65 + v18;
    }
    if (v17 == -INFINITY) {
      goto LABEL_38;
    }
LABEL_29:
    float v19 = *(float *)(v9 + 4 * v8);
    if (v19 >= -INFINITY && v19 <= -INFINITY) {
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  while (1)
  {
LABEL_90:
    if (!v68)
    {
      if (v70 >= v69) {
        break;
      }
      goto LABEL_75;
    }
    if ((*(uint64_t (**)(uint64_t))(*(void *)v68 + 16))(v68)) {
      break;
    }
    if (v68)
    {
      uint64_t v26 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 24))(v68);
      goto LABEL_76;
    }
LABEL_75:
    uint64_t v26 = v70;
LABEL_76:
    if (a3 == 1)
    {
      v27 = fst::TropicalWeightTpl<float>::Zero();
      (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v26);
      float v28 = *(float *)v27;
      if (*(float *)v27 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
      {
        float v29 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
      }
      else
      {
        BOOL v30 = *(float *)&v64 == INFINITY || v28 == INFINITY;
        float v29 = v28 + *(float *)&v64;
        if (v30) {
          float v29 = INFINITY;
        }
      }
      float v61 = v29;
      (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v26, &v61);
    }
    if (v68) {
      (*(void (**)(uint64_t))(*(void *)v68 + 32))(v68);
    }
    else {
      ++v70;
    }
  }
  if ((*(int (**)(uint64_t *))(*a1 + 16))(a1) >= (unint64_t)((a2[1] - *a2) >> 2)) {
    v31 = fst::TropicalWeightTpl<float>::Zero();
  }
  else {
    v31 = (int *)(*a2 + 4 * (*(int (**)(uint64_t *))(*a1 + 16))(a1));
  }
  float v32 = *(float *)v31;
  v33 = fst::TropicalWeightTpl<float>::One();
  *(float *)&uint64_t v64 = v32;
  LODWORD(v67) = 0;
  LODWORD(v67) = *v33;
  v34.n128_f32[0] = v32;
  if (v32 == *(float *)&v67) {
    goto LABEL_171;
  }
  v35 = fst::TropicalWeightTpl<float>::Zero();
  *(float *)&uint64_t v64 = v32;
  LODWORD(v67) = 0;
  LODWORD(v67) = *v35;
  v34.n128_f32[0] = v32;
  if (v32 == *(float *)&v67) {
    goto LABEL_171;
  }
  uint64_t v36 = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, float))(*a1 + 56))(a1, 0x2000000000, 1, v32);
  uint64_t v37 = *a1;
  if ((v36 & 0x2000000000) == 0)
  {
    uint64_t v38 = (*(uint64_t (**)(uint64_t *))(v37 + 176))(a1);
    if (a3)
    {
      float v39 = *(float *)fst::TropicalWeightTpl<float>::One();
      if (v39 == -INFINITY || v32 >= -INFINITY && v32 <= -INFINITY)
      {
        float v40 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
      }
      else if (v32 == INFINITY)
      {
        float v40 = NAN;
      }
      else
      {
        float v40 = INFINITY;
        if (v39 != INFINITY) {
          float v40 = v39 - v32;
        }
      }
    }
    else
    {
      float v40 = v32;
    }
    int v56 = (*(uint64_t (**)(uint64_t *))(*a1 + 16))(a1);
    uint64_t v64 = 0;
    float v65 = v40;
    int v66 = v56;
    (*(void (**)(uint64_t *, uint64_t, uint64_t *))(*a1 + 184))(a1, v38, &v64);
    (*(void (**)(uint64_t *, uint64_t))(*a1 + 152))(a1, v38);
    goto LABEL_171;
  }
  uint64_t v41 = (*(uint64_t (**)(uint64_t *))(v37 + 16))(a1);
  (*(void (**)(uint64_t *, uint64_t, uint64_t *))(*a1 + 272))(a1, v41, &v67);
  while (2)
  {
    if (!(*(unsigned int (**)(uint64_t))(*(void *)v67 + 16))(v67))
    {
      uint64_t v42 = (*(uint64_t (**)(uint64_t))(*(void *)v67 + 24))(v67);
      uint64_t v64 = *(void *)v42;
      float v43 = *(float *)(v42 + 8);
      float v65 = v43;
      int v66 = *(_DWORD *)(v42 + 12);
      if (a3)
      {
        float v44 = *(float *)fst::TropicalWeightTpl<float>::One();
        if (v44 == -INFINITY || v32 >= -INFINITY && v32 <= -INFINITY)
        {
          float v45 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
          goto LABEL_110;
        }
        if (v32 == INFINITY) {
          goto LABEL_117;
        }
        float v45 = INFINITY;
        if (v44 != INFINITY)
        {
          float v45 = v44 - v32;
LABEL_110:
          if (v45 == -INFINITY) {
            goto LABEL_117;
          }
        }
        if (v65 >= -INFINITY && v65 <= -INFINITY)
        {
LABEL_117:
          float v46 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
        }
        else
        {
          BOOL v48 = v65 == INFINITY || v45 == INFINITY;
          float v46 = v45 + v65;
          if (v48) {
            float v46 = INFINITY;
          }
        }
      }
      else
      {
        if (v32 == -INFINITY || v43 >= -INFINITY && v43 <= -INFINITY) {
          goto LABEL_117;
        }
        BOOL v47 = v43 == INFINITY || v32 == INFINITY;
        float v46 = v32 + v43;
        if (v47) {
          float v46 = INFINITY;
        }
      }
      float v65 = v46;
      (*(void (**)(uint64_t, uint64_t *))(*(void *)v67 + 80))(v67, &v64);
      (*(void (**)(uint64_t))(*(void *)v67 + 32))(v67);
      continue;
    }
    break;
  }
  if (v67) {
    (*(void (**)(uint64_t))(*(void *)v67 + 8))(v67);
  }
  if (a3)
  {
    float v49 = *(float *)fst::TropicalWeightTpl<float>::One();
    if (v49 == -INFINITY || v32 >= -INFINITY && v32 <= -INFINITY)
    {
      float v50 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
    }
    else
    {
      BOOL v25 = v49 == INFINITY;
      float v52 = v49 - v32;
      if (v25) {
        float v52 = INFINITY;
      }
      if (v32 == INFINITY) {
        float v50 = NAN;
      }
      else {
        float v50 = v52;
      }
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v41);
    if (v50 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
    {
      float v53 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
    }
    else
    {
      BOOL v54 = *(float *)&v64 == INFINITY || v50 == INFINITY;
      float v53 = v50 + *(float *)&v64;
      if (v54) {
        float v53 = INFINITY;
      }
    }
    float v59 = v53;
    (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v41, &v59);
  }
  else
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v41);
    if (v32 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
    {
      float v51 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
    }
    else
    {
      BOOL v55 = *(float *)&v64 == INFINITY || v32 == INFINITY;
      float v51 = v32 + *(float *)&v64;
      if (v55) {
        float v51 = INFINITY;
      }
    }
    float v60 = v51;
    (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v41, &v60);
  }
LABEL_171:
  unint64_t v57 = (*(uint64_t (**)(uint64_t *, uint64_t, void, __n128))(*a1 + 56))(a1, 0xFFFFFFFF0007, 0, v34);
  unint64_t v58 = fst::ReweightProperties(v57);
  (*(void (**)(uint64_t *, unint64_t, uint64_t))(*a1 + 168))(a1, v58, 0xFFFFFFFF0007);
  uint64_t result = v68;
  if (v68) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v68 + 8))(v68);
  }
  return result;
}

void sub_23AC216AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 8))(a15);
  }
  _Unwind_Resume(exception_object);
}

int *fst::RemoveWeight<fst::ArcTpl<fst::TropicalWeightTpl<float>>>(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = fst::TropicalWeightTpl<float>::One();
  LODWORD(v23) = 0;
  LODWORD(v23) = *a2;
  LODWORD(v21) = 0;
  LODWORD(v21) = *result;
  if (*(float *)&v23 == *(float *)&v21) {
    return result;
  }
  uint64_t result = fst::TropicalWeightTpl<float>::Zero();
  LODWORD(v23) = 0;
  LODWORD(v23) = *a2;
  LODWORD(v21) = 0;
  LODWORD(v21) = *result;
  float v7 = *(float *)&v23;
  if (*(float *)&v23 == *(float *)&v21) {
    return result;
  }
  if (a3)
  {
    float v23 = 0;
    float v24 = 0.0;
    unsigned int v26 = 0;
    (*(void (**)(uint64_t, int **, float))(*(void *)a1 + 112))(a1, &v23, v7);
    while (1)
    {
      uint64_t result = v23;
      if (!v23) {
        break;
      }
      int v8 = (*(uint64_t (**)(int *))(*(void *)v23 + 16))(v23);
      uint64_t result = v23;
      if (v8)
      {
        if (v23) {
          return (int *)(*(uint64_t (**)(void))(*(void *)v23 + 8))();
        }
        return result;
      }
      if (!v23) {
        goto LABEL_11;
      }
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v23 + 24))();
      if (v23) {
        uint64_t v10 = (*(uint64_t (**)(int *))(*(void *)v23 + 24))(v23);
      }
      else {
        uint64_t v10 = v26;
      }
LABEL_12:
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24))(&v21, a1, v10);
      if (*(float *)&v21 == -INFINITY || (float v11 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
      {
        float v12 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
      }
      else
      {
        float v12 = *(float *)&v21 - v11;
        if (*(float *)&v21 == INFINITY) {
          float v12 = INFINITY;
        }
        if (v11 == INFINITY) {
          float v12 = NAN;
        }
      }
      float v22 = v12;
      (*(void (**)(uint64_t, uint64_t, float *))(*(void *)a1 + 160))(a1, v9, &v22);
      if (v23) {
        (*(void (**)(int *))(*(void *)v23 + 32))(v23);
      }
      else {
        ++v26;
      }
    }
    if ((int)v26 >= SLODWORD(v24)) {
      return result;
    }
LABEL_11:
    uint64_t v9 = v26;
    uint64_t v10 = v26;
    goto LABEL_12;
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t, float))(*(void *)a1 + 16))(a1, *(float *)&v23);
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a1 + 272))(a1, v13, &v21);
  while (!(*(unsigned int (**)(uint64_t))(*(void *)v21 + 16))(v21))
  {
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v21 + 24))(v21);
    float v23 = *(int **)v14;
    float v15 = *(float *)(v14 + 8);
    float v24 = v15;
    int v25 = *(_DWORD *)(v14 + 12);
    if (v15 == -INFINITY || (float v16 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
    {
      float v17 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
    }
    else if (v16 == INFINITY)
    {
      float v17 = NAN;
    }
    else
    {
      float v17 = INFINITY;
      if (v15 != INFINITY) {
        float v17 = v15 - v16;
      }
    }
    float v24 = v17;
    (*(void (**)(uint64_t, int **))(*(void *)v21 + 80))(v21, &v23);
    (*(void (**)(uint64_t))(*(void *)v21 + 32))(v21);
  }
  if (v21) {
    (*(void (**)(uint64_t))(*(void *)v21 + 8))(v21);
  }
  (*(void (**)(int **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24))(&v23, a1, v13);
  if (*(float *)&v23 == -INFINITY || (float v18 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
  {
    float v19 = *(float *)fst::TropicalWeightTpl<float>::NoWeight();
  }
  else
  {
    float v19 = *(float *)&v23 - v18;
    if (*(float *)&v23 == INFINITY) {
      float v19 = INFINITY;
    }
    if (v18 == INFINITY) {
      float v19 = NAN;
    }
  }
  float v20 = v19;
  return (int *)(*(uint64_t (**)(uint64_t, uint64_t, float *))(*(void *)a1 + 160))(a1, v13, &v20);
}

void sub_23AC21CB0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t cmdp_fst_util::replace()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t fst::CountStates<fst::ArcTpl<fst::TropicalWeightTpl<float>>>()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t fst::ArcSortMapper<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::OLabelCompare<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::SetState(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 24);
  if (v1) {
    --*v1;
  }
  return result;
}

uint64_t fst::ArcSortMapper<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::OLabelCompare<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::SetState()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t fst::SortedMatcher<fst::Fst<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::SortedMatcher(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t fst::SequenceComposeFilter<cmdp_fst_util::SpecialMatcher<fst::SortedMatcher<fst::Fst<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>,cmdp_fst_util::SpecialMatcher<fst::SortedMatcher<fst::Fst<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>::SequenceComposeFilter(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)a1 + 8))();
}

uint64_t std::shared_ptr<fst::internal::ComposeFstImplBase<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>,fst::ComposeFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>::shared_ptr[abi:ne180100]<fst::internal::ComposeFstImplBase<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>,fst::ComposeFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>,void>()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t fst::ReplaceFstMatcher<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::DefaultReplaceStateTable<fst::ArcTpl<fst::TropicalWeightTpl<float>>,long>,fst::DefaultCacheStore<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>::ReplaceFstMatcher()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t fst::CountStates<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t std::shared_ptr<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>::shared_ptr[abi:ne180100]<fst::internal::DeterminizeFstImplBase<fst::ReverseArc<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>,void>()
{
  OUTLINED_FUNCTION_0_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void CMDPNormalizer::CMDPNormalizer(CMDPNormalizer *this, const __CFLocale *a2)
{
  *(void *)this = a2;
}

void CMDPNormalizer::~CMDPNormalizer(CMDPNormalizer *this)
{
}

void CMDPNormalizer::normalize(CFLocaleRef *a1@<X0>, const char *a2@<X1>, std::string *a3@<X8>)
{
  uint64_t v3 = a2;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  CFStringRef v6 = CFStringCreateWithCStringNoCopy(0, a2, 0x8000100u, (CFAllocatorRef)*MEMORY[0x263EFFB28]);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, v6);
  CFStringLowercase(MutableCopy, *a1);
  CFRelease(v6);
  if (MutableCopy)
  {
    cmdp_string::CreateCppStringFromCFString(MutableCopy, (const __CFString *)1, a3);
  }
  else if (v3[23] < 0)
  {
    int v8 = *(const std::string::value_type **)v3;
    std::string::size_type v9 = *((void *)v3 + 1);
    std::string::__init_copy_ctor_external(a3, v8, v9);
  }
  else
  {
    *(_OWORD *)&a3->__r_.__value_.__l.__data_ = *(_OWORD *)v3;
    a3->__r_.__value_.__r.__words[2] = *((void *)v3 + 2);
  }
}

void cmdp_string::CreateCppStringFromCFString(const __CFString *this@<X0>, const __CFString *a2@<X1>, void *a3@<X8>)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (this)
  {
    int v4 = (int)a2;
    CFIndex Length = CFStringGetLength(this);
    CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    MEMORY[0x270FA5388]();
    int v8 = (char *)v10 - v7;
    CFStringGetCString(this, (char *)v10 - v7, v9, 0x8000100u);
    std::string::basic_string[abi:ne180100]<0>(a3, v8);
    if (v4) {
      CFRelease(this);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(a3, 0);
  }
}

void sub_23AC22174(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

std::string *CMDPNormalizer::homonymize@<X0>(const void **a1@<X1>, std::string *a2@<X8>)
{
  {
    operator new();
  }
  std::string::basic_string[abi:ne180100]<0>(a2, "");
  uint64_t v4 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(CMDPNormalizer::homonymize(std::string const&)const::homonym_map, a1);
  uint64_t result = (std::string *)CMDPNormalizer::homonymize(std::string const&)const::homonym_map;
  if (CMDPNormalizer::homonymize(std::string const&)const::homonym_map + 8 != v4)
  {
    CFStringRef v6 = (const std::string *)std::map<std::string,std::string>::at(CMDPNormalizer::homonymize(std::string const&)const::homonym_map, a1);
    return std::string::operator=(a2, v6);
  }
  return result;
}

void sub_23AC22AC0(_Unwind_Exception *a1)
{
  for (uint64_t i = 3216; i != -48; i -= 48)
    std::pair<std::string const,std::string>::~pair(v2 + i);
  MEMORY[0x23ECC24B0](v1, 0x1020C4062D53EE8);
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::string const,std::string>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::map<std::string,std::string>::at(uint64_t a1, const void **a2)
{
  uint64_t v2 = *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(a1, &v4, a2);
  if (!v2) {
    std::__throw_out_of_range[abi:ne180100]("map::at:  key not found");
  }
  return v2 + 56;
}

__CFArray *CMDPNormalizer::tokenizedString(CMDPNormalizer *this, const __CFString *a2)
{
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (a2)
  {
    CFIndex Length = CFStringGetLength(a2);
    v17.location = 0;
    v17.length = Length;
    CFStringRef v6 = CFStringTokenizerCreate(0, a2, v17, 4uLL, *(CFLocaleRef *)this);
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      CFIndex v8 = CurrentTokenRange.length;
      if (RDGetLegitimateCharacters(void)::s_init_char_set != -1) {
        dispatch_once(&RDGetLegitimateCharacters(void)::s_init_char_set, &__block_literal_global_6);
      }
      if (CFStringFindCharacterFromSet(a2, (CFCharacterSetRef)RDGetLegitimateCharacters(void)::s_legit_chars, CurrentTokenRange, 0, &v16))
      {
        CFIndex v9 = CurrentTokenRange.length + CurrentTokenRange.location;
LABEL_7:
        if (v9 < Length - 1)
        {
          if (RDGetLegitimateCharacters(void)::s_init_char_set != -1) {
            dispatch_once(&RDGetLegitimateCharacters(void)::s_init_char_set, &__block_literal_global_6);
          }
          CFCharacterSetRef v10 = (const __CFCharacterSet *)RDGetLegitimateCharacters(void)::s_legit_chars;
          UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v9 + 1);
          if (CFCharacterSetIsCharacterMember(v10, CharacterAtIndex))
          {
            int v12 = CFStringGetCharacterAtIndex(a2, v9);
            if ((v12 - 8208) < 2 || v12 == 173 || v12 == 45)
            {
              while (CFStringTokenizerAdvanceToNextToken(v6))
              {
                CFRange v13 = CFStringTokenizerGetCurrentTokenRange(v6);
                if (v13.location > v9)
                {
                  CFIndex v8 = v13.length - CurrentTokenRange.location + v13.location;
                  CFIndex v9 = v13.length + v13.location;
                  goto LABEL_7;
                }
              }
            }
          }
        }
        v18.location = CurrentTokenRange.location;
        v18.length = v8;
        CFStringRef v14 = CFStringCreateWithSubstring(0, a2, v18);
        CFArrayAppendValue(Mutable, v14);
        CFRelease(v14);
      }
    }
    CFRelease(v6);
  }
  return Mutable;
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[5],char const(&)[2],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22E04(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[4],char const(&)[2],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22E58(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[6],char const(&)[2],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22EAC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[3],char const(&)[2],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22F00(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[7],char const(&)[2],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22F54(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[5],char const(&)[3],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22FA8(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[4],char const(&)[3],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC22FFC(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::pair<std::string const,std::string>::pair[abi:ne180100]<char const(&)[7],char const(&)[3],0>(void *a1, char *a2, char *a3)
{
  uint64_t v5 = std::string::basic_string[abi:ne180100]<0>(a1, a2);
  std::string::basic_string[abi:ne180100]<0>(v5 + 3, a3);
  return a1;
}

void sub_23AC23050(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void ___ZL25RDGetLegitimateCharactersv_block_invoke()
{
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  CFCharacterSetRef v2 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v2);
  CFCharacterSetInvert(MutableCopy);
  RDGetLegitimateCharacters(void)::s_legit_chars = (uint64_t)MutableCopy;
}

uint64_t std::map<std::string,std::string>::map[abi:ne180100](uint64_t a1, const void **a2, uint64_t a3)
{
  *(void *)(a1 + 8) = 0;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 48 * a3;
    do
    {
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>((uint64_t **)a1, v4, a2, (long long *)a2);
      a2 += 6;
      v6 -= 48;
    }
    while (v6);
  }
  return a1;
}

void sub_23AC23130(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_hint_unique_key_args<std::string,std::pair<std::string const,std::string> const&>(uint64_t **a1, uint64_t *a2, const void **a3, long long *a4)
{
  uint64_t v6 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(a1, a2, &v12, &v11, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    CFIndex v8 = (uint64_t **)v6;
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>((uint64_t)a1, a4, (uint64_t)v10);
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v12, v8, v10[0]);
    uint64_t v7 = v10[0];
    v10[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100]((uint64_t)v10, 0);
  }
  return v7;
}

const void **std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  CFIndex v9 = (const void **)(a1 + 1);
  if (a1 + 1 != a2 && !std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
    {
      *a3 = (const void **)a2;
      *a4 = (uint64_t)a2;
      return (const void **)a4;
    }
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      CFStringRef v14 = (const void **)a2[1];
      do
      {
        float v15 = v14;
        CFStringRef v14 = (const void **)*v14;
      }
      while (v14);
    }
    else
    {
      CFRange v18 = (const void **)a2;
      do
      {
        float v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        CFRange v18 = v15;
      }
      while (!v17);
    }
    if (v15 != v9)
    {
      if (!std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), a5, v15 + 4)) {
        goto LABEL_28;
      }
      uint64_t v13 = *a4;
    }
    if (v13)
    {
      *a3 = v15;
      return v15;
    }
    else
    {
      *a3 = (const void **)a2;
    }
    return (const void **)a4;
  }
  if ((uint64_t *)*a1 == a2)
  {
    int v12 = (const void **)a2;
LABEL_16:
    if (*a2)
    {
      *a3 = v12;
      return v12 + 1;
    }
    else
    {
      *a3 = (const void **)a2;
      return (const void **)a2;
    }
  }
  uint64_t v11 = (const void **)*a2;
  if (*a2)
  {
    do
    {
      int v12 = v11;
      uint64_t v11 = (const void **)v11[1];
    }
    while (v11);
  }
  else
  {
    CFRange v16 = a2;
    do
    {
      int v12 = (const void **)v16[2];
      BOOL v17 = *v12 == v16;
      CFRange v16 = (uint64_t *)v12;
    }
    while (v17);
  }
  if (std::less<std::string>::operator()[abi:ne180100]((uint64_t)(a1 + 2), v12 + 4, a5)) {
    goto LABEL_16;
  }
LABEL_28:
  return (const void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, a3, a5);
}

std::string *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__construct_node<std::pair<std::string const,std::string> const&>@<X0>(uint64_t a1@<X0>, long long *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  uint64_t result = std::pair<std::string const,std::string>::pair[abi:ne180100]((std::string *)(v6 + 32), a2);
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void sub_23AC233E0(_Unwind_Exception *a1)
{
  std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

void *std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        CFIndex v8 = (void *)v4;
        CFIndex v9 = (const void **)(v4 + 32);
        if (!std::less<std::string>::operator()[abi:ne180100](v7, a3, (const void **)(v4 + 32))) {
          break;
        }
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (!std::less<std::string>::operator()[abi:ne180100](v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }
    while (v4);
  }
  else
  {
    CFIndex v8 = (void *)(a1 + 8);
  }
LABEL_10:
  *a2 = v8;
  return v5;
}

std::string *std::pair<std::string const,std::string>::pair[abi:ne180100](std::string *this, long long *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  uint64_t v5 = this + 1;
  if (*((char *)a2 + 47) < 0)
  {
    std::string::__init_copy_ctor_external(v5, *((const std::string::value_type **)a2 + 3), *((void *)a2 + 4));
  }
  else
  {
    long long v6 = *(long long *)((char *)a2 + 24);
    this[1].__r_.__value_.__r.__words[2] = *((void *)a2 + 5);
    *(_OWORD *)&v5->__r_.__value_.__l.__data_ = v6;
  }
  return this;
}

void sub_23AC23514(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(exception_object);
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::string>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::string>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  CFCharacterSetRef v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0) {
    operator delete(*(void **)(a1 + 24));
  }
  if (*(char *)(a1 + 23) < 0)
  {
    CFCharacterSetRef v2 = *(void **)a1;
    operator delete(v2);
  }
}

void std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::string>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

uint64_t std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = std::less<std::string>::operator()[abi:ne180100](v5, (const void **)(v3 + 32), a2);
    CFIndex v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      CFIndex v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }
    uint64_t v3 = *v8;
  }
  while (*v8);
  if (v6 == v2 || std::less<std::string>::operator()[abi:ne180100](v5, a2, (const void **)(v6 + 32))) {
    return v2;
  }
  return v6;
}

void CMDPToken::CMDPToken(std::string *this, long long *a2, std::string::value_type a3, std::string::value_type a4, double a5, double a6, double a7, double a8)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v15 = *a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v15;
  }
  *(double *)&this[1].__r_.__value_.__l.__data_ = a5;
  *(double *)&this[1].__r_.__value_.__l.__size_ = a6;
  *(double *)&this[1].__r_.__value_.__r.__words[2] = a7;
  *(double *)&this[2].__r_.__value_.__l.__data_ = a8;
  this[2].__r_.__value_.__s.__data_[8] = a3;
  this[2].__r_.__value_.__s.__data_[9] = a4;
}

void cmdp_sausage_util::mergeTokens(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a1 + 23) < 0) {
    std::string::__init_copy_ctor_external(&v8, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
  }
  else {
    std::string v8 = *(std::string *)a1;
  }
  if (*(char *)(a2 + 23) < 0) {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else {
    std::string __p = *(std::string *)a2;
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  uint64_t v5 = std::string::append(&v8, (const std::string::value_type *)p_p, size);
  v7[0] = v5->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v7 + 3) = *(_DWORD *)((char *)&v5->__r_.__value_.__r.__words[2] + 3);
  v5->__r_.__value_.__l.__size_ = 0;
  v5->__r_.__value_.__r.__words[2] = 0;
  v5->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v8.__r_.__value_.__l.__data_);
  }
  operator new();
}

void sub_23AC2393C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  MEMORY[0x23ECC24B0](v22, 0x1012C408B718000);
  operator delete(v21);
  _Unwind_Resume(a1);
}

void cmdp_sausage_util::sanitizeTokenSausage(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  uint64_t v2 = *a1;
  uint64_t v15 = a1[1];
  if (*a1 == v15) {
    return;
  }
  CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  do
  {
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v3 = *(void **)v2;
    uint64_t v16 = v2;
    BOOL v17 = *(void **)(v2 + 8);
    if (*(void **)v2 == v17) {
      goto LABEL_33;
    }
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = 0;
      uint64_t v22 = 0;
      uint64_t v4 = *v3;
      if (v3[1] == *v3) {
        goto LABEL_30;
      }
      float v19 = v3;
      unint64_t v5 = 0;
      do
      {
        uint64_t v6 = *(long long **)(v4 + 8 * v5);
        if (*((char *)v6 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&v21, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        }
        else
        {
          long long v7 = *v6;
          v21.__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
          *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v7;
        }
        if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
          std::string v8 = &v21;
        }
        else {
          std::string v8 = (std::string *)v21.__r_.__value_.__r.__words[0];
        }
        CFStringRef v9 = CFStringCreateWithCString(0, (const char *)v8, 0x8000100u);
        if (CFStringCompare(@" ", v9, 0))
        {
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(alloc, v9, @" ");
          if (!v9) {
            goto LABEL_17;
          }
LABEL_16:
          CFRelease(v9);
          goto LABEL_17;
        }
        CFArrayRef ArrayBySeparatingStrings = 0;
        if (v9) {
          goto LABEL_16;
        }
LABEL_17:
        if (!ArrayBySeparatingStrings || CFArrayGetCount(ArrayBySeparatingStrings) < 2)
        {
          int v12 = *(long long **)(v4 + 8 * v5);
          if (*((char *)v12 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v28, *(const std::string::value_type **)v12, *((void *)v12 + 1));
          }
          else
          {
            long long v13 = *v12;
            v28.__r_.__value_.__r.__words[2] = *((void *)v12 + 2);
            *(_OWORD *)&v28.__r_.__value_.__l.__data_ = v13;
          }
          operator new();
        }
        if (CFArrayGetCount(ArrayBySeparatingStrings) > 0)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 0);
          cmdp_string::CreateCppStringFromCFString(ValueAtIndex, 0, __p);
          operator new();
        }
        CFRelease(ArrayBySeparatingStrings);
        if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0) {
          operator delete(v21.__r_.__value_.__l.__data_);
        }
        ++v5;
        uint64_t v4 = *v19;
      }
      while (v5 < (uint64_t)(v19[1] - *v19) >> 3);
      uint64_t v3 = v19;
      if (v22 != v23) {
        std::vector<std::vector<std::unique_ptr<CMDPToken>>>::push_back[abi:ne180100](&v25, (uint64_t)&v22);
      }
LABEL_30:
      v28.__r_.__value_.__r.__words[0] = (std::string::size_type)&v22;
      std::vector<std::unique_ptr<CMDPToken>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
      v3 += 3;
    }
    while (v3 != v17);
    if (v25 != v26) {
      std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::push_back[abi:ne180100](a2, (uint64_t)&v25);
    }
LABEL_33:
    v28.__r_.__value_.__r.__words[0] = (std::string::size_type)&v25;
    std::vector<std::vector<std::unique_ptr<CMDPToken>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
    uint64_t v2 = v16 + 24;
  }
  while (v16 + 24 != v15);
}

void sub_23AC23F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,uint64_t a34,uint64_t *a35,uint64_t a36,uint64_t a37,uint64_t a38)
{
  a35 = &a38;
  std::vector<std::vector<std::unique_ptr<CMDPToken>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a35);
  a38 = a10;
  std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&a38);
  _Unwind_Resume(a1);
}

void cmdp_sausage_util::addArcToFst(uint64_t a1, int a2, int a3, int a4, const char *a5, int a6, uint64_t **a7, CFLocaleRef *a8)
{
  CMDPNormalizer::normalize(a8, a5, &__p);
  std::to_string(&v17, a4);
  CMDPFst::addArc(a1, a2, a3, (uint64_t)&v17, (uint64_t)&__p, (double)a6);
  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(a7, (const void **)&__p.__r_.__value_.__l.__data_, (uint64_t)&__p);
  CMDPNormalizer::homonymize((const void **)&__p.__r_.__value_.__l.__data_, &v17);
  std::string::size_type size = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  char v15 = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  if ((v17.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    std::to_string(&v16, a4);
    CMDPFst::addArc(a1, a2, a3, (uint64_t)&v16, (uint64_t)&v17, (double)a6);
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v16.__r_.__value_.__l.__data_);
    }
    std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(a7, (const void **)&v17.__r_.__value_.__l.__data_, (uint64_t)&v17);
    char v15 = HIBYTE(v17.__r_.__value_.__r.__words[2]);
  }
  if (v15 < 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }
}

void sub_23AC24224(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t cmdp_sausage_util::needsMerging(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (*(char *)(a1 + 23) < 0) {
      std::string::__init_copy_ctor_external(&v12, *(const std::string::value_type **)a1, *(void *)(a1 + 8));
    }
    else {
      std::string v12 = *(std::string *)a1;
    }
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::size_type size = v12.__r_.__value_.__l.__size_;
      if (v12.__r_.__value_.__l.__size_)
      {
        unint64_t v5 = (std::string *)v12.__r_.__value_.__r.__words[0];
        goto LABEL_13;
      }
LABEL_22:
      int v9 = 1;
    }
    else
    {
      std::string::size_type size = HIBYTE(v12.__r_.__value_.__r.__words[2]);
      if (!*((unsigned char *)&v12.__r_.__value_.__s + 23)) {
        return 0;
      }
      unint64_t v5 = &v12;
      do
      {
LABEL_13:
        if (v5->__r_.__value_.__s.__data_[0] < 0) {
          goto LABEL_22;
        }
        uint64_t v6 = MEMORY[0x263EF8318];
        if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v5->__r_.__value_.__s.__data_[0] + 60) & 0x400) == 0) {
          goto LABEL_22;
        }
        unint64_t v5 = (std::string *)((char *)v5 + 1);
        --size;
      }
      while (size);
      if (*(char *)(a2 + 23) < 0) {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
      }
      else {
        std::string __p = *(std::string *)a2;
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::size_type v8 = __p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_)
        {
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
          goto LABEL_31;
        }
        int v9 = 1;
LABEL_39:
        operator delete(__p.__r_.__value_.__l.__data_);
        goto LABEL_23;
      }
      if (!*((unsigned char *)&__p.__r_.__value_.__s + 23)) {
        goto LABEL_22;
      }
      p_p = &__p;
      std::string::size_type v8 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
LABEL_31:
      while ((p_p->__r_.__value_.__s.__data_[0] & 0x80000000) == 0
           && (*(_DWORD *)(v6 + 4 * p_p->__r_.__value_.__s.__data_[0] + 60) & 0x400) != 0)
      {
        p_p = (std::string *)((char *)p_p + 1);
        if (!--v8)
        {
          int v9 = 0;
          goto LABEL_36;
        }
      }
      int v9 = 1;
LABEL_36:
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) != 0) {
        goto LABEL_39;
      }
    }
LABEL_23:
    if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v12.__r_.__value_.__l.__data_);
      if (v9) {
        return 0;
      }
    }
    else if (v9)
    {
      return 0;
    }
  }
  else if (*(unsigned char *)(a1 + 56) && *(unsigned char *)(a2 + 57))
  {
    return 0;
  }
  return 1;
}

void sub_23AC243F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void cmdp_sausage_util::fstFromSausage(uint64_t *a1@<X0>, void *a2@<X8>)
{
  cmdp_sausage_util::sanitizeTokenSausage(a1, v4);
  if (v4[0] != v4[1])
  {
    memset(v3, 0, sizeof(v3));
    operator new();
  }
  *a2 = 0;
  v3[0] = (void **)v4;
  std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100](v3);
}

void sub_23AC24C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *__p,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  CMDPFst::~CMDPFst(v38);
  MEMORY[0x23ECC24B0]();
  *(void *)(v39 - 168) = v39 - 136;
  std::vector<cmdp_sausage_util::SausageArc>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 168));
  *(void *)(v39 - 136) = v39 - 112;
  std::vector<std::vector<std::vector<std::unique_ptr<CMDPToken>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)(v39 - 136));
  _Unwind_Resume(a1);
}

uint64_t std::function<unsigned int ()(CMDPToken const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v4);
}

uint64_t *std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>(uint64_t **a1, const void **a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    std::__tree<std::string>::__construct_node<std::string const&>((uint64_t)a1, a3, (uint64_t)&v7);
    std::__tree<std::string>::__insert_node_at(a1, v8, v5, v7);
    return v7;
  }
  return result;
}

void std::__tree<std::string>::__construct_node<std::string const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x38uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v5;
  *(unsigned char *)(a3 + 16) = 0;
  long long v7 = (std::string *)(v6 + 32);
  if (*(char *)(a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v7, *(const std::string::value_type **)a2, *(void *)(a2 + 8));
  }
  else
  {
    *(_OWORD *)&v7->__r_.__value_.__l.__data_ = *(_OWORD *)a2;
    v7->__r_.__value_.__r.__words[2] = *(void *)(a2 + 16);
  }
  *(unsigned char *)(a3 + 16) = 1;
}

void sub_23AC24ED0(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0;
  std::__tree_node_destructor<std::allocator<std::__tree_node<std::string,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::vector<cmdp_sausage_util::SausageArc>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  uint64_t v2 = (uint64_t **)*a1;
  if (*v2)
  {
    std::vector<cmdp_sausage_util::SausageArc>::__base_destruct_at_end[abi:ne180100]((uint64_t)v2, *v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<cmdp_sausage_util::SausageArc>::__base_destruct_at_end[abi:ne180100](uint64_t a1, uint64_t *a2)
{
  uint64_t v4 = *(uint64_t **)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      uint64_t v6 = *v5;
      *uint64_t v5 = 0;
      if (v6) {
        std::default_delete<CMDPToken>::operator()[abi:ne180100]((uint64_t)v5, v6);
      }
      long long v7 = v5 - 2;
      v5 -= 3;
    }
    while (v7 != a2);
  }
  *(void *)(a1 + 8) = a2;
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);
  JUMPOUT(0x23ECC24B0);
}

void std::vector<cmdp_sausage_util::SausageArc>::__emplace_back_slow_path<int &,int &,CMDPToken *,BOOL,int>(uint64_t *a1, int *a2, int *a3, uint64_t *a4, char *a5, int *a6)
{
  uint64_t v7 = *a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 <= 0xAAAAAAAAAAAAAAALL)
  {
    uint64_t v15 = (uint64_t)(a1 + 2);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v7) >> 3);
    if (2 * v16 > v9) {
      unint64_t v9 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v9;
    }
    uint64_t v23 = a1 + 2;
    if (v17) {
      CFRange v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<CMDPToken>>>>(v15, v17);
    }
    else {
      CFRange v18 = 0;
    }
    float v19 = v18;
    float v20 = &v18[24 * v8];
    uint64_t v21 = (uint64_t)v20;
    uint64_t v22 = &v18[24 * v17];
    cmdp_sausage_util::SausageArc::SausageArc((uint64_t)v20, *a2, *a3, *a4, *a5, *a6);
  }
  std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
}

void sub_23AC25150(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<cmdp_sausage_util::SausageArc>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void cmdp_sausage_util::SausageArc::SausageArc(uint64_t a1, int a2, int a3, uint64_t a4, char a5, int a6)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(unsigned char *)(a1 + 8) = a5;
  *(_DWORD *)(a1 + 12) = a6;
  operator new();
}

void sub_23AC25200(_Unwind_Exception *a1)
{
  MEMORY[0x23ECC24B0](v1, 0x1012C408B718000);
  _Unwind_Resume(a1);
}

uint64_t std::vector<cmdp_sausage_util::SausageArc>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cmdp_sausage_util::SausageArc>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<cmdp_sausage_util::SausageArc>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&long long v14 = a6;
  *((void *)&v14 + 1) = a7;
  long long v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }
  else
  {
    do
    {
      *(_OWORD *)(v7 - ++*(_DWORD *)(result + 24) = *(_OWORD *)(a3 - 24);
      uint64_t v8 = *(void *)(a3 - 8);
      *(void *)(a3 - 8) = 0;
      *(void *)(v7 - 8) = v8;
      uint64_t v7 = *((void *)&v14 + 1) - 24;
      *((void *)&v14 + 1) -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    uint64_t v9 = v14;
  }
  char v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<cmdp_sausage_util::SausageArc>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<cmdp_sausage_util::SausageArc>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<cmdp_sausage_util::SausageArc>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<cmdp_sausage_util::SausageArc>,std::reverse_iterator<cmdp_sausage_util::SausageArc*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(*(void *)(a1 + 16) + 8);
  uint64_t v2 = *(uint64_t **)(*(void *)(a1 + 8) + 8);
  if (v1 != v2)
  {
    uint64_t v3 = v1 + 2;
    do
    {
      uint64_t v4 = *v3;
      *uint64_t v3 = 0;
      if (v4) {
        std::default_delete<CMDPToken>::operator()[abi:ne180100]((uint64_t)v3, v4);
      }
      uint64_t v5 = v3 + 1;
      v3 += 3;
    }
    while (v5 != v2);
  }
}

uint64_t std::__split_buffer<cmdp_sausage_util::SausageArc>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t std::__split_buffer<cmdp_sausage_util::SausageArc>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  for (uint64_t result = *(void *)(a1 + 16); result != a2; uint64_t result = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = result - 24;
    uint64_t v7 = *(void *)(result - 8);
    uint64_t v5 = (void *)(result - 8);
    uint64_t v6 = v7;
    *uint64_t v5 = 0;
    if (v7) {
      std::default_delete<CMDPToken>::operator()[abi:ne180100]((uint64_t)v5, v6);
    }
  }
  return result;
}

void std::vector<cmdp_sausage_util::SausageArc>::__emplace_back_slow_path<int &,int &,CMDPToken *,BOOL,int &>(uint64_t *a1, int *a2, int *a3, uint64_t *a4, char *a5, int *a6)
{
  uint64_t v7 = *a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 <= 0xAAAAAAAAAAAAAAALL)
  {
    uint64_t v15 = (uint64_t)(a1 + 2);
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v7) >> 3);
    if (2 * v16 > v9) {
      unint64_t v9 = 2 * v16;
    }
    if (v16 >= 0x555555555555555) {
      unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v17 = v9;
    }
    uint64_t v23 = a1 + 2;
    if (v17) {
      CFRange v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<CMDPToken>>>>(v15, v17);
    }
    else {
      CFRange v18 = 0;
    }
    float v19 = v18;
    float v20 = &v18[24 * v8];
    uint64_t v21 = (uint64_t)v20;
    uint64_t v22 = &v18[24 * v17];
    cmdp_sausage_util::SausageArc::SausageArc((uint64_t)v20, *a2, *a3, *a4, *a5, *a6);
  }
  std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
}

void sub_23AC2557C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::__split_buffer<cmdp_sausage_util::SausageArc>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

void fst::MergeSymbolTable(fst *this, const fst::SymbolTable *a2, const fst::SymbolTable *a3, BOOL *a4)
{
}

void sub_23AC25D38(_Unwind_Exception *a1, void *__p, uint64_t a3, int a4, __int16 a5, char a6, char a7, void *a8, uint64_t a9, void **__pa, uint64_t a11, std::__split_buffer<std::string> *a12, void *a13)
{
  __pa = &a13;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&__pa);
  (*(void (**)(uint64_t))(*(void *)v13 + 8))(v13);
  _Unwind_Resume(a1);
}

void std::shared_ptr<fst::internal::SymbolTableImpl>::shared_ptr[abi:ne180100]<fst::internal::SymbolTableImpl,void>(void *a1, uint64_t a2)
{
  *a1 = a2;
  operator new();
}

void sub_23AC25EEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::unique_ptr<fst::internal::SymbolTableImpl>::reset[abi:ne180100]((fst::internal::SymbolTableImpl **)va, 0);
  _Unwind_Resume(a1);
}

void std::__shared_ptr_pointer<fst::internal::SymbolTableImpl *,std::shared_ptr<fst::internal::SymbolTableImpl>::__shared_ptr_default_delete<fst::internal::SymbolTableImpl,fst::internal::SymbolTableImpl>,std::allocator<fst::internal::SymbolTableImpl>>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x23ECC24B0);
}

fst::internal::SymbolTableImpl *std::__shared_ptr_pointer<fst::internal::SymbolTableImpl *,std::shared_ptr<fst::internal::SymbolTableImpl>::__shared_ptr_default_delete<fst::internal::SymbolTableImpl,fst::internal::SymbolTableImpl>,std::allocator<fst::internal::SymbolTableImpl>>::__on_zero_shared(uint64_t a1)
{
  uint64_t result = *(fst::internal::SymbolTableImpl **)(a1 + 24);
  if (result)
  {
    fst::internal::SymbolTableImpl::~SymbolTableImpl(result);
    JUMPOUT(0x23ECC24B0);
  }
  return result;
}

uint64_t std::__shared_ptr_pointer<fst::internal::SymbolTableImpl *,std::shared_ptr<fst::internal::SymbolTableImpl>::__shared_ptr_default_delete<fst::internal::SymbolTableImpl,fst::internal::SymbolTableImpl>,std::allocator<fst::internal::SymbolTableImpl>>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

fst::internal::SymbolTableImpl *std::unique_ptr<fst::internal::SymbolTableImpl>::reset[abi:ne180100](fst::internal::SymbolTableImpl **a1, fst::internal::SymbolTableImpl *a2)
{
  uint64_t result = *a1;
  *a1 = a2;
  if (result)
  {
    fst::internal::SymbolTableImpl::~SymbolTableImpl(result);
    JUMPOUT(0x23ECC24B0);
  }
  return result;
}

fst::internal::DenseSymbolMap *fst::internal::DenseSymbolMap::DenseSymbolMap(fst::internal::DenseSymbolMap *this)
{
  *(void *)this = -1;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  std::vector<long long>::vector((void *)this + 5, 0x10uLL);
  uint64_t v3 = (void *)*((void *)this + 5);
  uint64_t v2 = (void *)*((void *)this + 6);
  for (*((void *)this + 8) = v2 - v3 - 1; v3 != v2; ++v3)
    *uint64_t v3 = *(void *)this;
  return this;
}

void sub_23AC26094(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

fst::internal::DenseSymbolMap *fst::internal::DenseSymbolMap::DenseSymbolMap(fst::internal::DenseSymbolMap *this, const fst::internal::DenseSymbolMap *a2)
{
  *(void *)this = -1;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>((std::string *)((char *)this + 8), *((long long **)a2 + 1), *((long long **)a2 + 2), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)a2 + 2) - *((void *)a2 + 1)) >> 3));
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  *((void *)this + 7) = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>((void *)this + 5, *((const void **)a2 + 5), *((void *)a2 + 6), (uint64_t)(*((void *)a2 + 6) - *((void *)a2 + 5)) >> 3);
  *((void *)this + 8) = *((void *)a2 + 8);
  return this;
}

void sub_23AC26144(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_start(va, a2);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

unint64_t fst::internal::DenseSymbolMap::InsertOrFind(fst::internal::DenseSymbolMap *this, long long *a2)
{
  uint64_t v4 = (uint64_t *)((char *)this + 8);
  uint64_t v5 = *((void *)this + 6) - *((void *)this + 5);
  if ((float)((float)(unint64_t)(v5 >> 3) * 0.75) <= (float)(0xAAAAAAAAAAAAAAABLL
                                                                   * ((uint64_t)(*((void *)this + 2)
                                                                              - *((void *)this + 1)) >> 3)))
    fst::internal::DenseSymbolMap::Rehash(this, v5 >> 2);
  unint64_t v6 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)this + 32, (uint64_t)a2);
  uint64_t v7 = *((void *)this + 8);
  uint64_t v8 = *((void *)this + 5);
  uint64_t v9 = v6 & v7;
  unint64_t v10 = *(void *)(v8 + 8 * (v6 & v7));
  uint64_t v12 = *(void *)this;
  uint64_t v11 = *((void *)this + 1);
  uint64_t v23 = a2;
  if (v10 != *(void *)this)
  {
    char v16 = *((unsigned char *)a2 + 23);
    if (v16 >= 0) {
      uint64_t v17 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      uint64_t v17 = *((void *)a2 + 1);
    }
    if (v16 < 0) {
      a2 = *(long long **)a2;
    }
    do
    {
      CFRange v18 = (unsigned __int8 *)(v11 + 24 * v10);
      uint64_t v19 = v18[23];
      if ((v19 & 0x80u) == 0) {
        uint64_t v20 = v18[23];
      }
      else {
        uint64_t v20 = *((void *)v18 + 1);
      }
      if (v20 == v17)
      {
        if ((v19 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v18, a2, *((void *)v18 + 1))) {
            return v10;
          }
        }
        else
        {
          if (!v18[23]) {
            return v10;
          }
          for (uint64_t i = a2; *v18 == *(unsigned __int8 *)i; uint64_t i = (long long *)((char *)i + 1))
          {
            ++v18;
            if (!--v19) {
              return v10;
            }
          }
        }
      }
      uint64_t v9 = (v9 + 1) & v7;
      unint64_t v10 = *(void *)(v8 + 8 * v9);
    }
    while (v10 != v12);
  }
  unint64_t v14 = *((void *)this + 2);
  unint64_t v13 = *((void *)this + 3);
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - v11) >> 3);
  *(void *)(v8 + 8 * v9) = v10;
  if (v14 >= v13)
  {
    uint64_t v15 = std::vector<std::string>::__emplace_back_slow_path<std::string const&>(v4, v23);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v4, v23);
    uint64_t v15 = v14 + 24;
  }
  *((void *)this + 2) = v15;
  return v10;
}

void fst::internal::DenseSymbolMap::Rehash(fst::internal::DenseSymbolMap *this, unint64_t a2)
{
  std::vector<long long>::resize((uint64_t)this + 40, a2);
  uint64_t v4 = (void *)*((void *)this + 5);
  uint64_t v3 = (void *)*((void *)this + 6);
  for (*((void *)this + 8) = v3 - v4 - 1; v4 != v3; ++v4)
    *uint64_t v4 = *(void *)this;
  uint64_t v5 = *((void *)this + 1);
  if (*((void *)this + 2) != v5)
  {
    unint64_t v6 = 0;
    do
    {
      uint64_t v7 = (long long *)(v5 + 24 * v6);
      if (*((char *)v7 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v7, *((void *)v7 + 1));
      }
      else
      {
        long long v8 = *v7;
        __p.__r_.__value_.__r.__words[2] = *((void *)v7 + 2);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v8;
      }
      unint64_t v9 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)this + 32, (uint64_t)&__p);
      uint64_t v10 = *((void *)this + 8);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      uint64_t v11 = v10 & v9;
      uint64_t v12 = *((void *)this + 5);
      if (*(void *)(v12 + 8 * (v10 & v9)) != *(void *)this)
      {
        do
          uint64_t v11 = *((void *)this + 8) & (v11 + 1);
        while (*(void *)(v12 + 8 * v11) != *(void *)this);
      }
      *(void *)(v12 + 8 * v11) = v6++;
      uint64_t v5 = *((void *)this + 1);
    }
    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 2) - v5) >> 3));
  }
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

uint64_t fst::internal::DenseSymbolMap::Find(uint64_t *a1, uint64_t a2)
{
  unint64_t v2 = (unsigned char *)a2;
  unint64_t v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 4), a2);
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[5];
  uint64_t v7 = *a1;
  uint64_t v8 = v4 & v5;
  uint64_t v9 = *(void *)(v6 + 8 * (v4 & v5));
  if (v9 != *a1)
  {
    uint64_t v11 = a1[1];
    char v12 = v2[23];
    if (v12 >= 0) {
      uint64_t v13 = v2[23];
    }
    else {
      uint64_t v13 = *((void *)v2 + 1);
    }
    if (v12 < 0) {
      unint64_t v2 = *(unsigned char **)v2;
    }
    do
    {
      unint64_t v14 = (unsigned __int8 *)(v11 + 24 * v9);
      uint64_t v15 = v14[23];
      if ((v15 & 0x80u) == 0) {
        uint64_t v16 = v14[23];
      }
      else {
        uint64_t v16 = *((void *)v14 + 1);
      }
      if (v16 == v13)
      {
        if ((v15 & 0x80) != 0)
        {
          if (!memcmp(*(const void **)v14, v2, *((void *)v14 + 1))) {
            return v9;
          }
        }
        else
        {
          if (!v14[23]) {
            return v9;
          }
          for (uint64_t i = v2; *v14 == *i; ++i)
          {
            ++v14;
            if (!--v15) {
              return v9;
            }
          }
        }
      }
      uint64_t v8 = (v8 + 1) & v5;
      uint64_t v9 = *(void *)(v6 + 8 * v8);
    }
    while (v9 != v7);
  }
  return v7;
}

void std::vector<long long>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 8 * a2;
    }
  }
  else
  {
    std::vector<long long>::__append((char **)a1, a2 - v2);
  }
}

void fst::internal::DenseSymbolMap::RemoveSymbol(fst::internal::DenseSymbolMap *this, uint64_t a2)
{
  std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>((uint64_t)&v6, (long long *)(*((void *)this + 1) + 24 * a2 + 24), *((long long **)this + 2), *((void *)this + 1) + 24 * a2);
  uint64_t v4 = v3;
  uint64_t v5 = *((void *)this + 2);
  if (v5 != v3)
  {
    do
    {
      if (*(char *)(v5 - 1) < 0) {
        operator delete(*(void **)(v5 - 24));
      }
      v5 -= 24;
    }
    while (v5 != v4);
  }
  *((void *)this + 2) = v4;
  fst::internal::DenseSymbolMap::Rehash(this, (uint64_t)(*((void *)this + 6) - *((void *)this + 5)) >> 3);
}

uint64_t fst::internal::SymbolTableImpl::AddSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = a3;
  if (a3 == -1) {
    return -1;
  }
  unint64_t v6 = fst::internal::DenseSymbolMap::InsertOrFind((fst::internal::DenseSymbolMap *)(a1 + 40), (long long *)a2);
  if (v7)
  {
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3) - 1 == a3
      && *(void *)(a1 + 32) == a3)
    {
      *(void *)(a1 + 32) = a3 + 1;
      uint64_t v9 = a3;
    }
    else
    {
      unint64_t v10 = *(void *)(a1 + 128);
      uint64_t v11 = *(uint64_t **)(a1 + 120);
      if ((unint64_t)v11 >= v10)
      {
        uint64_t v20 = *(uint64_t **)(a1 + 112);
        uint64_t v21 = v11 - v20;
        if ((unint64_t)(v21 + 1) >> 61) {
          std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
        }
        unint64_t v22 = v10 - (void)v20;
        unint64_t v23 = (uint64_t)(v10 - (void)v20) >> 2;
        if (v23 <= v21 + 1) {
          unint64_t v23 = v21 + 1;
        }
        if (v22 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v24 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v24 = v23;
        }
        if (v24)
        {
          uint64_t v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<CMDPToken>>>(a1 + 128, v24);
          uint64_t v20 = *(uint64_t **)(a1 + 112);
          uint64_t v11 = *(uint64_t **)(a1 + 120);
        }
        else
        {
          uint64_t v25 = 0;
        }
        uint64_t v26 = (uint64_t *)&v25[8 * v21];
        uint64_t v27 = &v25[8 * v24];
        *uint64_t v26 = a3;
        char v12 = v26 + 1;
        while (v11 != v20)
        {
          uint64_t v28 = *--v11;
          *--uint64_t v26 = v28;
        }
        *(void *)(a1 + 112) = v26;
        *(void *)(a1 + 120) = v12;
        *(void *)(a1 + 128) = v27;
        if (v20) {
          operator delete(v20);
        }
      }
      else
      {
        *uint64_t v11 = a3;
        char v12 = v11 + 1;
      }
      *(void *)(a1 + 120) = v12;
      uint64_t v29 = -1 - 0x5555555555555555 * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3);
      __p[0] = &v33;
      std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)(a1 + 136), &v33, (uint64_t)&std::piecewise_construct, (uint64_t **)__p)[5] = v29;
      uint64_t v9 = v33;
    }
    if (v9 >= *(void *)(a1 + 24)) {
      *(void *)(a1 + ++*(_DWORD *)(result + 24) = v9 + 1;
    }
    *(unsigned char *)(a1 + 1--*(_DWORD *)(a9 + 60) = 0;
  }
  else
  {
    unint64_t NthKey = fst::internal::SymbolTableImpl::GetNthKey((fst::internal::SymbolTableImpl *)a1, v6);
    if (NthKey == a3)
    {
      return a3;
    }
    else
    {
      uint64_t v9 = NthKey;
      if (FLAGS_v >= 1)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "INFO");
        LogMessage::LogMessage(&v34, (uint64_t)__p);
        uint64_t v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"SymbolTable::AddSymbol: symbol = ", 33);
        int v14 = *(char *)(a2 + 23);
        if (v14 >= 0) {
          uint64_t v15 = a2;
        }
        else {
          uint64_t v15 = *(void *)a2;
        }
        if (v14 >= 0) {
          uint64_t v16 = *(unsigned __int8 *)(a2 + 23);
        }
        else {
          uint64_t v16 = *(void *)(a2 + 8);
        }
        uint64_t v17 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, v15, v16);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)" already in symbol_map_ with key = ", 35);
        CFRange v18 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)" but supplied new key = ", 24);
        uint64_t v19 = (void *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v19, (uint64_t)" (ignoring new key)", 19);
        LogMessage::~LogMessage((LogMessage *)&v34);
        if (v32 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }
  return v9;
}

void sub_23AC268D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fst::internal::SymbolTableImpl::MaybeRecomputeCheckSum(fst::internal::SymbolTableImpl *this)
{
  unint64_t v2 = (std::mutex *)((char *)this + 216);
  std::mutex::lock((std::mutex *)((char *)this + 216));
  int v3 = *((unsigned __int8 *)this + 160);
  std::mutex::unlock(v2);
  if (!v3)
  {
    std::mutex::lock(v2);
    if (!*((unsigned char *)this + 160))
    {
      unint64_t v57 = v2;
      fst::CheckSummer::CheckSummer((fst::CheckSummer *)&v69);
      uint64_t v5 = *((void *)this + 6);
      uint64_t v4 = *((void *)this + 7);
      if (v4 != v5)
      {
        unint64_t v6 = 0;
        do
        {
          char v7 = (char *)(v5 + 24 * v6);
          if (v7[23] < 0)
          {
            uint64_t v8 = *((unsigned int *)v7 + 2);
            char v7 = *(char **)v7;
          }
          else
          {
            uint64_t v8 = v7[23];
          }
          if ((int)v8 >= 1)
          {
            do
            {
              char v10 = *v7++;
              char v9 = v10;
              int v11 = v69++;
              BOOL v12 = -v11 < 0;
              int v13 = -v11 & 0x1F;
              int v14 = v11 & 0x1F;
              if (!v12) {
                int v14 = -v13;
              }
              if ((v70.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                uint64_t v15 = &v70;
              }
              else {
                uint64_t v15 = (std::string *)v70.__r_.__value_.__r.__words[0];
              }
              v15->__r_.__value_.__s.__data_[v14] ^= v9;
              --v8;
            }
            while (v8);
            uint64_t v5 = *((void *)this + 6);
            uint64_t v4 = *((void *)this + 7);
          }
          ++v69;
          ++v6;
        }
        while (v6 < 0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3));
      }
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
        std::string::__init_copy_ctor_external(&v63, v70.__r_.__value_.__l.__data_, v70.__r_.__value_.__l.__size_);
      }
      else {
        std::string v63 = v70;
      }
      uint64_t v16 = (void **)((char *)this + 168);
      if (*((char *)this + 191) < 0) {
        operator delete(*v16);
      }
      *(_OWORD *)uint64_t v16 = *(_OWORD *)&v63.__r_.__value_.__l.__data_;
      *((void *)this + 23) = *((void *)&v63.__r_.__value_.__l + 2);
      fst::CheckSummer::CheckSummer((fst::CheckSummer *)&v67);
      if (*((uint64_t *)this + 4) >= 1)
      {
        uint64_t v17 = 0;
        std::string::size_type v18 = *MEMORY[0x263F8C2C8];
        std::string::size_type v19 = *(void *)(MEMORY[0x263F8C2C8] + 24);
        do
        {
          std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v63);
          uint64_t v20 = *((void *)this + 6) + 24 * v17;
          int v21 = *(char *)(v20 + 23);
          if (v21 >= 0) {
            uint64_t v22 = *((void *)this + 6) + 24 * v17;
          }
          else {
            uint64_t v22 = *(void *)v20;
          }
          if (v21 >= 0) {
            uint64_t v23 = *(unsigned __int8 *)(v20 + 23);
          }
          else {
            uint64_t v23 = *(void *)(v20 + 8);
          }
          unint64_t v24 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v63, v22, v23);
          LOBYTE(v61[0]) = 9;
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v24, (uint64_t)v61, 1);
          std::ostream::operator<<();
          std::stringbuf::str();
          if (v62 >= 0) {
            uint64_t v25 = v61;
          }
          else {
            uint64_t v25 = (void **)v61[0];
          }
          std::stringbuf::str();
          int v26 = v60;
          unsigned __int8 v27 = v60;
          if ((v60 & 0x80u) != 0) {
            int v26 = v59;
          }
          if (v26 >= 1)
          {
            uint64_t v28 = v26;
            do
            {
              char v30 = *(unsigned char *)v25;
              uint64_t v25 = (void **)((char *)v25 + 1);
              char v29 = v30;
              int v31 = v67++;
              BOOL v12 = -v31 < 0;
              int v32 = -v31 & 0x1F;
              int v33 = v31 & 0x1F;
              if (!v12) {
                int v33 = -v32;
              }
              if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                BOOL v34 = &v68;
              }
              else {
                BOOL v34 = (std::string *)v68.__r_.__value_.__r.__words[0];
              }
              v34->__r_.__value_.__s.__data_[v33] ^= v29;
              --v28;
            }
            while (v28);
            unsigned __int8 v27 = v60;
          }
          if ((v27 & 0x80) != 0) {
            operator delete(__p);
          }
          if (v62 < 0) {
            operator delete(v61[0]);
          }
          v63.__r_.__value_.__r.__words[0] = v18;
          *(std::string::size_type *)((char *)v63.__r_.__value_.__r.__words + *(void *)(v18 - 24)) = v19;
          v63.__r_.__value_.__l.__size_ = MEMORY[0x263F8C318] + 16;
          if (v65 < 0) {
            operator delete(v64);
          }
          std::streambuf::~streambuf();
          std::ostream::~ostream();
          MEMORY[0x23ECC2440](v66);
          ++v17;
        }
        while (v17 < *((void *)this + 4));
      }
      v35 = (fst::internal::SymbolTableImpl *)*((void *)this + 17);
      if (v35 != (fst::internal::SymbolTableImpl *)((char *)this + 144))
      {
        std::string::size_type v36 = *MEMORY[0x263F8C2C8];
        std::string::size_type v37 = *(void *)(MEMORY[0x263F8C2C8] + 24);
        do
        {
          if (*((void *)v35 + 4) >= *((void *)this + 4))
          {
            std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)&v63);
            uint64_t v38 = *((void *)this + 6) + 24 * *((void *)v35 + 5);
            int v39 = *(char *)(v38 + 23);
            if (v39 >= 0) {
              uint64_t v40 = *((void *)this + 6) + 24 * *((void *)v35 + 5);
            }
            else {
              uint64_t v40 = *(void *)v38;
            }
            if (v39 >= 0) {
              uint64_t v41 = *(unsigned __int8 *)(v38 + 23);
            }
            else {
              uint64_t v41 = *(void *)(v38 + 8);
            }
            uint64_t v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v63, v40, v41);
            LOBYTE(v61[0]) = 9;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)v61, 1);
            std::ostream::operator<<();
            std::stringbuf::str();
            if (v62 >= 0) {
              float v43 = v61;
            }
            else {
              float v43 = (void **)v61[0];
            }
            std::stringbuf::str();
            int v44 = v60;
            unsigned __int8 v45 = v60;
            if ((v60 & 0x80u) != 0) {
              int v44 = v59;
            }
            if (v44 >= 1)
            {
              uint64_t v46 = v44;
              do
              {
                char v48 = *(unsigned char *)v43;
                float v43 = (void **)((char *)v43 + 1);
                char v47 = v48;
                int v49 = v67++;
                BOOL v12 = -v49 < 0;
                int v50 = -v49 & 0x1F;
                int v51 = v49 & 0x1F;
                if (!v12) {
                  int v51 = -v50;
                }
                if ((v68.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
                  float v52 = &v68;
                }
                else {
                  float v52 = (std::string *)v68.__r_.__value_.__r.__words[0];
                }
                v52->__r_.__value_.__s.__data_[v51] ^= v47;
                --v46;
              }
              while (v46);
              unsigned __int8 v45 = v60;
            }
            if ((v45 & 0x80) != 0) {
              operator delete(__p);
            }
            if (v62 < 0) {
              operator delete(v61[0]);
            }
            v63.__r_.__value_.__r.__words[0] = v36;
            *(std::string::size_type *)((char *)v63.__r_.__value_.__r.__words + *(void *)(v36 - 24)) = v37;
            v63.__r_.__value_.__l.__size_ = MEMORY[0x263F8C318] + 16;
            if (v65 < 0) {
              operator delete(v64);
            }
            std::streambuf::~streambuf();
            std::ostream::~ostream();
            MEMORY[0x23ECC2440](v66);
          }
          float v53 = (fst::internal::SymbolTableImpl *)*((void *)v35 + 1);
          if (v53)
          {
            do
            {
              BOOL v54 = v53;
              float v53 = *(fst::internal::SymbolTableImpl **)v53;
            }
            while (v53);
          }
          else
          {
            do
            {
              BOOL v54 = (fst::internal::SymbolTableImpl *)*((void *)v35 + 2);
              BOOL v55 = *(void *)v54 == (void)v35;
              v35 = v54;
            }
            while (!v55);
          }
          v35 = v54;
        }
        while (v54 != (fst::internal::SymbolTableImpl *)((char *)this + 144));
      }
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
      {
        unint64_t v2 = v57;
        std::string::__init_copy_ctor_external(&v63, v68.__r_.__value_.__l.__data_, v68.__r_.__value_.__l.__size_);
      }
      else
      {
        std::string v63 = v68;
        unint64_t v2 = v57;
      }
      int v56 = (void **)((char *)this + 192);
      if (*((char *)this + 215) < 0) {
        operator delete(*v56);
      }
      *(_OWORD *)int v56 = *(_OWORD *)&v63.__r_.__value_.__l.__data_;
      *((void *)this + 26) = *((void *)&v63.__r_.__value_.__l + 2);
      *((unsigned char *)this + 1--*(_DWORD *)(a9 + 60) = 1;
      if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v68.__r_.__value_.__l.__data_);
      }
      if (SHIBYTE(v70.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(v70.__r_.__value_.__l.__data_);
      }
    }
    std::mutex::unlock(v2);
  }
}

void sub_23AC26F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20)
{
  if (*(char *)(v20 - 121) < 0) {
    operator delete(*(void **)(v20 - 144));
  }
  if (*(char *)(v20 - 89) < 0) {
    operator delete(*(void **)(v20 - 112));
  }
  std::mutex::unlock(a10);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::basic_ostringstream[abi:ne180100](uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C340] + 64;
  *(void *)(a1 + 112) = MEMORY[0x263F8C340] + 64;
  uint64_t v3 = *(void *)(MEMORY[0x263F8C2C8] + 16);
  uint64_t v4 = *(void *)(MEMORY[0x263F8C2C8] + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + *(void *)(v4 - 24)) = v3;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24));
  std::ios_base::init(v5, (void *)(a1 + 8));
  uint64_t v6 = MEMORY[0x263F8C340] + 24;
  v5[1].__vftable = 0;
  v5[1].__fmtflags_ = -1;
  *(void *)a1 = v6;
  *(void *)(a1 + 112) = v2;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_23AC2717C(_Unwind_Exception *a1)
{
  std::ostream::~ostream();
  MEMORY[0x23ECC2440](v1);
  _Unwind_Resume(a1);
}

uint64_t std::ostringstream::~ostringstream(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x263F8C2C8];
  uint64_t v3 = *MEMORY[0x263F8C2C8];
  *(void *)a1 = *MEMORY[0x263F8C2C8];
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 24);
  *(void *)(a1 + 8) = MEMORY[0x263F8C318] + 16;
  if (*(char *)(a1 + 95) < 0) {
    operator delete(*(void **)(a1 + 72));
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x23ECC2440](a1 + 112);
  return a1;
}

unint64_t fst::internal::SymbolTableImpl::GetNthKey(fst::internal::SymbolTableImpl *this, unint64_t a2)
{
  if ((a2 & 0x8000000000000000) != 0) {
    return -1;
  }
  uint64_t v3 = *((void *)this + 6);
  if (0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 7) - v3) >> 3) <= a2) {
    return -1;
  }
  if (*((void *)this + 4) <= (int64_t)a2)
  {
    uint64_t v4 = fst::internal::DenseSymbolMap::Find((uint64_t *)this + 5, v3 + 24 * a2);
    a2 = v4;
    if (v4 != -1)
    {
      uint64_t v5 = *((void *)this + 4);
      BOOL v6 = __OFSUB__(v4, v5);
      uint64_t v7 = v4 - v5;
      if (v7 < 0 == v6) {
        return *(void *)(*((void *)this + 14) + 8 * v7);
      }
    }
  }
  return a2;
}

void fst::internal::SymbolTableImpl::RemoveSymbol(fst::internal::SymbolTableImpl *this, uint64_t a2)
{
  if ((a2 & 0x8000000000000000) == 0)
  {
    uint64_t v4 = a2;
    if (*((void *)this + 4) > a2) {
      goto LABEL_14;
    }
  }
  uint64_t v5 = (uint64_t *)((char *)this + 144);
  BOOL v6 = (void *)*((void *)this + 18);
  if (v6)
  {
    uint64_t v7 = (uint64_t **)((char *)this + 136);
    uint64_t v8 = (uint64_t *)((char *)this + 144);
    do
    {
      uint64_t v9 = v6[4];
      BOOL v10 = v9 < a2;
      if (v9 >= a2) {
        int v11 = v6;
      }
      else {
        int v11 = v6 + 1;
      }
      if (!v10) {
        uint64_t v8 = v6;
      }
      BOOL v6 = (void *)*v11;
    }
    while (*v11);
    if (v8 != v5 && v8[4] <= a2)
    {
      uint64_t v4 = v8[5];
      std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__remove_node_pointer(v7, v8);
      operator delete(v8);
      if ((v4 & 0x8000000000000000) == 0)
      {
LABEL_14:
        if (v4 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3))
        {
          fst::internal::DenseSymbolMap::RemoveSymbol((fst::internal::SymbolTableImpl *)((char *)this + 40), v4);
          BOOL v12 = (fst::internal::SymbolTableImpl *)*((void *)this + 17);
          if (v12 != (fst::internal::SymbolTableImpl *)((char *)this + 144))
          {
            do
            {
              uint64_t v13 = *((void *)v12 + 5);
              if (v13 > v4) {
                *((void *)v12 + 5) = v13 - 1;
              }
              int v14 = (fst::internal::SymbolTableImpl *)*((void *)v12 + 1);
              if (v14)
              {
                do
                {
                  uint64_t v15 = v14;
                  int v14 = *(fst::internal::SymbolTableImpl **)v14;
                }
                while (v14);
              }
              else
              {
                do
                {
                  uint64_t v15 = (fst::internal::SymbolTableImpl *)*((void *)v12 + 2);
                  BOOL v16 = *(void *)v15 == (void)v12;
                  BOOL v12 = v15;
                }
                while (!v16);
              }
              BOOL v12 = v15;
            }
            while (v15 != (fst::internal::SymbolTableImpl *)((char *)this + 144));
          }
          uint64_t v17 = *((void *)this + 4);
          if (a2 < 0 || v17 <= a2)
          {
            uint64_t v27 = *((void *)this + 14);
            uint64_t v26 = *((void *)this + 15);
            uint64_t v28 = (v26 - v27) >> 3;
            if (v4 - v17 < (unint64_t)(v28 - 1))
            {
              uint64_t v29 = ~v4 + v17 + v28;
              char v30 = (void *)(v27 - 8 * v17 + 8 * v4 + 8);
              do
              {
                *(v30 - 1) = *v30;
                ++v30;
                --v29;
              }
              while (v29);
            }
            *((void *)this + 15) = v26 - 8;
          }
          else
          {
            uint64_t v31 = a2 + 1;
            if (a2 + 1 < v17)
            {
              uint64_t v18 = a2;
              do
              {
                int v32 = &v31;
                std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>((uint64_t **)this + 17, &v31, (uint64_t)&std::piecewise_construct, &v32)[5] = v18;
                uint64_t v18 = v31++;
              }
              while (v31 < *((void *)this + 4));
            }
            std::string::size_type v19 = (void *)((char *)this + 112);
            std::vector<long long>::resize((uint64_t)this + 112, 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3) - a2);
            int64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((void *)this + 7) - *((void *)this + 6)) >> 3);
            int64_t v21 = *((void *)this + 4);
            if (v20 >= v21)
            {
              uint64_t v22 = (void *)*v19;
              uint64_t v23 = *v19 - 8 * a2;
              do
              {
                *(void *)(v23 + 8 * v20 - 8) = v22[v20 - v21];
                int64_t v21 = *((void *)this + 4);
                BOOL v10 = v20-- <= v21;
              }
              while (!v10);
            }
            if (v21 - 1 > a2)
            {
              unint64_t v24 = (void *)*v19;
              uint64_t v25 = a2;
              do
                *v24++ = ++v25;
              while (v25 < *((void *)this + 4) - 1);
            }
            *((void *)this + 4) = a2;
          }
          if (*((void *)this + 3) - 1 == a2) {
            *((void *)this + 3) = a2;
          }
        }
      }
    }
  }
}

BOOL fst::internal::SymbolTableImpl::Write(uint64_t a1, void *a2)
{
  LODWORD(__p[0]) = 2125658996;
  std::ostream::write();
  LODWORD(v4) = *(unsigned __int8 *)(a1 + 23);
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  LODWORD(__p[0]) = v4;
  std::ostream::write();
  std::ostream::write();
  __p[0] = *(void **)(a1 + 24);
  std::ostream::write();
  uint64_t v5 = *(void *)(a1 + 56) - *(void *)(a1 + 48);
  uint64_t v6 = v5 / 24;
  __p[0] = (void *)(v5 / 24);
  std::ostream::write();
  if (v5 >= 1)
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    if (v6 <= 1) {
      uint64_t v6 = 1;
    }
    do
    {
      uint64_t v9 = *(void *)(a1 + 32);
      BOOL v10 = (void *)v8;
      if (v8 >= v9) {
        BOOL v10 = *(void **)(*(void *)(a1 + 112) - 8 * v9 + 8 * v8);
      }
      std::ostream::write();
      std::ostream::write();
      __p[0] = v10;
      std::ostream::write();
      ++v8;
      v7 += 24;
    }
    while (v6 != v8);
  }
  std::ostream::flush();
  int v11 = *(_DWORD *)((unsigned char *)a2 + *(void *)(*a2 - 24) + 32) & 5;
  if (v11)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "ERROR");
    LogMessage::LogMessage(&v15, (uint64_t)__p);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"SymbolTable::Write: Write failed", 32);
    LogMessage::~LogMessage((LogMessage *)&v15);
    if (v14 < 0) {
      operator delete(__p[0]);
    }
  }
  return v11 == 0;
}

void sub_23AC27800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void fst::SymbolTable::AddTable(fst::SymbolTable *this, const fst::SymbolTable *a2)
{
  fst::SymbolTable::MutateCheck((uint64_t)this);
  unint64_t v4 = (*(uint64_t (**)(const fst::SymbolTable *))(*(void *)a2 + 120))(a2);
  uint64_t v5 = (*(uint64_t (**)(const fst::SymbolTable *, void))(*(void *)a2 + 64))(a2, 0);
  if (v4)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = *((void *)this + 1);
      (*(void (**)(void **__return_ptr, const fst::SymbolTable *, uint64_t))(*(void *)a2 + 72))(__p, a2, v6);
      fst::internal::SymbolTableImpl::AddSymbol(v8, (uint64_t)__p, *(void *)(v8 + 24));
      if (v10 < 0) {
        operator delete(__p[0]);
      }
      if (++v7 < v4) {
        uint64_t v6 = (*(uint64_t (**)(const fst::SymbolTable *, uint64_t))(*(void *)a2 + 64))(a2, v7);
      }
    }
    while (v4 != v7);
  }
}

void sub_23AC27968(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t fst::SymbolTable::MutateCheck(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 16);
  if (!v1 || *(void *)(v1 + 8)) {
    operator new();
  }
  return this;
}

void sub_23AC279FC(_Unwind_Exception *a1)
{
  MEMORY[0x23ECC24B0](v1, 0x1032C403CA07A62);
  _Unwind_Resume(a1);
}

BOOL fst::SymbolTable::WriteText(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a3 + 31);
  if ((v3 & 0x80u) != 0) {
    uint64_t v3 = *(void *)(a3 + 16);
  }
  uint64_t v19 = v3;
  if (v3)
  {
    unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120))(a1);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64))(a1, 0);
    if (v6)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = 0;
      int64_t v20 = *(void **)(MEMORY[0x263F8C2C8] + 24);
      int64_t v21 = (void *)*MEMORY[0x263F8C2C8];
      do
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v26);
        BOOL v12 = v8 >= 0 || *(unsigned char *)a3 != 0;
        if (((v12 | v9) & 1) == 0)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, "WARNING");
          LogMessage::LogMessage((BOOL *)&v22, (uint64_t)__p);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"Negative symbol table entry when not allowed", 44);
          LogMessage::~LogMessage((LogMessage *)&v22);
          if ((char)v25 < 0) {
            operator delete(__p[0]);
          }
          int v9 = 1;
        }
        (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72))(__p, a1, v8);
        if ((v25 & 0x80u) == 0) {
          uint64_t v13 = __p;
        }
        else {
          uint64_t v13 = (void **)__p[0];
        }
        if ((v25 & 0x80u) == 0) {
          uint64_t v14 = v25;
        }
        else {
          uint64_t v14 = (uint64_t)__p[1];
        }
        BOOL v15 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v26, (uint64_t)v13, v14);
        BOOL v16 = (unsigned char *)(a3 + 8);
        if (*(char *)(a3 + 31) < 0) {
          BOOL v16 = *(unsigned char **)(a3 + 8);
        }
        LOBYTE(v22) = *v16;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)&v22, 1);
        uint64_t v17 = (void *)std::ostream::operator<<();
        LOBYTE(v22) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v17, (uint64_t)&v22, 1);
        if ((char)v25 < 0) {
          operator delete(__p[0]);
        }
        std::stringbuf::str();
        std::stringbuf::str();
        std::ostream::write();
        if (v23 < 0) {
          operator delete(v22);
        }
        if ((char)v25 < 0) {
          operator delete(__p[0]);
        }
        v26[0] = v21;
        *(void **)((char *)v26 + *((void *)v21 - 3)) = v20;
        v26[1] = (void *)(MEMORY[0x263F8C318] + 16);
        if (v29 < 0) {
          operator delete(v28);
        }
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x23ECC2440](&v30);
        if (++v10 < v6) {
          uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64))(a1, v10);
        }
      }
      while (v6 != v10);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v26, "ERROR");
    LogMessage::LogMessage((BOOL *)__p, (uint64_t)v26);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"Missing required field separator", 32);
    LogMessage::~LogMessage((LogMessage *)__p);
    if (v27 < 0) {
      operator delete(v26[0]);
    }
  }
  return v19 != 0;
}

void sub_23AC27E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL fst::CompatSymbols(fst *this, const fst::SymbolTable *a2, const fst::SymbolTable *a3)
{
  if (!FLAGS_fst_compat_symbols) {
    return 1;
  }
  BOOL result = 1;
  if (!this || !a2) {
    return result;
  }
  int v6 = (int)a3;
  uint64_t v7 = (unsigned __int8 *)(*(uint64_t (**)(fst *))(*(void *)this + 88))(this);
  uint64_t v8 = (*(uint64_t (**)(const fst::SymbolTable *))(*(void *)a2 + 88))(a2);
  uint64_t v9 = v7[23];
  if ((v9 & 0x80u) == 0) {
    uint64_t v10 = v7[23];
  }
  else {
    uint64_t v10 = *((void *)v7 + 1);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 23);
  int v12 = (char)v11;
  if ((v11 & 0x80u) != 0) {
    uint64_t v11 = *(void *)(v8 + 8);
  }
  if (v10 != v11) {
    goto LABEL_20;
  }
  if (v12 >= 0) {
    uint64_t v13 = (unsigned __int8 *)v8;
  }
  else {
    uint64_t v13 = *(unsigned __int8 **)v8;
  }
  if ((v9 & 0x80) != 0)
  {
    BOOL result = memcmp(*(const void **)v7, v13, *((void *)v7 + 1)) == 0;
    if (result) {
      return result;
    }
    goto LABEL_22;
  }
  if (!v7[23]) {
    return 1;
  }
  BOOL result = 1;
  while (*v7 == *v13)
  {
    ++v7;
    ++v13;
    if (!--v9) {
      return result;
    }
  }
LABEL_20:
  BOOL result = 0;
LABEL_22:
  if (v6)
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "WARNING");
    LogMessage::LogMessage(&v18, (uint64_t)__p);
    uint64_t v14 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"CompatSymbols: Symbol table checksums do not match. ", 52);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v14, (uint64_t)"Table sizes are ", 16);
    (*(void (**)(fst *))(*(void *)this + 120))(this);
    BOOL v15 = (void *)std::ostream::operator<<();
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v15, (uint64_t)" and ", 5);
    (*(void (**)(const fst::SymbolTable *))(*(void *)a2 + 120))(a2);
    std::ostream::operator<<();
    LogMessage::~LogMessage((LogMessage *)&v18);
    if (v17 < 0) {
      operator delete(__p[0]);
    }
    return 0;
  }
  return result;
}

void sub_23AC280C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fst::SymbolTable::~SymbolTable(fst::SymbolTable *this)
{
  *(void *)this = &unk_26EE2E2B8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
}

{
  std::__shared_weak_count *v1;
  uint64_t vars8;

  *(void *)this = &unk_26EE2E2B8;
  uint64_t v1 = (std::__shared_weak_count *)*((void *)this + 2);
  if (v1) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v1);
  }
  JUMPOUT(0x23ECC24B0);
}

void fst::SymbolTable::Copy(fst::SymbolTable *this)
{
}

uint64_t fst::SymbolTable::AddSymbol(uint64_t a1, uint64_t a2, uint64_t a3)
{
  fst::SymbolTable::MutateCheck(a1);
  uint64_t v6 = *(void *)(a1 + 8);
  return fst::internal::SymbolTableImpl::AddSymbol(v6, a2, a3);
}

uint64_t fst::SymbolTable::AddSymbol(uint64_t a1, uint64_t a2)
{
  fst::SymbolTable::MutateCheck(a1);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(v4 + 24);
  return fst::internal::SymbolTableImpl::AddSymbol(v4, a2, v5);
}

uint64_t fst::SymbolTable::AvailableKey(fst::SymbolTable *this)
{
  return *(void *)(*((void *)this + 1) + 24);
}

uint64_t fst::SymbolTable::CheckSum(fst::SymbolTable *this)
{
  uint64_t v1 = (fst::internal::SymbolTableImpl *)*((void *)this + 1);
  fst::internal::SymbolTableImpl::MaybeRecomputeCheckSum(v1);
  return (uint64_t)v1 + 168;
}

unint64_t fst::SymbolTable::GetNthKey(fst::internal::SymbolTableImpl **this, unint64_t a2)
{
  return fst::internal::SymbolTableImpl::GetNthKey(this[1], a2);
}

void fst::SymbolTable::Find(fst::internal::SymbolTableImpl **this@<X0>, int64_t a2@<X1>, std::string *a3@<X8>)
{
}

uint64_t fst::SymbolTable::Find(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t result = fst::internal::DenseSymbolMap::Find(v2 + 5, a2);
  if (result != -1)
  {
    uint64_t v4 = v2[4];
    BOOL v5 = __OFSUB__(result, v4);
    uint64_t v6 = result - v4;
    if (v6 < 0 == v5) {
      return *(void *)(v2[14] + 8 * v6);
    }
  }
  return result;
}

uint64_t fst::SymbolTable::LabeledCheckSum(fst::SymbolTable *this)
{
  uint64_t v1 = (fst::internal::SymbolTableImpl *)*((void *)this + 1);
  fst::internal::SymbolTableImpl::MaybeRecomputeCheckSum(v1);
  return (uint64_t)v1 + 192;
}

BOOL fst::SymbolTable::Member(fst::internal::SymbolTableImpl **this, int64_t a2)
{
  return fst::internal::SymbolTableImpl::Member(this[1], a2);
}

BOOL fst::SymbolTable::Member(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = fst::internal::DenseSymbolMap::Find(v2 + 5, a2);
  if (v3 == -1) {
    return 0;
  }
  uint64_t v4 = v2[4];
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  return v6 < 0 != v5 || *(void *)(v2[14] + 8 * v6) != -1;
}

uint64_t fst::SymbolTable::Name(fst::SymbolTable *this)
{
  return *((void *)this + 1);
}

unint64_t fst::SymbolTable::NumSymbols(fst::SymbolTable *this)
{
  return 0xAAAAAAAAAAAAAAABLL
       * ((uint64_t)(*(void *)(*((void *)this + 1) + 56) - *(void *)(*((void *)this + 1) + 48)) >> 3);
}

void fst::SymbolTable::RemoveSymbol(fst::SymbolTable *this, uint64_t a2)
{
  fst::SymbolTable::MutateCheck((uint64_t)this);
  uint64_t v4 = (fst::internal::SymbolTableImpl *)*((void *)this + 1);
  fst::internal::SymbolTableImpl::RemoveSymbol(v4, a2);
}

std::string *fst::SymbolTable::SetName(uint64_t a1, const std::string *a2)
{
  fst::SymbolTable::MutateCheck(a1);
  uint64_t v4 = *(std::string **)(a1 + 8);
  return std::string::operator=(v4, a2);
}

BOOL fst::SymbolTable::Write(uint64_t a1, void *a2)
{
  return fst::internal::SymbolTableImpl::Write(*(void *)(a1 + 8), a2);
}

uint64_t fst::SymbolTable::Write(uint64_t a1, uint64_t a2)
{
  v15[19] = *MEMORY[0x263EF8340];
  std::ofstream::basic_ofstream(&v13);
  if (*(_DWORD *)&v14[*(void *)(v13 - 24) + 24])
  {
    std::string::basic_string[abi:ne180100]<0>(__p, "ERROR");
    LogMessage::LogMessage(&v12, (uint64_t)__p);
    uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"SymbolTable::Write: Can't open file ", 36);
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(void *)a2;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a2 + 8);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, v6, v7);
    LogMessage::~LogMessage((LogMessage *)&v12);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 144))(a1, &v13);
  }
  uint64_t v13 = *MEMORY[0x263F8C2B0];
  *(void *)&v14[*(void *)(v13 - 24) - 8] = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x23ECC22C0](v14);
  std::ostream::~ostream();
  MEMORY[0x23ECC2440](v15);
  return v8;
}

void sub_23AC28654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
}

uint64_t fst::SymbolTable::WriteText(uint64_t a1, uint64_t a2)
{
  v17[19] = *MEMORY[0x263EF8340];
  std::ofstream::basic_ofstream(&v15);
  if (*(_DWORD *)&v16[*(void *)(v15 - 24) + 24])
  {
    std::string::basic_string[abi:ne180100]<0>(&__p, "ERROR");
    LogMessage::LogMessage(&v14, (uint64_t)&__p);
    uint64_t v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x263F8C0F8], (uint64_t)"SymbolTable::WriteText: Can't open file ", 40);
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(void *)a2;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a2 + 8);
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, v6, v7);
    LogMessage::~LogMessage((LogMessage *)&v14);
    if (v12 < 0) {
      operator delete(__p);
    }
    uint64_t v8 = 0;
  }
  else
  {
    LOBYTE(__p) = 0;
    std::string::basic_string[abi:ne180100]<0>(&v11, (char *)FLAGS_fst_field_separator);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t *, void **))(*(void *)a1 + 160))(a1, &v15, &__p);
    if (v13 < 0) {
      operator delete(v11);
    }
  }
  uint64_t v15 = *MEMORY[0x263F8C2B0];
  *(void *)&v16[*(void *)(v15 - 24) - 8] = *(void *)(MEMORY[0x263F8C2B0] + 24);
  MEMORY[0x23ECC22C0](v16);
  std::ostream::~ostream();
  MEMORY[0x23ECC2440](v17);
  return v8;
}

void sub_23AC288A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, int a20,__int16 a21,char a22,char a23,uint64_t a24)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  std::ofstream::~ofstream(&a24);
  _Unwind_Resume(a1);
}

void fst::internal::DenseSymbolMap::~DenseSymbolMap(fst::internal::DenseSymbolMap *this)
{
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void **)((char *)this + 8);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v3);
}

fst::CheckSummer *fst::CheckSummer::CheckSummer(fst::CheckSummer *this)
{
  *(_DWORD *)this = 0;
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  std::string::resize((std::string *)((char *)this + 8), 0x20uLL, 0);
  return this;
}

void sub_23AC2899C(_Unwind_Exception *exception_object)
{
  if (*(char *)(v1 + 31) < 0) {
    operator delete(*v2);
  }
  _Unwind_Resume(exception_object);
}

void std::shared_ptr<fst::internal::SymbolTableImpl>::reset[abi:ne180100]<fst::internal::SymbolTableImpl,void>(uint64_t a1, uint64_t a2)
{
  std::shared_ptr<fst::internal::SymbolTableImpl>::shared_ptr[abi:ne180100]<fst::internal::SymbolTableImpl,void>(&v2, a2);
}

std::string *fst::internal::SymbolTableImpl::SymbolTableImpl(std::string *this, const fst::internal::SymbolTableImpl *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *(_OWORD *)a2;
    this->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  *(_OWORD *)&this[1].__r_.__value_.__l.__data_ = *(_OWORD *)((char *)a2 + 24);
  fst::internal::DenseSymbolMap::DenseSymbolMap((fst::internal::DenseSymbolMap *)&this[1].__r_.__value_.__r.__words[2], (const fst::internal::SymbolTableImpl *)((char *)a2 + 40));
  this[4].__r_.__value_.__r.__words[2] = 0;
  this[5].__r_.__value_.__r.__words[0] = 0;
  this[5].__r_.__value_.__l.__size_ = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&this[4].__r_.__value_.__r.__words[2], *((const void **)a2 + 14), *((void *)a2 + 15), (uint64_t)(*((void *)a2 + 15) - *((void *)a2 + 14)) >> 3);
  std::map<long long,long long>::map[abi:ne180100]((uint64_t *)&this[5].__r_.__value_.__r.__words[2], (uint64_t)a2 + 136);
  this[6].__r_.__value_.__s.__data_[16] = 0;
  *(_OWORD *)&this[7].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[7].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&this[8].__r_.__value_.__r.__words[1] = 0u;
  this[9].__r_.__value_.__r.__words[0] = 850045863;
  *(_OWORD *)&this[9].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&this[10].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&this[10].__r_.__value_.__r.__words[2] = 0u;
  this[11].__r_.__value_.__l.__size_ = 0;
  return this;
}

void sub_23AC28AC8(_Unwind_Exception *a1)
{
  int v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 120) = v5;
    operator delete(v5);
  }
  fst::internal::DenseSymbolMap::~DenseSymbolMap(v2);
  if (*(char *)(v1 + 23) < 0) {
    operator delete(*(void **)v1);
  }
  _Unwind_Resume(a1);
}

uint64_t *std::map<long long,long long>::map[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  a1[2] = 0;
  a1[1] = 0;
  *a1 = (uint64_t)(a1 + 1);
  std::map<long long,long long>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<long long,long long>,std::__tree_node<std::__value_type<long long,long long>,void *> *,long>>>(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_23AC28B4C(_Unwind_Exception *a1)
{
  std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::destroy(v1, *(void **)(v1 + 8));
  _Unwind_Resume(a1);
}

uint64_t *std::map<long long,long long>::insert[abi:ne180100]<std::__map_const_iterator<std::__tree_const_iterator<std::__value_type<long long,long long>,std::__tree_node<std::__value_type<long long,long long>,void *> *,long>>>(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    long long v4 = a2;
    int v5 = (uint64_t **)result;
    uint64_t v6 = result + 1;
    do
    {
      uint64_t result = std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__emplace_hint_unique_key_args<long long,std::pair<long long const,long long> const&>(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      uint64_t v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          uint64_t v7 = (void *)*v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          long long v4 = v8;
        }
        while (!v9);
      }
      long long v4 = v8;
    }
    while (v8 != a3);
  }
  return result;
}

uint64_t *std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__emplace_hint_unique_key_args<long long,std::pair<long long const,long long> const&>(uint64_t **a1, void *a2, uint64_t *a3, _OWORD *a4)
{
  uint64_t v6 = (void **)std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__find_equal<long long>(a1, a2, &v11, &v10, a3);
  uint64_t v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    uint64_t v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    std::__tree<std::string>::__insert_node_at(a1, v11, v8, v7);
  }
  return v7;
}

void *std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__find_equal<long long>(void *a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (uint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }
      else
      {
        *a3 = a2;
        return a2;
      }
    }
    if (v8)
    {
      BOOL v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }
      while (v9);
    }
    else
    {
      char v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        char v13 = v10;
      }
      while (v14);
    }
    uint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    BOOL v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          char v17 = v16;
          uint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          BOOL v16 = (void *)*v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }
        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        BOOL v16 = (void *)v17[1];
      }
      while (v16);
    }
    else
    {
      char v17 = a1 + 1;
    }
LABEL_29:
    *a3 = v17;
    return v5;
  }
  if (v7 >= v6)
  {
    *a3 = a2;
    *a4 = a2;
    return a4;
  }
  uint64_t v11 = a2[1];
  if (v11)
  {
    char v12 = (void *)a2[1];
    do
    {
      a4 = v12;
      char v12 = (void *)*v12;
    }
    while (v12);
  }
  else
  {
    uint64_t v19 = a2;
    do
    {
      a4 = (void *)v19[2];
      BOOL v14 = *a4 == (void)v19;
      uint64_t v19 = a4;
    }
    while (!v14);
  }
  if (a4 != v5 && v6 >= a4[4])
  {
    int64_t v20 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          int64_t v21 = v20;
          uint64_t v22 = v20[4];
          if (v6 >= v22) {
            break;
          }
          int64_t v20 = (void *)*v21;
          int v5 = v21;
          if (!*v21) {
            goto LABEL_48;
          }
        }
        if (v22 >= v6) {
          break;
        }
        int v5 = v21 + 1;
        int64_t v20 = (void *)v21[1];
      }
      while (v20);
    }
    else
    {
      int64_t v21 = a1 + 1;
    }
LABEL_48:
    *a3 = v21;
    return v5;
  }
  if (v11)
  {
    *a3 = a4;
  }
  else
  {
    *a3 = a2;
    return a2 + 1;
  }
  return a4;
}

void fst::internal::SymbolTableImpl::Find(fst::internal::SymbolTableImpl *this@<X0>, int64_t a2@<X1>, std::string *a3@<X8>)
{
  if (a2 < 0 || *((void *)this + 4) <= a2)
  {
    uint64_t v3 = (void *)*((void *)this + 18);
    if (!v3) {
      goto LABEL_17;
    }
    long long v4 = (void *)((char *)this + 144);
    do
    {
      int64_t v5 = v3[4];
      BOOL v6 = v5 < a2;
      if (v5 >= a2) {
        uint64_t v7 = v3;
      }
      else {
        uint64_t v7 = v3 + 1;
      }
      if (!v6) {
        long long v4 = v3;
      }
      uint64_t v3 = (void *)*v7;
    }
    while (*v7);
    if (v4 == (void *)((char *)this + 144)) {
      goto LABEL_17;
    }
    if (v4[4] > a2) {
      goto LABEL_17;
    }
    a2 = v4[5];
    if (a2 < 0) {
      goto LABEL_17;
    }
  }
  uint64_t v8 = *((void *)this + 6);
  if (a2 >= 0xAAAAAAAAAAAAAAABLL * ((*((void *)this + 7) - v8) >> 3))
  {
LABEL_17:
    std::string::basic_string[abi:ne180100]<0>(a3, "");
  }
  else
  {
    BOOL v9 = (long long *)(v8 + 24 * a2);
    if (*((char *)v9 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)v9, *((void *)v9 + 1));
    }
    else
    {
      long long v10 = *v9;
      a3->__r_.__value_.__r.__words[2] = *((void *)v9 + 2);
      *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v10;
    }
  }
}

BOOL fst::internal::SymbolTableImpl::Member(fst::internal::SymbolTableImpl *this, int64_t a2)
{
  fst::internal::SymbolTableImpl::Find(this, a2, &v4);
  if ((SHIBYTE(v4.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
    return SHIBYTE(v4.__r_.__value_.__r.__words[2]) != 0;
  }
  BOOL v2 = v4.__r_.__value_.__l.__size_ != 0;
  operator delete(v4.__r_.__value_.__l.__data_);
  return v2;
}

void *std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    BOOL v6 = result;
    uint64_t result = std::vector<fst::ReplaceStackPrefix<int,int>::PrefixTuple,std::allocator<fst::ReplaceStackPrefix<int,int>::PrefixTuple>>::__vallocate[abi:ne180100](result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_23AC28F8C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<long long>::vector(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<fst::ReplaceStackPrefix<int,int>::PrefixTuple,std::allocator<fst::ReplaceStackPrefix<int,int>::PrefixTuple>>::__vallocate[abi:ne180100](a1, a2);
    std::string v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_23AC29004(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    BOOL v6 = result;
    std::vector<fst::ReplaceStackPrefix<int,int>>::__vallocate[abi:ne180100](result, a4);
    uint64_t result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_23AC29088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, long long *a2, long long *a3, std::string *this)
{
  std::string v4 = this;
  uint64_t v11 = this;
  char v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    BOOL v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((void *)v6 + 1));
        std::string v4 = v12;
      }
      else
      {
        long long v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((void *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      BOOL v6 = (long long *)((char *)v6 + 24);
      char v12 = ++v4;
    }
    while (v6 != a3);
  }
  char v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_23AC29154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 24)) {
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  }
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0) {
      operator delete(*(void **)(v1 - 24));
    }
    v1 -= 24;
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64;
      }
      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273 * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127 * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(void *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, long long *a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }
  *(void *)(a1 + 8) = v3 + 24;
}

void sub_23AC296AC(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__emplace_back_slow_path<std::string const&>(uint64_t *a1, long long *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9) {
    uint64_t v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<std::unique_ptr<CMDPToken>>>>(v7, v9);
  }
  else {
    uint64_t v10 = 0;
  }
  std::__split_buffer<std::string>::pointer end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((void *)a2 + 1));
    std::__split_buffer<std::string>::pointer end = __v.__end_;
  }
  else
  {
    long long v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  uint64_t v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_23AC297C4(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
}

void std::vector<long long>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      std::vector<std::pair<std::string,std::unique_ptr<fst::VectorFst<fst::ArcTpl<fst::TropicalWeightTpl<float>>,fst::VectorState<fst::ArcTpl<fst::TropicalWeightTpl<float>>,std::allocator<fst::ArcTpl<fst::TropicalWeightTpl<float>>>>>>>>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<CMDPToken>>>(v4, v13);
      unint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      unint64_t v14 = 0;
    }
    uint64_t v15 = &v14[8 * v11];
    unint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    uint64_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
    {
      operator delete(v8);
    }
  }
}

long long *std::__move_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::string *,std::string *,std::string *>(uint64_t a1, long long *a2, long long *a3, uint64_t a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      if (*(char *)(a4 + 23) < 0) {
        operator delete(*(void **)a4);
      }
      long long v7 = *v5;
      *(void *)(a4 + 16) = *((void *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24;
      *((unsigned char *)v5 + 23) = 0;
      *(unsigned char *)unint64_t v5 = 0;
      unint64_t v5 = (long long *)((char *)v5 + 24);
    }
    while (v5 != a3);
    return a3;
  }
  return v5;
}

uint64_t *std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__emplace_unique_key_args<long long,std::piecewise_construct_t const&,std::tuple<long long const&>,std::tuple<>>(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  long long v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        long long v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        long long v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<std::string>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

uint64_t *std::__tree<std::__value_type<long long,long long>,std::__map_value_compare<long long,std::__value_type<long long,long long>,std::less<long long>,true>,std::allocator<std::__value_type<long long,long long>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    uint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      uint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    uint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      uint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  long long v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      long long v7 = 0;
      unint64_t result = (uint64_t *)v2;
    }
    else
    {
      long long v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + ++*(_DWORD *)(result + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      unint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + ++*(_DWORD *)(result + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + ++*(_DWORD *)(result + 24) = 1;
      *(unsigned char *)(v12 + ++*(_DWORD *)(result + 24) = 0;
      unint64_t v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      uint64_t *v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        unint64_t result = v7;
      }
      long long v7 = *(uint64_t **)(*v7 + 8);
    }
    uint64_t v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      unint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + ++*(_DWORD *)(result + 24) = 1;
        *((unsigned char *)v7 + ++*(_DWORD *)(result + 24) = 0;
        uint64_t v22 = v15[1];
        *long long v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        _DWORD v7[2] = (uint64_t)v15;
        unint64_t v16 = v7;
      }
      else
      {
        uint64_t v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + ++*(_DWORD *)(result + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + ++*(_DWORD *)(result + 24) = 1;
      *((unsigned char *)v16 + ++*(_DWORD *)(result + 24) = 1;
      unint64_t v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *unint64_t v24 = v23;
      goto LABEL_72;
    }
    unint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + ++*(_DWORD *)(result + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      uint64_t v17 = result;
LABEL_53:
      *((unsigned char *)v17 + ++*(_DWORD *)(result + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    long long v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + ++*(_DWORD *)(result + 24) = 1;
    *(unsigned char *)(v12 + ++*(_DWORD *)(result + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    _DWORD v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      unint64_t result = v7;
    }
    long long v7 = *(uint64_t **)v12;
  }
  uint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + ++*(_DWORD *)(result + 24) = 0;
    uint64_t v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + ++*(_DWORD *)(result + 24) = 1;
    *((unsigned char *)v7 + ++*(_DWORD *)(result + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *uint64_t v20 = (uint64_t)v7;
    _DWORD v7[2] = (uint64_t)v20;
    uint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + ++*(_DWORD *)(result + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + ++*(_DWORD *)(result + 24) = 1;
  *((unsigned char *)v19 + ++*(_DWORD *)(result + 24) = 1;
  unint64_t v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

uint64_t CMDPOSLog(void)
{
  if (CMDPOSLog(void)::onceToken != -1) {
    dispatch_once(&CMDPOSLog(void)::onceToken, &__block_literal_global_7);
  }
  return CMDPOSLog(void)::signpostLog;
}

os_log_t ___Z9CMDPOSLogv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.SpeechRecognitionCore", "CMDPLogs");
  CMDPOSLog(void)::signpostLog = (uint64_t)result;
  return result;
}

uint64_t fst::FstHeader::Write()
{
  return 1;
}

unint64_t fst::ComposeProperties(unint64_t this, uint64_t a2)
{
  uint64_t v2 = (a2 | this) & 4;
  unint64_t v3 = a2 & this;
  unint64_t v4 = a2 & this & 0x2802010000 | v2 | 0x10000000000;
  if ((a2 & this & 0x2000000) != 0) {
    v4 |= a2 & this & 0x40000;
  }
  uint64_t v5 = v3 & 0x280A800000 | v2 | 0x10000010000;
  if ((v3 & 0x2000000) != 0) {
    v5 |= v3 & 0x140000;
  }
  if ((v3 & 0x10000) != 0) {
    return v5;
  }
  else {
    return v4;
  }
}

unint64_t fst::DeterminizeProperties(unint64_t this, int a2, int a3)
{
  if ((this & 0x10000) != 0
    || ((this & 0x2000000) == 0 ? (v3 = a2 ^ 1) : (v3 = 0), (uint64_t v4 = 0x10000000000, (v3 & 1) == 0) && a3))
  {
    uint64_t v4 = 0x10000040000;
  }
  unint64_t v5 = (this >> 25) & 1;
  unint64_t v6 = this & 0x800000;
  if ((v5 & a3) == 0) {
    unint64_t v6 = 0;
  }
  unint64_t v7 = this & ((uint64_t)(this << 23) >> 63) & 0x405000000 | this & 0x142800010004 | this & ((int)(this << 15) >> 31) & 0xA000000 | v6 | v4;
  if ((v5 & a2) != 0) {
    return v7 | 0x2000000;
  }
  else {
    return v7;
  }
}

uint64_t fst::ReplaceProperties(uint64_t **a1, uint64_t a2, int a3, int a4, int a5, char a6, int a7, int a8, char a9, char a10, unsigned __int8 a11)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  if (*a1 == v12) {
    return 0x956A5A950000;
  }
  uint64_t v13 = 0;
  uint64_t v14 = *a1;
  do
  {
    uint64_t v15 = *v14++;
    v13 |= v15 & 4;
  }
  while (v14 != v12);
  uint64_t v16 = 0x50000000000;
  if (!a8) {
    uint64_t v16 = 0;
  }
  uint64_t v17 = *a1;
  do
  {
    uint64_t v18 = *v17++;
    v16 &= v18;
  }
  while (v17 != v12);
  if (v16 == 0x50000000000)
  {
    uint64_t v19 = 0;
    LOBYTE(v20) = 1;
    BOOL v21 = *a1;
    do
    {
      uint64_t v23 = *v21++;
      uint64_t v22 = v23;
      uint64_t v24 = v23 & 0x20000;
      if (!a7) {
        uint64_t v24 = 0;
      }
      v19 |= v22 & 0x608505680000 | v24;
      int v20 = ((v22 & 0x100000000000) != 0) & v20;
    }
    while (v21 != v12);
    BOOL v25 = v20 == 0;
    uint64_t v26 = 0x50000000000;
    if (!v25) {
      uint64_t v26 = 0x150000000000;
    }
    v13 |= v11[a2] & 0x1000000000 | v19 | v26;
  }
  char v27 = a3 ^ 1;
  unint64_t v28 = v12 - v11;
  int v29 = (a3 | a4) ^ 1;
  int v30 = (a3 ^ 1) & a4;
  LOBYTE(v31) = a7 ^ 1;
  if (v28 <= 1) {
    uint64_t v32 = 1;
  }
  else {
    uint64_t v32 = v28;
  }
  LOBYTE(v33) = 1;
  uint64_t v34 = (unint64_t *)v11;
  uint64_t v35 = a2;
  LOBYTE(v36) = 1;
  do
  {
    unint64_t v37 = *v34++;
    int v31 = BYTE2(v37) & 1 & v31;
    uint64_t v38 = (v37 >> 18) & 1;
    uint64_t v39 = (v37 >> 25) & 1;
    v29 &= v39;
    int v36 = ((v37 & 0x800000000) != 0) & v36;
    int v33 = ((v37 & 0x200000000) != 0) & v33;
    if (v35) {
      int v40 = v39;
    }
    else {
      int v40 = 1;
    }
    v30 &= v40 & v38;
    --v35;
    --v32;
  }
  while (v32);
  if (v31) {
    v13 |= 0x10000uLL;
  }
  if (v30) {
    v13 |= 0x40000uLL;
  }
  if (v29) {
    v13 |= 0x2000000uLL;
  }
  if (v36) {
    v13 |= 0x800000000uLL;
  }
  if (v33) {
    v13 |= 0x200000000uLL;
  }
  uint64_t v41 = v11[a2] & 0x2000000000 | v13;
  if ((((v27 | a11) & a9) & a4) != 0) {
    v41 |= 0x10000000uLL;
  }
  if (((a6 & a10) & (a5 ^ 1 | a11)) != 0) {
    return v41 | 0x40000000;
  }
  else {
    return v41;
  }
}

unint64_t fst::RelabelProperties(unint64_t this)
{
  return this & 0xFFFF00000007;
}

unint64_t fst::ReverseProperties(unint64_t this, int a2)
{
  uint64_t v2 = 0xC00E05430007;
  if (a2) {
    uint64_t v2 = 0xC00F05430007;
  }
  return v2 & this;
}

unint64_t fst::ReweightProperties(unint64_t this)
{
  return this & 0x3BFCFFFF0007;
}

unint64_t fst::RmEpsilonProperties(unint64_t this, int a2)
{
  uint64_t v2 = 176160768;
  if ((this & 0x10000) == 0) {
    uint64_t v2 = 0x800000;
  }
  unint64_t v3 = v2 | this & 0x2800010004;
  if (!a2) {
    v3 |= this & 0x4000000000 | 3;
  }
  if ((a2 & ((this & 0x10000000000) == 0)) != 0) {
    unint64_t v4 = 0;
  }
  else {
    unint64_t v4 = this & 0x20000;
  }
  return v3 | v4;
}

unint64_t fst::ShortestPathProperties(unint64_t this, int a2)
{
  uint64_t v2 = 0x852800000000;
  if (a2) {
    uint64_t v2 = 0x812800000000;
  }
  return v2 | this;
}

uint64_t sub_23AC2A4C0()
{
  return MEMORY[0x270EF0FA0]();
}

uint64_t sub_23AC2A4D0()
{
  return MEMORY[0x270EF10A8]();
}

uint64_t sub_23AC2A4E0()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_23AC2A4F0()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_23AC2A500()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_23AC2A510()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_23AC2A520()
{
  return MEMORY[0x270EF18D0]();
}

uint64_t sub_23AC2A530()
{
  return MEMORY[0x270EF1958]();
}

uint64_t sub_23AC2A540()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_23AC2A550()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_23AC2A560()
{
  return MEMORY[0x270EF1AE8]();
}

uint64_t sub_23AC2A570()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_23AC2A580()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_23AC2A590()
{
  return MEMORY[0x270F9D788]();
}

uint64_t sub_23AC2A5A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_23AC2A5B0()
{
  return MEMORY[0x270F9D880]();
}

uint64_t sub_23AC2A5D0()
{
  return MEMORY[0x270F9DA80]();
}

uint64_t sub_23AC2A5E0()
{
  return MEMORY[0x270F9DB00]();
}

uint64_t sub_23AC2A5F0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_23AC2A600()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_23AC2A610()
{
  return MEMORY[0x270F9DEF0]();
}

uint64_t sub_23AC2A620()
{
  return MEMORY[0x270F9E470]();
}

uint64_t sub_23AC2A630()
{
  return MEMORY[0x270EF23E8]();
}

uint64_t sub_23AC2A640()
{
  return MEMORY[0x270F9E7F0]();
}

uint64_t sub_23AC2A650()
{
  return MEMORY[0x270F9E958]();
}

uint64_t sub_23AC2A660()
{
  return MEMORY[0x270F9E960]();
}

uint64_t sub_23AC2A670()
{
  return MEMORY[0x270F9E970]();
}

uint64_t sub_23AC2A680()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_23AC2A690()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_23AC2A6A0()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_23AC2A6B0()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_23AC2A6C0()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_23AC2A6D0()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_23AC2A6E0()
{
  return MEMORY[0x270F9EBE0]();
}

uint64_t sub_23AC2A6F0()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_23AC2A700()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_23AC2A710()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_23AC2A720()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_23AC2A730()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_23AC2A740()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_23AC2A750()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_23AC2A760()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_23AC2A770()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_23AC2A780()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_23AC2A790()
{
  return MEMORY[0x270F9F270]();
}

uint64_t sub_23AC2A7A0()
{
  return MEMORY[0x270F9F2A0]();
}

uint64_t sub_23AC2A7B0()
{
  return MEMORY[0x270F9F2E8]();
}

uint64_t sub_23AC2A7C0()
{
  return MEMORY[0x270F9F2F0]();
}

uint64_t sub_23AC2A7D0()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_23AC2A7E0()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_23AC2A7F0()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_23AC2A800()
{
  return MEMORY[0x270F9F3B0]();
}

uint64_t sub_23AC2A810()
{
  return MEMORY[0x270F9F3E0]();
}

uint64_t sub_23AC2A820()
{
  return MEMORY[0x270F9F428]();
}

uint64_t sub_23AC2A830()
{
  return MEMORY[0x270F9F430]();
}

uint64_t sub_23AC2A840()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_23AC2A850()
{
  return MEMORY[0x270F9F4C8]();
}

uint64_t sub_23AC2A860()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_23AC2A870()
{
  return MEMORY[0x270F9FA40]();
}

uint64_t sub_23AC2A880()
{
  return MEMORY[0x270F9FB10]();
}

uint64_t sub_23AC2A890()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_23AC2A8A0()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_23AC2A8B0()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_23AC2A8C0()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_23AC2A8D0()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_23AC2A8E0()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_23AC2A8F0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_23AC2A900()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_23AC2A910()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_23AC2A920()
{
  return MEMORY[0x270F9FD98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFCharacterSetAddCharactersInString(CFMutableCharacterSetRef theSet, CFStringRef theString)
{
}

CFMutableCharacterSetRef CFCharacterSetCreateMutable(CFAllocatorRef alloc)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4730](alloc);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x270EE4738](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x270EE4750](theSetIdentifier);
}

void CFCharacterSetInvert(CFMutableCharacterSetRef theSet)
{
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x270EE4760](theSet, theChar);
}

void CFCharacterSetUnion(CFMutableCharacterSetRef theSet, CFCharacterSetRef theOtherSet)
{
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x270EE48F0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x270EE4A80](allocator, localeIdentifier);
}

CFLocaleRef CFLocaleCreateCopy(CFAllocatorRef allocator, CFLocaleRef locale)
{
  return (CFLocaleRef)MEMORY[0x270EE4AA0](allocator, locale);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x270EE4AB0](locale);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x270EE5098](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B8](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x270EE50F0](alloc, cStr, *(void *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x270EE5158](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x270EE5190](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x270EE51E0](length, *(void *)&encoding);
}

void CFStringLowercase(CFMutableStringRef theString, CFLocaleRef locale)
{
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x270EE5278](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x270EE5290](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1 = MEMORY[0x270EE52A0](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
}

uint64_t EARCSpeechRecognitionTokenGetConfidence()
{
  return MEMORY[0x270F26E30]();
}

uint64_t EARCSpeechRecognitionTokenGetEnd()
{
  return MEMORY[0x270F26E38]();
}

uint64_t EARCSpeechRecognitionTokenGetSilenceStart()
{
  return MEMORY[0x270F26E40]();
}

uint64_t EARCSpeechRecognitionTokenGetStart()
{
  return MEMORY[0x270F26E48]();
}

uint64_t EARCSpeechRecognitionTokenGetTokenName()
{
  return MEMORY[0x270F26E50]();
}

uint64_t EARCSpeechRecognitionTokenHasSpaceAfter()
{
  return MEMORY[0x270F26E58]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t RXEngineTypeForLocaleIdentifier()
{
  return MEMORY[0x270F76C68]();
}

uint64_t RXIsLocaleWithNoSpaceInPostITN()
{
  return MEMORY[0x270F76C80]();
}

uint64_t RXLocalesSupportingSpellingMode()
{
  return MEMORY[0x270F76CC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984E0](this, __pos, __s);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x270F98750]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x270F98770]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F98778]();
}

{
  return MEMORY[0x270F98788]();
}

{
  return MEMORY[0x270F987A0]();
}

{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987C0]();
}

{
  return MEMORY[0x270F987D8]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x270F98E08](retstr, *(void *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x270FA0528]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x270FA0568]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}