@interface PXGViewControllerItemPlacementInterpolator
- (PXGViewControllerItemPlacementInterpolator)init;
- (PXGViewControllerItemPlacementInterpolator)initWithSourcePlacement:(id)a3 targetPlacement:(id)a4 layering:(int64_t)a5 containerView:(id)a6 duration:(double)a7;
- (double)time;
- (id)adjustedPlacement:(id)a3;
- (void)setTime:(double)a3;
@end

@implementation PXGViewControllerItemPlacementInterpolator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fadeTimingFunction, 0);
  objc_storeStrong((id *)&self->_secondaryTimingFunction, 0);
  objc_storeStrong((id *)&self->_mainTimingFunction, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_targetPlacement, 0);
  objc_storeStrong((id *)&self->_sourcePlacement, 0);
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (double)time
{
  return self->_time;
}

- (id)adjustedPlacement:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_hasValidGeometry)
  {
    [(PXGViewControllerItemPlacementInterpolator *)self time];
    double v7 = v6 / self->_duration;
    if (v7 < 0.0) {
      double v7 = 0.0;
    }
    *(float *)&double v7 = fmin(v7, 1.0);
    [(CAMediaTimingFunction *)self->_mainTimingFunction _solveForInput:v7];
    PXRectDerivativeIntegrate();
  }
  id v8 = v4;

  return v8;
}

void __64__PXGViewControllerItemPlacementInterpolator_adjustedPlacement___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(v3, "setRect:velocity:inCoordinateSpace:", *(void *)(*(void *)(a1 + 32) + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)off_1E5DAB008, *((double *)off_1E5DAB008 + 1), *((double *)off_1E5DAB008 + 2), *((double *)off_1E5DAB008 + 3));
  [v3 setAlpha:*(double *)(a1 + 80)];
  long long v4 = *(_OWORD *)(a1 + 104);
  long long v5 = *(_OWORD *)(a1 + 88);
  long long v6 = v4;
  long long v7 = *(_OWORD *)(a1 + 120);
  PXStoryRectIsNull();
}

uint64_t __64__PXGViewControllerItemPlacementInterpolator_adjustedPlacement___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setChromeAlpha:0.0];
}

- (PXGViewControllerItemPlacementInterpolator)initWithSourcePlacement:(id)a3 targetPlacement:(id)a4 layering:(int64_t)a5 containerView:(id)a6 duration:(double)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  v40.receiver = self;
  v40.super_class = (Class)PXGViewControllerItemPlacementInterpolator;
  v16 = [(PXGViewControllerItemPlacementInterpolator *)&v40 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sourcePlacement, a3);
    objc_storeStrong((id *)&v17->_targetPlacement, a4);
    v17->_layering = a5;
    objc_storeStrong((id *)&v17->_containerView, a6);
    v17->_duration = a7;
    LODWORD(v18) = 1043207291;
    LODWORD(v19) = 1045220557;
    LODWORD(v20) = 1.0;
    LODWORD(v21) = 1043207291;
    uint64_t v22 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v18 :v21 :v19 :v20];
    mainTimingFunction = v17->_mainTimingFunction;
    v17->_mainTimingFunction = (CAMediaTimingFunction *)v22;

    LODWORD(v24) = 1051260355;
    LODWORD(v25) = 1059816735;
    LODWORD(v26) = 1.0;
    uint64_t v27 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v24 :0.0 :v25 :v26];
    secondaryTimingFunction = v17->_secondaryTimingFunction;
    v17->_secondaryTimingFunction = (CAMediaTimingFunction *)v27;

    sourcePlacement = v17->_sourcePlacement;
    if (sourcePlacement)
    {
      [(PXGItemPlacement *)sourcePlacement rectInCoordinateSpace:v17->_containerView velocity:&v17->_sourceRectVelocity];
      v17->_sourceRect.origin.x = v30;
      v17->_sourceRect.origin.y = v31;
      v17->_sourceRect.size.width = v32;
      v17->_sourceRect.size.height = v33;
    }
    else
    {
      CGSize v34 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      v17->_sourceRect.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      v17->_sourceRect.size = v34;
    }
    [(PXGItemPlacement *)v17->_targetPlacement rectInCoordinateSpace:v17->_containerView velocity:0];
    v17->_targetRect.origin.x = v35;
    v17->_targetRect.origin.y = v36;
    v17->_targetRect.size.width = v37;
    v17->_targetRect.size.height = v38;
    PXRectIsValid();
  }

  return 0;
}

- (PXGViewControllerItemPlacementInterpolator)init
{
  long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGViewControllerItemPlacementInterpolator.m", 45, @"%s is not available as initializer", "-[PXGViewControllerItemPlacementInterpolator init]");

  abort();
}

@end