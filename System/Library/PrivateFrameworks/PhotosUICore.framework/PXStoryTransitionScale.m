@interface PXStoryTransitionScale
- (PXStoryTransitionScale)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5;
- (double)clipAlphaForTime:(id *)a3;
- (void)_configureWithTransitionInfo:(id *)a3;
- (void)timeDidChange;
- (void)wasStopped;
@end

@implementation PXStoryTransitionScale

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedBelowAnimationCurve, 0);
  objc_storeStrong((id *)&self->_orderedAboveAnimationCurve, 0);
}

- (void)wasStopped
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = [(PXStoryConcreteTransition *)self clipLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v12 = *MEMORY[0x1E4F1DAB8];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        v14[0] = v12;
        v14[1] = v11;
        v14[2] = v10;
        objc_msgSend(v8, "setContentsRectTransform:", v14, v10, v11, v12);
        LODWORD(v9) = 1.0;
        [v8 setContentAlpha:v9];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  v13.receiver = self;
  v13.super_class = (Class)PXStoryTransitionScale;
  [(PXStoryConcreteTransition *)&v13 wasStopped];
}

- (void)timeDidChange
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(PXStoryConcreteTransition *)self clipLayouts];
  if (objc_claimAutoreleasedReturnValue())
  {
    [(PXStoryAnimation *)self time];
    CMTime time = v19;
    double Seconds = CMTimeGetSeconds(&time);
    [(PXStoryConcreteTransition *)self duration];
    CMTime time = v18;
    double v5 = CMTimeGetSeconds(&time);
    BOOL zoomingOut = self->_zoomingOut;
    int64_t v7 = [(PXStoryConcreteTransition *)self event];
    if (zoomingOut)
    {
      if (v7 != 1)
      {
        if (v7 != 2)
        {
          if (!v7)
          {
            v8 = [MEMORY[0x1E4F28B00] currentHandler];
            double v9 = v8;
            SEL v10 = a2;
            long long v11 = self;
            uint64_t v12 = 766;
            goto LABEL_18;
          }
LABEL_10:
          id v13 = 0;
          goto LABEL_15;
        }
        goto LABEL_12;
      }
    }
    else
    {
      if (v7 == 1)
      {
LABEL_12:
        v14 = &OBJC_IVAR___PXStoryTransitionScale__orderedBelowAnimationCurve;
LABEL_14:
        id v13 = *(id *)((char *)&self->super.super.super.super.isa + *v14);
LABEL_15:
        double v15 = Seconds / v5;
        *(float *)&double v15 = Seconds / v5;
        [v13 _solveForInput:v15];
        PXFloatByLinearlyInterpolatingFloats();
      }
      if (v7 != 2)
      {
        if (!v7)
        {
          v8 = [MEMORY[0x1E4F28B00] currentHandler];
          double v9 = v8;
          SEL v10 = a2;
          long long v11 = self;
          uint64_t v12 = 782;
LABEL_18:
          [v8 handleFailureInMethod:v10 object:v11 file:@"PXStoryTransition.m" lineNumber:v12 description:@"Code which should be unreachable has been reached"];

          abort();
        }
        goto LABEL_10;
      }
    }
    v14 = &OBJC_IVAR___PXStoryTransitionScale__orderedAboveAnimationCurve;
    goto LABEL_14;
  }
  v16.receiver = self;
  v16.super_class = (Class)PXStoryTransitionScale;
  [(PXStoryConcreteTransition *)&v16 timeDidChange];
}

- (double)clipAlphaForTime:(id *)a3
{
  BOOL zoomingOut = self->_zoomingOut;
  int64_t v6 = [(PXStoryConcreteTransition *)self event];
  if (zoomingOut)
  {
    if (v6 != 1)
    {
      if (v6 != 2)
      {
        if (v6)
        {
          id v7 = 0;
          goto LABEL_15;
        }
        long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v12 = v11;
        SEL v13 = a2;
        v14 = self;
        uint64_t v15 = 724;
LABEL_18:
        [v11 handleFailureInMethod:v13 object:v14 file:@"PXStoryTransition.m" lineNumber:v15 description:@"Code which should be unreachable has been reached"];

        abort();
      }
      v8 = &OBJC_IVAR___PXStoryTransitionScale__orderedBelowAnimationCurve;
      goto LABEL_14;
    }
  }
  else
  {
    if (v6 == 1)
    {
      v8 = &OBJC_IVAR___PXStoryTransitionScale__orderedBelowAnimationCurve;
LABEL_14:
      id v7 = *(id *)((char *)&self->super.super.super.super.isa + *v8);
      goto LABEL_15;
    }
    if (v6 != 2)
    {
      if (!v6)
      {
        long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v12 = v11;
        SEL v13 = a2;
        v14 = self;
        uint64_t v15 = 737;
        goto LABEL_18;
      }
      id v7 = 0;
LABEL_15:
      [(PXStoryAnimation *)self time];
      CMTime time = v18;
      double Seconds = CMTimeGetSeconds(&time);
      [(PXStoryConcreteTransition *)self duration];
      CMTime time = v17;
      double v10 = Seconds / CMTimeGetSeconds(&time);
      *(float *)&double v10 = v10;
      [v7 _solveForInput:v10];
      PXFloatByLinearlyInterpolatingFloats();
    }
  }
  v8 = &OBJC_IVAR___PXStoryTransitionScale__orderedAboveAnimationCurve;
  goto LABEL_14;
}

- (void)_configureWithTransitionInfo:(id *)a3
{
  if (!BYTE5(a3->var2.var3))
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 704, @"Invalid parameter not satisfying: %@", @"transitionInfo.scaleDirection != PXStoryScaleDirectionUndefined" object file lineNumber description];
  }
  double v7 = *(double *)&a3->var3;
  self->_scaleRelativeFactor = v7;
  self->_BOOL zoomingOut = BYTE5(a3->var2.var3) == 2;
  LODWORD(v3) = 1059648963;
  LODWORD(v4) = 1.0;
  LODWORD(v7) = 1051260355;
  v8 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v7 :0.0 :v3 :v4];
  orderedAboveAnimationCurve = self->_orderedAboveAnimationCurve;
  self->_orderedAboveAnimationCurve = v8;

  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1051260355;
  uint64_t v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v11 :0.0 :0.0 :v10];
  orderedBelowAnimationCurve = self->_orderedBelowAnimationCurve;
  self->_orderedBelowAnimationCurve = v12;
}

- (PXStoryTransitionScale)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  long long v9 = *(_OWORD *)(&a3->var1 + 3);
  *(void *)&long long v10 = *(void *)&a3->var2.var2;
  int64_t v6 = [(PXStoryConcreteTransition *)self initWithKind:4 duration:&v9 event:a4 clipLayouts:a5];
  long long v7 = *(_OWORD *)&a3->var2.var1;
  long long v9 = *(_OWORD *)&a3->var0;
  long long v10 = v7;
  uint64_t v11 = *(void *)&a3->var3;
  [(PXStoryTransitionScale *)v6 _configureWithTransitionInfo:&v9];
  return v6;
}

@end