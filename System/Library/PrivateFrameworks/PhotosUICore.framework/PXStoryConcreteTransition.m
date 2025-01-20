@interface PXStoryConcreteTransition
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- (BOOL)canBePaused;
- (BOOL)finished;
- (NSArray)clipLayouts;
- (NSString)description;
- (PXGEffect)auxiliaryEffect;
- (PXGEffect)effect;
- (PXStoryConcreteTransition)initWithIdentifier:(id)a3 kind:(char)a4 duration:(id *)a5 event:(int64_t)a6;
- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 effect:(id)a5;
- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 effect:(id)a5 auxiliaryEffect:(id)a6;
- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 event:(int64_t)a5 clipLayouts:(id)a6;
- (char)kind;
- (double)clipAlphaForTime:(id *)a3;
- (double)initialClipAlpha;
- (double)progress;
- (id)completionHandler;
- (id)effectAlphaHandler;
- (int64_t)event;
- (void)_end:(BOOL)a3;
- (void)_updateClipAlphaForTime:(id *)a3;
- (void)configureEffectForTime:(id *)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setEffectAlphaHandler:(id)a3;
- (void)setFinished:(BOOL)a3;
- (void)setPrimaryEffectAlpha:(double)a3 auxiliaryEffectAlpha:(double)a4;
- (void)timeDidChange;
- (void)wasStopped;
@end

@implementation PXStoryConcreteTransition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryEffect, 0);
  objc_storeStrong((id *)&self->_effect, 0);
  objc_storeStrong((id *)&self->_clipLayouts, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_effectAlphaHandler, 0);
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)finished
{
  return self->_finished;
}

- (double)initialClipAlpha
{
  return self->_initialClipAlpha;
}

- (PXGEffect)auxiliaryEffect
{
  return self->_auxiliaryEffect;
}

- (PXGEffect)effect
{
  return self->_effect;
}

- (NSArray)clipLayouts
{
  return self->_clipLayouts;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setEffectAlphaHandler:(id)a3
{
}

- (id)effectAlphaHandler
{
  return self->_effectAlphaHandler;
}

- (int64_t)event
{
  return self->_event;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[12];
  return self;
}

- (char)kind
{
  return self->_kind;
}

- (NSString)description
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  v3 = [(PXStoryConcreteTransition *)self clipLayouts];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v6 = [(PXStoryConcreteTransition *)self clipLayouts];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [*(id *)(*((void *)&v24 + 1) + 8 * i) clip];
          objc_msgSend(v5, "addIndex:", objc_msgSend(v11, "identifier"));
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v8);
    }

    v12 = NSString;
    v13 = objc_msgSend(v5, "px_shortDescription");
    [v12 stringWithFormat:@" clips=%@", v13];
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = &stru_1F00B0030;
  }
  id v15 = [NSString alloc];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  unsigned int v18 = [(PXStoryConcreteTransition *)self kind];
  if (v18 > 0xA) {
    v19 = @"??";
  }
  else {
    v19 = off_1E5DC5088[v18];
  }
  v20 = v19;
  [(PXStoryAnimation *)self time];
  CMTime time = v23;
  v21 = objc_msgSend(v15, "initWithFormat:", @"<%@: %p; %@, t=%0.1f%@>",
                  v17,
                  self,
                  v20,
                  CMTimeGetSeconds(&time),
                  v14);

  return (NSString *)v21;
}

- (void)setPrimaryEffectAlpha:(double)a3 auxiliaryEffectAlpha:(double)a4
{
  v6 = [(PXStoryConcreteTransition *)self effectAlphaHandler];
  if (v6)
  {
    uint64_t v7 = v6;
    v6[2](a3, a4);
    v6 = v7;
  }
}

- (void)configureEffectForTime:(id *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 156, @"Method %s is a responsibility of subclass %@", "-[PXStoryConcreteTransition configureEffectForTime:]", v7 object file lineNumber description];

  abort();
}

- (double)clipAlphaForTime:(id *)a3
{
  id v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PXStoryTransition.m", 152, @"Method %s is a responsibility of subclass %@", "-[PXStoryConcreteTransition clipAlphaForTime:]", v7 object file lineNumber description];

  abort();
}

- (double)progress
{
  [(PXStoryConcreteTransition *)self duration];
  CMTime time = v6;
  double Seconds = CMTimeGetSeconds(&time);
  double result = 1.0;
  if (Seconds > 0.0)
  {
    [(PXStoryAnimation *)self time];
    CMTime time = v5;
    CMTimeGetSeconds(&time);
    PXClamp();
  }
  return result;
}

- (void)_end:(BOOL)a3
{
  [(PXStoryConcreteTransition *)self setFinished:a3];
  [(PXStoryAnimation *)self performChanges:&__block_literal_global_15_36440];
}

uint64_t __34__PXStoryConcreteTransition__end___block_invoke(uint64_t a1, void *a2)
{
  return [a2 stop];
}

- (void)wasStopped
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)PXStoryConcreteTransition;
  [(PXStoryAnimation *)&v18 wasStopped];
  [(PXStoryConcreteTransition *)self initialClipAlpha];
  double v4 = v3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  CMTime v5 = [(PXStoryConcreteTransition *)self clipLayouts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v15;
    float v10 = v4;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        *(float *)&double v7 = v10;
        [*(id *)(*((void *)&v14 + 1) + 8 * v11++) setContentAlpha:v7];
      }
      while (v8 != v11);
      uint64_t v8 = [v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  v12 = [(PXStoryConcreteTransition *)self completionHandler];
  if (v12)
  {
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = 0;

    ((void (**)(void, BOOL))v12)[2](v12, [(PXStoryConcreteTransition *)self finished]);
  }
}

- (void)_updateClipAlphaForTime:(id *)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a3;
  [(PXStoryConcreteTransition *)self clipAlphaForTime:&v17];
  double v5 = v4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(PXStoryConcreteTransition *)self clipLayouts];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v14;
    float v11 = v5;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        *(float *)&double v8 = v11;
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) setContentAlpha:v8];
      }
      while (v9 != v12);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)timeDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryConcreteTransition;
  [(PXStoryAnimation *)&v7 timeDidChange];
  [(PXStoryAnimation *)self time];
  double v3 = [(PXStoryConcreteTransition *)self clipLayouts];

  if (v3)
  {
    memset(&time1, 0, sizeof(time1));
    [(PXStoryConcreteTransition *)self _updateClipAlphaForTime:&time1];
  }
  else
  {
    double v4 = [(PXStoryConcreteTransition *)self effect];

    if (v4)
    {
      memset(&time1, 0, sizeof(time1));
      [(PXStoryConcreteTransition *)self configureEffectForTime:&time1];
    }
  }
  [(PXStoryConcreteTransition *)self duration];
  memset(&time1, 0, sizeof(time1));
  CMTime time2 = v6;
  int32_t v5 = CMTimeCompare(&time1, &time2);
  if ((v5 & 0x80000000) == 0
    || (memset(&time1, 0, sizeof(time1)),
        *(_OWORD *)&time2.value = PXStoryTimeZero,
        time2.epoch = 0,
        CMTimeCompare(&time1, &time2) < 0))
  {
    [(PXStoryConcreteTransition *)self _end:v5 >= 0];
  }
}

- (BOOL)canBePaused
{
  return 0;
}

- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 effect:(id)a5 auxiliaryEffect:(id)a6
{
  uint64_t v9 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = NSString;
  if (v9 > 0xA) {
    long long v14 = @"??";
  }
  else {
    long long v14 = off_1E5DC5088[v9];
  }
  long long v15 = v14;
  uint64_t v16 = objc_opt_class();
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = [v13 stringWithFormat:@"PXStoryConcreteTransition.%@.%@.%@", v15, v16, objc_opt_class()];

  long long v21 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  objc_super v18 = [(PXStoryConcreteTransition *)self initWithIdentifier:v17 kind:v9 duration:&v21 event:0];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_effect, a5);
    objc_storeStrong((id *)&v19->_auxiliaryEffect, a6);
  }

  return v19;
}

- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 effect:(id)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  return [(PXStoryConcreteTransition *)self initWithKind:a3 duration:&v6 effect:a5 auxiliaryEffect:0];
}

- (PXStoryConcreteTransition)initWithKind:(char)a3 duration:(id *)a4 event:(int64_t)a5 clipLayouts:(id)a6
{
  id v6 = a6;
  _PXStoryIdentifierFromClipLayouts();
}

- (PXStoryConcreteTransition)initWithIdentifier:(id)a3 kind:(char)a4 duration:(id *)a5 event:(int64_t)a6
{
  unsigned int v12 = a4;
  id v14 = a3;
  long long v15 = v14;
  if (!v14)
  {
    uint64_t v16 = NSString;
    if (v12 > 0xA) {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = @"??";
    }
    else {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = off_1E5DC5088[v12];
    }
    id v6 = v17;
    objc_super v18 = @"undefined";
    if (a6 == 1) {
      objc_super v18 = @"orderIn";
    }
    if (a6 == 2) {
      objc_super v18 = @"orderOut";
    }
    objc_super v7 = v18;
    double v8 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v9 = [v8 UUIDString];
    long long v15 = [v16 stringWithFormat:@"PXStoryConcreteTransition.%@.%@.%@", v6, v7, v9];
  }
  v23.receiver = self;
  v23.super_class = (Class)PXStoryConcreteTransition;
  uint64_t v19 = [(PXStoryAnimation *)&v23 initWithIdentifier:v15];
  uint64_t v20 = v19;
  if (!v14)
  {

    if (!v20) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20->_kind = v12;
    long long v21 = *(_OWORD *)&a5->var0;
    v20->_duration.epoch = a5->var3;
    *(_OWORD *)&v20->_duration.value = v21;
    v20->_event = a6;
  }
LABEL_13:

  return v20;
}

@end