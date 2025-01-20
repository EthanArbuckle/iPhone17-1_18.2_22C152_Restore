@interface UIDynamicValueAnimation
@end

@implementation UIDynamicValueAnimation

uint64_t __48___UIDynamicValueAnimation__animateForInterval___block_invoke(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, double, double))(v6 + 16))(v6, a2, *(double *)(a1 + 40), *(double *)(v5 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
  }
  uint64_t result = *(void *)(v5 + 32);
  if (result)
  {
    a3.n128_u64[0] = *(void *)(a1 + 40);
    a4.n128_u64[0] = *(void *)(v5 + 40);
    v8 = *(uint64_t (**)(__n128, __n128))(result + 16);
    return v8(a3, a4);
  }
  return result;
}

uint64_t __48___UIDynamicValueAnimation__animateForInterval___block_invoke_2(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, double, double))(v6 + 16))(v6, a2, *(double *)(v5 + 40), *(double *)(v5 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
  }
  uint64_t result = *(void *)(v5 + 32);
  if (result)
  {
    a3.n128_u64[0] = *(void *)(v5 + 40);
    v8 = *(uint64_t (**)(__n128, __n128))(result + 16);
    a4.n128_u64[0] = a3.n128_u64[0];
    return v8(a3, a4);
  }
  return result;
}

@end