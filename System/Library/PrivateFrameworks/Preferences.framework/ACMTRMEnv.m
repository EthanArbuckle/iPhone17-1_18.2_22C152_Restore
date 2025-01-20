@interface ACMTRMEnv
@end

@implementation ACMTRMEnv

uint64_t __ACMTRMEnv_Get_block_invoke(uint64_t result, _DWORD *a2, uint64_t a3)
{
  int v3 = -5;
  if (a2 && a3 == 4)
  {
    int v3 = 0;
    **(_DWORD **)(result + 40) = *a2;
  }
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  return result;
}

@end