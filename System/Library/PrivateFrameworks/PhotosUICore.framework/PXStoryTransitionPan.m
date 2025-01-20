@interface PXStoryTransitionPan
+ (id)panWithConfiguration:(id)a3;
+ (id)panWithEffect:(id)a3 transitionInfo:(id *)a4;
- (void)_configureClipLayoutsContentBoundsForTime:(id *)a3;
- (void)configureEffectForTime:(id *)a3;
- (void)timeDidChange;
- (void)wasStopped;
@end

@implementation PXStoryTransitionPan

+ (id)panWithEffect:(id)a3 transitionInfo:(id *)a4
{
  id v6 = a3;
  id v7 = objc_alloc((Class)a1);
  long long v19 = *(_OWORD *)(&a4->var1 + 3);
  uint64_t v20 = *(void *)&a4->var2.var2;
  v8 = (void *)[v7 initWithKind:5 duration:&v19 effect:v6];

  LODWORD(v9) = 1042536202;
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1.0;
  uint64_t v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v9 :0.0 :v10 :v11];
  v13 = (void *)v8[40];
  v8[40] = v12;

  LODWORD(v14) = 1059648963;
  LODWORD(v15) = 1.0;
  uint64_t v16 = [MEMORY[0x1E4F39C10] functionWithControlPoints:0.0 :0.0 :v14 :v15];
  v17 = (void *)v8[41];
  v8[41] = v16;

  return v8;
}

+ (id)panWithConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  v8 = [v5 identifier];
  double v9 = [v7 stringByAppendingFormat:@".%@", v8];

  v21.receiver = a1;
  v21.super_class = (Class)&OBJC_METACLASS___PXStoryTransitionPan;
  id v10 = objc_msgSendSuper2(&v21, sel_alloc);
  if (v5) {
    [v5 duration];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  uint64_t v11 = [v10 initWithIdentifier:v9 kind:5 duration:v20 event:0];
  uint64_t v12 = (void *)v11;
  if (v11)
  {
    objc_storeStrong((id *)(v11 + 312), a3);
    LODWORD(v13) = 1045220557;
    LODWORD(v14) = 1051931443;
    LODWORD(v15) = 1042536202;
    LODWORD(v16) = 1.0;
    uint64_t v17 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :v14 :v15 :v16];
    v18 = (void *)v12[42];
    v12[42] = v17;
  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movementCurve, 0);
  objc_storeStrong((id *)&self->_effectCurveAfterMidpoint, 0);
  objc_storeStrong((id *)&self->_effectCurveBeforeMidpoint, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)configureEffectForTime:(id *)a3
{
  [(PXStoryConcreteTransition *)self effect];
  objc_claimAutoreleasedReturnValue();
  CMTime time = *(CMTime *)a3;
  CMTimeGetSeconds(&time);
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v5;
  CMTimeGetSeconds(&time);
  PXClamp();
}

- (void)wasStopped
{
  [(PXStoryPanTransitionConfiguration *)self->_configuration enumerateLayoutsUsingBlock:&__block_literal_global_306];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionPan;
  [(PXStoryConcreteTransition *)&v3 wasStopped];
}

void __34__PXStoryTransitionPan_wasStopped__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_msgSend(v2, "setContentBounds:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
  [v2 setUseContentBoundsForContentEdgeInsets:1];
  objc_super v3 = [v2 clip];
  if (v3)
  {
    v4 = v3;
    [v3 info];

    if (v6[1] == 3)
    {
      LODWORD(v5) = 1.0;
      [v2 setContentAlpha:v5];
    }
  }
  else
  {
    bzero(v6, 0x300uLL);
  }
}

- (void)_configureClipLayoutsContentBoundsForTime:(id *)a3
{
  CMTime time = *(CMTime *)a3;
  CMTimeGetSeconds(&time);
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v4;
  CMTimeGetSeconds(&time);
  PXClamp();
}

void __66__PXStoryTransitionPan__configureClipLayoutsContentBoundsForTime___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PXRectByLinearlyInterpolatingRects();
}

- (void)timeDidChange
{
  long long v6 = 0uLL;
  uint64_t v7 = 0;
  [(PXStoryAnimation *)self time];
  if (self->_configuration)
  {
    long long v4 = v6;
    uint64_t v5 = v7;
    [(PXStoryTransitionPan *)self _configureClipLayoutsContentBoundsForTime:&v4];
  }
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionPan;
  [(PXStoryConcreteTransition *)&v3 timeDidChange];
}

@end