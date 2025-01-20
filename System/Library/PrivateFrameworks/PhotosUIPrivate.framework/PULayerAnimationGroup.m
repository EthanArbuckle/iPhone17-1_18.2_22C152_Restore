@interface PULayerAnimationGroup
- (CALayer)referenceLayer;
- (PULayerAnimationGroup)init;
- (PULayerAnimationGroup)initWithReferenceLayer:(id)a3;
- (double)currentTime;
- (void)updateAnimations;
@end

@implementation PULayerAnimationGroup

- (void).cxx_destruct
{
}

- (CALayer)referenceLayer
{
  return self->_referenceLayer;
}

- (void)updateAnimations
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)PULayerAnimationGroup;
  [(PUTimedAnimationGroup *)&v22 updateAnimations];
  BOOL v3 = [(PUAnimationGroup *)self isPaused];
  [(PUTimedAnimationGroup *)self elapsedTime];
  double v5 = v4;
  [(PUTimedAnimationGroup *)self beginTime];
  double v7 = v6;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v8 = [(PUAnimationGroup *)self subAnimationGroups];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (v3)
          {
            double v14 = 0.0;
            double v15 = 0.0;
            v16 = v13;
            double v17 = v5;
          }
          else
          {
            LODWORD(v14) = 1.0;
            double v17 = 0.0;
            v16 = v13;
            double v15 = v7;
          }
          [v16 setSpeed:v14 timeOffset:v17 beginTime:v15];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v10);
  }
}

- (double)currentTime
{
  v2 = [(PULayerAnimationGroup *)self referenceLayer];
  [v2 convertTime:0 fromLayer:CACurrentMediaTime()];
  double v4 = v3;

  return v4;
}

- (PULayerAnimationGroup)initWithReferenceLayer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PULayerAnimationGroup.m", 24, @"Invalid parameter not satisfying: %@", @"referenceLayer != nil" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)PULayerAnimationGroup;
  double v7 = [(PUTimedAnimationGroup *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_referenceLayer, a3);
    [(PULayerAnimationGroup *)v8 currentTime];
    -[PUTimedAnimationGroup setBeginTime:](v8, "setBeginTime:");
  }

  return v8;
}

- (PULayerAnimationGroup)init
{
  return [(PULayerAnimationGroup *)self initWithReferenceLayer:0];
}

@end