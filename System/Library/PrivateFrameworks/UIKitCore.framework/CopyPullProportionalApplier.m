@interface CopyPullProportionalApplier
@end

@implementation CopyPullProportionalApplier

double ___CopyPullProportionalApplier_block_invoke(uint64_t a1, uint64_t a2, double *a3, double *a4)
{
  double result = *a3 + (*(double *)(a2 + 8) - *a4) * (*(double *)(a2 + 40) / 1000.0);
  *a3 = result;
  return result;
}

@end