@interface UIEditMenuCollectionView
@end

@implementation UIEditMenuCollectionView

void __50___UIEditMenuCollectionView_contentOffsetForPage___block_invoke(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  if (*(void *)(a1 + 40) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    id v5 = a2;
    [v5 width];
    double v7 = v6;
    [v5 overlapWidth];
    double v9 = v8;

    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = v7
                                                                - v9
                                                                + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 32);
  }
}

void __56___UIEditMenuCollectionView_scrollToTargetPageAnimated___block_invoke()
{
  double v7 = 0.0;
  double v8 = 0.0;
  double v6 = 0.0;
  +[UISpringTimingParameters _convertDampingRatio:&v8 response:&v7 toMass:&v6 stiffness:1.0 damping:0.3];
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1_20;
  _MergedGlobals_1_20 = v0;

  [(id)_MergedGlobals_1_20 setMass:v8];
  [(id)_MergedGlobals_1_20 setStiffness:v7];
  [(id)_MergedGlobals_1_20 setDamping:v6];
  [(id)_MergedGlobals_1_20 durationForEpsilon:1.17549435e-38];
  objc_msgSend((id)_MergedGlobals_1_20, "setDuration:");
  LODWORD(v2) = 1045220557;
  LODWORD(v3) = 1.0;
  LODWORD(v4) = 1.0;
  id v5 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :v2 :v3 :v4];
  [(id)_MergedGlobals_1_20 setTimingFunction:v5];
}

@end