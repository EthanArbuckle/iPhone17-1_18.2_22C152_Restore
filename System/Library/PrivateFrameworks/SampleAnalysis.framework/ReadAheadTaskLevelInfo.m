@interface ReadAheadTaskLevelInfo
@end

@implementation ReadAheadTaskLevelInfo

__n128 __ReadAheadTaskLevelInfo_block_invoke_1680(uint64_t a1, unsigned int a2, __n128 *a3)
{
  v3 = (__n128 *)(*(void *)(a1 + 32) + 24 * a2);
  __n128 result = *a3;
  v3[1].n128_u64[0] = a3[1].n128_u64[0];
  __n128 *v3 = result;
  return result;
}

__n128 __ReadAheadTaskLevelInfo_block_invoke_1685(uint64_t a1, unsigned int a2, __n128 *a3)
{
  v3 = (__n128 *)(*(void *)(a1 + 32) + 24 * a2);
  __n128 result = *a3;
  v3[1].n128_u64[0] = a3[1].n128_u64[0];
  __n128 *v3 = result;
  return result;
}

__n128 __ReadAheadTaskLevelInfo_block_invoke_1688(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32) + 56 * a2;
  __n128 result = *(__n128 *)a3;
  long long v5 = *(_OWORD *)(a3 + 16);
  long long v6 = *(_OWORD *)(a3 + 32);
  *(void *)(v3 + 48) = *(void *)(a3 + 48);
  *(_OWORD *)(v3 + 16) = v5;
  *(_OWORD *)(v3 + 32) = v6;
  *(__n128 *)uint64_t v3 = result;
  return result;
}

__n128 __ReadAheadTaskLevelInfo_block_invoke_3(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32) - a2 + 32 * a2;
  __n128 result = *(__n128 *)a3;
  if (*(_DWORD *)(a1 + 40) < 0x1Fu)
  {
    *(_OWORD *)(v3 + 9) = *(_OWORD *)(a3 + 9);
    *(__n128 *)uint64_t v3 = result;
    uint64_t v5 = *(void *)(a1 + 32) - a2 + 32 * a2;
    *(_WORD *)(v5 + 25) = 0;
    *(_DWORD *)(v5 + 27) = 0;
  }
  else
  {
    *(_OWORD *)(v3 + 15) = *(_OWORD *)(a3 + 15);
    *(__n128 *)uint64_t v3 = result;
  }
  return result;
}

__n128 __ReadAheadTaskLevelInfo_block_invoke_4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32) + 28 * a2;
  __n128 result = *(__n128 *)a3;
  if (*(_DWORD *)(a1 + 40) < 0x1Cu)
  {
    *(_OWORD *)(v3 + 10) = *(_OWORD *)(a3 + 10);
    *(__n128 *)uint64_t v3 = result;
    *(_WORD *)(*(void *)(a1 + 32) + 28 * a2 + 26) = 0;
  }
  else
  {
    *(_OWORD *)(v3 + 12) = *(_OWORD *)(a3 + 12);
    *(__n128 *)uint64_t v3 = result;
  }
  return result;
}

@end