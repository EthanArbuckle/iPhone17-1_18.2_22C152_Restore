@interface UINavigationBarTransitionContext
@end

@implementation UINavigationBarTransitionContext

uint64_t __59___UINavigationBarTransitionContext__animateBackgroundView__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(_WORD *)(v1 + 160) & 0x800) != 0)
  {
    [*(id *)(v1 + 40) transitionBackgroundViews];
    uint64_t v1 = *(void *)(a1 + 32);
  }
  v3 = *(void **)(v1 + 8);
  return [v3 _updatePaletteBackgroundIfNecessary];
}

void __51___UINavigationBarTransitionContext_fadeInFunction__block_invoke(double a1, double a2, double a3, double a4)
{
  LODWORD(a2) = 1036831949;
  LODWORD(a1) = 0.75;
  LODWORD(a3) = 0.75;
  LODWORD(a4) = 1036831949;
  uint64_t v4 = [MEMORY[0x1E4F39C10] functionWithControlPoints:a1 :a2 :a3 :a4];
  v5 = (void *)_MergedGlobals_67;
  _MergedGlobals_67 = v4;
}

void __52___UINavigationBarTransitionContext_fadeOutFunction__block_invoke(double a1, double a2, double a3, double a4)
{
  LODWORD(a2) = 1063675494;
  LODWORD(a1) = 0.25;
  LODWORD(a3) = 0.25;
  LODWORD(a4) = 1063675494;
  uint64_t v4 = [MEMORY[0x1E4F39C10] functionWithControlPoints:a1 :a2 :a3 :a4];
  v5 = (void *)qword_1EB25B228;
  qword_1EB25B228 = v4;
}

uint64_t __83___UINavigationBarTransitionContext__animateAsTwoPartsWithOverlap_partOne_partTwo___block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 40)) {
    result = +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", 0.0, *(double *)(*(void *)(result + 32) + 128) + *(double *)(result + 56));
  }
  if (*(void *)(v1 + 48))
  {
    double v2 = *(double *)(*(void *)(v1 + 32) + 128);
    double v3 = *(double *)(v1 + 56);
    double v4 = v2 - v3;
    double v5 = v2 + v3;
    return +[UIView addKeyframeWithRelativeStartTime:relativeDuration:animations:](UIView, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v4, v5);
  }
  return result;
}

void __103___UINavigationBarTransitionContext__animateInProcessAsTwoPartsWithKeyframeID_overlap_partOne_partTwo___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    double v2 = [*(id *)(a1 + 32) stringByAppendingString:@"-1"];
    +[UIView _animateKeyframeWithID:v2 relativeStartTime:*(void *)(a1 + 48) relativeDuration:0.0 animations:*(double *)(*(void *)(a1 + 40) + 128) + *(double *)(a1 + 64)];
  }
  if (*(void *)(a1 + 56))
  {
    id v3 = [*(id *)(a1 + 32) stringByAppendingString:@"-2"];
    +[UIView _animateKeyframeWithID:v3 relativeStartTime:*(void *)(a1 + 56) relativeDuration:*(double *)(*(void *)(a1 + 40) + 128) - *(double *)(a1 + 64) animations:*(double *)(*(void *)(a1 + 40) + 128) + *(double *)(a1 + 64)];
  }
}

@end