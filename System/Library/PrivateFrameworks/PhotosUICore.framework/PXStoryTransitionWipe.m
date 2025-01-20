@interface PXStoryTransitionWipe
- (PXStoryTransitionWipe)initWithConfiguration:(id)a3;
- (void)timeDidChange;
- (void)wasStopped;
@end

@implementation PXStoryTransitionWipe

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCurve, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)wasStopped
{
  [(PXStoryWipeTransitionConfiguration *)self->_configuration enumerateLayoutsUsingBlock:&__block_literal_global_276];
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionWipe;
  [(PXStoryConcreteTransition *)&v3 wasStopped];
}

void __35__PXStoryTransitionWipe_wasStopped__block_invoke(uint64_t a1, void *a2)
{
  double v2 = *MEMORY[0x1E4F1DB20];
  double v3 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v6 = a2;
  objc_msgSend(v6, "setContentBounds:", v2, v3, v4, v5);
  long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v9[0] = *MEMORY[0x1E4F1DAB8];
  v9[1] = v7;
  v9[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v6 setContentsRectTransform:v9];
  v8[2] = xmmword_1AB35B818;
  v8[3] = unk_1AB35B828;
  v8[4] = xmmword_1AB35B838;
  v8[5] = unk_1AB35B848;
  v8[0] = PXStoryTiltedEdgeInsetsNull;
  v8[1] = unk_1AB35B808;
  [v6 setContentEdgeInsets:v8];
  objc_msgSend(v6, "setPrimaryDividerBounds:", v2, v3, v4, v5);
  objc_msgSend(v6, "setSecondaryDividerBounds:", v2, v3, v4, v5);
}

- (void)timeDidChange
{
  [(PXStoryAnimation *)self time];
  CMTime time = v4;
  CMTimeGetSeconds(&time);
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v3;
  CMTimeGetSeconds(&time);
  PXClamp();
}

void __38__PXStoryTransitionWipe_timeDidChange__block_invoke(uint64_t a1, void *a2, double *a3, double *a4)
{
  id v6 = a2;
  if ((a3[4] != INFINITY
     || a3[5] != INFINITY
     || a3[6] != INFINITY
     || a3[7] != INFINITY
     || a3[8] != INFINITY
     || a3[9] != INFINITY
     || a3[10] != INFINITY
     || a3[11] != INFINITY
     || a3[12] != INFINITY
     || a3[13] != INFINITY
     || a3[14] != INFINITY
     || a3[15] != INFINITY)
    && (a4[4] != INFINITY
     || a4[5] != INFINITY
     || a4[6] != INFINITY
     || a4[7] != INFINITY
     || a4[8] != INFINITY
     || a4[9] != INFINITY
     || a4[10] != INFINITY
     || a4[11] != INFINITY
     || a4[12] != INFINITY
     || a4[13] != INFINITY
     || a4[14] != INFINITY
     || a4[15] != INFINITY))
  {
    PXFloatByLinearlyInterpolatingFloats();
  }
  PXRectByLinearlyInterpolatingRects();
}

void __38__PXStoryTransitionWipe_timeDidChange__block_invoke_2(uint64_t a1)
{
}

void __38__PXStoryTransitionWipe_timeDidChange__block_invoke_3()
{
}

void __38__PXStoryTransitionWipe_timeDidChange__block_invoke_4()
{
}

- (PXStoryTransitionWipe)initWithConfiguration:(id)a3
{
  id v5 = a3;
  id v6 = (objc_class *)objc_opt_class();
  long long v7 = NSStringFromClass(v6);
  v8 = [v5 identifier];
  v9 = [v7 stringByAppendingFormat:@".%@", v8];

  if (v5) {
    [v5 duration];
  }
  else {
    memset(v24, 0, sizeof(v24));
  }
  v23.receiver = self;
  v23.super_class = (Class)PXStoryTransitionWipe;
  v10 = [(PXStoryConcreteTransition *)&v23 initWithIdentifier:v9 kind:8 duration:v24 event:0];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_configuration, a3);
    LODWORD(v12) = 1045220557;
    LODWORD(v13) = 1051931443;
    LODWORD(v14) = 1042536202;
    LODWORD(v15) = 1.0;
    uint64_t v16 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v12 :v13 :v14 :v15];
    animationCurve = v11->_animationCurve;
    v11->_animationCurve = (CAMediaTimingFunction *)v16;

    v18 = +[PXStoryTransitionsSettings sharedInstance];
    [v18 dividerAnimationDurationFraction];
    v11->_dividerAnimationDurationFraction = v19;

    v20 = +[PXStoryTransitionsSettings sharedInstance];
    [v20 reverseDividerAnimationDurationFraction];
    v11->_reverseDividerAnimationDurationFraction = v21;
  }
  return v11;
}

@end