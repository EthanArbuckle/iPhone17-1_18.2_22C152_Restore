@interface UIView
@end

@implementation UIView

void __58__UIView_NCTextSupportingAdditions___interactionForClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (objc_opt_isKindOfClass())
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

uint64_t __49__UIView_NCHighFrameRate__nc_applyHighFrameRate___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v3 = *(void *)(a1 + 32);

  return objc_msgSend(v2, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 2621442, v3, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

@end