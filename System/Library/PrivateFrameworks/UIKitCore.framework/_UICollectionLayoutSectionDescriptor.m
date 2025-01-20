@interface _UICollectionLayoutSectionDescriptor
- (BOOL)isEqualToSectionDescriptor:(int)a3 comparingContentOffset:;
- (double)scrollingUnitVector;
@end

@implementation _UICollectionLayoutSectionDescriptor

- (BOOL)isEqualToSectionDescriptor:(int)a3 comparingContentOffset:
{
  if (!a1) {
    return 0;
  }
  if (a2 == a1) {
    return 1;
  }
  if (a3)
  {
    if (a2)
    {
      double v4 = *(double *)(a2 + 96);
      double v3 = *(double *)(a2 + 104);
    }
    else
    {
      double v3 = 0.0;
      double v4 = 0.0;
    }
    if (*(double *)(a1 + 96) != v4 || *(double *)(a1 + 104) != v3) {
      return 0;
    }
  }
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)
    || *(void *)(a1 + 24) != *(void *)(a2 + 24)
    || *(double *)(a1 + 32) != *(double *)(a2 + 32)
    || *(void *)(a1 + 40) != *(void *)(a2 + 40)
    || *(unsigned __int8 *)(a1 + 8) != *(unsigned __int8 *)(a2 + 8)
    || *(unsigned __int8 *)(a1 + 9) != *(unsigned __int8 *)(a2 + 9)
    || *(double *)(a1 + 48) != *(double *)(a2 + 48))
  {
    return 0;
  }
  uint64_t v6 = 0;
  if (*(double *)(a1 + 80) - *(double *)(a2 + 80) != 0.0 || *(double *)(a1 + 88) - *(double *)(a2 + 88) != 0.0) {
    return v6;
  }
  if (*(double *)(a1 + 56) != *(double *)(a2 + 56)
    || *(double *)(a1 + 64) != *(double *)(a2 + 64)
    || *(double *)(a1 + 72) != *(double *)(a2 + 72)
    || !CGRectEqualToRect(*(CGRect *)(a1 + 112), *(CGRect *)(a2 + 112))
    || !CGRectEqualToRect(*(CGRect *)(a1 + 144), *(CGRect *)(a2 + 144))
    || (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 176), *(float64x2_t *)(a2 + 176)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 192), *(float64x2_t *)(a2 + 192)))), 0xFuLL))) & 1) == 0|| !CGRectEqualToRect(*(CGRect *)(a1 + 208), *(CGRect *)(a2 + 208)))
  {
    return 0;
  }
  uint64_t v8 = *(void *)(a2 + 240);
  uint64_t v9 = *(void *)(a2 + 248);
  uint64_t v10 = *(void *)(a2 + 256);
  uint64_t v11 = *(void *)(a2 + 264);
  uint64_t v12 = *(void *)(a1 + 240);
  uint64_t v13 = *(void *)(a1 + 248);
  uint64_t v14 = *(void *)(a1 + 256);
  uint64_t v15 = *(void *)(a1 + 264);
  return CGRectEqualToRect(*(CGRect *)&v12, *(CGRect *)&v8);
}

- (double)scrollingUnitVector
{
  if (a1) {
    return *(double *)(a1 + 80);
  }
  else {
    return 0.0;
  }
}

@end