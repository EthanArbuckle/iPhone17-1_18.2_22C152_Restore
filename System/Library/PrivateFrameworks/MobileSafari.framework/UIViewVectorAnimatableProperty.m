@interface UIViewVectorAnimatableProperty
@end

@implementation UIViewVectorAnimatableProperty

double __84__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setPointValue___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setSizeValue___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __83__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setRectValue___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  *(void *)(a2 + 8) = *(void *)(a1 + 40);
  *(void *)(a2 + 16) = *(void *)(a1 + 48);
  double result = *(double *)(a1 + 56);
  *(double *)(a2 + 24) = result;
  return result;
}

double __88__UIViewVectorAnimatableProperty_MobileSafariFrameworkExtras__safari_setTransformValue___block_invoke(uint64_t a1, uint64_t a2)
{
  *(long double *)a2 = log(*(long double *)(a1 + 32));
  *(long double *)(a2 + 8) = log(*(long double *)(a1 + 40));
  *(void *)(a2 + 16) = *(void *)(a1 + 64);
  *(void *)(a2 + 24) = *(void *)(a1 + 72);
  *(void *)(a2 + 32) = *(void *)(a1 + 48);
  double result = *(double *)(a1 + 56);
  *(double *)(a2 + 40) = result;
  return result;
}

@end