@interface PASHistogramData
@end

@implementation PASHistogramData

uint64_t __35___PASHistogramData_countWhereA_b___block_invoke(uint64_t result, uint64_t a2, int a3)
{
  if (*(unsigned __int16 *)(result + 40) == a3) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

uint64_t __35___PASHistogramData_countWhereA_b___block_invoke_2(uint64_t result, int a2)
{
  if (*(unsigned __int16 *)(result + 40) == a2) {
    ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  return result;
}

@end