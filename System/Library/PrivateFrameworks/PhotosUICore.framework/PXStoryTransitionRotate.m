@interface PXStoryTransitionRotate
- (PXStoryTransitionRotate)initWithTransitionInfo:(id *)a3 effect:(id)a4 auxiliaryEffect:(id)a5;
- (PXStoryTransitionRotate)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5;
- (double)clipAlphaForTime:(id *)a3;
- (void)_configureWithTransitionInfo:(id *)a3;
- (void)configureEffectForTime:(id *)a3;
- (void)timeDidChange;
- (void)wasStopped;
@end

@implementation PXStoryTransitionRotate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectAnimationCurve, 0);
  objc_storeStrong((id *)&self->_transformAnimationCurve, 0);
}

- (void)configureEffectForTime:(id *)a3
{
  v6 = [(PXStoryConcreteTransition *)self effect];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v11 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v11);
    v12 = objc_msgSend(v6, "px_descriptionForAssertionMessage");
    [v8 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 895, @"%@ should be an instance inheriting from %@, but it is %@", @"self.effect", v10, v12 object file lineNumber description];
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    [v8 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 895, @"%@ should be an instance inheriting from %@, but it is nil", @"self.effect", v10 object file lineNumber description];
  }

LABEL_3:
  v7 = [(PXStoryConcreteTransition *)self auxiliaryEffect];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_5;
    }
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v16 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v16);
    v17 = objc_msgSend(v7, "px_descriptionForAssertionMessage");
    [v13 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 896, @"%@ should be an instance inheriting from %@, but it is %@", @"self.auxiliaryEffect", v15, v17 object file lineNumber description];
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    v14 = (objc_class *)objc_opt_class();
    v15 = NSStringFromClass(v14);
    [v13 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 896, @"%@ should be an instance inheriting from %@, but it is nil", @"self.auxiliaryEffect", v15 object file lineNumber description];
  }

LABEL_5:
  +[PXStoryTransitionsSettings sharedInstance];
  objc_claimAutoreleasedReturnValue();
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v18;
  CMTimeGetSeconds(&time);
  CMTime time = (CMTime)*a3;
  CMTimeGetSeconds(&time);
  PXClamp();
}

- (void)wasStopped
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v3 = [(PXStoryConcreteTransition *)self clipLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v11 = *MEMORY[0x1E4F1DAB8];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v14 + 1) + 8 * v7);
        v13[0] = v11;
        v13[1] = v10;
        v13[2] = v9;
        objc_msgSend(v8, "setContentsRectTransform:", v13, v9, v10, v11);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v12.receiver = self;
  v12.super_class = (Class)PXStoryTransitionRotate;
  [(PXStoryConcreteTransition *)&v12 wasStopped];
}

- (void)timeDidChange
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXStoryConcreteTransition *)self clipLayouts];
  if (!v4) {
    goto LABEL_17;
  }
  [(PXStoryAnimation *)self time];
  *(_OWORD *)&time.a = v38;
  time.c = v39;
  double Seconds = CMTimeGetSeconds((CMTime *)&time);
  [(PXStoryConcreteTransition *)self duration];
  *(_OWORD *)&time.a = v36;
  time.c = v37;
  Float64 v6 = CMTimeGetSeconds((CMTime *)&time);
  double angle = self->_angle;
  memset(&time, 0, sizeof(time));
  double v8 = Seconds / v6;
  int64_t v9 = [(PXStoryConcreteTransition *)self event];
  switch(v9)
  {
    case 1:
      *(float *)&double v10 = v8;
      [(CAMediaTimingFunction *)self->_transformAnimationCurve _solveForInput:v10];
      double v13 = v12;
      double v14 = angle * (v12 + -1.0);
      long long v15 = 0uLL;
      *(_OWORD *)&v34.tx = 0u;
      double v16 = v13 * -0.6 + 1.6;
      break;
    case 2:
      *(float *)&double v10 = v8;
      [(CAMediaTimingFunction *)self->_transformAnimationCurve _solveForInput:v10];
      double v18 = v17;
      double v14 = angle * v17;
      long long v15 = 0uLL;
      *(_OWORD *)&v34.tx = 0u;
      double v16 = v18 * -0.33 + 1.0;
      break;
    case 0:
      long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXStoryTransition.m" lineNumber:859 description:@"Code which should be unreachable has been reached"];

      abort();
    default:
      goto LABEL_9;
  }
  *(_OWORD *)&v34.a = v15;
  *(_OWORD *)&v34.c = v15;
  CGAffineTransformMakeRotation(&v34, v14);
  memset(&v33, 0, sizeof(v33));
  CGAffineTransformMakeScale(&v33, v16, v16);
  CGAffineTransform t1 = v34;
  CGAffineTransform t2 = v33;
  CGAffineTransformConcat(&time, &t1, &t2);
LABEL_9:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        CGAffineTransform v26 = time;
        [v24 setContentsRectTransform:&v26];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v21);
  }

LABEL_17:
  v25.receiver = self;
  v25.super_class = (Class)PXStoryTransitionRotate;
  [(PXStoryConcreteTransition *)&v25 timeDidChange];
}

- (double)clipAlphaForTime:(id *)a3
{
  return 1.0;
}

- (void)_configureWithTransitionInfo:(id *)a3
{
}

- (PXStoryTransitionRotate)initWithTransitionInfo:(id *)a3 effect:(id)a4 auxiliaryEffect:(id)a5
{
  long long v9 = *(_OWORD *)(&a3->var1 + 3);
  *(void *)&long long v10 = *(void *)&a3->var2.var2;
  Float64 v6 = [(PXStoryConcreteTransition *)self initWithKind:7 duration:&v9 effect:a4 auxiliaryEffect:a5];
  long long v7 = *(_OWORD *)&a3->var2.var1;
  long long v9 = *(_OWORD *)&a3->var0;
  long long v10 = v7;
  uint64_t v11 = *(void *)&a3->var3;
  [(PXStoryTransitionRotate *)v6 _configureWithTransitionInfo:&v9];
  return v6;
}

- (PXStoryTransitionRotate)initWithTransitionInfo:(id *)a3 event:(int64_t)a4 clipLayouts:(id)a5
{
  long long v9 = *(_OWORD *)(&a3->var1 + 3);
  *(void *)&long long v10 = *(void *)&a3->var2.var2;
  Float64 v6 = [(PXStoryConcreteTransition *)self initWithKind:7 duration:&v9 event:a4 clipLayouts:a5];
  long long v7 = *(_OWORD *)&a3->var2.var1;
  long long v9 = *(_OWORD *)&a3->var0;
  long long v10 = v7;
  uint64_t v11 = *(void *)&a3->var3;
  [(PXStoryTransitionRotate *)v6 _configureWithTransitionInfo:&v9];
  return v6;
}

@end