@interface UIBoundingPath
@end

@implementation UIBoundingPath

void __78___UIBoundingPath__rectTuckedInCorner_ofBoundingRect_withSize_minimumPadding___block_invoke(uint64_t a1, double a2, double a3)
{
  if (!CGRectIsNull(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32)))
  {
    double v6 = _UIIntersectionPointOfRayWithRect(a2, a3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(CGFloat *)(a1 + 56), *(CGFloat *)(a1 + 64), *(CGFloat *)(a1 + 72), *(CGFloat *)(a1 + 80));
    if (v6 == *MEMORY[0x1E4F1DB20] && v7 == *(double *)(MEMORY[0x1E4F1DB20] + 8))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
      *(_OWORD *)(v9 + 32) = *MEMORY[0x1E4F1DB20];
      *(_OWORD *)(v9 + 48) = v10;
    }
    else
    {
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v6
                                                                  - a2
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 32);
      *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = v7
                                                                  - a3
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 40);
    }
  }
}

@end