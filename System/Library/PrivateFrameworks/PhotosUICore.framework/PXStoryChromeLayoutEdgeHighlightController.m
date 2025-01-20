@interface PXStoryChromeLayoutEdgeHighlightController
- (double)targetAlphaForVisibleState;
- (void)animateChangeToTargetAlpha:(double)a3;
@end

@implementation PXStoryChromeLayoutEdgeHighlightController

- (void)animateChangeToTargetAlpha:(double)a3
{
  if (a3 == 0.0)
  {
    v8.receiver = self;
    v8.super_class = (Class)PXStoryChromeLayoutEdgeHighlightController;
    [(PXStoryChromeLayoutItemController *)&v8 animateChangeToTargetAlpha:a3];
  }
  else
  {
    v5 = [(PXStoryChromeLayoutItemController *)self alphaAnimator];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__PXStoryChromeLayoutEdgeHighlightController_animateChangeToTargetAlpha___block_invoke;
    v7[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v7[4] = a3;
    [v5 performChangesWithoutAnimation:v7];

    v6 = [(PXStoryChromeLayoutItemController *)self viewModel];
    [v6 performChanges:&__block_literal_global_184838];
  }
}

uint64_t __73__PXStoryChromeLayoutEdgeHighlightController_animateChangeToTargetAlpha___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setValue:*(double *)(a1 + 32)];
}

uint64_t __73__PXStoryChromeLayoutEdgeHighlightController_animateChangeToTargetAlpha___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setEdgeToHighlight:0];
}

- (double)targetAlphaForVisibleState
{
  v2 = [(PXStoryChromeLayoutItemController *)self viewModel];
  v3 = [v2 viewLayoutSpec];

  [v3 edgeHighlightAlpha];
  double v5 = v4;

  return v5;
}

@end