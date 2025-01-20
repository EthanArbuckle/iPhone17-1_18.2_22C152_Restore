@interface SBHDefaultIconGridSizeClassEditingAnimationStrengths
@end

@implementation SBHDefaultIconGridSizeClassEditingAnimationStrengths

void ___SBHDefaultIconGridSizeClassEditingAnimationStrengths_block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  int v3 = [*(id *)(a1 + 32) gridSizeForGridSizeClass:v8];
  double v4 = 1.0;
  if (v8
    && *(unsigned char *)(a1 + 56)
    && ([v8 isEqualToString:@"SBHIconGridSizeClassDefault"] & 1) == 0)
  {
    if ([*(id *)(a1 + 40) containsGridSizeClass:v8]) {
      double v4 = 0.5;
    }
    else {
      double v4 = 1.0;
    }
  }
  double v5 = SBHIconListLayoutDefaultEditingAnimationStrengthForGridSize(v3);
  v6 = *(void **)(a1 + 48);
  v7 = [NSNumber numberWithDouble:v4 * v5];
  [v6 setObject:v7 forKey:v8];
}

@end