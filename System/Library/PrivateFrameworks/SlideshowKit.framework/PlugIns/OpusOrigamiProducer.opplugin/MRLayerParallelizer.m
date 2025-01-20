@interface MRLayerParallelizer
- (BOOL)_isMadeOpaqueBySublayers;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)isAlphaFriendly;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (MRLayerParallelizer)initWithParameters:(id)a3;
- (MRLayerParallelizer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (NSArray)sublayers;
- (const)backgroundColor;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)phaseInSublayerForKey:(id)a3;
- (double)phaseOutSublayerForKey:(id)a3;
- (id)_createSublayerForPlug:(id)a3;
- (id)_currentState;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)sublayerForKey:(id)a3;
- (id)sublayerForPlugObjectID:(id)a3 recursive:(BOOL)a4;
- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5;
- (void)_deleteSublayer:(id)a3;
- (void)_executeLayerCommandQueue;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_observeSublayer:(id)a3;
- (void)_observeSublayerOnPreactivate:(id)a3;
- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_unobserveSublayer:(id)a3;
- (void)_unobserveSublayerOnDepreactivate:(id)a3;
- (void)_updateSublayersOrdering;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)deactivate;
- (void)depreactivate:(BOOL)a3;
- (void)endMorphing;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preactivate;
- (void)removeSublayer:(id)a3;
- (void)setBackgroundColor:(const float *)a3;
- (void)setBackgroundColorRed:(float)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6;
- (void)setDuration:(double)a3;
- (void)setIsInInteractiveMode:(BOOL)a3;
- (void)setNeedsUpdateForPluggerOfSublayer:(id)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setSublayer:(id)a3 forKey:(id)a4;
- (void)synchronizeTime;
@end

@implementation MRLayerParallelizer

- (MRLayerParallelizer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MRLayerParallelizer;
  v5 = [(MRLayer *)&v8 initWithPlug:a3 andParameters:a4 inSuperlayer:a5];
  v6 = v5;
  if (v5)
  {
    v5->mContainer = (MCContainerParallelizer *)[(MCPlug *)v5->super.mPlug container];
    v6->mSublayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->mSublayersForPlugs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mNeedsToUpdateSublayersOrdering = 0;
    if (!v6->super.mIsReadonly) {
      [(MRLayerParallelizer *)v6 _observePlug];
    }
    [(MRLayerParallelizer *)v6 observeValueForKeyPath:@"plugs" ofObject:v6->mContainer change:0 context:0];
  }
  return v6;
}

- (MRLayerParallelizer)initWithParameters:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRLayerParallelizer;
  v3 = [(MRLayer *)&v5 initWithParameters:a3];
  if (v3)
  {
    v3->mSublayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->mSublayersForPlugs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  }
  return v3;
}

- (void)cleanup
{
  if (self->super.mUUID)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    id v4 = [(NSMutableArray *)self->mSublayers copy];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_super v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (([v8 isScheduledForDestruction] & 1) == 0) {
            [(MRLayerParallelizer *)self _unobserveSublayer:v8];
          }
          [(MRLayerParallelizer *)self _deleteSublayer:v8];
        }
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    self->mSublayersForPlugs = 0;
    self->mSublayers = 0;
    objc_sync_exit(mSublayers);
    v10.receiver = self;
    v10.super_class = (Class)MRLayerParallelizer;
    [(MRLayer *)&v10 cleanup];
    p_mContainer = &self->mContainer;

    *p_mContainer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6 = a6;
  id v7 = a5;
  id v28 = a5;
  v29 = a6;
  if ([a3 isEqualToString:@"plugs"])
  {
    long long v11 = (char *)objc_msgSend(objc_msgSend(v7, "objectForKey:", NSKeyValueChangeKindKey), "unsignedIntegerValue");
    if (v11 == (unsigned char *)&dword_0 + 2)
    {
      v21 = (NSSet *)[v7 objectForKey:NSKeyValueChangeNewKey];
    }
    else
    {
      if (v11 == (unsigned char *)&dword_0 + 3)
      {
        id v12 = [v7 objectForKey:NSKeyValueChangeOldKey];
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v36;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v36 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
              id v18 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", objc_msgSend(v17, "objectID", v28, v29));
              if (([v18 isScheduledForDestruction] & 1) == 0)
              {
                [(MRLayerParallelizer *)self _unobserveSublayer:v18];
                [v18 scheduleForDestruction];
                [(MRLayer *)self _queueLayerCommand:1 object:v17];
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v14);
        }
        goto LABEL_34;
      }
      v21 = [(MCContainerParallelizer *)self->mContainer plugs];
    }
    v22 = v21;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = -[NSSet countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16, v28, v29);
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v32;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v32 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
          if (objc_msgSend(objc_msgSend(v27, "idInSupercontainer"), "characterAtIndex:", 0) != 95) {
            [(MRLayer *)self _queueLayerCommand:0 object:v27];
          }
        }
        id v24 = [(NSSet *)v22 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v24);
    }
    goto LABEL_34;
  }
  if ([a3 isEqualToString:@"plugAsParallel.container"])
  {
    id v19 = [a4 plugAsParallel];
    if (([a4 isScheduledForDestruction] & 1) == 0)
    {
      [(MRLayerParallelizer *)self _unobserveSublayer:a4];
      [a4 scheduleForDestruction];
      [(MRLayer *)self _queueLayerCommand:1 object:v19];
    }
    if (objc_msgSend(v19, "container", v28, v29)) {
      [(MRLayer *)self _queueLayerCommand:0 object:v19];
    }
  }
  else
  {
    if (([a3 isEqualToString:@"zOrderedPlugs"] & 1) != 0
      || [a3 isEqualToString:@"plugAsParallel.zIndex"])
    {
      uint64_t v20 = 256;
    }
    else
    {
      if (![a3 isEqualToString:@"backgroundColor"]) {
        goto LABEL_36;
      }
      uint64_t v20 = 257;
    }
    *((unsigned char *)&self->super.super.isa + v20) = 1;
  }
LABEL_34:
  id v7 = v28;
  uint64_t v6 = v29;
  if (!self->super.mIsPrecomputing)
  {
    [(MRLayer *)self->super.mSuperlayer setNeedsUpdateForPluggerOfSublayer:self];
    [(MRLayer *)self stampTime];
  }
LABEL_36:
  v30.receiver = self;
  v30.super_class = (Class)MRLayerParallelizer;
  -[MRLayer observeValueForKeyPath:ofObject:change:context:](&v30, "observeValueForKeyPath:ofObject:change:context:", a3, a4, v7, v6, v28, v29);
}

- (void)setPixelSize:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MRLayerParallelizer;
  -[MRLayer setPixelSize:](&v13, "setPixelSize:", a3.width, a3.height);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      objc_super v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setNeedsToUpdateGeometry:1];
        objc_super v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (const)backgroundColor
{
  if (self->mBackgroundColor[3] >= 0.0) {
    return self->mBackgroundColor;
  }
  else {
    return 0;
  }
}

- (BOOL)hasSomethingToRender
{
  v13.receiver = self;
  v13.super_class = (Class)MRLayerParallelizer;
  LODWORD(v3) = [(MRLayer *)&v13 hasSomethingToRender];
  if (v3)
  {
    if (self->mBackgroundColor[3] > 0.0 || !self->super.mSuperlayer)
    {
LABEL_13:
      LOBYTE(v3) = 1;
      return (char)v3;
    }
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    mSublayers = self->mSublayers;
    id v3 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v3)
    {
      id v5 = v3;
      uint64_t v6 = *(void *)v10;
LABEL_6:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(mSublayers);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * v7) hasSomethingToRender]) {
          goto LABEL_13;
        }
        if (v5 == (id)++v7)
        {
          id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v14 count:16];
          LOBYTE(v3) = 0;
          if (v5) {
            goto LABEL_6;
          }
          return (char)v3;
        }
      }
    }
  }
  return (char)v3;
}

- (void)synchronizeTime
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 synchronizeTime];
  [(NSMutableArray *)self->mSublayers enumerateObjectsUsingBlock:&stru_1AAD48];
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  mSublayers = self->mSublayers;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_58E30;
  v5[3] = &unk_1AAD68;
  *(double *)&v5[4] = a3;
  *(double *)&v5[5] = a4;
  [(NSMutableArray *)mSublayers enumerateObjectsUsingBlock:v5];
}

- (void)endMorphing
{
}

- (void)setDuration:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRLayerParallelizer;
  -[MRLayer setDuration:](&v7, "setDuration:");
  mSublayers = self->mSublayers;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_58FA4;
  v6[3] = &unk_1AADA8;
  *(double *)&v6[4] = a3;
  [(NSMutableArray *)mSublayers enumerateObjectsUsingBlock:v6];
}

- (void)setBackgroundColor:(const float *)a3
{
  *(_OWORD *)self->mBackgroundColor = *(_OWORD *)a3;
}

- (void)setBackgroundColorRed:(float)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  float v6 = a4;
  self->mBackgroundColor[0] = a3;
  self->mBackgroundColor[1] = v6;
  float v7 = a5;
  float v8 = a6;
  self->mBackgroundColor[2] = v7;
  self->mBackgroundColor[3] = v8;
}

- (void)preactivate
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 preactivate];
  self->mNeedsToUpdateBackgroundColor = self->mContainer != 0;
}

- (void)deactivate
{
  [(NSMutableArray *)self->mSublayers enumerateObjectsUsingBlock:&stru_1AADC8];
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 deactivate];
}

- (void)depreactivate:(BOOL)a3
{
  BOOL v3 = a3;
  mSublayers = self->mSublayers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_59200;
  v7[3] = &unk_1AADF0;
  v7[4] = self;
  BOOL v8 = a3;
  [(NSMutableArray *)mSublayers enumerateObjectsUsingBlock:v7];
  v6.receiver = self;
  v6.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v6 depreactivate:v3];
}

- (BOOL)isLoadedForTime:(double)a3
{
  v20.receiver = self;
  v20.super_class = (Class)MRLayerParallelizer;
  unsigned int v5 = -[MRLayer isLoadedForTime:](&v20, "isLoadedForTime:");
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    mSublayers = self->mSublayers;
    id v7 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v17;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(mSublayers);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        [v11 timeIn];
        double v13 = v12;
        if ([v11 isPreactivated])
        {
          double v14 = a3 - v13;
          if ([v11 shouldBeActivatedAtTime:v14])
          {
            unsigned int v5 = [v11 isLoadedForTime:v14];
            if (!v5) {
              break;
            }
          }
        }
        if (v8 == (id)++v10)
        {
          id v8 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v16 objects:v21 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_isMadeOpaqueBySublayers
{
  double width = self->super.mPixelSize.width;
  double height = self->super.mPixelSize.height;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v32;
    double v8 = width / height;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        uint64_t v10 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v9);
        if ([v10 isOpaque])
        {
          id v11 = [v10 plugAsParallel];
          [v11 rotationAngle];
          if (v12 == 0.0)
          {
            [v11 xRotationAngle];
            if (v13 == 0.0)
            {
              [v11 yRotationAngle];
              if (v14 == 0.0)
              {
                [v11 opacity];
                if (v15 >= 1.0)
                {
                  [v11 zPosition];
                  if (v16 >= 0.0 && ![v11 countOfAnimationPaths])
                  {
                    [v11 position];
                    double v18 = v17;
                    double v20 = v19;
                    [v11 sizeForParentAspectRatio:v8];
                    double v23 = v18 - v22 * 0.5;
                    double v24 = v18 + v22 * 0.5;
                    BOOL v25 = v23 > -1.0 || v24 < -1.0;
                    double v26 = v20 - v21 * 0.5;
                    double v27 = v20 + v21 * 0.5;
                    BOOL v28 = v25 || v26 > -1.0;
                    if (!v28 && v27 >= -1.0)
                    {
                      LOBYTE(v5) = 1;
                      return (char)v5;
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v31 objects:v35 count:16];
      id v6 = v5;
    }
    while (v5);
  }
  return (char)v5;
}

- (BOOL)isOpaque
{
  if (self->mBackgroundColor[3] == 1.0) {
    return 1;
  }
  else {
    return [(MRLayerParallelizer *)self _isMadeOpaqueBySublayers];
  }
}

- (BOOL)isAlphaFriendly
{
  BOOL v3 = (char *)[(NSMutableArray *)self->mSublayers count];
  if (!v3)
  {
LABEL_5:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (v3 != (unsigned char *)&dword_0 + 1)
  {
    LOBYTE(v5) = 0;
    return v5;
  }
  id v4 = [(NSMutableArray *)self->mSublayers lastObject];
  unsigned int v5 = [v4 isAlphaFriendly];
  if (v5)
  {
    if (([v4 isOpaque] & 1) == 0)
    {
      LOBYTE(v5) = self->mBackgroundColor[3] <= 0.0;
      return v5;
    }
    goto LABEL_5;
  }
  return v5;
}

- (BOOL)isInfinite
{
  if (self->mBackgroundColor[3] <= 0.0) {
    return ![(MCPlugParallel *)self->super.mPlugAsParallel clipsContainer];
  }
  else {
    return 0;
  }
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  uint64_t v7 = self;
  if (self->super.mLayerCommandQueueNeedsAttention) {
    [(MRLayerParallelizer *)self _executeLayerCommandQueue];
  }
  v57.receiver = v7;
  v57.super_class = (Class)MRLayerParallelizer;
  unsigned int v52 = [(MRLayer *)&v57 prerenderForTime:a4 inContext:a5 withArguments:a3];
  if (v7->mNeedsToUpdateBackgroundColor)
  {
    v7->mNeedsToUpdateBackgroundColor = 0;
    double v8 = [(MCContainerParallelizer *)v7->mContainer backgroundColor];
    if ([(MCContainerParallelizer *)v7->mContainer backgroundColor])
    {
      Components = CGColorGetComponents(v8);
      if (Components)
      {
        uint64_t v10 = (float64x2_t *)Components;
        switch(CGColorGetNumberOfComponents(v8))
        {
          case 1uLL:
            float v11 = v10->f64[0];
            mBackgroundColor = v7->mBackgroundColor;
            v7->mBackgroundColor[1] = v11;
            v7->mBackgroundColor[2] = v11;
            v7->mBackgroundColor[0] = v11;
            goto LABEL_11;
          case 2uLL:
            double v14 = v10->f64[1];
            float v15 = v10->f64[0];
            mBackgroundColor = v7->mBackgroundColor;
            v7->mBackgroundColor[1] = v15;
            v7->mBackgroundColor[2] = v15;
            v7->mBackgroundColor[0] = v15;
            goto LABEL_13;
          case 3uLL:
            mBackgroundColor = v7->mBackgroundColor;
            *(float32x2_t *)v7->mBackgroundColor = vcvt_f32_f64(*v10);
            float v16 = v10[1].f64[0];
            v7->mBackgroundColor[2] = v16;
LABEL_11:
            float v13 = 1.0;
            goto LABEL_14;
          case 4uLL:
            mBackgroundColor = v7->mBackgroundColor;
            *(float32x2_t *)v7->mBackgroundColor = vcvt_f32_f64(*v10);
            double v14 = v10[1].f64[1];
            float v17 = v10[1].f64[0];
            v7->mBackgroundColor[2] = v17;
LABEL_13:
            float v13 = v14;
            goto LABEL_14;
          default:
            goto LABEL_15;
        }
      }
    }
    mBackgroundColor = v7->mBackgroundColor;
    float v13 = -1.0;
LABEL_14:
    mBackgroundColor[3] = v13;
  }
LABEL_15:
  id v18 = [a5 forcedState];
  id v19 = v18;
  if (v18) {
    id v20 = [v18 objectForKey:@"activatedSublayers"];
  }
  else {
    id v20 = 0;
  }
  unsigned int v50 = [a5 currentLayoutIndex];
  [(MRLayerClock *)v7->super.mClock containerTime];
  double v22 = v21;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obj = v7->mSublayers;
  id v49 = [(NSMutableArray *)obj countByEnumeratingWithState:&v53 objects:v58 count:16];
  if (v49)
  {
    id v43 = v19;
    uint64_t v47 = *(void *)v54;
    v51 = v7;
    id v44 = a5;
    id v48 = v20;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(obj);
        }
        double v24 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        id v25 = [v24 plugAsParallel];
        double v26 = v25;
        if (v20)
        {
          id v27 = objc_msgSend(v20, "objectForKey:", objc_msgSend(v25, "idInSupercontainer"));
          if (v27)
          {
            if ([v26 isTriggered])
            {
              objc_msgSend(objc_msgSend(v27, "objectForKey:", @"timeIn"), "doubleValue");
              objc_msgSend(v26, "setTimeIn:");
            }
            LODWORD(v20) = 1;
          }
          else
          {
            LODWORD(v20) = 0;
          }
        }
        else
        {
          id v27 = 0;
        }
        [v24 timeIn];
        double v29 = v22 - v28;
        unsigned int v30 = [v24 isPreactivated];
        unsigned int v31 = [v24 isActivated];
        if ([v26 preactivatesWithParent]) {
          unsigned int v32 = 1;
        }
        else {
          unsigned int v32 = [v24 shouldBePreactivatedAtTime:v29];
        }
        BOOL v33 = !v7->super.mIsActivated || v32 == 0;
        if (v33 || ![v24 shouldBeActivatedAtTime:v29]) {
          unsigned int v34 = 0;
        }
        else {
          unsigned int v34 = [v26 isTriggered] ^ 1 | v20 | v31;
        }
        v52 |= v31 ^ v34;
        if (v32)
        {
          if ((v30 & 1) == 0)
          {
            [v24 preactivate];
            [(MRLayerParallelizer *)v51 _observeSublayerOnPreactivate:v24];
            objc_msgSend(objc_msgSend(v24, "parentHelper"), "setNeedsUpdate:", 1);
          }
          if ((v34 ^ 1 | v31))
          {
            char v35 = v34 | v31 ^ 1;
            long long v36 = v44;
            if ((v35 & 1) == 0) {
              [v24 deactivate];
            }
          }
          else
          {
            [v24 activate];
            long long v36 = v44;
          }
          if (v50 != [v26 currentLayoutIndex]) {
            [v26 setCurrentLayoutIndex:v50];
          }
          if (v34)
          {
            if (v20)
            {
              id v37 = [v27 objectForKey:@"persistentState"];
              if (v37) {
                [v24 _applyState:v37];
              }
            }
            id v38 = [v24 parentHelper];
            uint64_t v7 = v51;
            if ([v38 needsUpdate])
            {
              [v38 setPlug:v26];
              id v20 = v48;
LABEL_62:
              id v39 = [v26 actionForKey:@"onLayoutChange"];
              if (v39) {
                objc_msgSend(v24, "_sendAction:withStates:async:yesterday:", v39, +[NSDictionary dictionaryWithObject:forKey:](NSDictionary, "dictionaryWithObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v50), @"_currentLayoutIndex"), 0, 0);
              }
            }
            else
            {
              id v20 = v48;
              if (v50 != [v38 currentLayoutIndex])
              {
                [v38 setCurrentLayoutIndex:v50];
                goto LABEL_62;
              }
            }
            v52 |= [v38 applyAtTime:v24 toSublayer:v36 withArguments:v29];
            objc_msgSend(objc_msgSend(v24, "clock"), "externalTime");
            double v29 = v40;
          }
          else
          {
            uint64_t v7 = v51;
            id v20 = v48;
          }
          if (v43) {
            [v36 setForcedState:v27];
          }
          v52 |= [v24 prerenderForTime:a4 inContext:v36 withArguments:v29];
          continue;
        }
        if (v31) {
          [v24 deactivate];
        }
        uint64_t v7 = v51;
        id v20 = v48;
        if (v30)
        {
          [(MRLayerParallelizer *)v51 _unobserveSublayerOnDepreactivate:v24];
          [v24 depreactivate:1];
        }
      }
      id v49 = [(NSMutableArray *)obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    }
    while (v49);
  }
  if (v7->super.mIsActivated)
  {
    if (v7->mNeedsToUpdateSublayersOrdering)
    {
      [(MRLayerParallelizer *)v7 _updateSublayersOrdering];
      char v41 = v7->super.mIsActivated & v52;
    }
    else
    {
      char v41 = v52;
    }
  }
  else
  {
    char v41 = 0;
  }
  return v41 & 1;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mPixelSize.width <= 0.0 || self->super.mPixelSize.height <= 0.0) {
    return 0;
  }
  if ([(NSMutableArray *)self->mSublayers count] != (char *)&dword_0 + 1
    || (id v9 = [(NSMutableArray *)self->mSublayers lastObject],
        objc_msgSend(objc_msgSend(v9, "clock"), "externalTime"),
        (id result = objc_msgSend(v9, "patchworkAtTime:inContext:withArguments:", a4, a5)) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)MRLayerParallelizer;
    return [(MRLayer *)&v11 patchworkAtTime:a4 inContext:a5 withArguments:a3];
  }
  return result;
}

- (void)setNeedsUpdateForPluggerOfSublayer:(id)a3
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  objc_msgSend(objc_msgSend(a3, "parentHelper"), "setNeedsUpdate:", 1);
  objc_sync_exit(mSublayers);
}

- (BOOL)hasAudio
{
  BOOL v3 = [(MCAudioPlaylist *)[(MCContainer *)self->mContainer audioPlaylist] songs];
  if (!v3 || ![(NSSet *)v3 count])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    mSublayers = self->mSublayers;
    id v4 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (!v4) {
      return (char)v4;
    }
    id v6 = v4;
    uint64_t v7 = *(void *)v11;
LABEL_6:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mSublayers);
      }
      if ([*(id *)(*((void *)&v10 + 1) + 8 * v8) hasAudio]) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v4) = 0;
        if (v6) {
          goto LABEL_6;
        }
        return (char)v4;
      }
    }
  }
  LOBYTE(v4) = 1;
  return (char)v4;
}

- (id)sublayerForKey:(id)a3
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = self->mSublayers;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v10, "idInSupercontainer"), "isEqualToString:", a3))
        {
          id v11 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_11:
  objc_sync_exit(mSublayers);
  return v11;
}

- (void)setSublayer:(id)a3 forKey:(id)a4
{
  id v10 = -[MCObject _initWithObjectID:]([MCPlugParallel alloc], "_initWithObjectID:", [a3 uuid]);
  [a3 setIdInSupercontainer:a4];
  [v10 setIDInSupercontainer:a4];
  if (self->super.mIsActivated) {
    id v7 = &dword_0 + 1;
  }
  else {
    id v7 = [a3 isActivated];
  }
  [v10 setIsTriggered:v7];
  if (!self->super.mIsActivated) {
    [a3 setTimeIn:0.0];
  }
  [v10 setPreactivatesWithParent:1];
  [v10 setLoopDuration:1.0e10];
  [a3 _setPlug:v10 andSuperlayer:self];
  uint64_t v8 = objc_alloc_init(MRParallelPlugger);
  [a3 setParentHelper:v8];
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [(NSMutableArray *)self->mSublayers addObject:a3];
  -[NSMutableDictionary setObject:forKey:](self->mSublayersForPlugs, "setObject:forKey:", a3, [a3 uuid]);
  [(MRLayerParallelizer *)self _observeSublayer:a3];
  if ([a3 isPreactivated]) {
    [(MRLayerParallelizer *)self _observeSublayerOnPreactivate:a3];
  }
  objc_sync_exit(mSublayers);
}

- (void)removeSublayer:(id)a3
{
  id v5 = a3;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  if ([a3 isPreactivated]) {
    [(MRLayerParallelizer *)self _unobserveSublayerOnDepreactivate:a3];
  }
  [(MRLayerParallelizer *)self _unobserveSublayer:a3];
  [a3 _setPlug:0 andSuperlayer:0];
  [a3 setParentHelper:0];
  [(NSMutableArray *)self->mSublayers removeObject:a3];
  -[NSMutableDictionary removeObjectForKey:](self->mSublayersForPlugs, "removeObjectForKey:", [a3 uuid]);
  objc_sync_exit(mSublayers);
  id v7 = a3;
}

- (id)sublayerForPlugObjectID:(id)a3 recursive:(BOOL)a4
{
  BOOL v4 = a4;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  id v8 = [(NSMutableDictionary *)self->mSublayersForPlugs objectForKey:a3];
  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = !v4;
  }
  if (!v9)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = self->mSublayers;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v18;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v17 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector())
        {
          id v8 = [v14 sublayerForPlugObjectID:a3 recursive:1];
          if (v8) {
            break;
          }
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          id v8 = 0;
          if (v11) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  id v15 = v8;
  objc_sync_exit(mSublayers);
  return v8;
}

- (BOOL)hasSlides
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSublayers = self->mSublayers;
  id v3 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(mSublayers);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        if [v7 isActivated] && (objc_msgSend(v7, "hasSlides"))
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (BOOL)isInInteractiveMode
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSublayers = self->mSublayers;
  id v3 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(mSublayers);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v6);
        if ([v7 isActivated]
          && ([v7 isInInteractiveMode] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v3 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v13 count:16];
      id v4 = v3;
      if (v3) {
        continue;
      }
      break;
    }
  }
  return (char)v3;
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
  BOOL v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 isActivated]) {
          [v9 setIsInInteractiveMode:v3];
        }
      }
      id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)currentSlideInfoForElement:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mSublayers = self->mSublayers;
  id result = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (result)
  {
    id v6 = result;
    uint64_t v7 = *(void *)v11;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(mSublayers);
      }
      long long v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
      if ([v9 isActivated])
      {
        id result = [v9 currentSlideInfoForElement:a3];
        if (result) {
          break;
        }
      }
      if (v6 == (id)++v8)
      {
        id result = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v10 objects:v14 count:16];
        id v6 = result;
        if (result) {
          goto LABEL_3;
        }
        return result;
      }
    }
  }
  return result;
}

- (id)currentSlideInfos
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mSublayers = self->mSublayers;
  id v3 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v12;
LABEL_3:
  uint64_t v6 = 0;
  while (1)
  {
    if (*(void *)v12 != v5) {
      objc_enumerationMutation(mSublayers);
    }
    uint64_t v7 = *(void **)(*((void *)&v11 + 1) + 8 * v6);
    if ([v7 isActivated])
    {
      id v8 = [v7 currentSlideInfos];
      if (v8)
      {
        long long v9 = v8;
        if ([v8 count]) {
          return v9;
        }
      }
    }
    if (v4 == (id)++v6)
    {
      id v4 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  BOOL v6 = a6;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mSublayers = self->mSublayers;
  id v11 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(mSublayers);
        }
        id v15 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v14);
        if ([v15 isActivated]
          && ([v15 getStartTime:a3 andDuration:a4 forMovingToElementID:a5 backwards:v6] & 1) != 0)
        {
          LOBYTE(v11) = 1;
          return (char)v11;
        }
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v11 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v12 = v11;
      if (v11) {
        continue;
      }
      break;
    }
  }
  return (char)v11;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mSublayers = self->mSublayers;
  id v11 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    while (2)
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(mSublayers);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
        if ([v15 isActivated])
        {
          [v15 timeIn];
          if ([v15 hasMoreSlidesFromTime:v8 backwards:a5 startTime:a6 duration:a3 - v16])
          {
            if (a5)
            {
              [v15 timeIn];
              *a5 = v17 + *a5;
            }
            if (a6)
            {
              [v15 timeIn];
              *a6 = v18 + *a6;
            }
            LOBYTE(v11) = 1;
            return (char)v11;
          }
        }
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v11 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v20 objects:v24 count:16];
      id v12 = v11;
      if (v11) {
        continue;
      }
      break;
    }
  }
  return (char)v11;
}

- (double)interestingTimeForTime:(double)a3
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v16 objects:v20 count:16];
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(mSublayers);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if [v10 isActivated] && (objc_msgSend(v10, "hasSlides"))
        {
          [v10 timeIn];
          [v10 interestingTimeForTime:a3 - v11];
          double v13 = v12;
          [v10 timeIn];
          return v13 + v14;
        }
      }
      id v7 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (double)interestingTimeForElement:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v15 objects:v19 count:16];
  double v6 = 0.0;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(mSublayers);
        }
        long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if [v10 isActivated] && (objc_msgSend(v10, "hasSlides"))
        {
          [v10 interestingTimeForElement:a3];
          double v12 = v11;
          [v10 timeIn];
          return v12 + v13;
        }
      }
      id v7 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  mSublayers = self->mSublayers;
  id v11 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(mSublayers);
        }
        long long v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v15 isActivated] && objc_msgSend(v15, "hasSlides"))
        {
          [v15 timeIn];
          [v15 getLazyDuration:a3 lazyFactor:a4 animationDuration:a5 fromInterestingTime:a6 - v16];
          return;
        }
      }
      id v12 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
}

- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5
{
  if (self->super.mIsActivated)
  {
    BOOL v6 = a4;
    double x = a3.x;
    if (self->super.mRenderingState->var18) {
      double y = -a3.y;
    }
    else {
      double y = a3.y;
    }
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    id v11 = [(NSMutableArray *)self->mSublayers copy];
    objc_sync_exit(mSublayers);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (!v12)
    {
      unsigned int v31 = 0;
      goto LABEL_38;
    }
    unsigned int v31 = 0;
    uint64_t v13 = *(void *)v34;
    int64_t v14 = 0x8000000000000000;
    while (1)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(v11);
        }
        double v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([v16 isActivated])
        {
          long long v17 = (float *)[v16 renderingState];
          long long v18 = v17;
          if (v17)
          {
            if (*((unsigned char *)v17 + 240))
            {
              CGPoint v32 = (CGPoint)0;
              memset(v38, 0, sizeof(v38));
              memset(v37, 0, sizeof(v37));
              MRMatrix_MultiplyWithMatrix(v17 + 28, v17 + 44, (float *)v38);
              double v19 = x;
              double v20 = y;
              if (MRMatrix_Invert((float *)v38, (float *)v37))
              {
                double v19 = MRMatrix_UnprojectPoint((float *)v37, x, y);
                double v22 = v21;
                [v16 pixelSize];
                double v24 = v23;
                [v16 pixelSize];
                double v20 = v22 * (v24 / v25);
              }
              if (([v16 isInfinite] & 1) != 0
                || (v41.origin.double x = -1.0,
                    v41.origin.double y = -1.0,
                    v41.size.double width = 2.0,
                    v41.size.double height = 2.0,
                    v40.double x = v19,
                    v40.double y = v20,
                    CGRectContainsPoint(v41, v40)))
              {
                int v26 = *((unsigned __int8 *)v18 + 242);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (v6 && !objc_msgSend(v16, "elementHitAtPoint:localPoint:", 0, v19, v20)) {
                    continue;
                  }
                  v32.double x = v19;
                  v32.double y = v20;
                  id v27 = v16;
                  if (!v16) {
                    continue;
                  }
                }
                else
                {
                  if (v26) {
                    double v28 = v19;
                  }
                  else {
                    double v28 = x;
                  }
                  if (v26) {
                    double v29 = v20;
                  }
                  else {
                    double v29 = y;
                  }
                  id v27 = objc_msgSend(v16, "sublayerHitAtPoint:onlyIfHitElement:localPoint:", v6, &v32, v28, v29);
                  if (!v27) {
                    continue;
                  }
                }
                if (v14 < (int)objc_msgSend(objc_msgSend(v16, "plugAsParallel"), "zIndex"))
                {
                  if (a5) {
                    *a5 = v32;
                  }
                  int64_t v14 = (int)objc_msgSend(objc_msgSend(v16, "plugAsParallel"), "zIndex");
                  unsigned int v31 = v27;
                }
              }
            }
          }
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (!v12)
      {
LABEL_38:

        return v31;
      }
    }
  }
  return 0;
}

- (double)phaseInSublayerForKey:(id)a3
{
  id v4 = [(MRLayerParallelizer *)self sublayerForKey:a3];
  if (!v4) {
    return 0.0;
  }
  id v5 = v4;
  if (!objc_msgSend(objc_msgSend(v4, "plugAsParallel"), "isTriggered")
    || [v5 isActivated]
    && !objc_msgSend(objc_msgSend(v5, "plugAsParallel"), "resetsTimeOnTrigger"))
  {
    return 0.0;
  }
  [(MRLayerClock *)self->super.mClock containerTime];
  objc_msgSend(v5, "setTimeIn:");
  if ([v5 isActivated])
  {
    [v5 setNeedsToSynchronizeTime:1];
  }
  else
  {
    if (([v5 isPreactivated] & 1) == 0)
    {
      [v5 preactivate];
      [(MRLayerParallelizer *)self _observeSublayerOnPreactivate:v5];
    }
    [v5 activate];
  }
  objc_msgSend(objc_msgSend(v5, "plug"), "fullDuration");
  objc_msgSend(v5, "setDuration:");
  objc_msgSend(objc_msgSend(v5, "clock"), "setExternalTime:", 0.0);
  id v7 = [v5 plug];
  [v7 phaseInDuration];
  return result;
}

- (double)phaseOutSublayerForKey:(id)a3
{
  id v4 = [(MRLayerParallelizer *)self sublayerForKey:a3];
  double v5 = 0.0;
  if (v4)
  {
    BOOL v6 = v4;
    if (objc_msgSend(objc_msgSend(v4, "plugAsParallel"), "isTriggered"))
    {
      if ([v6 isActivated])
      {
        objc_msgSend(objc_msgSend(v6, "plug"), "phaseOutDuration");
        double v5 = v7;
        [(MRLayerClock *)self->super.mClock containerTime];
        double v9 = v8;
        [v6 timeIn];
        [v6 setDuration:v5 + v9 - v10];
      }
    }
  }
  return v5;
}

- (id)_currentState
{
  v17.receiver = self;
  v17.super_class = (Class)MRLayerParallelizer;
  id v12 = [(MRLayer *)&v17 _currentState];
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        double v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isActivated])
        {
          id v10 = [v9 _currentState];
          if (objc_msgSend(objc_msgSend(v9, "plugAsParallel"), "isTriggered"))
          {
            [v9 timeIn];
            objc_msgSend(v10, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"timeIn");
          }
          objc_msgSend(v3, "setObject:forKey:", v10, objc_msgSend(v9, "idInSupercontainer"));
        }
      }
      id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v6);
  }
  if ([v3 count]) {
    [v12 setObject:v3 forKey:@"activatedSublayers"];
  }

  return v12;
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MRLayerParallelizer;
  id v5 = -[MRLayer _dumpLayerWithOptions:](&v19, "_dumpLayerWithOptions:");
  if ((a3 & 1) == 0)
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", v5, 0);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    mSublayers = self->mSublayers;
    id v8 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      unint64_t v11 = a3 + 256;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(mSublayers);
          }
          long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if ([v13 isActivated]) {
            objc_msgSend(v6, "addObject:", objc_msgSend(v13, "_dumpLayerWithOptions:", v11));
          }
        }
        id v9 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }
    id v5 = [v6 componentsJoinedByString:@"\n"];
  }
  return v5;
}

- (NSArray)sublayers
{
  return &self->mSublayers->super;
}

- (void)_executeLayerCommandQueue
{
  mLayerCommandQueue = self->super.mLayerCommandQueue;
  objc_sync_enter(mLayerCommandQueue);
  if ([(NSMutableArray *)self->super.mLayerCommandQueue count])
  {
    self->super.mLayerCommandQueueNeedsAttention = 0;
    id v4 = [(NSMutableArray *)self->super.mLayerCommandQueue copy];
    [(NSMutableArray *)self->super.mLayerCommandQueue removeAllObjects];
    objc_sync_exit(mLayerCommandQueue);
    if (v4)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v17;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(v4);
            }
            uint64_t v8 = *(void *)(*((void *)&v16 + 1) + 8 * i);
            switch(*(_DWORD *)(v8 + 8))
            {
              case 0:
                [(MRLayerParallelizer *)self _observeSublayer:[(MRLayerParallelizer *)self _createSublayerForPlug:*(void *)(v8 + 16)]];
                break;
              case 1:
                id v9 = *(void **)(v8 + 16);
                id v10 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [v9 objectID]);
                unint64_t v11 = v10;
                if (v10)
                {
                  if ([v10 isPreactivated])
                  {
                    if ([v11 isActivated]) {
                      [v11 deactivate];
                    }
                    [(MRLayerParallelizer *)self _unobserveSublayerOnDepreactivate:v11];
                    [v11 depreactivate:0];
                  }
                  [(MRLayerParallelizer *)self _unobserveSublayer:v11];
                  [(MRLayerParallelizer *)self _deleteSublayer:v11];
                }
                else if ([v9 container])
                {
                  NSLog(@"Consistency error, trying to delete a nil sublayer in parallelizer\n");
                }
                break;
              case 2:
                id v12 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [*(id *)(v8 + 16) objectID]);
                long long v13 = v12;
                if (v12)
                {
                  if (([v12 isPreactivated] & 1) == 0)
                  {
                    [v13 preactivate];
                    [(MRLayerParallelizer *)self _observeSublayerOnPreactivate:v13];
                  }
                  if (([v13 isActivated] & 1) == 0) {
                    [v13 activate];
                  }
                }
                break;
              case 3:
                id v14 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [*(id *)(v8 + 16) objectID]);
                long long v15 = v14;
                if (v14 && [v14 isActivated]) {
                  [v15 deactivate];
                }
                break;
              default:
                continue;
            }
          }
          id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v5);
      }
    }
  }
  else
  {
    objc_sync_exit(mLayerCommandQueue);
  }
}

- (void)_updateSublayersOrdering
{
  self->mNeedsToUpdateSublayersOrdering = 0;
  [(NSMutableArray *)self->mSublayers sortUsingComparator:&stru_1AAE30];
}

- (id)_createSublayerForPlug:(id)a3
{
  id v5 = +[MRLayer layerWithPlug:a3 andParameters:self->super.mParameters inSuperlayer:self];
  uint64_t v6 = objc_alloc_init(MRParallelPlugger);
  [(MRLayer *)v5 setParentHelper:v6];
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [(NSMutableArray *)self->mSublayers addObject:v5];
  -[NSMutableDictionary setObject:forKey:](self->mSublayersForPlugs, "setObject:forKey:", v5, [a3 objectID]);
  objc_sync_exit(mSublayers);

  self->mNeedsToUpdateSublayersOrdering = 1;
  return v5;
}

- (void)_deleteSublayer:(id)a3
{
  id v4 = a3;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [a3 setParentHelper:0];
  -[NSMutableDictionary removeObjectForKey:](self->mSublayersForPlugs, "removeObjectForKey:", objc_msgSend(objc_msgSend(a3, "plug"), "objectID"));
  [(NSMutableArray *)self->mSublayers removeObject:a3];
  objc_sync_exit(mSublayers);
  [a3 cleanup];
}

- (void)_observeSublayer:(id)a3
{
  if ([a3 isAdhocLayer])
  {
    CFStringRef v5 = @"plugAsParallel.zIndex";
  }
  else
  {
    if (self->super.mIsReadonly) {
      return;
    }
    CFStringRef v5 = @"plugAsParallel.container";
  }
  [a3 addObserver:self forKeyPath:v5 options:0 context:0];
}

- (void)_unobserveSublayer:(id)a3
{
  if (([a3 isScheduledForDestruction] & 1) == 0)
  {
    if ([a3 isAdhocLayer])
    {
      CFStringRef v5 = @"plugAsParallel.zIndex";
    }
    else
    {
      if (self->super.mIsReadonly) {
        return;
      }
      CFStringRef v5 = @"plugAsParallel.container";
    }
    [a3 removeObserver:self forKeyPath:v5];
  }
}

- (void)_observeSublayerOnPreactivate:(id)a3
{
}

- (void)_unobserveSublayerOnDepreactivate:(id)a3
{
}

- (void)_observePlug
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 _observePlug];
  [(MCContainerParallelizer *)self->mContainer addObserver:self forKeyPath:@"plugs" options:3 context:0];
  [(MCContainerParallelizer *)self->mContainer addObserver:self forKeyPath:@"zOrderedPlugs" options:3 context:0];
}

- (void)_unobservePlug
{
  [(MCContainerParallelizer *)self->mContainer removeObserver:self forKeyPath:@"plugs"];
  [(MCContainerParallelizer *)self->mContainer removeObserver:self forKeyPath:@"zOrderedPlugs"];
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 _unobservePlug];
}

- (void)_observePlugOnPreactivate
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 _observePlugOnPreactivate];
  [(MCContainerParallelizer *)self->mContainer addObserver:self forKeyPath:@"backgroundColor" options:0 context:0];
  if (self->super.mDoAudio)
  {
    [(MCContainerParallelizer *)self->mContainer addObserver:self forKeyPath:@"audioPlaylist.audioNoVolume" options:0 context:0];
    [(MCContainerParallelizer *)self->mContainer addObserver:self forKeyPath:@"audioPlaylist.builtVolume" options:0 context:0];
  }
}

- (void)_unobservePlugOnDepreactivate
{
  [(MCContainerParallelizer *)self->mContainer removeObserver:self forKeyPath:@"backgroundColor"];
  if (self->super.mDoAudio)
  {
    [(MCContainerParallelizer *)self->mContainer removeObserver:self forKeyPath:@"audioPlaylist.audioNoVolume"];
    [(MCContainerParallelizer *)self->mContainer removeObserver:self forKeyPath:@"audioPlaylist.builtVolume"];
  }
  v3.receiver = self;
  v3.super_class = (Class)MRLayerParallelizer;
  [(MRLayer *)&v3 _unobservePlugOnDepreactivate];
}

- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3
{
  self->super.mNeedsToRequestRebuildAudio = self->super.mDoAudio;
  if (a3)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    mSublayers = self->mSublayers;
    id v4 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(mSublayers);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) _setNeedsToRequestRebuildAudio:1];
        }
        id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  HIDWORD(v11) = 0;
  long long v27 = xmmword_165220;
  mBackgroundColor = self->mBackgroundColor;
  if (self->mBackgroundColor[3] >= 0.0)
  {
    *(float *)&double v5 = self->mBackgroundColor[1];
    *(float *)&double v6 = self->mBackgroundColor[2];
    objc_msgSend(a4, "setBackColorRed:green:blue:alpha:saveTo:", &v27, COERCE_DOUBLE((unint64_t)*(_DWORD *)mBackgroundColor), v5, v6);
  }
  if (!self->super.mSuperlayer
    || self->super.mRenderingState->var17
    && [(MRLayerParallelizer *)self isOpaque]
    && !self->super.mRenderingState->var19)
  {
    LODWORD(v11) = 1.0;
    LODWORD(v5) = 1.0;
    LODWORD(v6) = 1.0;
    LODWORD(v7) = 1.0;
    [a4 setForeColorRed:0 green:v11 blue:v5 alpha:v6 saveTo:v7];
    if (mBackgroundColor[3] < 0.0)
    {
      if (self->super.mRenderingState->var19) {
        *(float *)&double v14 = 1.0;
      }
      else {
        *(float *)&double v14 = 0.0;
      }
      [a4 setBackColorRed:&v27 green:0.0 blue:0.0 alpha:0.0 saveTo:v14];
    }
    if (![a4 dimensionalMode]
      || [a4 dimensionalMode] == 1
      || [a4 dimensionalMode] == 3)
    {
      [a4 clear:3];
    }
  }
  else if (![(MRLayerParallelizer *)self _isMadeOpaqueBySublayers] {
         && mBackgroundColor[3] > 0.0)
  }
  {
    id v13 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithSize:andColor:", mBackgroundColor, 1.0, 1.0);
    [v13 setLabel:@"Marimba Parallelizer Background"];
    [v13 setClampMode:2];
    if (mBackgroundColor[3] >= 1.0)
    {
      [a4 setShader:@"PlainTexture"];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:zRotation:", v13, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
      [a4 unsetShader];
    }
    else
    {
      [a4 blend:3];
      [a4 setShader:@"PlainTexture"];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:zRotation:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:zRotation:", v13, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0, 0.0);
      [a4 unsetShader];
      [a4 blend:0];
    }
    [v13 releaseByUser];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mSublayers = self->mSublayers;
  id v16 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    id v18 = v16;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(mSublayers);
        }
        double v21 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v21 hasSomethingToRender])
        {
          objc_msgSend(objc_msgSend(v21, "clock"), "externalTime");
          objc_msgSend(v21, "renderAtTime:inContext:withArguments:", a4, a5);
        }
      }
      id v18 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }
  LODWORD(v17) = HIDWORD(v27);
  if (*((float *)&v27 + 3) >= 0.0) {
    objc_msgSend(a4, "restoreBackColor:", &v27, v17);
  }
}

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mBackgroundColor = self->mBackgroundColor;
  float v9 = self->mBackgroundColor[3];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  mSublayers = self->mSublayers;
  id v11 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v11)
  {
    id v12 = v11;
    id v31 = a4;
    id v13 = 0;
    uint64_t v14 = *(void *)v38;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(mSublayers);
        }
        id v16 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v16, "hasSomethingToRender", v31))
        {
          if (v13 || v9 > 0.0)
          {
            if (v13) {
              id v16 = v13;
            }
LABEL_23:
            a4 = v31;
            if (!v16) {
              goto LABEL_27;
            }
LABEL_24:
            if (mBackgroundColor[3] < 0.0)
            {
              if (self->super.mRenderingState->var19) {
                mBackgroundColor = (float *)[a4 backColor];
              }
              else {
                mBackgroundColor = 0;
              }
            }
            v36[0] = 0;
            v36[1] = 0;
            *(_WORD *)&self->super.mRenderingState->var17 = 257;
            id v23 = objc_msgSend(a4, "beginLocalContextWithSize:backgroundColor:state:", mBackgroundColor, v36, self->super.mPixelSize.width, self->super.mPixelSize.height);
            long long v32 = 0u;
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v24 = self->mSublayers;
            id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v25)
            {
              id v26 = v25;
              uint64_t v27 = *(void *)v33;
              do
              {
                for (j = 0; j != v26; j = (char *)j + 1)
                {
                  if (*(void *)v33 != v27) {
                    objc_enumerationMutation(v24);
                  }
                  double v29 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
                  if ([v29 hasSomethingToRender])
                  {
                    objc_msgSend(objc_msgSend(v29, "clock"), "externalTime");
                    objc_msgSend(v29, "renderAtTime:inContext:withArguments:", v23, a5);
                  }
                }
                id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v32 objects:v41 count:16];
              }
              while (v26);
            }
            return [a4 retainedByUserImageByEndingLocalContext:v23 andRestoreState:v36];
          }
          objc_msgSend(objc_msgSend(v16, "plugAsParallel"), "sizeForParentAspectRatio:", self->super.mPixelSize.width / self->super.mPixelSize.height);
          if (v18 != 2.0 || v17 != 2.0) {
            goto LABEL_23;
          }
          id v13 = v16;
          if (![v16 isOpaque]) {
            goto LABEL_23;
          }
        }
      }
      id v12 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v12) {
        continue;
      }
      break;
    }
    a4 = v31;
    if (v13)
    {
      double v20 = [v13 renderingState];
      v20[244] = self->super.mRenderingState->var19;
      objc_msgSend(objc_msgSend(v13, "clock"), "externalTime");
      id v21 = objc_msgSend(v13, "retainedByUserRenderedImageAtTime:inContext:withArguments:", v31, a5);
      v20[244] = 0;
      if (v21)
      {
        id v22 = v21;
        if (![v21 isEmpty]) {
          return v22;
        }
        [v22 releaseByUser];
      }
      goto LABEL_24;
    }
  }
LABEL_27:
  if (mBackgroundColor[3] < 0.0)
  {
    if (self->super.mRenderingState->var19) {
      mBackgroundColor = (float *)[a4 backColor];
    }
    else {
      mBackgroundColor = 0;
    }
  }
  id v22 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserImageWithSize:andColor:", mBackgroundColor, 1.0, 1.0);
  [v22 setLabel:@"Marimba Parallelizer Background"];
  [v22 setClampMode:2];
  return v22;
}

@end