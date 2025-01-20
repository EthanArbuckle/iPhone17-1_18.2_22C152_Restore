@interface PXNumberAnimator
- (BOOL)_needsUpdate;
- (BOOL)isAnimating;
- (BOOL)isBeingMutated;
- (BOOL)prepareForAnimation;
- (NSString)description;
- (NSString)label;
- (PXNumberAnimator)init;
- (PXNumberAnimator)initWithValue:(double)a3;
- (PXNumberAnimator)initWithValue:(double)a3 epsilon:(double)a4;
- (PXNumberAnimatorDisplayLinkTarget)displayLinkTarget;
- (double)approximateVelocity;
- (double)currentTime;
- (double)epsilon;
- (double)presentationValue;
- (double)value;
- (id)_createDisplayLinkDeferredStart:(BOOL)a3;
- (unsigned)highFrameRateReason;
- (void)_configureDisplayLink:(id)a3;
- (void)_invalidatePresentationValue;
- (void)_setAnimating:(BOOL)a3;
- (void)_setAnimating:(BOOL)a3 deferredStart:(BOOL)a4;
- (void)_setNeedsUpdate;
- (void)_setPresentationValue:(double)a3;
- (void)_updateIfNeeded;
- (void)_updatePresentationValueIfNeeded;
- (void)advanceAnimationsToFractionComplete:(double)a3;
- (void)didPerformChanges;
- (void)handleDisplayLink:(id)a3;
- (void)performChanges:(id)a3;
- (void)performChangesUsingDefaultOpacityAnimation:(id)a3;
- (void)performChangesUsingDefaultSpringAnimationWithInitialVelocity:(double)a3 changes:(id)a4;
- (void)performChangesUsingSpringAnimationWithStiffness:(double)a3 dampingRatio:(double)a4 initialVelocity:(double)a5 changes:(id)a6;
- (void)performChangesWithDuration:(double)a3 curve:(int64_t)a4 changes:(id)a5;
- (void)performChangesWithoutAnimation:(id)a3;
- (void)setDisplayLinkTarget:(id)a3;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setLabel:(id)a3;
- (void)setPrepareForAnimation:(BOOL)a3;
- (void)setValue:(double)a3;
- (void)setValue:(double)a3 animateImmediately:(BOOL)a4;
- (void)setValue:(double)a3 skipFirstNumberWhenAnimationStart:(BOOL)a4;
@end

@implementation PXNumberAnimator

- (PXNumberAnimator)initWithValue:(double)a3 epsilon:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXNumberAnimator;
  result = [(PXObservable *)&v7 init];
  if (result)
  {
    result->_presentationValue = a3;
    result->_value = a3;
    result->_epsilon = a4;
  }
  return result;
}

__n128 __51__PXNumberAnimator_performChangesWithoutAnimation___block_invoke(uint64_t a1)
{
  v2 = (long long *)(*(void *)(a1 + 32) + 104);
  long long v5 = *v2;
  long long v6 = *(_OWORD *)(*(void *)(a1 + 32) + 120);
  __n128 v7 = *(__n128 *)(*(void *)(a1 + 32) + 136);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 152);
  *(void *)v2 = 1;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = *(void *)(a1 + 32) + 104;
  *(_OWORD *)uint64_t v3 = v5;
  *(_OWORD *)(v3 + 16) = v6;
  __n128 result = v7;
  *(__n128 *)(v3 + 32) = v7;
  *(void *)(v3 + 48) = v8;
  return result;
}

uint64_t __35__PXNumberAnimator_performChanges___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PXNumberAnimator)init
{
  return [(PXNumberAnimator *)self initWithValue:0.0];
}

- (PXNumberAnimator)initWithValue:(double)a3
{
  return [(PXNumberAnimator *)self initWithValue:a3 epsilon:0.001];
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  self->_highFrameRateReason = a3;
}

- (BOOL)isAnimating
{
  return self->_displayLink != 0;
}

- (void)setValue:(double)a3
{
}

- (void)performChangesWithoutAnimation:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__PXNumberAnimator_performChangesWithoutAnimation___block_invoke;
  v6[3] = &unk_26545B618;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXNumberAnimator *)self performChanges:v6];
}

- (void)performChanges:(id)a3
{
  id v4 = a3;
  BOOL isBeingMutated = self->_isBeingMutated;
  self->_BOOL isBeingMutated = 1;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __35__PXNumberAnimator_performChanges___block_invoke;
  v8[3] = &unk_26545B230;
  id v9 = v4;
  v7.receiver = self;
  v7.super_class = (Class)PXNumberAnimator;
  id v6 = v4;
  [(PXObservable *)&v7 performChanges:v8];
  self->_BOOL isBeingMutated = isBeingMutated;
}

- (void)setValue:(double)a3 animateImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  double value = self->_value;
  self->_double value = a3;
  if (![(PXNumberAnimator *)self prepareForAnimation] || !v4) {
    [(PXNumberAnimator *)self _invalidatePresentationValue];
  }
  int64_t type = self->_currentAnimationSpec.type;
  if (type == 1)
  {
    [(NSMutableArray *)self->_animations removeAllObjects];
    goto LABEL_19;
  }
  double v10 = value - a3;
  switch(type)
  {
    case 2:
      if (self->_currentAnimationSpec.duration <= 0.0) {
        goto LABEL_19;
      }
      v12 = PXValueDefaultAnimation;
      break;
    case 3:
      v12 = PXValueSpringAnimation;
      break;
    case 0:
      v11 = [MEMORY[0x263F08690] currentHandler];
      [v11 handleFailureInMethod:a2 object:self file:@"PXNumberAnimator.m" lineNumber:290 description:@"unexpected animation type"];

      abort();
    default:
      goto LABEL_19;
  }
  id v13 = [v12 alloc];
  long long v14 = *(_OWORD *)&self->_currentAnimationSpec.curve;
  v19[0] = *(_OWORD *)&self->_currentAnimationSpec.type;
  v19[1] = v14;
  v19[2] = *(_OWORD *)&self->_currentAnimationSpec.stiffness;
  double initialVelocity = self->_currentAnimationSpec.initialVelocity;
  v15 = (void *)[v13 initWithFromValue:v19 currentMediaTime:v10 spec:0.0];
  if (v15)
  {
    if (v4) {
      [(PXNumberAnimator *)self _setAnimating:1 deferredStart:0];
    }
    animations = self->_animations;
    if (!animations)
    {
      v17 = [MEMORY[0x263EFF980] array];
      v18 = self->_animations;
      self->_animations = v17;

      animations = self->_animations;
    }
    [(NSMutableArray *)animations addObject:v15];
  }
LABEL_19:
  [(PXObservable *)self signalChange:1];
}

- (BOOL)prepareForAnimation
{
  return self->_prepareForAnimation;
}

- (void)_invalidatePresentationValue
{
  self->_needsUpdateFlags.presentationValue = 1;
  [(PXNumberAnimator *)self _needsUpdate];
}

- (void)didPerformChanges
{
  v3.receiver = self;
  v3.super_class = (Class)PXNumberAnimator;
  [(PXObservable *)&v3 didPerformChanges];
  [(PXNumberAnimator *)self _updateIfNeeded];
}

- (void)_updateIfNeeded
{
  if ([(PXNumberAnimator *)self _needsUpdate])
  {
    [(PXNumberAnimator *)self _updatePresentationValueIfNeeded];
    if ([(PXNumberAnimator *)self _needsUpdate])
    {
      id v4 = [MEMORY[0x263F08690] currentHandler];
      [v4 handleFailureInMethod:a2 object:self file:@"PXNumberAnimator.m" lineNumber:341 description:@"update still needed after update pass"];
    }
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.presentationValue;
}

- (void)_updatePresentationValueIfNeeded
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (self->_needsUpdateFlags.presentationValue)
  {
    self->_needsUpdateFlags.presentationValue = 0;
    BOOL skipFirstNumberWhenAnimationStart = self->_skipFirstNumberWhenAnimationStart;
    double v4 = 0.0;
    if (self->_skipFirstNumberWhenAnimationStart)
    {
      self->_BOOL skipFirstNumberWhenAnimationStart = 0;
      if ([(NSMutableArray *)self->_animations count])
      {
        if (![(PXNumberAnimator *)self isAnimating])
        {
          [(PXNumberAnimator *)self _setAnimating:1 deferredStart:0];
          double v4 = (float)(1.0
                     / (float)[(PXDisplayLink *)self->_displayLink preferredFramesPerSecond]);
        }
      }
    }
    [(PXDisplayLink *)self->_displayLink targetTimestamp];
    double v6 = v5;
    if (skipFirstNumberWhenAnimationStart || v5 != 0.0)
    {
      [(PXDisplayLink *)self->_displayLink currentMediaTime];
      if (v7 > v6) {
        double v6 = v7;
      }
    }
    [(PXNumberAnimator *)self value];
    double v9 = v8;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v10 = (void *)[(NSMutableArray *)self->_animations copy];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      double v14 = v6 - v4;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          [v16 startTime];
          if (v6 > 0.0 && v17 == 0.0)
          {
            BOOL v18 = [(PXNumberAnimator *)self prepareForAnimation];
            double v19 = v14;
            if (v18)
            {
              [(PXDisplayLink *)self->_displayLink timestamp];
              if (v19 == 0.0) {
                double v19 = v6;
              }
            }
            [v16 setStartTime:v19];
          }
          [v16 setCurrentMediaTime:v6];
          if ([v16 completed])
          {
            [(NSMutableArray *)self->_animations removeObject:v16];
          }
          else
          {
            [v16 currentValue];
            double v9 = v9 + v20;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    [(PXNumberAnimator *)self _setPresentationValue:v9];
    self->_currentTime = v6;
    [(PXNumberAnimator *)self _setAnimating:[(NSMutableArray *)self->_animations count] != 0];
    v21 = [(PXNumberAnimator *)self label];
    [(PXNumberAnimator *)self value];
    [(PXNumberAnimator *)self presentationValue];
    [(NSMutableArray *)self->_animations count];
    v22 = self;
    id v23 = v21;
    if (kdebug_is_enabled())
    {
      v29 = v22;
      if (v23)
      {
        id v24 = v23;
        [v24 cStringUsingEncoding:4];
        [v24 length];
        __memcpy_chk();
      }
      kdebug_trace();
    }
  }
}

- (double)presentationValue
{
  return self->_presentationValue;
}

- (double)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (void)_setPresentationValue:(double)a3
{
  if (self->_presentationValue != a3)
  {
    self->_presentationValue = a3;
    [(PXObservable *)self signalChange:2];
  }
}

- (void)_setAnimating:(BOOL)a3 deferredStart:(BOOL)a4
{
  displayLink = self->_displayLink;
  if ((displayLink != 0) == a3) {
    return;
  }
  if (displayLink) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = !a3;
  }
  if (!v6)
  {
    BOOL v7 = a4;
    double v8 = self->_reusableDisplayLink;
    reusableDisplayLink = self->_reusableDisplayLink;
    self->_reusableDisplayLink = 0;

    if (!v8)
    {
      double v8 = [(PXNumberAnimator *)self _createDisplayLinkDeferredStart:v7];
    }
    [(PXNumberAnimator *)self _configureDisplayLink:v8];
    goto LABEL_17;
  }
  if (displayLink && !a3)
  {
    if ([(PXNumberAnimator *)self prepareForAnimation]) {
      objc_storeStrong((id *)&self->_reusableDisplayLink, self->_displayLink);
    }
    else {
      [(PXDisplayLink *)self->_displayLink invalidate];
    }
    double v8 = 0;
LABEL_17:
    double v10 = self->_displayLink;
    self->_displayLink = v8;
  }

  -[PXObservable signalChange:](self, "signalChange:", 4, a4);
}

- (void)_setAnimating:(BOOL)a3
{
}

- (void)setLabel:(id)a3
{
}

- (double)approximateVelocity
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = self->_animations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    double v6 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "approximateVelocity", (void)v10);
        double v6 = v6 + v8;
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayLinkTarget);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_reusableDisplayLink, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);

  objc_storeStrong((id *)&self->_animations, 0);
}

- (void)setDisplayLinkTarget:(id)a3
{
}

- (PXNumberAnimatorDisplayLinkTarget)displayLinkTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayLinkTarget);

  return (PXNumberAnimatorDisplayLinkTarget *)WeakRetained;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (unsigned)highFrameRateReason
{
  return self->_highFrameRateReason;
}

- (BOOL)isBeingMutated
{
  return self->_isBeingMutated;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (void)_setNeedsUpdate
{
}

- (void)setValue:(double)a3 skipFirstNumberWhenAnimationStart:(BOOL)a4
{
  self->_BOOL skipFirstNumberWhenAnimationStart = a4;
  [(PXNumberAnimator *)self setValue:a3];
}

- (void)handleDisplayLink:(id)a3
{
  if (self->_displayLink == a3)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __38__PXNumberAnimator_handleDisplayLink___block_invoke;
    v4[3] = &unk_26545B208;
    v4[4] = self;
    v3.receiver = self;
    v3.super_class = (Class)PXNumberAnimator;
    [(PXObservable *)&v3 performChanges:v4];
  }
}

uint64_t __38__PXNumberAnimator_handleDisplayLink___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidatePresentationValue];
}

- (void)setPrepareForAnimation:(BOOL)a3
{
  if (self->_prepareForAnimation != a3)
  {
    self->_prepareForAnimation = a3;
    reusableDisplayLink = self->_reusableDisplayLink;
    if (a3)
    {
      if (reusableDisplayLink || self->_displayLink) {
        return;
      }
      uint64_t v5 = [(PXNumberAnimator *)self _createDisplayLinkDeferredStart:0];
    }
    else
    {
      if (!reusableDisplayLink) {
        return;
      }
      [(PXDisplayLink *)reusableDisplayLink invalidate];
      uint64_t v5 = 0;
    }
    double v6 = self->_reusableDisplayLink;
    self->_reusableDisplayLink = v5;
    MEMORY[0x270F9A758](v5, v6);
  }
}

- (void)_configureDisplayLink:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(PXNumberAnimator *)self highFrameRateReason];
  [v6 setHighFrameRateReason:v4];
  if (v4) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  [v6 setFrameRateRangeType:v5];
}

- (id)_createDisplayLinkDeferredStart:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PXNumberAnimator *)self displayLinkTarget];
  id v6 = (void *)v5;
  if (v5) {
    BOOL v7 = (PXNumberAnimator *)v5;
  }
  else {
    BOOL v7 = self;
  }
  double v8 = v7;

  double v9 = [[PXDisplayLink alloc] initWithWeakTarget:v8 selector:sel_handleDisplayLink_ deferredStart:v3];

  return v9;
}

- (void)advanceAnimationsToFractionComplete:(double)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_animations count])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v5 = self->_animations;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      double v8 = fmax(fmin(a3, 1.0), 0.0);
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v5);
          }
          long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          objc_msgSend(v11, "startTime", (void)v21);
          if (v12 != 0.0)
          {
            [v11 duration];
            if (v13 != 0.0)
            {
              [v11 currentMediaTime];
              double v15 = v14;
              [v11 duration];
              double v17 = v15 - v16 * v8;
              [v11 startTime];
              double v19 = v17 - v18;
              if (v19 < 0.0)
              {
                [v11 startTime];
                [v11 setStartTime:v19 + v20];
              }
            }
          }
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v7);
    }
  }
}

- (void)performChangesUsingDefaultOpacityAnimation:(id)a3
{
}

- (void)performChangesUsingSpringAnimationWithStiffness:(double)a3 dampingRatio:(double)a4 initialVelocity:(double)a5 changes:(id)a6
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a6;
  double v11 = fabs(a5);
  if (v11 >= INFINITY && v11 <= INFINITY)
  {
    double v12 = PXAssertGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v20 = a5;
      _os_log_error_impl(&dword_259CDA000, v12, OS_LOG_TYPE_ERROR, "Invalid initial velocity:%.3f correcting...", buf, 0xCu);
    }

    a5 = 0.0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __105__PXNumberAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke;
  v14[3] = &unk_26545B1E0;
  double v16 = a3;
  double v17 = a4;
  double v18 = a5;
  v14[4] = self;
  id v15 = v10;
  id v13 = v10;
  [(PXNumberAnimator *)self performChanges:v14];
}

__n128 __105__PXNumberAnimator_performChangesUsingSpringAnimationWithStiffness_dampingRatio_initialVelocity_changes___block_invoke(void *a1, void *a2)
{
  BOOL v3 = (long long *)(a1[4] + 104);
  long long v9 = *v3;
  long long v10 = *(_OWORD *)(a1[4] + 120);
  __n128 v11 = *(__n128 *)(a1[4] + 136);
  uint64_t v12 = *(void *)(a1[4] + 152);
  *(void *)BOOL v3 = 3;
  *(void *)(a1[4] + 136) = a1[6];
  *(void *)(a1[4] + 144) = a1[7];
  *(void *)(a1[4] + 152) = a1[8];
  uint64_t v4 = (void *)a1[4];
  id v5 = a2;
  [v4 epsilon];
  *(void *)(a1[4] + 128) = v6;
  (*(void (**)(void))(a1[5] + 16))();

  uint64_t v7 = a1[4] + 104;
  *(_OWORD *)uint64_t v7 = v9;
  *(_OWORD *)(v7 + 16) = v10;
  __n128 result = v11;
  *(__n128 *)(v7 + 32) = v11;
  *(void *)(v7 + 48) = v12;
  return result;
}

- (void)performChangesUsingDefaultSpringAnimationWithInitialVelocity:(double)a3 changes:(id)a4
{
}

- (void)performChangesWithDuration:(double)a3 curve:(int64_t)a4 changes:(id)a5
{
  id v8 = a5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __61__PXNumberAnimator_performChangesWithDuration_curve_changes___block_invoke;
  v10[3] = &unk_26545B668;
  double v12 = a3;
  int64_t v13 = a4;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(PXNumberAnimator *)self performChanges:v10];
}

__n128 __61__PXNumberAnimator_performChangesWithDuration_curve_changes___block_invoke(void *a1)
{
  v2 = (long long *)(a1[4] + 104);
  long long v5 = *v2;
  long long v6 = *(_OWORD *)(a1[4] + 120);
  __n128 v7 = *(__n128 *)(a1[4] + 136);
  uint64_t v8 = *(void *)(a1[4] + 152);
  *(void *)v2 = 2;
  *(void *)(a1[4] + 112) = a1[6];
  *(void *)(a1[4] + 120) = a1[7];
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = a1[4] + 104;
  *(_OWORD *)uint64_t v3 = v5;
  *(_OWORD *)(v3 + 16) = v6;
  __n128 result = v7;
  *(__n128 *)(v3 + 32) = v7;
  *(void *)(v3 + 48) = v8;
  return result;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  uint64_t v6 = [(PXNumberAnimator *)self label];
  __n128 v7 = (void *)v6;
  if (v6) {
    uint64_t v8 = (__CFString *)v6;
  }
  else {
    uint64_t v8 = &stru_270799240;
  }
  [(PXNumberAnimator *)self value];
  uint64_t v10 = v9;
  [(PXNumberAnimator *)self presentationValue];
  uint64_t v12 = v11;
  BOOL v13 = [(PXNumberAnimator *)self isAnimating];
  double v14 = @"NO";
  if (v13) {
    double v14 = @"YES";
  }
  id v15 = v14;
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; %@ value:%.3f presentationValue:%.3f isAnimating:%@ animations:%lu>",
    v5,
    self,
    v8,
    v10,
    v12,
    v15,
  double v16 = [(NSMutableArray *)self->_animations count]);

  return (NSString *)v16;
}

@end