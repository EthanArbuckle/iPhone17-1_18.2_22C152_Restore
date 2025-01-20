@interface _UIDynamicAnimation
+ (id)dynamicAnimationForView:(id)a3 withInitialValue:(double)a4 velocity:(double)a5 type:(int)a6 anchorPoint:(CGPoint)a7;
+ (void)_updateAnimations:(id)a3;
+ (void)_updateAnimations:(id)a3 timer:(id)a4;
+ (void)_updateAnimationsWithTimer:(id)a3;
- (BOOL)_animateForInterval:(double)a3;
- (BOOL)_isGrouped;
- (BOOL)_isRunning;
- (BOOL)_shouldYield;
- (BOOL)_usesNSTimer;
- (_UIDynamicAnimation)init;
- (id)description;
- (int)state;
- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4;
- (void)_callAppliers:(id)a3 additionalEndAppliers:(id)a4 done:(BOOL)a5;
- (void)_cancelWithAppliers:(id)a3;
- (void)_completeWithFinished:(BOOL)a3;
- (void)_setGrouped:(BOOL)a3;
- (void)_setShouldYield:(BOOL)a3;
- (void)_setUsesNSTimer:(BOOL)a3;
- (void)_stopAnimation;
- (void)dealloc;
- (void)runWithCompletion:(id)a3;
- (void)runWithCompletion:(id)a3 forScreen:(id)a4 runLoopMode:(id)a5;
- (void)stop;
@end

@implementation _UIDynamicAnimation

+ (void)_updateAnimations:(id)a3 timer:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (qword_1EB25BC30)
  {
    [(id)qword_1EB25BC30 enumerateObjectsUsingBlock:&__block_literal_global_23];

    qword_1EB25BC30 = 0;
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v6 = (void *)qword_1EB25BC40;
  uint64_t v7 = [(id)qword_1EB25BC40 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        if (a3 && *(id *)(v11 + 16) == a3 || a4 && *(id *)(v11 + 24) == a4)
        {
          if (*(unsigned char *)(v11 + 48)) {
            sched_yield();
          }
          if (a3) {
            [a3 timestamp];
          }
          else {
            double v12 = CACurrentMediaTime();
          }
          double v13 = v12;
          double v14 = *(double *)(v11 + 40);
          v15 = (void *)[*(id *)(v11 + 32) copy];
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            double v18 = v13 - v14;
            uint64_t v19 = *(void *)v26;
            do
            {
              for (uint64_t j = 0; j != v17; ++j)
              {
                if (*(void *)v26 != v19) {
                  objc_enumerationMutation(v15);
                }
                v21 = *(void **)(*((void *)&v25 + 1) + 8 * j);
                if ([v21 _usesNSTimer]) {
                  id v22 = a3;
                }
                else {
                  id v22 = a4;
                }
                if (!v22)
                {
                  id v23 = v21;
                  if ([v21 _animateForInterval:v18])
                  {
                    v24 = (void *)qword_1EB25BC30;
                    if (!qword_1EB25BC30)
                    {
                      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
                      qword_1EB25BC30 = (uint64_t)v24;
                    }
                    [v24 addObject:v21];
                  }
                }
              }
              uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v17);
          }

          *(double *)(v11 + 40) = v13;
          return;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  [a3 invalidate];
  [a4 invalidate];
}

+ (void)_updateAnimations:(id)a3
{
}

+ (void)_updateAnimationsWithTimer:(id)a3
{
}

+ (id)dynamicAnimationForView:(id)a3 withInitialValue:(double)a4 velocity:(double)a5 type:(int)a6 anchorPoint:(CGPoint)a7
{
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  double v13 = [_UIDynamicValueAnimation alloc];
  if ((a6 - 6) >= 7) {
    double v14 = 1.0;
  }
  else {
    double v14 = 0.0001;
  }
  v15 = [(_UIDynamicValueAnimation *)v13 initWithValue:a4 velocity:a5 unitSize:v14];
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  *(double *)&v28[3] = a4;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3010000000;
  v27[3] = &unk_186D7DBA7;
  *(CGFloat *)&v27[4] = x;
  *(CGFloat *)&v27[5] = y;
  switch(a6)
  {
    case 0:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v16 = ___CreateDefaultAnimationApplier_block_invoke_8;
      goto LABEL_12;
    case 1:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v16 = ___CreateDefaultAnimationApplier_block_invoke_9;
      goto LABEL_12;
    case 2:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v16 = ___CreateDefaultAnimationApplier_block_invoke_10;
      goto LABEL_12;
    case 3:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v16 = (uint64_t (*)(uint64_t, double, double))___CreateDefaultAnimationApplier_block_invoke_11;
      goto LABEL_12;
    case 4:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v16 = ___CreateDefaultAnimationApplier_block_invoke_12;
      goto LABEL_12;
    case 5:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v16 = ___CreateDefaultAnimationApplier_block_invoke_13;
LABEL_12:
      id v22 = v16;
      id v23 = &unk_1E52DC5F8;
      id v24 = a3;
      goto LABEL_20;
    case 6:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v18 = ___CreateDefaultAnimationApplier_block_invoke_2;
      goto LABEL_19;
    case 7:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v18 = ___CreateDefaultAnimationApplier_block_invoke_3;
      goto LABEL_19;
    case 8:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v18 = ___CreateDefaultAnimationApplier_block_invoke_4;
      goto LABEL_19;
    case 9:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v18 = ___CreateDefaultAnimationApplier_block_invoke_5;
      goto LABEL_19;
    case 10:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v18 = ___CreateDefaultAnimationApplier_block_invoke_6;
      goto LABEL_19;
    case 11:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      double v18 = ___CreateDefaultAnimationApplier_block_invoke_7;
LABEL_19:
      id v22 = v18;
      id v23 = &unk_1E52DC5D0;
      id v24 = a3;
      long long v25 = v27;
      long long v26 = v28;
      goto LABEL_20;
    case 12:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      id v22 = ___CreateDefaultAnimationApplier_block_invoke;
      id v23 = &unk_1E52DC5A8;
      id v24 = a3;
      long long v25 = v27;
LABEL_20:
      uint64_t v17 = [&v20 copy];
      break;
    default:
      uint64_t v17 = 0;
      break;
  }
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  v15->_viewApplier = (id)v17;
  return v15;
}

- (_UIDynamicAnimation)init
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDynamicAnimation;
  v2 = [(_UIDynamicAnimation *)&v4 init];
  if (v2)
  {
    if (qword_1EB25BC38 != -1) {
      dispatch_once(&qword_1EB25BC38, &__block_literal_global_16_0);
    }
    *((unsigned char *)v2 + 20) = *((unsigned char *)v2 + 20) & 0xDF | (32 * _MergedGlobals_1);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDynamicAnimation;
  [(_UIDynamicAnimation *)&v3 dealloc];
}

- (void)_stopAnimation
{
  self->_completion = 0;
  *((unsigned char *)self + 20) &= 0xFCu;
  self->_state = 0;
}

- (BOOL)_animateForInterval:(double)a3
{
  return 1;
}

- (void)_callAppliers:(id)a3 additionalEndAppliers:(id)a4 done:(BOOL)a5
{
  BOOL v5 = a5;
  self->_state = 2;
  char v8 = *((unsigned char *)self + 20);
  if (v8)
  {
    if (a5)
    {
      uint64_t v12 = 3;
      self->_state = 3;
    }
    else
    {
      uint64_t v12 = 2;
    }
    v10 = (void (*)(id, uint64_t))*((void *)a3 + 2);
    id v11 = a3;
    goto LABEL_10;
  }
  self->_state = 1;
  *((unsigned char *)self + 20) = v8 | 1;
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
  if (!v5) {
    return;
  }
  self->_state = 3;
  if (a4)
  {
    v10 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    id v11 = a4;
    uint64_t v12 = 3;
LABEL_10:
    v10(v11, v12);
    return;
  }
  double v13 = (void (*)(id, uint64_t))*((void *)a3 + 2);
  v13(a3, 3);
}

- (void)runWithCompletion:(id)a3 forScreen:(id)a4 runLoopMode:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 20) & 0x10) != 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8], @"%@ is grouped. Grouped dynamic animations may not be run independent of their group", self format];
  }
  if (!a4) {
    a4 = +[UIScreen mainScreen];
  }
  if (!a5) {
    a5 = (id)*MEMORY[0x1E4F1C4B0];
  }
  if ((*((unsigned char *)self + 20) & 2) == 0)
  {

    self->_completion = (id)[a3 copy];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v9 = (void *)qword_1EB25BC40;
    uint64_t v10 = [(id)qword_1EB25BC40 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
LABEL_10:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        double v14 = *(_UIDynamicAnimationState **)(*((void *)&v17 + 1) + 8 * v13);
        if (v14->_screen == a4) {
          break;
        }
        if (v11 == ++v13)
        {
          uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v11) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
    }
    else
    {
LABEL_16:
      if (!qword_1EB25BC40) {
        qword_1EB25BC40 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:0];
      }
      double v14 = objc_alloc_init(_UIDynamicAnimationState);
      [(id)qword_1EB25BC40 addObject:v14];
    }
    if ((*((unsigned char *)self + 20) & 8) != 0) {
      v14->_shouldSchedYield = 1;
    }
    activeAnimations = v14->_activeAnimations;
    if (!activeAnimations)
    {
      activeAnimations = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v14->_activeAnimations = activeAnimations;
    }
    [(NSMutableArray *)activeAnimations addObject:self];
    if (![(_UIDynamicAnimation *)self _usesNSTimer] && !v14->_displayLink)
    {
      uint64_t v16 = (CADisplayLink *)(id)[a4 displayLinkWithTarget:objc_opt_class() selector:sel__updateAnimations_];
      v14->_displayLink = v16;
      -[CADisplayLink addToRunLoop:forMode:](v16, "addToRunLoop:forMode:", [MEMORY[0x1E4F1CAC0] mainRunLoop], a5);
      v14->_lastUpdateTime = CACurrentMediaTime();
    }
    if ([(_UIDynamicAnimation *)self _usesNSTimer])
    {
      if (!v14->_timer)
      {
        v14->_timer = (NSTimer *)(id)[MEMORY[0x1E4F1CB00] timerWithTimeInterval:objc_opt_class() target:sel__updateAnimationsWithTimer_ selector:0 userInfo:1 repeats:0.0166666667];
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAC0], "mainRunLoop"), "addTimer:forMode:", v14->_timer, a5);
        v14->_lastUpdateTime = CACurrentMediaTime();
      }
    }
    *((unsigned char *)self + 20) |= 2u;
  }
}

- (void)runWithCompletion:(id)a3
{
}

- (void)stop
{
  v2 = self;
  if ((*((unsigned char *)self + 20) & 2) != 0) {
    [(_UIDynamicAnimation *)self _completeWithFinished:0];
  }
  else {
    [(_UIDynamicAnimation *)self _stopAnimation];
  }
}

- (void)_completeWithFinished:(BOOL)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ((*((unsigned char *)self + 20) & 4) == 0)
  {
    char v4 = *((unsigned char *)self + 20) | 4;
    *((unsigned char *)self + 20) = v4;
    id completion = self->_completion;
    if (completion)
    {
      BOOL v6 = a3;
      uint64_t v7 = (void (**)(id, BOOL))completion;
      v7[2](v7, v6);

      char v4 = *((unsigned char *)self + 20);
    }
    *((unsigned char *)self + 20) = v4 & 0xFB;
    [(_UIDynamicAnimation *)self _stopAnimation];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    char v8 = (void *)qword_1EB25BC40;
    uint64_t v9 = [(id)qword_1EB25BC40 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v19 = 0;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          [*(id *)(v13 + 32) removeObject:self];
          if ([*(id *)(v13 + 32) count])
          {
            *(unsigned char *)(v13 + 48) = 0;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v20 = 0u;
            long long v21 = 0u;
            double v14 = *(void **)(v13 + 32);
            uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
            if (v15)
            {
              uint64_t v16 = v15;
              uint64_t v17 = *(void *)v21;
              while (2)
              {
                for (uint64_t j = 0; j != v16; ++j)
                {
                  if (*(void *)v21 != v17) {
                    objc_enumerationMutation(v14);
                  }
                  if ((*(unsigned char *)(*(void *)(*((void *)&v20 + 1) + 8 * j) + 20) & 8) != 0)
                  {
                    *(unsigned char *)(v13 + 48) = 1;
                    goto LABEL_21;
                  }
                }
                uint64_t v16 = [v14 countByEnumeratingWithState:&v20 objects:v28 count:16];
                if (v16) {
                  continue;
                }
                break;
              }
            }
          }
          else
          {
            [*(id *)(v13 + 16) invalidate];

            *(void *)(v13 + 16) = 0;
            [*(id *)(v13 + 24) invalidate];

            *(void *)(v13 + 24) = 0;
            *(void *)(v13 + 32) = 0;
            uint64_t v19 = v13;
          }
LABEL_21:
          ;
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v10);
    }
    else
    {
      uint64_t v19 = 0;
    }
    [(id)qword_1EB25BC40 removeObject:v19];
    if (![(id)qword_1EB25BC40 count])
    {

      qword_1EB25BC40 = 0;
    }
  }
}

- (void)_cancelWithAppliers:(id)a3
{
  if ((*((unsigned char *)self + 20) & 2) != 0)
  {
    self->_state = 4;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    [(_UIDynamicAnimation *)self stop];
  }
}

- (int)state
{
  return self->_state;
}

- (BOOL)_shouldYield
{
  return (*((unsigned __int8 *)self + 20) >> 3) & 1;
}

- (void)_setShouldYield:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xF7 | v3;
}

- (BOOL)_usesNSTimer
{
  return (*((unsigned __int8 *)self + 20) >> 5) & 1;
}

- (void)_setUsesNSTimer:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xDF | v3;
}

- (BOOL)_isGrouped
{
  return (*((unsigned __int8 *)self + 20) >> 4) & 1;
}

- (void)_setGrouped:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *((unsigned char *)self + 20) = *((unsigned char *)self + 20) & 0xEF | v3;
}

- (BOOL)_isRunning
{
  return (*((unsigned __int8 *)self + 20) >> 1) & 1;
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  if ([a3 length]) {
    [a3 appendString:@"\n"];
  }
  if (v4)
  {
    unint64_t v7 = 1;
    do
    {
      [a3 appendString:@"    "];
      ++v7;
    }
    while (v7 <= (int)v4);
  }
  [a3 appendFormat:@"<%@: %p", objc_opt_class(), self];
  uint64_t v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  for (uint64_t i = objc_opt_class();
        [MEMORY[0x1E4F28B50] bundleForClass:i] != v8;
        uint64_t i = (void *)[i superclass])
  {
    if (i == objc_opt_class()) {
      break;
    }
  }
  if (objc_opt_class() != i) {
    [a3 appendFormat:@"; baseClass = %@", NSStringFromClass((Class)i)];
  }
  uint64_t state = self->_state;
  if (state > 4) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = off_1E52DC618[state];
  }
  [a3 appendFormat:@"; uint64_t state = %@", v11];
  [(_UIDynamicAnimation *)self _appendSubclassDescription:a3 atLevel:v4];
  [a3 appendFormat:@">"];
}

- (id)description
{
  char v3 = (void *)[MEMORY[0x1E4F28E78] string];
  [(_UIDynamicAnimation *)self _appendDescriptionToString:v3 atLevel:0];
  return v3;
}

@end