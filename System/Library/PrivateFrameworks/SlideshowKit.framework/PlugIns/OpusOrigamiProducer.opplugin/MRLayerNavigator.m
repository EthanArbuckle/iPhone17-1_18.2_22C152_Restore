@interface MRLayerNavigator
- (BOOL)_isNative3D;
- (BOOL)canTransitionToMoreSlides:(BOOL)a3;
- (BOOL)enterSlideFocusModeWithState:(id)a3;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)historyIsEnabled;
- (BOOL)isAlphaFriendly;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)isReadyToTransitionToNextSublayer;
- (BOOL)isTransitioning;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4;
- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4;
- (MRLayer)currentSublayer;
- (MRLayerNavigator)initWithParameters:(id)a3;
- (MRLayerNavigator)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (NSArray)sublayers;
- (double)abortTransition:(id)a3;
- (double)attemptToFinishTransition:(id)a3 didTransition:(BOOL *)a4 gotReversed:(BOOL *)a5;
- (double)currentSlideshowTime;
- (double)doActionTrigger:(id)a3;
- (double)doTransition:(id)a3 backwards:(BOOL)a4 pzr:(id)a5;
- (double)doTransition:(id)a3 backwards:(BOOL)a4 updateHistory:(BOOL)a5 deltaStartTime:(double)a6 pzr:(id)a7;
- (double)doTransition:(id)a3 withDeltaStartTime:(double)a4;
- (double)fastScrubCancel:(id)a3;
- (double)fastScrubEnd:(id)a3;
- (double)fastScrubStart:(id)a3;
- (double)fastScrubUpdate:(id)a3;
- (double)finishTransition:(id)a3;
- (double)forcedTransitionProgress;
- (double)goBack;
- (double)goForth;
- (double)gotoMoreSlidesWithAction:(id)a3 backwards:(BOOL)a4 animate:(BOOL)a5 canCatchCurrentTransition:(BOOL)a6;
- (double)gotoNextOrPreviousSlideInCurrentSublayer:(BOOL)a3;
- (double)gotoNextSublayer:(id)a3 animate:(BOOL)a4;
- (double)gotoPreviousSublayer:(id)a3 animate:(BOOL)a4;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)startMovingCurrentSublayer:(BOOL)a3;
- (double)transitionToNextSublayerWithDeltaStartTime:(double)a3;
- (id)_createSublayerForPlug:(id)a3;
- (id)_createSublayerForPrecomputingWithPlug:(id)a3;
- (id)_currentState;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)_transitionWithTransitionTrigger:(id)a3;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)sublayerForKey:(id)a3;
- (id)sublayerForPlugObjectID:(id)a3 recursive:(BOOL)a4;
- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5;
- (void)_createExtraSublayer;
- (void)_deleteSublayer:(id)a3;
- (void)_executeLayerCommandQueue;
- (void)_getInterestingTimesForSublayerControl;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_observeSublayer:(id)a3;
- (void)_precomputeAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_prerenderSublayersAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_registerTransitionForHistory:(id)a3 withDestinationPlugID:(id)a4 backwards:(BOOL)a5;
- (void)_removeExtraSublayer;
- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_resyncToSerializerForTime:(double)a3;
- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_unobserveSublayer:(id)a3;
- (void)activate;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)deactivate;
- (void)depreactivate:(BOOL)a3;
- (void)didFocusOnNextSlideWithState:(id)a3;
- (void)didFocusOnPreviousSlideWithState:(id)a3;
- (void)endMorphing;
- (void)endMovingCurrentSublayer;
- (void)endTransitionToSublayer;
- (void)exitSlideFocusModeWithState:(id)a3;
- (void)fillInNextSlideInformationInState:(id)a3;
- (void)fillInPreviousSlideInformationInState:(id)a3;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)jumpToNextMarker:(id)a3;
- (void)jumpToPreviousMarker:(id)a3;
- (void)jumpToSublayer:(id)mCurrentSublayer atTime:(double)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resyncToSerializer;
- (void)setForcedTransitionProgress:(double)a3;
- (void)setHistoryIsEnabled:(BOOL)a3;
- (void)setIsInInteractiveMode:(BOOL)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setSublayer:(id)a3 forKey:(id)a4;
- (void)synchronizeTime;
- (void)updateTransition:(id)a3;
@end

@implementation MRLayerNavigator

- (MRLayerNavigator)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)MRLayerNavigator;
  v5 = [(MRLayer *)&v8 initWithPlug:a3 andParameters:a4 inSuperlayer:a5];
  v6 = v5;
  if (v5)
  {
    v5->mContainer = [(MCPlug *)v5->super.mPlug container];
    objc_opt_class();
    v6->mIsSerializerBased = objc_opt_isKindOfClass() & 1;
    v6->mSublayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v6->mSublayersForPlugs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mNextSublayer = 0;
    v6->mCurrentSublayer = 0;
    v6->mCurrentTransition = 0;
    v6->mSublayerToPrecompute = 0;
    v6->mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
    v6->mForcedTransitionProgress = -1.0;
    v6->mPotentialTargetSublayers = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    if (!v6->super.mIsReadonly) {
      [(MRLayerNavigator *)v6 _observePlug];
    }
    [(MRLayerNavigator *)v6 observeValueForKeyPath:@"plugs" ofObject:v6->mContainer change:0 context:0];
  }
  return v6;
}

- (MRLayerNavigator)initWithParameters:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MRLayerNavigator;
  v3 = [(MRLayer *)&v5 initWithParameters:a3];
  if (v3)
  {
    v3->mSublayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v3->mSublayersForPlugs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v3->mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
    v3->mForcedTransitionProgress = -1.0;
    v3->mPotentialTargetSublayers = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  return v3;
}

- (void)cleanup
{
  if (self->super.mUUID)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if (self->mExtraSublayer) {
      [(MRLayerNavigator *)self _removeExtraSublayer];
    }
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
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          [(MRLayerNavigator *)self _unobserveSublayer:v8];
          [(MRLayerNavigator *)self _deleteSublayer:v8];
        }
        id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }

    self->mSublayersForPlugs = 0;
    self->mSublayers = 0;
    [(MRTransition *)self->mCurrentTransition releaseByTransitioner:self];
    self->mCurrentTransition = 0;

    self->mPotentialTargetSublayers = 0;
    objc_sync_exit(mSublayers);
    [(MRLayer *)self->mSublayerToPrecompute cleanup];

    self->mSublayerToPrecompute = 0;
    self->mHistoryBack = 0;

    self->mHistoryForth = 0;
    v10.receiver = self;
    v10.super_class = (Class)MRLayerNavigator;
    [(MRLayer *)&v10 cleanup];
    p_mContainer = &self->mContainer;

    *p_mContainer = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"plugs"])
  {
    long long v11 = (char *)objc_msgSend(objc_msgSend(a5, "objectForKey:", NSKeyValueChangeKindKey), "unsignedIntegerValue");
    v26 = a6;
    id v27 = a4;
    if (v11 == (unsigned char *)&dword_0 + 2)
    {
      id v20 = [a5 objectForKey:NSKeyValueChangeNewKey];
    }
    else
    {
      if (v11 == (unsigned char *)&dword_0 + 3)
      {
        id v12 = [a5 objectForKey:NSKeyValueChangeOldKey];
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v34;
          do
          {
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v34 != v15) {
                objc_enumerationMutation(v12);
              }
              v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              id v18 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", objc_msgSend(v17, "objectID", v26));
              if (([v18 isScheduledForDestruction] & 1) == 0)
              {
                [(MRLayerNavigator *)self _unobserveSublayer:v18];
                [v18 scheduleForDestruction];
                [(MRLayer *)self _queueLayerCommand:1 object:v17];
              }
            }
            id v14 = [v12 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }
          while (v14);
        }
        goto LABEL_28;
      }
      id v20 = [(MCContainer *)self->mContainer plugs];
    }
    v21 = v20;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16, a6);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v30;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v30 != v24) {
            objc_enumerationMutation(v21);
          }
          [(MRLayer *)self _queueLayerCommand:0 object:*(void *)(*((void *)&v29 + 1) + 8 * (void)j)];
        }
        id v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v23);
    }
    goto LABEL_28;
  }
  if (![a3 isEqualToString:@"container"]) {
    goto LABEL_30;
  }
  v26 = a6;
  id v19 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [a4 objectID]);
  if (([v19 isScheduledForDestruction] & 1) == 0)
  {
    [(MRLayerNavigator *)self _unobserveSublayer:v19];
    [v19 scheduleForDestruction];
    [(MRLayer *)self _queueLayerCommand:1 object:a4];
  }
  id v27 = a4;
  if ([a4 container]) {
    [(MRLayer *)self _queueLayerCommand:0 object:a4];
  }
LABEL_28:
  a6 = v26;
  a4 = v27;
  if (!self->super.mIsPrecomputing)
  {
    [(MRLayer *)self->super.mSuperlayer setNeedsUpdateForPluggerOfSublayer:self];
    [(MRLayer *)self stampTime];
  }
LABEL_30:
  v28.receiver = self;
  v28.super_class = (Class)MRLayerNavigator;
  -[MRLayer observeValueForKeyPath:ofObject:change:context:](&v28, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5, a6, v26);
}

- (void)setPixelSize:(CGSize)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MRLayerNavigator;
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
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) setNeedsToUpdateGeometry:1];
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v9 objects:v14 count:16];
    }
    while (v6);
  }
}

- (BOOL)hasSomethingToRender
{
  v6.receiver = self;
  v6.super_class = (Class)MRLayerNavigator;
  BOOL v3 = [(MRLayer *)&v6 hasSomethingToRender];
  if (v3)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    if (mCurrentSublayer && [(MRLayer *)mCurrentSublayer hasSomethingToRender])
    {
      LOBYTE(v3) = 1;
    }
    else if (self->mIsTransitioning)
    {
      LOBYTE(v3) = [(MRLayer *)self->mNextSublayer hasSomethingToRender];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)synchronizeTime
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v3 synchronizeTime];
  if ([(MRLayer *)self->mCurrentSublayer isPreactivated]) {
    [(MRLayer *)self->mCurrentSublayer synchronizeTime];
  }
  if ([(MRLayer *)self->mNextSublayer isPreactivated]) {
    [(MRLayer *)self->mNextSublayer synchronizeTime];
  }
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  if (self->mIsTransitioning) {
    [(MRLayerNavigator *)self endTransitionToSublayer];
  }
  [(MRLayer *)self->mCurrentSublayer beginMorphingToAspectRatio:a3 withDuration:a4];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  mPotentialTargetSublayers = self->mPotentialTargetSublayers;
  id v8 = [(NSMutableSet *)mPotentialTargetSublayers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(mPotentialTargetSublayers);
        }
        long long v12 = *(MRLayer **)(*((void *)&v13 + 1) + 8 * i);
        if (v12 != self->mCurrentSublayer) {
          [(MRLayer *)v12 beginMorphingToAspectRatio:a3 withDuration:a4];
        }
      }
      id v9 = [(NSMutableSet *)mPotentialTargetSublayers countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)endMorphing
{
  [(MRLayer *)self->mCurrentSublayer endMorphing];
  if (self->mIsTransitioning)
  {
    mNextSublayer = self->mNextSublayer;
    [(MRLayer *)mNextSublayer endMorphing];
  }
}

- (void)activate
{
  v4.receiver = self;
  v4.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v4 activate];
  mCurrentSublayer = self->mCurrentSublayer;
  if (mCurrentSublayer) {
    [(MRLayer *)mCurrentSublayer setTimeIn:0.0];
  }
}

- (void)deactivate
{
  if (self->mCurrentTransition) {
    [(MRLayerNavigator *)self endTransitionToSublayer];
  }
  if (self->mIsInnerTransitioning) {
    [(MRLayerNavigator *)self endMovingCurrentSublayer];
  }
  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges)
  {

    self->mTransitionChanges = 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  mSublayers = self->mSublayers;
  id v5 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(mSublayers);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isActivated]) {
          [v9 deactivate];
        }
      }
      id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  mSublayerToPrecompute = self->mSublayerToPrecompute;
  if (mSublayerToPrecompute)
  {
    [(MRLayer *)mSublayerToPrecompute deactivate];
    [(MRLayer *)self->mSublayerToPrecompute depreactivate:0];
    [(MRLayer *)self->mSublayerToPrecompute cleanup];

    self->mSublayerToPrecompute = 0;
    self->mPrecomputingTarget = 0;
    self->mPrecomputingType = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v11 deactivate];
}

- (void)depreactivate:(BOOL)a3
{
  BOOL v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  mSublayers = self->mSublayers;
  id v6 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(mSublayers);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v10 isPreactivated]) {
          [v10 depreactivate:v3];
        }
      }
      id v7 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  v11.receiver = self;
  v11.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v11 depreactivate:v3];
}

- (BOOL)isLoadedForTime:(double)a3
{
  v21.receiver = self;
  v21.super_class = (Class)MRLayerNavigator;
  unsigned int v5 = -[MRLayer isLoadedForTime:](&v21, "isLoadedForTime:");
  if (v5)
  {
    mCurrentTransition = self->mCurrentTransition;
    if (mCurrentTransition
      && [(NSString *)[(MRTransition *)mCurrentTransition transitionID] isEqualToString:@"SourceOver"]|| (v19 = 0u, v20 = 0u, v17 = 0u, v18 = 0u, mSublayers = self->mSublayers, (id v8 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v17 objects:v22 count:16]) == 0))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v18;
LABEL_6:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(mSublayers);
        }
        long long v12 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
        [v12 timeIn];
        double v14 = v13;
        if ([v12 isPreactivated])
        {
          double v15 = a3 - v14;
          if ([v12 shouldBeActivatedAtTime:v15])
          {
            unsigned int v5 = [v12 isLoadedForTime:v15];
            if (!v5) {
              break;
            }
          }
        }
        if (v9 == (id)++v11)
        {
          id v9 = [(NSMutableArray *)mSublayers countByEnumeratingWithState:&v17 objects:v22 count:16];
          LOBYTE(v5) = 1;
          if (v9) {
            goto LABEL_6;
          }
          return v5;
        }
      }
    }
  }
  return v5;
}

- (BOOL)isOpaque
{
  if (!self->mIsTransitioning) {
    goto LABEL_6;
  }
  if ([(MRTransition *)self->mCurrentTransition isOpaque]) {
    return 1;
  }
  if (self->mIsTransitioning) {
    return 0;
  }
LABEL_6:
  mCurrentSublayer = self->mCurrentSublayer;
  return [(MRLayer *)mCurrentSublayer isOpaque];
}

- (BOOL)isAlphaFriendly
{
  if (!self->mIsTransitioning) {
    goto LABEL_6;
  }
  if ([(MRTransition *)self->mCurrentTransition isAlphaFriendly]) {
    return 1;
  }
  if (self->mIsTransitioning) {
    return 0;
  }
LABEL_6:
  mCurrentSublayer = self->mCurrentSublayer;
  return [(MRLayer *)mCurrentSublayer isAlphaFriendly];
}

- (BOOL)isInfinite
{
  return ![(MCPlugParallel *)self->super.mPlugAsParallel clipsContainer];
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mLayerCommandQueueNeedsAttention) {
    [(MRLayerNavigator *)self _executeLayerCommandQueue];
  }
  v108.receiver = self;
  v108.super_class = (Class)MRLayerNavigator;
  unsigned int v8 = [(MRLayer *)&v108 prerenderForTime:a4 inContext:a5 withArguments:a3];
  id v9 = (char *)[(NSMutableArray *)self->mSublayers count];
  if (!v9) {
    goto LABEL_44;
  }
  if (v9 == (unsigned char *)&dword_0 + 1 && !self->mExtraSublayer)
  {
    [(MCPlug *)self->super.mPlug numberOfLoops];
    if (v10 > 1.0) {
      [(MRLayerNavigator *)self _createExtraSublayer];
    }
  }
  [(MRLayerClock *)self->super.mClock containerTime];
  double v12 = v11;
  mCurrentSublayer = self->mCurrentSublayer;
  mNextSublayer = self->mNextSublayer;
  mCurrentTransition = self->mCurrentTransition;
  id v14 = [a5 forcedState];
  if (!v14)
  {
    id v102 = 0;
    goto LABEL_17;
  }
  double v15 = v14;
  id v102 = [v14 objectForKey:@"currentSublayerState"];
  if (self->mIsSerializerBased)
  {
    id v16 = [v15 objectForKey:@"currentSublayerIndex"];
    if (!v16) {
      goto LABEL_17;
    }
    id v17 = -[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", (int)[v16 intValue]);
  }
  else
  {
    id v18 = [v15 objectForKey:@"currentSublayerID"];
    if (!v18) {
      goto LABEL_17;
    }
    id v17 = [(MCContainer *)self->mContainer plugForID:v18];
  }
  long long v19 = v17;
  if (v17)
  {
    [(MRLayerNavigator *)self endTransitionToSublayer];
    unsigned int v20 = v8;
    mSublayersForPlugs = self->mSublayersForPlugs;
    id v22 = [v19 objectID];
    id v23 = mSublayersForPlugs;
    unsigned int v8 = v20;
    self->mCurrentSublayer = (MRLayer *)[(NSMutableDictionary *)v23 objectForKey:v22];
    objc_msgSend(objc_msgSend(v102, "objectForKey:", @"timeIn"), "doubleValue");
    -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:");
    self->mNeedsToUpdatePotentialTargetSublayers = 1;
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
  }
LABEL_17:
  if ((([a5 timeWasSet] & 1) != 0 || self->mNeedsToResyncToSerializer)
    && self->mIsSerializerBased)
  {
    goto LABEL_20;
  }
  if (self->mIsTransitioning) {
    goto LABEL_22;
  }
  if (self->mCurrentSublayer)
  {
    if ([(MRLayerClock *)self->super.mClock jumpedBackInTime]
      || ![(MRLayer *)self->mCurrentSublayer isPreactivated])
    {
      [(MRLayer *)self->mCurrentSublayer timeIn];
      if (v12 < v40) {
        [(MRLayer *)self->mCurrentSublayer setTimeIn:v12];
      }
    }
    goto LABEL_22;
  }
  if (self->mIsSerializerBased)
  {
LABEL_20:
    [(MRLayerNavigator *)self _resyncToSerializerForTime:v12];
    goto LABEL_22;
  }
  mContainer = self->mContainer;
  if (mContainer)
  {
    v78 = (MRLayer *)-[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", objc_msgSend(-[MCContainer startPlug](mContainer, "startPlug"), "objectID"));
  }
  else
  {
    if (![(NSMutableArray *)self->mSublayers count])
    {
      v78 = self->mCurrentSublayer;
      goto LABEL_154;
    }
    v78 = (MRLayer *)[(NSMutableArray *)self->mSublayers objectAtIndex:0];
  }
  self->mCurrentSublayer = v78;
LABEL_154:
  double v99 = 0.0;
  if (self->super.mIsActivated) {
    double v99 = v12;
  }
  [(MRLayer *)v78 setTimeIn:v99];
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
LABEL_22:
  self->int mElementToDraw = 0;
  [(MRLayerNavigator *)self _prerenderSublayersAtTime:a4 inContext:a5 withArguments:a3];
  uint64_t v24 = self->mCurrentSublayer;
  if (v24 != mCurrentSublayer
    || self->mCurrentTransition != mCurrentTransition
    || self->mIsTransitioning && self->mNextSublayer != mNextSublayer)
  {
    unsigned int v8 = 1;
  }
  if (!v24 && !self->mIsTransitioning)
  {
LABEL_44:
    LOBYTE(v8) = 0;
    return v8;
  }
  if (self->mIsSerializerBased)
  {
    if (!self->mHasWarnedDelegateAboutNearingEnd)
    {
      v25 = mCurrentSublayer;
      v26 = (char *)[(MCPlugSerial *)[(MRLayer *)v24 plugAsSerial] index] + 3;
      BOOL v27 = v26 >= [(NSMutableArray *)self->mSublayers count];
      mCurrentSublayer = v25;
      if (v27)
      {
        self->mHasWarnedDelegateAboutNearingEnd = 1;
        [(MRRenderer *)self->super.mRenderer nearingEndForSerializer:self->mContainer];
      }
    }
    uint64_t v24 = self->mCurrentSublayer;
    if (self->mIsSerializerBased)
    {
      if (v24 == mCurrentSublayer && !self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn)
      {
        uint64_t v24 = mCurrentSublayer;
      }
      else
      {
        id v28 = a4;
        unsigned int v29 = v8;
        id v30 = [(MCContainer *)self->mContainer orderedPlugs];
        long long v104 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        id v31 = [v30 countByEnumeratingWithState:&v104 objects:v109 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v105;
          double v34 = 0.0;
LABEL_37:
          uint64_t v35 = 0;
          while (1)
          {
            if (*(void *)v105 != v33) {
              objc_enumerationMutation(v30);
            }
            long long v36 = *(MCPlug **)(*((void *)&v104 + 1) + 8 * v35);
            if (v36 == [(MRLayer *)self->mCurrentSublayer plug]) {
              break;
            }
            [(MCPlug *)v36 fullDuration];
            double v38 = v37;
            [(MCPlug *)v36 transitionDuration];
            double v34 = v34 + v38 - v39;
            if (v32 == (id)++v35)
            {
              id v32 = [v30 countByEnumeratingWithState:&v104 objects:v109 count:16];
              if (v32) {
                goto LABEL_37;
              }
              break;
            }
          }
        }
        else
        {
          double v34 = 0.0;
        }
        self->_double currentSublayerTheoreticalTimeIn = v34;
        self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = 0;
        uint64_t v24 = self->mCurrentSublayer;
        unsigned int v8 = v29;
        a4 = v28;
      }
    }
  }
  [(MRLayer *)v24 timeIn];
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setExternalTime:v12 - v41];
  if (!self->mIsTransitioning || !self->mCurrentTransition)
  {
    if (v102)
    {
      id v56 = [v102 objectForKey:@"persistentState"];
      if (v56) {
        [(MRLayer *)self->mCurrentSublayer _applyState:v56];
      }
      [a5 setForcedState:v102];
    }
    if (!self->mIsInnerTransitioning)
    {
      if ([(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] selfIsPaused])
      {
        v64 = self->mCurrentSublayer;
        [(MRLayerClock *)[(MRLayer *)v64 clock] containerTime];
        if (-[MRLayer isLoadedForTime:](v64, "isLoadedForTime:")) {
          [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] resumeOnNextUpdate];
        }
      }
      goto LABEL_112;
    }
    double mForcedTransitionProgress = self->mForcedTransitionProgress;
    if (mForcedTransitionProgress < 0.0) {
      double mForcedTransitionProgress = fmin(v12 - self->mTransitionStartTime, 1.0);
    }
    if (self->mTransitionWasAborted) {
      double mForcedTransitionProgress = 1.0 - mForcedTransitionProgress;
    }
    if (self->mTransitionIsBackwards)
    {
      double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime;
      if (self->mCurrentSublayerContainerTimeOnTransitionStart >= mCurrentSublayerInterestingTime) {
        double mCurrentSublayerContainerTimeOnTransitionStart = self->mCurrentSublayerContainerTimeOnTransitionStart;
      }
      else {
        double mCurrentSublayerContainerTimeOnTransitionStart = self->mCurrentSublayerInterestingTime;
      }
      double mTotalMotionDuration = self->mTotalMotionDuration;
      double v61 = mForcedTransitionProgress * mTotalMotionDuration;
      double mCurrentSublayerLazyFactor = self->mCurrentSublayerLazyFactor;
      double v63 = (mCurrentSublayerContainerTimeOnTransitionStart - mCurrentSublayerInterestingTime)
          * mCurrentSublayerLazyFactor;
      if (mForcedTransitionProgress * mTotalMotionDuration < v63)
      {
        if (mCurrentSublayerLazyFactor > 0.0) {
          double mCurrentSublayerContainerTimeOnTransitionStart = mCurrentSublayerContainerTimeOnTransitionStart
        }
                                                         - v61 / mCurrentSublayerLazyFactor;
        goto LABEL_111;
      }
      double mNextSublayerLazyDuration = self->mNextSublayerLazyDuration;
      double mNextSublayerLazyFactor = self->mNextSublayerLazyFactor;
      if (v61 <= mTotalMotionDuration - mNextSublayerLazyDuration * mNextSublayerLazyFactor)
      {
        double mCurrentSublayerContainerTimeOnTransitionStart = mNextSublayerLazyDuration
                                                       + self->mNextSublayerInterestingTime
                                                       + self->mTransitionDuration
                                                       * (1.0
                                                        - -(v63 - mForcedTransitionProgress * mTotalMotionDuration)
                                                        / self->mTransitionDuration);
        goto LABEL_111;
      }
      double mCurrentSublayerContainerTimeOnTransitionStart = self->mNextSublayerInterestingTime;
      if (mNextSublayerLazyFactor > 0.0)
      {
        double v69 = (1.0 - mForcedTransitionProgress) * mTotalMotionDuration / mNextSublayerLazyFactor;
        goto LABEL_100;
      }
    }
    else
    {
      double v66 = self->mTotalMotionDuration;
      double v67 = self->mCurrentSublayerLazyFactor;
      double v68 = self->mCurrentSublayerLazyDuration * v67;
      if (mForcedTransitionProgress * v66 >= v68)
      {
        double mCurrentSublayerContainerTimeOnTransitionStart = self->mNextSublayerInterestingTime
                                                       - self->mTransitionDuration
                                                       * (1.0
                                                        - -(v68 - mForcedTransitionProgress * v66)
                                                        / self->mTransitionDuration);
        goto LABEL_111;
      }
      double mCurrentSublayerContainerTimeOnTransitionStart = self->mCurrentSublayerInterestingTime;
      if (v67 > 0.0)
      {
        double v69 = mForcedTransitionProgress * v66 / v67;
LABEL_100:
        double mCurrentSublayerContainerTimeOnTransitionStart = v69 + mCurrentSublayerContainerTimeOnTransitionStart;
      }
    }
LABEL_111:
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:mCurrentSublayerContainerTimeOnTransitionStart];
LABEL_112:
    v82 = self->mCurrentSublayer;
    [(MRLayerClock *)[(MRLayer *)v82 clock] externalTime];
    v8 |= -[MRLayer prerenderForTime:inContext:withArguments:](v82, "prerenderForTime:inContext:withArguments:", a4, a5);
    self->int mElementToDraw = 1;
    goto LABEL_131;
  }
  double v42 = self->mForcedTransitionProgress;
  if (v42 < 0.0)
  {
    double v43 = self->mTotalMotionDuration;
    double v42 = 1.0;
    if (v43 > 0.0) {
      double v42 = (v12 - self->mTransitionStartTime) / v43;
    }
  }
  if (self->mTransitionWasAborted) {
    double v44 = 1.0 - v42;
  }
  else {
    double v44 = v42;
  }
  [(MRLayer *)self->mNextSublayer timeIn];
  double v46 = v12 - v45;
  if (v46 >= 0.0) {
    double v47 = v46;
  }
  else {
    double v47 = 0.0;
  }
  [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] setExternalTime:v47];
  if (!self->mControlsSublayerTimes)
  {
    if (self->mTransitionIsBackwards) {
      double v65 = 1.0 - v44;
    }
    else {
      double v65 = v44;
    }
    if (![(MRTransition *)self->mCurrentTransition prerenderForTime:a4 inContext:a5 withArguments:v65])
    {
LABEL_121:
      unsigned __int8 v76 = 3;
      goto LABEL_128;
    }
LABEL_119:
    if (v65 != self->_previouslyRenderedTransitionProgress) {
      LOBYTE(v8) = 1;
    }
    goto LABEL_121;
  }
  double v48 = self->mTotalMotionDuration;
  double v49 = v44 * v48;
  if (self->mTransitionIsBackwards)
  {
    double v50 = self->mCurrentSublayerContainerTimeOnTransitionStart;
    double v51 = self->mCurrentSublayerLazyFactor;
    double v52 = (v50 - self->mCurrentSublayerInterestingTime) * v51;
    if (v49 >= v52)
    {
      double v79 = self->mNextSublayerLazyFactor;
      if (v49 <= v48 - self->mNextSublayerLazyDuration * v79)
      {
        double mTransitionDuration = self->mTransitionDuration;
        double v87 = 1.0 - -(v52 - v44 * v48) / mTransitionDuration;
        [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:mTransitionDuration * v87];
        [(MRLayer *)self->mNextSublayer duration];
        double v89 = (1.0 - v87) * self->mTransitionDuration;
        if (v89 < 0.001) {
          double v89 = 0.001;
        }
        [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] setContainerTime:v88 - v89];
        if ([(MRTransition *)self->mCurrentTransition prerenderForTime:a4 inContext:a5 withArguments:v87]&& v87 != self->_previouslyRenderedTransitionProgress)
        {
          LOBYTE(v8) = 1;
        }
        unsigned __int8 v76 = 3;
      }
      else
      {
        [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] setContainerTime:(1.0 - v44) * v48 / v79 + self->mNextSublayerInterestingTime];
        v80 = self->mCurrentSublayer;
        [(MRLayerClock *)[(MRLayer *)v80 clock] externalTime];
        -[MRLayer prerenderForTime:inContext:withArguments:](v80, "prerenderForTime:inContext:withArguments:", a4, a5);
        v81 = self->mNextSublayer;
        [(MRLayerClock *)[(MRLayer *)v81 clock] externalTime];
        v8 |= -[MRLayer prerenderForTime:inContext:withArguments:](v81, "prerenderForTime:inContext:withArguments:", a4, a5);
        unsigned __int8 v76 = 2;
      }
      goto LABEL_128;
    }
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:v50 - v49 / v51];
    v53 = self->mCurrentSublayer;
    [(MRLayerClock *)[(MRLayer *)v53 clock] externalTime];
    v54 = v53;
    id v55 = a4;
    goto LABEL_103;
  }
  double v72 = self->mCurrentSublayerLazyFactor;
  double v73 = self->mCurrentSublayerLazyDuration * v72;
  if (v49 >= v73)
  {
    double v83 = self->mTransitionDuration;
    double v65 = 1.0;
    if (v83 > 0.0) {
      double v65 = -(v73 - v44 * v48) / v83;
    }
    [(MRLayer *)self->mCurrentSublayer duration];
    double v85 = (1.0 - v65) * self->mTransitionDuration;
    if (v85 < 0.001) {
      double v85 = 0.001;
    }
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:v84 - v85];
    [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] setContainerTime:v65 * self->mTransitionDuration];
    if (![(MRTransition *)self->mCurrentTransition prerenderForTime:a4 inContext:a5 withArguments:v65])goto LABEL_121; {
    goto LABEL_119;
    }
  }
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:v49 / v72 + self->mCurrentSublayerInterestingTime];
  v74 = self->mCurrentSublayer;
  [(MRLayerClock *)[(MRLayer *)v74 clock] externalTime];
  v54 = v74;
  id v55 = a4;
LABEL_103:
  v8 |= -[MRLayer prerenderForTime:inContext:withArguments:](v54, "prerenderForTime:inContext:withArguments:", v55, a5);
  v75 = self->mNextSublayer;
  [(MRLayerClock *)[(MRLayer *)v75 clock] externalTime];
  -[MRLayer prerenderForTime:inContext:withArguments:](v75, "prerenderForTime:inContext:withArguments:", a4, a5);
  unsigned __int8 v76 = 1;
LABEL_128:
  self->int mElementToDraw = v76;
  if ([(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] jumpedBackInTime]
    && !self->mControlsSublayerTimes)
  {
    [(MRLayer *)self->mNextSublayer synchronizeTime];
  }
LABEL_131:
  if ([(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] jumpedBackInTime]
    && !self->mControlsSublayerTimes)
  {
    [(MRLayer *)self->mCurrentSublayer synchronizeTime];
  }
  [(MRLayerNavigator *)self _preprecomputeAtTime:a4 inContext:a5 withArguments:a3];
  if (self->super.mIsActivated)
  {
    if (self->mIsSerializerBased)
    {
      v90 = self->mNextSublayer;
      if (v90 && ![(MCPlugSerial *)[(MRLayer *)v90 plugAsSerial] index])
      {
        [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] containerTime];
      }
      else
      {
        double currentSublayerTheoreticalTimeIn = self->_currentSublayerTheoreticalTimeIn;
        [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
        double v93 = currentSublayerTheoreticalTimeIn + v92;
      }
      self->_currentSlideshowTime = v93;
    }
    int mElementToDraw = self->mElementToDraw;
    switch(mElementToDraw)
    {
      case 3:
        v96 = [(MRLayer *)self->mCurrentSublayer renderingState];
        *(_OWORD *)&v96->var4 = xmmword_164F60;
        *(_OWORD *)&v96->var8 = xmmword_164F50;
        *(_OWORD *)&v96->var0 = xmmword_164F70;
        v95 = self->mNextSublayer;
        if (v95) {
          goto LABEL_149;
        }
        break;
      case 2:
        v95 = self->mNextSublayer;
        goto LABEL_149;
      case 1:
        v95 = self->mCurrentSublayer;
LABEL_149:
        v97 = [(MRLayer *)v95 renderingState];
        *(_OWORD *)&v97->var4 = xmmword_164F60;
        *(_OWORD *)&v97->var8 = xmmword_164F50;
        *(_OWORD *)&v97->var0 = xmmword_164F70;
        break;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    self->_currentSlideshowTime = 0.0;
  }
  return v8;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mPixelSize.width <= 0.0 || self->super.mPixelSize.height <= 0.0) {
    return 0;
  }
  int mElementToDraw = self->mElementToDraw;
  if (mElementToDraw == 3)
  {
    mCurrentTransition = self->mCurrentTransition;
    [(MRTransition *)mCurrentTransition progress];
    id v11 = -[MRTransition patchworkAtTime:inContext:withArguments:](mCurrentTransition, "patchworkAtTime:inContext:withArguments:", a4, a5);
    [(MRTransition *)self->mCurrentTransition progress];
    self->_previouslyRenderedTransitionProgress = v14;
    if (!v11) {
      goto LABEL_13;
    }
  }
  else
  {
    if (mElementToDraw == 2)
    {
      uint64_t v10 = 240;
    }
    else
    {
      if (mElementToDraw != 1)
      {
LABEL_13:
        v16.receiver = self;
        v16.super_class = (Class)MRLayerNavigator;
        return [(MRLayer *)&v16 patchworkAtTime:a4 inContext:a5 withArguments:a3];
      }
      uint64_t v10 = 496;
    }
    double v15 = *(Class *)((char *)&self->super.super.isa + v10);
    objc_msgSend(objc_msgSend(v15, "clock"), "externalTime");
    id v11 = objc_msgSend(v15, "patchworkAtTime:inContext:withArguments:", a4, a5);
    if (!v11) {
      goto LABEL_13;
    }
  }
  return v11;
}

- (NSArray)sublayers
{
  if (!self->mExtraSublayer) {
    return &self->mSublayers->super;
  }
  id v2 = [(NSMutableArray *)self->mSublayers objectAtIndex:0];
  return +[NSArray arrayWithObject:v2];
}

- (id)sublayerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5
{
  if (!self->super.mIsActivated) {
    return 0;
  }
  if (!self->mCurrentSublayer) {
    return 0;
  }
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  if (self->mIsTransitioning)
  {
    if ([(MRLayer *)self->mNextSublayer isActivated])
    {
      [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] externalTime];
      double v11 = v10;
      [(MRRenderer *)self->super.mRenderer timeQuantum];
      if (v11 > v12 + v12) {
        return 0;
      }
    }
  }
  if (self->super.mRenderingState->var18) {
    double y = -y;
  }
  CGPoint v14 = (CGPoint)0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id result = -[MRLayer sublayerHitAtPoint:onlyIfHitElement:localPoint:](self->mCurrentSublayer, "sublayerHitAtPoint:onlyIfHitElement:localPoint:", v7, &v14, x, y);
    if (!a5) {
      return result;
    }
    goto LABEL_16;
  }
  if (!v7
    || (id result = -[MRLayer elementHitAtPoint:localPoint:](self->mCurrentSublayer, "elementHitAtPoint:localPoint:", 0, x, y)) != 0)
  {
    id result = self->mCurrentSublayer;
    v14.double x = x;
    v14.double y = y;
    if (a5)
    {
LABEL_16:
      if (result) {
        *a5 = v14;
      }
    }
  }
  return result;
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

- (BOOL)_isNative3D
{
  if (self->mIsFastScrubbing) {
    return 1;
  }
  if (self->mIsTransitioning && self->mCurrentTransition) {
    mCurrentTransition = self->mCurrentTransition;
  }
  else {
    mCurrentTransition = self->mCurrentSublayer;
  }
  return [mCurrentTransition isNative3D];
}

- (id)sublayerForKey:(id)a3
{
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3052000000;
  double v15 = sub_5F4C8;
  objc_super v16 = sub_5F4D8;
  uint64_t v17 = 0;
  if (a3)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    mContainer = self->mContainer;
    if (mContainer)
    {
      if (self->mIsSerializerBased) {
        id v7 = -[MCContainer plugAtIndex:](mContainer, "plugAtIndex:", (int)[a3 intValue]);
      }
      else {
        id v7 = [(MCContainer *)self->mContainer plugForID:a3];
      }
      if (v7) {
        id v7 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [v7 objectID]);
      }
      v13[5] = (uint64_t)v7;
    }
    else
    {
      id v9 = self->mSublayers;
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_5F4E4;
      v11[3] = &unk_1AAE58;
      v11[4] = a3;
      v11[5] = &v12;
      [(NSMutableArray *)v9 enumerateObjectsUsingBlock:v11];
    }
    objc_sync_exit(mSublayers);
    uint64_t v8 = (void *)v13[5];
  }
  else
  {
    uint64_t v8 = 0;
  }
  _Block_object_dispose(&v12, 8);
  return v8;
}

- (void)setSublayer:(id)a3 forKey:(id)a4
{
  [(MRLayerNavigator *)self _removeExtraSublayer];
  id v8 = -[MCObject _initWithObjectID:]([MCPlugHaven alloc], "_initWithObjectID:", [a3 uuid]);
  [a3 setIdInSupercontainer:a4];
  [v8 setIDInSupercontainer:a4];
  [v8 setPreactivatesWithParent:1];
  [v8 setLoopDuration:1.0e10];
  [a3 _setPlug:v8 andSuperlayer:self];
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [(NSMutableArray *)self->mSublayers addObject:a3];
  -[NSMutableDictionary setObject:forKey:](self->mSublayersForPlugs, "setObject:forKey:", a3, [a3 uuid]);
  [(MRLayerNavigator *)self _observeSublayer:a3];
  objc_sync_exit(mSublayers);
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
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v10 = self->mSublayers;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v17;
LABEL_7:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(MRLayer **)(*((void *)&v16 + 1) + 8 * v13);
        if (v14 != self->mExtraSublayer && (objc_opt_respondsToSelector() & 1) != 0)
        {
          id v8 = [(MRLayer *)v14 sublayerForPlugObjectID:a3 recursive:1];
          if (v8) {
            break;
          }
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v11) {
            goto LABEL_7;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      id v8 = 0;
    }
  }
  objc_sync_exit(mSublayers);
  return v8;
}

- (double)doActionTrigger:(id)a3
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  id v5 = [a3 mcAction];
  if (objc_msgSend(objc_msgSend(v5, "actionKey"), "isEqualToString:", @"gotoNext"))
  {
    [(MRLayerNavigator *)self gotoNextSublayer:a3 animate:1];
  }
  else if (objc_msgSend(objc_msgSend(v5, "actionKey"), "isEqualToString:", @"gotoPrevious"))
  {
    [(MRLayerNavigator *)self gotoPreviousSublayer:a3 animate:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)MRLayerNavigator;
    [(MRLayer *)&v7 doActionTrigger:a3];
  }
  return result;
}

- (void)updateTransition:(id)a3
{
  if (self->super.mIsActivated && (self->mCurrentTransition || self->mIsInnerTransitioning))
  {
    id v5 = (double *)[a3 specificObject];
    id v6 = v5;
    if (self->mNextSublayer || self->mIsInnerTransitioning)
    {
      BOOL mTransitionStartedWithNext = self->mTransitionStartedWithNext;
      double v8 = v5[4];
      if (self->mTransitionStartedWithNext) {
        double v8 = -v8;
      }
      double v9 = self->mForcedTransitionProgressOffset + v8 * 0.5 * 1.5;
    }
    else
    {
      BOOL mTransitionStartedWithNext = self->mTransitionStartedWithNext;
      double v14 = v5[4];
      if (mTransitionStartedWithNext == v14 >= 0.0) {
        double v15 = -1.0;
      }
      else {
        double v15 = 1.0;
      }
      double v9 = self->mForcedTransitionProgressOffset + v15 * (sqrt(fabs(v14) * 0.5 * 1.5 + 1.0) + -1.0);
    }
    if (v9 > 1.0) {
      double v9 = 1.0;
    }
    self->double mForcedTransitionProgress = v9;
    double v10 = v5[13];
    if (v10 != -10.0)
    {
      if (mTransitionStartedWithNext) {
        double v10 = -v10;
      }
      double v9 = self->mForcedTransitionProgressOffset + v10;
      if (v9 > 1.0) {
        double v9 = 1.0;
      }
      self->double mForcedTransitionProgress = v9;
    }
    if (self->mTransitionIsSubzero)
    {
      double v9 = -v9;
      self->double mForcedTransitionProgress = v9;
    }
    if (v9 >= 0.0)
    {
      if (v9 > 1.0) {
        self->double mForcedTransitionProgress = 1.0;
      }
    }
    else if (self->mTransitionIsNextPrevious {
           && ![(MRTransition *)self->mCurrentTransition dependsOnFingerPosition])
    }
    {
      int mTransitionIsSubzero = self->mTransitionIsSubzero;
      int v12 = self->mTransitionStartedWithNext;
      -[MRTransition pzrCancel:](self->mCurrentTransition, "pzrCancel:", [a3 specificObject]);
      self->mTransitionWasAborted = 1;
      double v13 = -self->mForcedTransitionProgress;
      if (self->mIsInnerTransitioning) {
        [(MRLayerNavigator *)self endMovingCurrentSublayer];
      }
      else {
        [(MRLayerNavigator *)self endTransitionToSublayer];
      }
      [(MRLayerNavigator *)self gotoMoreSlidesWithAction:a3 backwards:mTransitionIsSubzero != v12 animate:1 canCatchCurrentTransition:0];
      self->double mForcedTransitionProgress = v13;
      self->BOOL mTransitionStartedWithNext = v12;
      self->int mTransitionIsSubzero = mTransitionIsSubzero ^ 1;
    }
    else
    {
      self->double mForcedTransitionProgress = 0.0;
    }
    mCurrentTransition = self->mCurrentTransition;
    if (mCurrentTransition)
    {
      [(MRTransition *)mCurrentTransition pzrUpdate:v6];
    }
  }
}

- (double)attemptToFinishTransition:(id)a3 didTransition:(BOOL *)a4 gotReversed:(BOOL *)a5
{
  double v9 = (double *)[a3 specificObject];
  double mForcedTransitionProgressOffset = self->mForcedTransitionProgressOffset;
  double v11 = v9[4];
  double v12 = mForcedTransitionProgressOffset + v11 * 0.5 * 1.5;
  double v13 = mForcedTransitionProgressOffset + v11 * -0.5 * 1.5;
  if (self->mTransitionStartedWithNext)
  {
    double v12 = v13;
    double v14 = -v9[8];
  }
  else
  {
    double v14 = v9[8];
  }
  double v15 = v9[13];
  if (v15 != -10.0)
  {
    double v16 = -v15;
    if (!self->mTransitionStartedWithNext) {
      double v16 = v9[13];
    }
    double v17 = mForcedTransitionProgressOffset + v16;
    double v14 = -v9[14];
    if (!self->mTransitionStartedWithNext) {
      double v14 = v9[14];
    }
    double v12 = 1.0;
    if (v17 <= 1.0) {
      double v12 = v17;
    }
  }
  double v18 = -v12;
  if (self->mTransitionIsSubzero) {
    double v14 = -v14;
  }
  else {
    double v18 = v12;
  }
  if (self->mNextSublayer || self->mIsInnerTransitioning)
  {
    BOOL v19 = v18 < 0.35;
    if (v14 >= 4.0) {
      BOOL v19 = 0;
    }
    if (v14 < -0.1) {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 1;
  }
  if (*((unsigned char *)v9 + 120)) {
    BOOL v19 = v18 < 0.0;
  }
  if (a4) {
    *a4 = !v19;
  }
  if (v19)
  {
    [(MRLayerNavigator *)self abortTransition:a3];
  }
  else
  {
    if (a5) {
      *a5 = self->mTransitionIsSubzero;
    }
    [(MRLayerNavigator *)self finishTransition:a3];
  }
  return result;
}

- (double)finishTransition:(id)a3
{
  double v3 = 0.0;
  if (!self->super.mIsActivated
    || !self->mCurrentTransition && !self->mIsInnerTransitioning && !self->mTransitionChanges
    || self->mForcedTransitionProgress < 0.0)
  {
    return v3;
  }
  id v6 = (double *)[a3 specificObject];
  BOOL mIsInnerTransitioning = self->mIsInnerTransitioning;
  if (v6)
  {
    double v8 = 1.0;
    if (!self->mIsInnerTransitioning) {
      double v8 = 1.0 / self->mTotalMotionDuration;
    }
    if (v6[13] == -10.0)
    {
      double v10 = v6[8];
      if (self->mTransitionStartedWithNext) {
        double v10 = -v10;
      }
      double v9 = v10 * 0.5 * 1.5;
    }
    else
    {
      double v9 = v6[14];
      if (self->mTransitionStartedWithNext) {
        double v9 = -v9;
      }
    }
    if (v9 >= v8)
    {
      double v8 = v9;
      if (v9 > 5.0) {
        double v8 = 5.0;
      }
    }
    self->double mTotalMotionDuration = 1.0 / v8;
    self->double mTransitionDuration = 1.0 / v8;
    double v3 = (1.0 - self->mForcedTransitionProgress) / v8;
    if (mIsInnerTransitioning) {
      goto LABEL_22;
    }
LABEL_24:
    [(MRLayerClock *)self->super.mClock containerTime];
    double v12 = v13 - self->mTotalMotionDuration * self->mForcedTransitionProgress;
    goto LABEL_25;
  }
  if (!self->mIsInnerTransitioning)
  {
    double v3 = self->mTotalMotionDuration * (1.0 - self->mForcedTransitionProgress);
    goto LABEL_24;
  }
  double v3 = 1.0 - self->mForcedTransitionProgress;
LABEL_22:
  [(MRLayerClock *)self->super.mClock containerTime];
  double v12 = v11 - self->mForcedTransitionProgress;
LABEL_25:
  self->mTransitionStartTime = v12;
  self->double mForcedTransitionProgress = -1.0;
  self->double mForcedTransitionProgressOffset = 0.0;
  mCurrentTransition = self->mCurrentTransition;
  if (mCurrentTransition) {
    -[MRTransition pzrEnd:](mCurrentTransition, "pzrEnd:", [a3 specificObject]);
  }
  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges) {
    [(MRTransitionChanges *)mTransitionChanges setPzr:0];
  }
  return v3;
}

- (double)abortTransition:(id)a3
{
  double mForcedTransitionProgress = 0.0;
  if (self->super.mIsActivated
    && (self->mCurrentTransition || self->mIsInnerTransitioning || self->mTransitionChanges)
    && self->mForcedTransitionProgress >= 0.0)
  {
    self->mTransitionWasAborted = 1;
    BOOL mIsInnerTransitioning = self->mIsInnerTransitioning;
    [(MRLayerClock *)self->super.mClock containerTime];
    if (mIsInnerTransitioning) {
      double v8 = v7 - (1.0 - self->mForcedTransitionProgress);
    }
    else {
      double v8 = v7 - self->mTotalMotionDuration * (1.0 - self->mForcedTransitionProgress);
    }
    self->mTransitionStartTime = v8;
    if (self->mIsInnerTransitioning) {
      double mForcedTransitionProgress = self->mForcedTransitionProgress;
    }
    else {
      double mForcedTransitionProgress = self->mTotalMotionDuration * self->mForcedTransitionProgress;
    }
    mCurrentTransition = self->mCurrentTransition;
    if (mCurrentTransition) {
      -[MRTransition pzrCancel:](mCurrentTransition, "pzrCancel:", [a3 specificObject]);
    }
    self->double mForcedTransitionProgress = -1.0;
    self->double mForcedTransitionProgressOffset = 0.0;
    [(MCPlug *)[(MRLayer *)self->mCurrentSublayer plug] fullDuration];
    -[MRLayer setDuration:](self->mCurrentSublayer, "setDuration:");
  }
  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges)
  {

    self->mTransitionChanges = 0;
  }
  return mForcedTransitionProgress;
}

- (double)doTransition:(id)a3 backwards:(BOOL)a4 updateHistory:(BOOL)a5 deltaStartTime:(double)a6 pzr:(id)a7
{
  if (!self->super.mIsPreactivated) {
    return 0.0;
  }
  BOOL v9 = a5;
  BOOL v10 = a4;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  double v14 = -[MRLayerNavigator sublayerForKey:](self, "sublayerForKey:", [a3 transitionDestinationPlugID]);
  mExtraSublayer = v14;
  if (self->super.mIsActivated && (mCurrentSublayer = self->mCurrentSublayer) != 0)
  {
    if (self->mIsTransitioning)
    {
      [(MRLayerNavigator *)self endTransitionToSublayer];
      mCurrentSublayer = self->mCurrentSublayer;
    }
    if (mExtraSublayer == mCurrentSublayer && self->mExtraSublayer) {
      mExtraSublayer = self->mExtraSublayer;
    }
    if (![(MRLayer *)mExtraSublayer isPreactivated]) {
      [(MRLayer *)mExtraSublayer preactivate];
    }
    if (a7 && ![(MRLayer *)mExtraSublayer hasSlides]) {
      mExtraSublayer = 0;
    }
    double v17 = self->mCurrentSublayer;
    if (mExtraSublayer == v17)
    {
      double v23 = 0.0;
    }
    else
    {
      if (self->mHistoryIsEnabled && v9) {
        [(MRLayerNavigator *)self _registerTransitionForHistory:a3 withDestinationPlugID:[(MRLayer *)v17 idInSupercontainer] backwards:v10];
      }
      mTransitionChanges = self->mTransitionChanges;
      if (mTransitionChanges) {

      }
      BOOL v19 = objc_alloc_init(MRTransitionChanges);
      self->mTransitionChanges = v19;
      [(MRTransitionChanges *)v19 setTransition:a3];
      [(MRTransitionChanges *)self->mTransitionChanges setCurrentSublayer:v17];
      [(MRTransitionChanges *)self->mTransitionChanges setNextSublayer:mExtraSublayer];
      [(MRLayerClock *)self->super.mClock containerTime];
      self->mTransitionChanges->startTime = v20 - a6;
      [a3 transitionDuration];
      self->mTransitionChanges->duration = v21;
      self->mTransitionChanges->isBackwards = v10;
      [(MRTransitionChanges *)self->mTransitionChanges setPzr:a7];
      [a3 transitionDuration];
      double v23 = v22;
    }
  }
  else
  {
    double v23 = 0.0;
    if (v14)
    {
      self->mCurrentSublayer = v14;
      self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
    }
  }
  objc_sync_exit(mSublayers);
  return v23;
}

- (double)doTransition:(id)a3 withDeltaStartTime:(double)a4
{
  [(MRLayerNavigator *)self doTransition:a3 backwards:0 updateHistory:0 deltaStartTime:0 pzr:a4];
  return result;
}

- (double)doTransition:(id)a3 backwards:(BOOL)a4 pzr:(id)a5
{
  [(MRLayerNavigator *)self doTransition:a3 backwards:a4 updateHistory:1 deltaStartTime:a5 pzr:0.0];
  return result;
}

- (void)jumpToSublayer:(id)mCurrentSublayer atTime:(double)a4
{
  if (self->super.mIsPreactivated)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if (self->mIsTransitioning) {
      [(MRLayerNavigator *)self endTransitionToSublayer];
    }
    if (self->mCurrentSublayer != mCurrentSublayer)
    {
      self->mCurrentSublayer = (MRLayer *)mCurrentSublayer;
      [(MRLayerClock *)self->super.mClock containerTime];
      -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:");
      mCurrentSublayer = self->mCurrentSublayer;
    }
    if (([mCurrentSublayer isActivated] & 1) == 0)
    {
      if (![(MRLayer *)self->mCurrentSublayer isPreactivated]) {
        [(MRLayer *)self->mCurrentSublayer preactivate];
      }
      [(MRLayer *)self->mCurrentSublayer activate];
      if (![(MRLayer *)self->mCurrentSublayer isLoadedForTime:0.0]) {
        [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] pauseOnNextUpdate];
      }
    }
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:a4];
    [(MRLayer *)self->mCurrentSublayer setNeedsToSynchronizeTime:1];
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
    objc_sync_exit(mSublayers);
  }
}

- (double)goForth
{
  double v2 = 0.0;
  if (self->super.mIsActivated && self->mHistoryIsEnabled)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if ([(NSMutableArray *)self->mHistoryForth count])
    {
      id v5 = [(NSMutableArray *)self->mHistoryForth lastObject];
      [(MRLayerNavigator *)self doTransition:v5 backwards:0 pzr:0];
      double v2 = v6;
    }
    objc_sync_exit(mSublayers);
  }
  return v2;
}

- (double)goBack
{
  double v2 = 0.0;
  if (self->super.mIsActivated && self->mHistoryIsEnabled)
  {
    mSublayers = self->mSublayers;
    objc_sync_enter(mSublayers);
    if ([(NSMutableArray *)self->mHistoryBack count])
    {
      id v5 = [(NSMutableArray *)self->mHistoryBack lastObject];
      [(MRLayerNavigator *)self doTransition:v5 backwards:1 pzr:0];
      double v2 = v6;
    }
    objc_sync_exit(mSublayers);
  }
  return v2;
}

- (void)endTransitionToSublayer
{
  if (self->mTransitionWasAborted)
  {
    if (self->mControlsSublayerTimes)
    {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:self->mCurrentSublayerContainerTimeOnTransitionStart];
      [(MRLayer *)self->mCurrentSublayer duration];
      double v4 = v3;
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
      if (v4 < v5 + 4.0)
      {
        [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
        [(MRLayer *)self->mCurrentSublayer setDuration:v6 + 4.0];
      }
    }
    else
    {
      [(MRLayer *)self->mCurrentSublayer phaseInDuration];
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:v13];
    }
  }
  else
  {
    mExtraSublayer = self->mExtraSublayer;
    if (mExtraSublayer && self->mNextSublayer == mExtraSublayer)
    {
      [(NSMutableDictionary *)self->mSublayersForPlugs setObject:mExtraSublayer forKey:[(MCObject *)[(MRLayer *)self->mExtraSublayer plug] objectID]];
      self->mExtraSublayer = self->mCurrentSublayer;
    }
    self->mCurrentSublayer = self->mNextSublayer;
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
    [(MRLayer *)self->mCurrentSublayer timeIn];
    double v9 = v8;
    [(MRLayerClock *)self->super.mClock containerTime];
    if (v9 > v10)
    {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
      double v12 = v11;
      [(MRLayerClock *)self->super.mClock containerTime];
      -[MRLayer setTimeIn:](self->mCurrentSublayer, "setTimeIn:");
      if (v12 < 0.0) {
        double v12 = 0.0;
      }
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:v12];
    }
    if (self->mControlsSublayerTimes) {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:self->mNextSublayerInterestingTime];
    }
  }
  self->mNextSublayer = 0;
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  [(MRTransition *)self->mCurrentTransition releaseByTransitioner:self];
  self->mCurrentTransition = 0;
  self->mControlsSublayerTimes = 0;
  self->mTransitionWasAborted = 0;
  self->mIsTransitioning = 0;
  self->mTransitionIsBackwards = 0;
  self->BOOL mTransitionStartedWithNext = 0;
  self->mTransitionIsNextPrevious = 0;
  self->int mTransitionIsSubzero = 0;
  self->double mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
  self->double mForcedTransitionProgress = -1.0;
  self->double mForcedTransitionProgressOffset = 0.0;
  if (self->mPausedSublayersForTransition && !self->mIsInSlideFocusMode)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    [(MRLayerClock *)[(MRLayer *)mCurrentSublayer clock] containerTime];
    if (-[MRLayer isLoadedForTime:](mCurrentSublayer, "isLoadedForTime:")) {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] resumeOnNextUpdate];
    }
  }
  if (self->_pauseWhenTransitionEnds)
  {
    [(MRLayerClock *)self->super.mClock pauseOnNextUpdate];
    self->_pauseWhenTransitionEnds = 0;
  }
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);

  self->mTransitionChanges = 0;
  objc_sync_exit(mSublayers);
}

- (BOOL)canTransitionToMoreSlides:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  mCurrentSublayer = self->mCurrentSublayer;
  [(MRLayerClock *)[(MRLayer *)mCurrentSublayer clock] containerTime];
  if (!-[MRLayer hasMoreSlidesFromTime:backwards:startTime:duration:](mCurrentSublayer, "hasMoreSlidesFromTime:backwards:startTime:duration:", v3, &v10, &v9))
  {
    double v7 = self->mCurrentSublayer;
    if (v3)
    {
      double v6 = [(MRLayer *)v7 previousTransition];
      if (!v6) {
        return (char)v6;
      }
    }
    else
    {
      double v6 = [(MRLayer *)v7 nextTransition];
      if (!v6) {
        return (char)v6;
      }
    }
    LOBYTE(v6) = [(MRLayerNavigator *)self sublayerForKey:[(MCTransitionTrigger *)v6 transitionDestinationPlugID]] != 0;
    return (char)v6;
  }
  LOBYTE(v6) = 1;
  return (char)v6;
}

- (double)gotoMoreSlidesWithAction:(id)a3 backwards:(BOOL)a4 animate:(BOOL)a5 canCatchCurrentTransition:(BOOL)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  if (a5
    && (a6 || self->mForcedTransitionProgress == -1.0)
    && self->mIsTransitioning
    && [a3 specificObject])
  {
    if (self->mCurrentTransition)
    {
      self->mPausedSublayersForTransition = 1;
      BOOL v10 = [(MRTransition *)self->mCurrentTransition controlsLayersTime];
      self->mControlsSublayerTimes = v10;
      if (v10) {
        [(MRLayerNavigator *)self _getInterestingTimesForSublayerControl];
      }
      self->mTransitionWasAborted = 0;
      BOOL mTransitionIsBackwards = self->mTransitionIsBackwards;
      [(MRTransition *)self->mCurrentTransition progress];
      if (mTransitionIsBackwards) {
        double v12 = 1.0 - v12;
      }
      self->double mForcedTransitionProgressOffset = v12;
      self->double mForcedTransitionProgress = v12;
      -[MRTransition pzrStart:](self->mCurrentTransition, "pzrStart:", [a3 specificObject]);
    }
    double v13 = 0.0;
    if (self->mPausedSublayersForTransition)
    {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] pauseOnNextUpdate];
      [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] pauseOnNextUpdate];
    }
  }
  else
  {
    if (self->mIsTransitioning)
    {
      [(MRLayerNavigator *)self endTransitionToSublayer];
    }
    else if (self->mIsInnerTransitioning)
    {
      [(MRLayerNavigator *)self endMovingCurrentSublayer];
    }
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    mCurrentSublayer = self->mCurrentSublayer;
    [(MRLayerClock *)[(MRLayer *)mCurrentSublayer clock] containerTime];
    if (-[MRLayer hasMoreSlidesFromTime:backwards:startTime:duration:](mCurrentSublayer, "hasMoreSlidesFromTime:backwards:startTime:duration:", v7, &v18, &v17))
    {
      if (v6) {
        [(MRLayerNavigator *)self startMovingCurrentSublayer:v7];
      }
      else {
        [(MRLayerNavigator *)self gotoNextOrPreviousSlideInCurrentSublayer:v7];
      }
    }
    else if (v7)
    {
      [(MRLayerNavigator *)self gotoPreviousSublayer:a3 animate:v6];
    }
    else
    {
      [(MRLayerNavigator *)self gotoNextSublayer:a3 animate:v6];
    }
    return v15;
  }
  return v13;
}

- (double)transitionToNextSublayerWithDeltaStartTime:(double)a3
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  if (!mCurrentSublayer) {
    return 0.0;
  }
  id v6 = [(MCAction *)[(MRLayer *)mCurrentSublayer nextTransition] snapshot];
  if (!v6
    && self->mIsSerializerBased
    && [(NSString *)[(MCObject *)[(MRLayer *)self plug] objectID] isEqualToString:[(MRRenderer *)self->super.mRenderer transitionLayerPlugObjectID]])
  {
    [(MRRenderer *)self->super.mRenderer _playbackIsOverWithTime:1 sendNotification:-1.0];
    return 0.0;
  }
  if (![v6 transitionID]) {
    [v6 setTransitionID:kMRLayerTransitionIDPhaseInOut];
  }
  self->BOOL mTransitionStartedWithNext = 1;
  [(MRLayerNavigator *)self doTransition:v6 withDeltaStartTime:a3];
  return result;
}

- (BOOL)isReadyToTransitionToNextSublayer
{
  if (self->super.mIsActivated)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    if (mCurrentSublayer)
    {
      id v4 = [(MRLayerNavigator *)self sublayerForKey:[(MCTransitionTrigger *)[(MRLayer *)mCurrentSublayer nextTransition] transitionDestinationPlugID]];
      if (v4)
      {
        LOBYTE(mCurrentSublayer) = [v4 isLoadedForTime:0.0];
      }
      else
      {
        LOBYTE(mCurrentSublayer) = 1;
      }
    }
  }
  else
  {
    LOBYTE(mCurrentSublayer) = 0;
  }
  return (char)mCurrentSublayer;
}

- (double)gotoNextSublayer:(id)a3 animate:(BOOL)a4
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  if (!mCurrentSublayer) {
    return 0.0;
  }
  if (self->mIsTransitioning) {
    mCurrentSublayer = self->mNextSublayer;
  }
  id v8 = [(MCAction *)[(MRLayer *)mCurrentSublayer nextTransition] snapshot];
  if (!v8) {
    return 0.0;
  }
  uint64_t v9 = v8;
  if (a4)
  {
    if (![v8 transitionID]) {
      [v9 setTransitionID:kMRLayerTransitionIDPhaseInOut];
    }
  }
  else
  {
    [v8 setTransitionDuration:0.0];
  }
  self->BOOL mTransitionStartedWithNext = 1;
  self->mTransitionIsNextPrevious = 1;
  id v11 = [a3 specificObject];
  [(MRLayerNavigator *)self doTransition:v9 backwards:0 pzr:v11];
  return result;
}

- (double)gotoPreviousSublayer:(id)a3 animate:(BOOL)a4
{
  if (!self->super.mIsActivated) {
    return 0.0;
  }
  mCurrentSublayer = self->mCurrentSublayer;
  if (!mCurrentSublayer) {
    return 0.0;
  }
  if (self->mIsTransitioning) {
    mCurrentSublayer = self->mNextSublayer;
  }
  id v8 = [(MCAction *)[(MRLayer *)mCurrentSublayer previousTransition] snapshot];
  if (!v8) {
    return 0.0;
  }
  uint64_t v9 = v8;
  if (a4)
  {
    if (![v8 transitionID]) {
      [v9 setTransitionID:kMRLayerTransitionIDPhaseInOut];
    }
  }
  else
  {
    [v8 setTransitionDuration:0.0];
  }
  self->mTransitionIsNextPrevious = 1;
  self->BOOL mTransitionStartedWithNext = 0;
  id v11 = [a3 specificObject];
  [(MRLayerNavigator *)self doTransition:v9 backwards:1 pzr:v11];
  return result;
}

- (void)jumpToNextMarker:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(-[MRLayer effect](self->mCurrentSublayer, "effect"), "supportsChapters"))
  {
    id v5 = [(MRLayer *)self->mCurrentSublayer effect];
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
    objc_msgSend(v5, "timeForNextChapterAfterTime:");
    double v7 = v6;
    id v8 = [(MRLayer *)self->mCurrentSublayer clock];
    [(MRLayerClock *)v8 setContainerTime:v7];
  }
  else
  {
    [(MRLayerNavigator *)self gotoNextSublayer:a3 animate:0];
  }
}

- (void)jumpToPreviousMarker:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(-[MRLayer effect](self->mCurrentSublayer, "effect"), "supportsChapters"))
  {
    id v5 = [(MRLayer *)self->mCurrentSublayer effect];
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
    objc_msgSend(v5, "timeForPreviousChapterBeforeTime:");
    double v7 = v6;
    id v8 = [(MRLayer *)self->mCurrentSublayer clock];
    [(MRLayerClock *)v8 setContainerTime:v7];
  }
  else
  {
    [(MRLayerNavigator *)self gotoPreviousSublayer:a3 animate:0];
  }
}

- (void)_registerTransitionForHistory:(id)a3 withDestinationPlugID:(id)a4 backwards:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:](MCTransitionTrigger, "transitionForTargetPlugObjectID:withTransitionID:", [a3 targetObjectID], objc_msgSend(a3, "transitionID"));
  [a3 transitionDuration];
  objc_msgSend(v9, "setTransitionDuration:");
  objc_msgSend(v9, "setTransitionAttributes:", objc_msgSend(a3, "transitionAttributes"));
  [v9 setTransitionDestinationPlugID:a4];
  mHistoryBack = self->mHistoryBack;
  if (v5)
  {
    id v11 = [(NSMutableArray *)mHistoryBack lastObject];
    mHistoryForth = self->mHistoryForth;
    if (v11 != a3)
    {
      [(NSMutableArray *)mHistoryForth removeAllObjects];
      [(MRRenderer *)self->super.mRenderer removeNavigatorFromForthHistory:self];
      [(NSMutableDictionary *)self->super.mPersistentState removeObjectForKey:@"forthPlugID"];
      double v13 = self->mHistoryBack;
      if (!v13)
      {
        double v13 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        self->mHistoryBack = v13;
      }
      [(NSMutableArray *)v13 addObject:v9];
      [(MRRenderer *)self->super.mRenderer addNavigatorToBackHistory:self];
      id v14 = v9;
      goto LABEL_14;
    }
    if (!mHistoryForth)
    {
      mHistoryForth = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->mHistoryForth = mHistoryForth;
    }
    [(NSMutableArray *)mHistoryForth addObject:v9];
    -[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", [v9 transitionDestinationPlugID], @"forthPlugID");
    [(NSMutableArray *)self->mHistoryBack removeLastObject];
    [(MRRenderer *)self->super.mRenderer moveNavigatorFromBackToForthHistory:self];
    if ([(NSMutableArray *)self->mHistoryBack count])
    {
      id v14 = [(NSMutableArray *)self->mHistoryBack lastObject];
LABEL_14:
      id v17 = [v14 transitionDestinationPlugID];
      CFStringRef v18 = @"backPlugID";
LABEL_18:
      [(MRLayer *)self _setStateValue:v17 forKey:v18];
      return;
    }
    mPersistentState = self->super.mPersistentState;
    CFStringRef v20 = @"backPlugID";
  }
  else
  {
    if (!mHistoryBack)
    {
      mHistoryBack = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->mHistoryBack = mHistoryBack;
    }
    [(NSMutableArray *)mHistoryBack addObject:v9];
    -[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", [v9 transitionDestinationPlugID], @"backPlugID");
    id v15 = [(NSMutableArray *)self->mHistoryForth lastObject];
    double v16 = self->mHistoryForth;
    if (v15 == a3)
    {
      [(NSMutableArray *)v16 removeLastObject];
      [(MRRenderer *)self->super.mRenderer moveNavigatorFromForthToBackHistory:self];
    }
    else
    {
      [(NSMutableArray *)v16 removeAllObjects];
      [(MRRenderer *)self->super.mRenderer removeNavigatorFromForthHistory:self];
      [(MRRenderer *)self->super.mRenderer addNavigatorToBackHistory:self];
    }
    if ([(NSMutableArray *)self->mHistoryForth count])
    {
      id v17 = objc_msgSend(-[NSMutableArray lastObject](self->mHistoryForth, "lastObject"), "transitionDestinationPlugID");
      CFStringRef v18 = @"forthPlugID";
      goto LABEL_18;
    }
    mPersistentState = self->super.mPersistentState;
    CFStringRef v20 = @"forthPlugID";
  }
  [(NSMutableDictionary *)mPersistentState removeObjectForKey:v20];
}

- (double)startMovingCurrentSublayer:(BOOL)a3
{
  BOOL v3 = a3;
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
  self->double mCurrentSublayerContainerTimeOnTransitionStart = v5;
  -[MRLayer interestingTimeForTime:](self->mCurrentSublayer, "interestingTimeForTime:");
  self->double mCurrentSublayerInterestingTime = v6;
  p_mCurrentSublayerLazyDuration = &self->mCurrentSublayerLazyDuration;
  p_mCurrentSublayerAnimationDuration = &self->mCurrentSublayerAnimationDuration;
  p_double mCurrentSublayerLazyFactor = &self->mCurrentSublayerLazyFactor;
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:](self->mCurrentSublayer, "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:", &self->mCurrentSublayerLazyDuration);
  if (!v3)
  {
    double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime
                                    + *p_mCurrentSublayerLazyDuration
                                    + *p_mCurrentSublayerAnimationDuration;
    double v10 = 0.01;
    goto LABEL_5;
  }
  double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime;
  if (self->mCurrentSublayerContainerTimeOnTransitionStart < mCurrentSublayerInterestingTime
                                                            + *p_mCurrentSublayerLazyDuration)
  {
    double v10 = -0.01;
LABEL_5:
    [(MRLayer *)self->mCurrentSublayer interestingTimeForTime:mCurrentSublayerInterestingTime + v10];
    self->double mNextSublayerInterestingTime = v11;
    -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:](self->mCurrentSublayer, "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:", &self->mNextSublayerLazyDuration, &self->mNextSublayerLazyFactor, &self->mNextSublayerAnimationDuration);
    goto LABEL_7;
  }
  self->double mNextSublayerInterestingTime = mCurrentSublayerInterestingTime;
  self->double mNextSublayerLazyDuration = *p_mCurrentSublayerLazyDuration;
  self->double mNextSublayerLazyFactor = *p_mCurrentSublayerLazyFactor;
  self->double mNextSublayerAnimationDuration = *p_mCurrentSublayerAnimationDuration;
  [(MRLayer *)self->mCurrentSublayer interestingTimeForTime:self->mCurrentSublayerInterestingTime+ *p_mCurrentSublayerLazyDuration+ *p_mCurrentSublayerAnimationDuration+ 0.01];
  self->double mCurrentSublayerInterestingTime = v12;
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:](self->mCurrentSublayer, "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:", &self->mCurrentSublayerLazyDuration, p_mCurrentSublayerLazyFactor, &self->mCurrentSublayerAnimationDuration);
LABEL_7:
  self->BOOL mTransitionStartedWithNext = !v3;
  self->mTransitionIsNextPrevious = 1;
  self->BOOL mIsInnerTransitioning = 1;
  self->BOOL mTransitionIsBackwards = v3;
  if (v3)
  {
    double mNextSublayerAnimationDuration = self->mNextSublayerAnimationDuration;
    p_double mTransitionDuration = &self->mTransitionDuration;
    self->double mTransitionDuration = mNextSublayerAnimationDuration;
    self->double mTotalMotionDuration = mNextSublayerAnimationDuration
                               + (self->mCurrentSublayerContainerTimeOnTransitionStart
                                - self->mCurrentSublayerInterestingTime)
                               * *p_mCurrentSublayerLazyFactor
                               + self->mNextSublayerLazyDuration * self->mNextSublayerLazyFactor;
    double mCurrentSublayerContainerTimeOnTransitionStart = self->mCurrentSublayerContainerTimeOnTransitionStart;
    double mNextSublayerInterestingTime = self->mNextSublayerInterestingTime;
    double mNextSublayerLazyDuration = self->mNextSublayerLazyDuration;
    if (mCurrentSublayerContainerTimeOnTransitionStart >= mNextSublayerInterestingTime + mNextSublayerLazyDuration)
    {
      double v27 = mNextSublayerLazyDuration * self->mNextSublayerLazyFactor;
      self->double mForcedTransitionProgressOffset = v27;
      double v28 = self->mCurrentSublayerContainerTimeOnTransitionStart;
      double v29 = self->mCurrentSublayerInterestingTime;
      if (v28 >= v29) {
        double v30 = *p_mTransitionDuration + (v28 - v29) * *p_mCurrentSublayerLazyFactor;
      }
      else {
        double v30 = v28 - (self->mNextSublayerInterestingTime + self->mNextSublayerLazyDuration);
      }
      double v18 = v27 + v30;
      self->double mForcedTransitionProgressOffset = v18;
    }
    else
    {
      double v18 = (mCurrentSublayerContainerTimeOnTransitionStart - mNextSublayerInterestingTime)
          * self->mNextSublayerLazyFactor;
      self->double mForcedTransitionProgressOffset = v18;
    }
    double mTotalMotionDuration = self->mTotalMotionDuration;
    double v26 = 1.0;
    if (mTotalMotionDuration > 0.0) {
      double v26 = 1.0 - v18 / mTotalMotionDuration;
    }
    self->double mForcedTransitionProgressOffset = v26;
  }
  else
  {
    double v19 = *p_mCurrentSublayerAnimationDuration;
    p_double mTransitionDuration = &self->mTransitionDuration;
    self->double mTransitionDuration = *p_mCurrentSublayerAnimationDuration;
    double v20 = v19 + *p_mCurrentSublayerLazyDuration * *p_mCurrentSublayerLazyFactor;
    self->double mTotalMotionDuration = v20;
    double v21 = 1.0;
    if (v20 > 0.0)
    {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
      double v21 = (v22 - self->mCurrentSublayerInterestingTime) * *p_mCurrentSublayerLazyFactor / self->mTotalMotionDuration;
    }
    self->double mForcedTransitionProgressOffset = v21;
    self->double mForcedTransitionProgress = v21;
    double v23 = self->mCurrentSublayerContainerTimeOnTransitionStart;
    double v24 = self->mCurrentSublayerInterestingTime;
    double v25 = v24 + *p_mCurrentSublayerLazyDuration;
    if (v23 >= v25) {
      double v26 = v23 - v25 + *p_mCurrentSublayerLazyDuration * *p_mCurrentSublayerLazyFactor;
    }
    else {
      double v26 = (v23 - v24) * *p_mCurrentSublayerLazyFactor;
    }
    self->double mForcedTransitionProgressOffset = v26;
    double v31 = self->mTotalMotionDuration;
    if (v31 > 0.0)
    {
      double v26 = v26 / v31;
      self->double mForcedTransitionProgressOffset = v26;
    }
  }
  self->double mForcedTransitionProgress = v26;
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] pauseOnNextUpdate];
  self->mPausedSublayersForTransition = 1;
  [(MRLayer *)self->mCurrentSublayer setIsInInteractiveMode:1];
  self->_pauseWhenTransitionEnds = [(MRLayerClock *)self->super.mClock selfIsPaused];
  [(MRLayerClock *)self->super.mClock resumeOnNextUpdate];
  return *p_mTransitionDuration;
}

- (void)endMovingCurrentSublayer
{
  BOOL mTransitionWasAborted = self->mTransitionWasAborted;
  mCurrentSublayer = self->mCurrentSublayer;
  if (mTransitionWasAborted)
  {
    [(MRLayerClock *)[(MRLayer *)mCurrentSublayer clock] setContainerTime:self->mCurrentSublayerInterestingTime];
  }
  else
  {
    [(MRLayerClock *)[(MRLayer *)mCurrentSublayer clock] setContainerTime:self->mNextSublayerInterestingTime];
    self->mNeedsToUpdatePotentialTargetSublayers = 1;
  }
  self->mControlsSublayerTimes = 0;
  self->BOOL mTransitionWasAborted = 0;
  self->BOOL mIsInnerTransitioning = 0;
  self->BOOL mTransitionIsBackwards = 0;
  self->double mCurrentSublayerContainerTimeOnTransitionStart = -1.0;
  self->double mForcedTransitionProgress = -1.0;
  self->double mForcedTransitionProgressOffset = 0.0;
  [(MRLayer *)self->mCurrentSublayer setIsInInteractiveMode:0];
  if (self->mPausedSublayersForTransition && !self->mIsInSlideFocusMode) {
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] resumeOnNextUpdate];
  }
  if (self->_pauseWhenTransitionEnds)
  {
    [(MRLayerClock *)self->super.mClock pauseOnNextUpdate];
    self->_pauseWhenTransitionEnds = 0;
  }
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);

  self->mTransitionChanges = 0;
  objc_sync_exit(mSublayers);
}

- (double)gotoNextOrPreviousSlideInCurrentSublayer:(BOOL)a3
{
  BOOL v3 = a3;
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
  self->double mCurrentSublayerContainerTimeOnTransitionStart = v5;
  -[MRLayer interestingTimeForTime:](self->mCurrentSublayer, "interestingTimeForTime:");
  self->double mCurrentSublayerInterestingTime = v6;
  p_mCurrentSublayerLazyDuration = &self->mCurrentSublayerLazyDuration;
  -[MRLayer getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:](self->mCurrentSublayer, "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:", &self->mCurrentSublayerLazyDuration, &self->mCurrentSublayerLazyFactor, &self->mCurrentSublayerAnimationDuration);
  if (!v3)
  {
    double v9 = self->mCurrentSublayerInterestingTime
       + *p_mCurrentSublayerLazyDuration
       + self->mCurrentSublayerAnimationDuration
       + 0.01;
    goto LABEL_5;
  }
  double mCurrentSublayerInterestingTime = self->mCurrentSublayerInterestingTime;
  if (self->mCurrentSublayerContainerTimeOnTransitionStart < mCurrentSublayerInterestingTime
                                                            + *p_mCurrentSublayerLazyDuration)
  {
    double v9 = mCurrentSublayerInterestingTime + -0.01;
LABEL_5:
    [(MRLayer *)self->mCurrentSublayer interestingTimeForTime:v9];
    double mCurrentSublayerInterestingTime = v10;
  }
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:mCurrentSublayerInterestingTime];
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  return 0.0;
}

- (id)_currentState
{
  v7.receiver = self;
  v7.super_class = (Class)MRLayerNavigator;
  id v3 = [(MRLayer *)&v7 _currentState];
  mCurrentSublayer = self->mCurrentSublayer;
  if (mCurrentSublayer)
  {
    objc_msgSend(v3, "setObject:forKey:", -[MRLayer idInSupercontainer](mCurrentSublayer, "idInSupercontainer"), @"currentSublayerID");
    id v5 = [(MRLayer *)self->mCurrentSublayer _currentState];
    [(MRLayer *)self->mCurrentSublayer timeIn];
    objc_msgSend(v5, "setObject:forKey:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"timeIn");
    [v3 setObject:v5 forKey:@"currentSublayerState"];
  }
  return v3;
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MRLayerNavigator;
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
          double v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
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

- (void)resyncToSerializer
{
  self->mNeedsToResyncToSerializer = 1;
}

- (void)_resyncToSerializerForTime:(double)a3
{
  BOOL mNeedsToResyncToSerializer = self->mNeedsToResyncToSerializer;
  self->BOOL mNeedsToResyncToSerializer = 0;
  if (self->mIsTransitioning) {
    [(MRLayerNavigator *)self endTransitionToSublayer];
  }
  if (self->mIsInnerTransitioning) {
    [(MRLayerNavigator *)self endMovingCurrentSublayer];
  }
  mContainer = self->mContainer;
  id v7 = [(MCContainer *)mContainer orderedPlugs];
  double v41 = mContainer;
  [(MCContainer *)mContainer initialTransitionDuration];
  double v9 = v8;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v10 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v10)
  {
    id v11 = v10;
    double v12 = 0;
    BOOL v13 = 0;
    uint64_t v14 = *(void *)v43;
    double v15 = 0.0;
    double v16 = v9;
    while (2)
    {
      long long v17 = 0;
      long long v18 = v12;
      do
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v7);
        }
        double v12 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v17);
        double v19 = v9;
        if (v13)
        {
          objc_msgSend(*(id *)(*((void *)&v42 + 1) + 8 * (void)v17), "phaseInDuration", v9);
          double v19 = v9 + v20;
        }
        if (v19 > a3)
        {
          double v23 = v9;
          goto LABEL_17;
        }
        double v15 = v9 - v16;
        [v12 fullDuration];
        double v9 = v9 - v16 + v21;
        [v12 transitionDuration];
        double v16 = v22;
        BOOL v13 = [v12 transitionID] == 0;
        long long v17 = (char *)v17 + 1;
        long long v18 = v12;
      }
      while (v11 != v17);
      id v11 = [v7 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    long long v18 = v12;
    double v23 = v9;
    double v12 = 0;
LABEL_17:
    if (v13)
    {
      [v18 phaseOutDuration];
      double v25 = v23 - v24;
      [v18 phaseOutDuration];
      double v27 = v26;
      [v12 phaseInDuration];
      double v9 = v27 + v28;
      int v29 = 1;
      goto LABEL_22;
    }
    double v9 = v16;
  }
  else
  {
    double v12 = 0;
    long long v18 = 0;
    double v15 = 0.0;
    double v23 = v9;
    double v16 = v9;
  }
  int v29 = 0;
  double v25 = v23 - v9;
LABEL_22:
  if (!v12)
  {
    int v34 = 0;
    self->mIsTransitioning = 0;
    if (!v18) {
      goto LABEL_59;
    }
LABEL_34:
    id v32 = v12;
    double v12 = v18;
LABEL_35:
    uint64_t v35 = (MRLayer *)-[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [v12 objectID]);
    self->mCurrentSublayer = v35;
    if (![(MRLayer *)v35 isActivated])
    {
      if (![(MRLayer *)self->mCurrentSublayer isPreactivated]) {
        [(MRLayer *)self->mCurrentSublayer preactivate];
      }
      [(MRLayer *)self->mCurrentSublayer activate];
      if (![(MRLayer *)self->mCurrentSublayer isLoadedForTime:0.0]) {
        [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] pauseOnNextUpdate];
      }
    }
    [(MRLayer *)self->mCurrentSublayer setTimeIn:v15];
    [(MRLayer *)self->mCurrentSublayer setDuration:v23 - v15];
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:a3 - v15];
    char v36 = 0;
    self->_double currentSublayerTheoreticalTimeIn = v15;
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = 0;
    if (!self->mIsTransitioning) {
      goto LABEL_57;
    }
    goto LABEL_41;
  }
  BOOL v30 = v25 <= a3 || v18 == 0;
  BOOL v31 = v30;
  self->mIsTransitioning = v31;
  if (!v30) {
    goto LABEL_34;
  }
  if (mNeedsToResyncToSerializer)
  {
    self->mIsTransitioning = 0;
    double v15 = v23 - v16;
    [v12 fullDuration];
    id v32 = 0;
    double v23 = v23 - v16 + v33;
    goto LABEL_35;
  }
  int v34 = 1;
  if (v18) {
    goto LABEL_34;
  }
LABEL_59:
  char v36 = 1;
  id v32 = v12;
  double v12 = 0;
  if (!v34) {
    goto LABEL_57;
  }
LABEL_41:
  mExtraSublayer = self->mExtraSublayer;
  if (!mExtraSublayer) {
    mExtraSublayer = (MRLayer *)-[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [v32 objectID]);
  }
  self->mNextSublayer = mExtraSublayer;
  if (![(MRLayer *)mExtraSublayer isPreactivated]) {
    [(MRLayer *)self->mNextSublayer preactivate];
  }
  double v38 = v23 - v16;
  [(MRLayer *)self->mNextSublayer setTimeIn:v38];
  [v32 fullDuration];
  -[MRLayer setDuration:](self->mNextSublayer, "setDuration:");
  [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] setContainerTime:a3 - v38];
  if (![(MRLayer *)self->mNextSublayer isActivated])
  {
    [(MRLayer *)self->mNextSublayer activate];
    if (![(MRLayer *)self->mNextSublayer isLoadedForTime:0.0]) {
      [(MRLayerClock *)[(MRLayer *)self->mNextSublayer clock] pauseOnNextUpdate];
    }
  }
  if (v36)
  {
    double v39 = +[MRTransition retainedTransitionWithTransitionID:[(MCContainer *)v41 initialTransitionID] forTransitioner:self];
    self->mCurrentTransition = v39;
    if (!v39) {
      goto LABEL_57;
    }
    [(MRTransition *)self->mCurrentTransition setAttributes:[(MCContainer *)v41 initialTransitionAttributes]];
    -[MRTransition setPixelSize:](self->mCurrentTransition, "setPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    mCurrentTransition = self->mCurrentTransition;
    if (!mCurrentTransition) {
      goto LABEL_57;
    }
LABEL_56:
    [(MRTransition *)mCurrentTransition setSourceLayer:self->mCurrentSublayer];
    [(MRTransition *)self->mCurrentTransition setTargetLayer:self->mNextSublayer];
    self->mTransitionStartTime = v25;
    self->double mTransitionDuration = v9;
    self->double mTotalMotionDuration = v9;
    self->_previouslyRenderedTransitionProgress = -1.0;
    goto LABEL_57;
  }
  if (v29) {
    mCurrentTransition = +[MRTransition retainedTransitionWithTransitionID:@"PhaseInOut" forTransitioner:self];
  }
  else {
    mCurrentTransition = [(MRLayerNavigator *)self _transitionWithTransitionTrigger:v12];
  }
  self->mCurrentTransition = mCurrentTransition;
  if (mCurrentTransition) {
    goto LABEL_56;
  }
LABEL_57:
  [(MRLayer *)self setNeedsToSynchronizeTime:1];
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
}

- (id)_transitionWithTransitionTrigger:(id)a3
{
  id v5 = [a3 transitionID];
  id v6 = [a3 transitionAttributes];
  id v7 = [v6 objectForKey:@"PresetID"];
  if ([v5 isEqualToString:@"Random"])
  {
    id v8 = [(MRRenderer *)self->super.mRenderer chooseTransitionIDForRandomTransitionPresetID:v7];
    id v9 = [v8 lastPathComponent];
    id v10 = +[MRTransition retainedTransitionWithTransitionID:forTransitioner:](MRTransition, "retainedTransitionWithTransitionID:forTransitioner:", [v8 stringByDeletingLastPathComponent], self);
    id v11 = v10;
    if (v10)
    {
      [v10 setPresetID:v9];
LABEL_6:
      objc_msgSend(v11, "setPixelSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
    }
  }
  else
  {
    id v12 = +[MRTransition retainedTransitionWithTransitionID:v5 forTransitioner:self];
    id v11 = v12;
    if (v12)
    {
      [v12 setAttributes:v6];
      goto LABEL_6;
    }
  }
  return v11;
}

- (BOOL)enterSlideFocusModeWithState:(id)a3
{
  BOOL mIsTransitioning = self->mIsTransitioning;
  if (!self->mIsTransitioning)
  {
    mCurrentSublayer = self->mCurrentSublayer;
    [(MRLayerClock *)[(MRLayer *)mCurrentSublayer clock] pauseOnNextUpdate];
    self->mIsInSlideFocusMode = 1;
    objc_msgSend(a3, "setSlideInfo:", -[MRLayer currentSlideInfoForElement:](mCurrentSublayer, "currentSlideInfoForElement:", objc_msgSend(a3, "slideID")));
    [(MRLayerNavigator *)self fillInNextSlideInformationInState:a3];
    [(MRLayerNavigator *)self fillInPreviousSlideInformationInState:a3];
  }
  return !mIsTransitioning;
}

- (void)fillInNextSlideInformationInState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if (![v6 isActivated]) {
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ((v7 = objc_msgSend(objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "descriptionForEffectID:", objc_msgSend(objc_msgSend(v6, "container"), "effectID")), "objectForKey:", @"numberOfSlides")) == 0? (id v8 = objc_msgSend(objc_msgSend(v6, "container"), "countOfSlides")): (id v8 = (id)(int)objc_msgSend(v7, "intValue")), (v9 = (char *)objc_msgSend(objc_msgSend(a3, "slideInfo"), "index") + 1, v9 < v8)&& (v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"image%d", v9)) != 0))
  {
    CFStringRef v11 = (const __CFString *)v10;
  }
  else
  {
    id v12 = -[MRLayerNavigator sublayerForKey:](self, "sublayerForKey:", objc_msgSend(objc_msgSend(v6, "nextTransition"), "transitionDestinationPlugID"));
    if (!v12)
    {
      CFStringRef v11 = 0;
      id v13 = 0;
      goto LABEL_17;
    }
    id v6 = v12;
    CFStringRef v11 = @"image0";
  }
  id v13 = [v6 currentSlideInfoForElement:v11];
LABEL_17:
  [a3 setNextSlideInfo:v13];
  [a3 setNextSlideID:v11];
}

- (void)fillInPreviousSlideInformationInState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if (![v6 isActivated]) {
    return;
  }
  id v7 = objc_msgSend(objc_msgSend(a3, "slideInfo"), "index");
  if (!v7)
  {
    id v9 = -[MRLayerNavigator sublayerForKey:](self, "sublayerForKey:", objc_msgSend(objc_msgSend(v6, "previousTransition"), "transitionDestinationPlugID"));
    if (v9)
    {
      id v6 = v9;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        CFStringRef v8 = @"image0";
        goto LABEL_15;
      }
      id v10 = objc_msgSend(objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "descriptionForEffectID:", objc_msgSend(objc_msgSend(v6, "container"), "effectID")), "objectForKey:", @"numberOfSlides");
      if (v10)
      {
        LODWORD(v7) = [v10 intValue];
        if (v7) {
          goto LABEL_6;
        }
      }
      else
      {
        id v7 = objc_msgSend(objc_msgSend(v6, "container"), "countOfSlides");
        if (v7) {
          goto LABEL_6;
        }
      }
    }
    CFStringRef v8 = 0;
LABEL_18:
    id v11 = 0;
    goto LABEL_19;
  }
LABEL_6:
  CFStringRef v8 = +[NSString stringWithFormat:@"image%d", (v7 - 1)];
  if (!v8) {
    goto LABEL_18;
  }
LABEL_15:
  id v11 = [v6 currentSlideInfoForElement:v8];
LABEL_19:
  [a3 setPreviousSlideInfo:v11];
  [a3 setPreviousSlideID:v8];
}

- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->mIsTransitioning) {
    id v7 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v7 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  unsigned int v8 = [*(id *)((char *)&self->super.super.isa + *v7) isActivated];
  if (v8)
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "nextSlideInfo"), "index");
    id v10 = objc_msgSend(objc_msgSend(a3, "slideInfo"), "index");
    if (v9 <= v10) {
      -[MRLayerNavigator gotoNextSublayer:animate:](self, "gotoNextSublayer:animate:", [a3 action], v4);
    }
    [a3 setDelegateIsTransitioningToo:v9 <= v10];
  }
  return v8;
}

- (void)didFocusOnNextSlideWithState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    objc_msgSend(v6, "interestingTimeForElement:", objc_msgSend(a3, "slideID"));
    objc_msgSend(objc_msgSend(v6, "clock"), "setContainerTime:", v7);
    [(MRLayerNavigator *)self fillInNextSlideInformationInState:a3];
  }
}

- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->mIsTransitioning) {
    double v7 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    double v7 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  unsigned int v8 = [*(id *)((char *)&self->super.super.isa + *v7) isActivated];
  if (v8)
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "previousSlideInfo"), "index");
    id v10 = objc_msgSend(objc_msgSend(a3, "slideInfo"), "index");
    if (v9 >= v10) {
      -[MRLayerNavigator gotoPreviousSublayer:animate:](self, "gotoPreviousSublayer:animate:", [a3 action], v4);
    }
    [a3 setDelegateIsTransitioningToo:v9 >= v10];
  }
  return v8;
}

- (void)didFocusOnPreviousSlideWithState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    objc_msgSend(v6, "interestingTimeForElement:", objc_msgSend(a3, "slideID"));
    objc_msgSend(objc_msgSend(v6, "clock"), "setContainerTime:", v7);
    [(MRLayerNavigator *)self fillInPreviousSlideInformationInState:a3];
  }
}

- (void)exitSlideFocusModeWithState:(id)a3
{
  if (self->mIsTransitioning) {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
  }
  else {
    id v5 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
  }
  id v6 = *(Class *)((char *)&self->super.super.isa + *v5);
  if ([v6 isActivated])
  {
    self->mIsInSlideFocusMode = 0;
    objc_msgSend(objc_msgSend(v6, "clock"), "containerTime");
    double v8 = v7;
    objc_msgSend(objc_msgSend(a3, "slideInfo"), "time");
    double v10 = v8 + v9;
    if ([v6 plugAsSerial])
    {
      objc_msgSend(objc_msgSend(v6, "plugAsSerial"), "transitionDuration");
      double v12 = v11;
      [v6 duration];
      double v14 = v13 - v12 + -0.1;
      if (v10 >= v14) {
        double v10 = v14;
      }
    }
    objc_msgSend(objc_msgSend(v6, "clock"), "setContainerTime:", v10);
    objc_msgSend(objc_msgSend(v6, "clock"), "resumeAfter:", 2.0);
    id v15 = objc_msgSend(v6, "currentSlideInfoForElement:", objc_msgSend(a3, "slideID"));
    [a3 setSlideInfo:v15];
  }
}

- (double)fastScrubStart:(id)a3
{
  if (self->mIsSerializerBased)
  {
    self->mIsFastScrubbing = 1;
    if (self->mIsTransitioning)
    {
      [(MRLayerNavigator *)self endTransitionToSublayer];
    }
    else if (self->mIsInnerTransitioning)
    {
      [(MRLayerNavigator *)self endMovingCurrentSublayer];
    }
    [(MRLayerClock *)self->super.mClock pauseOnNextUpdate];
    self->mFastScrubbingStartIndedouble x = [(MCPlugSerial *)[(MRLayer *)self->mCurrentSublayer plugAsSerial] index];
    self->mFastScrubbingProgress = 0.0;
  }
  return 0.0;
}

- (double)fastScrubUpdate:(id)a3
{
  if (!self->mIsFastScrubbing) {
    return 0.0;
  }
  BOOL v4 = (double *)[a3 specificObject];
  mFastScrubbingStartIndedouble x = (double)self->mFastScrubbingStartIndex;
  double v6 = v4[4] * 0.5;
  double v7 = (double)(unint64_t)[(NSMutableArray *)self->mSublayers count];
  if (v7 > 50.0) {
    double v7 = 50.0;
  }
  if (v7 < 10.0) {
    double v7 = 10.0;
  }
  uint64_t v8 = (uint64_t)(mFastScrubbingStartIndex + v6 * v7);
  double v9 = v4[4] * 0.5;
  double v10 = (double)(unint64_t)[(NSMutableArray *)self->mSublayers count];
  if (v10 > 50.0) {
    double v10 = 50.0;
  }
  if (v10 < 10.0) {
    double v10 = 10.0;
  }
  self->mFastScrubbingProgress = v9 * v10;
  if (v8 <= 0)
  {
    objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", 0), "fullDuration");
    uint64_t v8 = v11 <= 1.0;
    if (v11 > 1.0) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
    double v13 = v4[4];
    double v14 = (double)(unint64_t)[(NSMutableArray *)self->mSublayers count];
    if (v14 > 50.0) {
      double v14 = 50.0;
    }
    if (v14 < 10.0) {
      double v14 = 10.0;
    }
    double v15 = v12 + v13 * -0.5 * v14;
    goto LABEL_29;
  }
  if ((char *)[(NSMutableArray *)self->mSublayers count] - 1 <= (char *)v8)
  {
    double v16 = (char *)[(NSMutableArray *)self->mSublayers count];
    objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", v16 - 1), "fullDuration");
    if (v17 <= 1.0) {
      uint64_t v8 = (uint64_t)(v16 - 2);
    }
    else {
      uint64_t v8 = (uint64_t)(v16 - 1);
    }
    double v18 = v4[4];
    double v19 = (double)(unint64_t)[(NSMutableArray *)self->mSublayers count];
    if (v19 > 50.0) {
      double v19 = 50.0;
    }
    if (v19 < 10.0) {
      double v19 = 10.0;
    }
    double v15 = (double)v8 + v18 * -0.5 * v19;
LABEL_29:
    self->mFastScrubbingProgress = self->mFastScrubbingProgress
                                 + (double)((unint64_t)v15 - self->mFastScrubbingStartIndex);
    self->mFastScrubbingStartIndedouble x = (unint64_t)v15;
  }
  double v20 = (MRLayer *)-[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", v8), "objectID"));
  if (v20 != self->mCurrentSublayer)
  {
    self->mCurrentSublayer = v20;
    [(MRLayerClock *)self->super.mClock containerTime];
    [(MRLayer *)self->mCurrentSublayer setTimeIn:v21 + -1.0];
    self->_needsToRecomputeCurrentSublayerTheoreticalTimeIn = self->mIsSerializerBased;
  }
  return 0.0;
}

- (double)fastScrubEnd:(id)a3
{
  if (self->mIsFastScrubbing)
  {
    self->mIsFastScrubbing = 0;
    self->mFastScrubbingStartIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    self->mFastScrubbingProgress = 0.0;
    [(MRLayerClock *)self->super.mClock resumeOnNextUpdate];
  }
  return 0.0;
}

- (double)fastScrubCancel:(id)a3
{
  if (self->mIsFastScrubbing)
  {
    self->mIsFastScrubbing = 0;
    self->mFastScrubbingStartIndedouble x = 0x7FFFFFFFFFFFFFFFLL;
    self->mFastScrubbingProgress = 0.0;
    [(MRLayerClock *)self->super.mClock resumeOnNextUpdate];
  }
  return 0.0;
}

- (BOOL)hasSlides
{
  return [(MRLayer *)self->mCurrentSublayer hasSlides];
}

- (BOOL)isInInteractiveMode
{
  return [(MRLayer *)self->mCurrentSublayer isInInteractiveMode];
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
}

- (id)currentSlideInfoForElement:(id)a3
{
  return [(MRLayer *)self->mCurrentSublayer currentSlideInfoForElement:a3];
}

- (id)currentSlideInfos
{
  return [(MRLayer *)self->mCurrentSublayer currentSlideInfos];
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return [(MRLayer *)self->mCurrentSublayer getStartTime:a3 andDuration:a4 forMovingToElementID:a5 backwards:a6];
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  BOOL v8 = a4;
  mCurrentSublayer = self->mCurrentSublayer;
  [(MRLayer *)mCurrentSublayer timeIn];
  double v12 = a3 - v11;
  return [(MRLayer *)mCurrentSublayer hasMoreSlidesFromTime:v8 backwards:a5 startTime:a6 duration:v12];
}

- (double)interestingTimeForTime:(double)a3
{
  mCurrentSublayer = self->mCurrentSublayer;
  [(MRLayer *)mCurrentSublayer timeIn];
  [(MRLayer *)mCurrentSublayer interestingTimeForTime:a3 - v6];
  double v8 = v7;
  [(MRLayer *)self->mCurrentSublayer timeIn];
  return v8 + v9;
}

- (double)interestingTimeForElement:(id)a3
{
  [(MRLayer *)self->mCurrentSublayer interestingTimeForElement:a3];
  double v5 = v4;
  [(MRLayer *)self->mCurrentSublayer timeIn];
  return v5 + v6;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
  mCurrentSublayer = self->mCurrentSublayer;
  [(MRLayer *)mCurrentSublayer timeIn];
  double v12 = a6 - v11;
  [(MRLayer *)mCurrentSublayer getLazyDuration:a3 lazyFactor:a4 animationDuration:a5 fromInterestingTime:v12];
}

- (MRLayer)currentSublayer
{
  return self->mCurrentSublayer;
}

- (BOOL)isTransitioning
{
  return self->mIsTransitioning;
}

- (BOOL)historyIsEnabled
{
  return self->mHistoryIsEnabled;
}

- (void)setHistoryIsEnabled:(BOOL)a3
{
  self->mHistoryIsEnabled = a3;
}

- (double)forcedTransitionProgress
{
  return self->mForcedTransitionProgress;
}

- (void)setForcedTransitionProgress:(double)a3
{
  self->double mForcedTransitionProgress = a3;
}

- (double)currentSlideshowTime
{
  return self->_currentSlideshowTime;
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
      if (self->mExtraSublayer) {
        [(MRLayerNavigator *)self _removeExtraSublayer];
      }
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v5)
      {
        uint64_t v6 = 0;
        uint64_t v7 = *(void *)v16;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v16 != v7) {
              objc_enumerationMutation(v4);
            }
            uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
            int v10 = *(_DWORD *)(v9 + 8);
            if (v10 == 1)
            {
              double v12 = *(void **)(v9 + 16);
              id v13 = -[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", [v12 objectID]);
              double v14 = v13;
              if (v13)
              {
                if ([v13 isPreactivated])
                {
                  if ([v14 isActivated]) {
                    [v14 deactivate];
                  }
                  [v14 depreactivate:0];
                }
                [(MRLayerNavigator *)self _unobserveSublayer:v14];
                [(MRLayerNavigator *)self _deleteSublayer:v14];
              }
              else if ([v12 container])
              {
                NSLog(@"Consistency error, trying to delete a nil sublayer in serializer\n");
              }
            }
            else if (!v10)
            {
              id v11 = [(MRLayerNavigator *)self _createSublayerForPlug:*(void *)(v9 + 16)];
              if (v11) {
                [(MRLayerNavigator *)self _observeSublayer:v11];
              }
              ++v6;
            }
          }
          id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v5);
        if (v6) {
          self->mHasWarnedDelegateAboutNearingEnd = 0;
        }
      }
    }
  }
  else
  {
    objc_sync_exit(mLayerCommandQueue);
  }
}

- (id)_createSublayerForPlug:(id)a3
{
  if (![a3 container]) {
    return 0;
  }
  id v5 = +[MRLayer layerWithPlug:a3 andParameters:self->super.mParameters inSuperlayer:self];
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [(NSMutableArray *)self->mSublayers addObject:v5];
  -[NSMutableDictionary setObject:forKey:](self->mSublayersForPlugs, "setObject:forKey:", v5, [a3 objectID]);
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  objc_sync_exit(mSublayers);
  return v5;
}

- (void)_deleteSublayer:(id)a3
{
  id v4 = a3;
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  [(NSMutableArray *)self->mSublayers removeObject:a3];
  -[NSMutableDictionary removeObjectForKey:](self->mSublayersForPlugs, "removeObjectForKey:", objc_msgSend(objc_msgSend(a3, "plug"), "objectID"));
  if (self->mIsTransitioning) {
    [(MRLayerNavigator *)self endTransitionToSublayer];
  }
  if (self->mCurrentSublayer == a3) {
    self->mCurrentSublayer = 0;
  }
  if (self->mNextSublayer == a3) {
    self->mNextSublayer = 0;
  }
  -[NSMutableSet removeObject:](self->mPotentialTargetSublayers, "removeObject:");
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  objc_sync_exit(mSublayers);
  [a3 cleanup];
}

- (id)_createSublayerForPrecomputingWithPlug:(id)a3
{
  id v5 = +[NSMutableDictionary dictionaryWithDictionary:self->super.mParameters];
  [(NSMutableDictionary *)v5 setObject:&__kCFBooleanTrue forKey:@"precomputing"];
  [(NSMutableDictionary *)v5 setObject:&__kCFBooleanTrue forKey:@"readonly"];
  [(NSMutableDictionary *)v5 setObject:&__kCFBooleanTrue forKey:@"noAudio"];
  return +[MRLayer layerWithPlug:a3 andParameters:v5 inSuperlayer:self];
}

- (void)_createExtraSublayer
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  id v4 = +[MRLayer layerWithPlug:andParameters:inSuperlayer:](MRLayer, "layerWithPlug:andParameters:inSuperlayer:", objc_msgSend(-[NSMutableArray lastObject](self->mSublayers, "lastObject"), "plug"), self->super.mParameters, self);
  self->mExtraSublayer = v4;
  [(NSMutableArray *)self->mSublayers addObject:v4];
  [(MRLayerNavigator *)self _observeSublayer:self->mExtraSublayer];
  objc_sync_exit(mSublayers);
}

- (void)_removeExtraSublayer
{
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  if ([(MRLayer *)self->mExtraSublayer isPreactivated])
  {
    if ([(MRLayer *)self->mExtraSublayer isActivated]) {
      [(MRLayer *)self->mExtraSublayer deactivate];
    }
    [(MRLayer *)self->mExtraSublayer depreactivate:0];
  }
  [(MRLayerNavigator *)self _unobserveSublayer:self->mExtraSublayer];
  mExtraSublayer = self->mExtraSublayer;
  if (self->mNextSublayer == mExtraSublayer)
  {
    self->mNextSublayer = 0;
    mExtraSublayer = self->mExtraSublayer;
  }
  [(MRLayer *)mExtraSublayer cleanup];
  [(NSMutableArray *)self->mSublayers removeObject:self->mExtraSublayer];
  self->mExtraSublayer = 0;
  objc_sync_exit(mSublayers);
}

- (void)_observeSublayer:(id)a3
{
  [a3 addObserver:self forKeyPath:@"timeStamp" options:0 context:0];
  if (objc_msgSend(objc_msgSend(a3, "plug"), "container") && !self->super.mIsReadonly)
  {
    id v5 = [a3 plugAsHaven];
    [v5 addObserver:self forKeyPath:@"container" options:0 context:0];
  }
}

- (void)_unobserveSublayer:(id)a3
{
  if (([a3 isScheduledForDestruction] & 1) == 0)
  {
    [a3 removeObserver:self forKeyPath:@"timeStamp"];
    if (objc_msgSend(objc_msgSend(a3, "plug"), "container"))
    {
      if (!self->super.mIsReadonly)
      {
        id v5 = [a3 plugAsHaven];
        [v5 removeObserver:self forKeyPath:@"container"];
      }
    }
  }
}

- (void)_observePlug
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v3 _observePlug];
  [(MCContainer *)self->mContainer addObserver:self forKeyPath:@"plugs" options:3 context:0];
}

- (void)_unobservePlug
{
  [(MCContainer *)self->mContainer removeObserver:self forKeyPath:@"plugs"];
  v3.receiver = self;
  v3.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v3 _unobservePlug];
}

- (void)_observePlugOnPreactivate
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerNavigator;
  [(MRLayer *)&v3 _observePlugOnPreactivate];
  if (self->super.mDoAudio)
  {
    [(MCContainer *)self->mContainer addObserver:self forKeyPath:@"audioPlaylist.audioNoVolume" options:0 context:0];
    [(MCContainer *)self->mContainer addObserver:self forKeyPath:@"audioPlaylist.builtVolume" options:0 context:0];
  }
}

- (void)_unobservePlugOnDepreactivate
{
  if (self->super.mDoAudio)
  {
    [(MCContainer *)self->mContainer removeObserver:self forKeyPath:@"audioPlaylist.audioNoVolume"];
    [(MCContainer *)self->mContainer removeObserver:self forKeyPath:@"audioPlaylist.builtVolume"];
  }
  v3.receiver = self;
  v3.super_class = (Class)MRLayerNavigator;
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

- (void)_precomputeAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (!self->mSublayerToPrecompute) {
    return;
  }
  if (self->mPrecomputingType == 1)
  {
    if (objc_msgSend(self->mPrecomputingTarget, "isActivated", a3)) {
      goto LABEL_7;
    }
    if (self->mPrecomputingType == 1) {
      goto LABEL_6;
    }
  }
  if (![(MRTransition *)self->mCurrentTransition sourceLayer])
  {
LABEL_6:
    mSublayerToPrecompute = self->mSublayerToPrecompute;
    [(MRLayerClock *)[(MRLayer *)mSublayerToPrecompute clock] externalTime];
    if (!-[MRLayer isLoadedForTime:](mSublayerToPrecompute, "isLoadedForTime:")) {
      return;
    }
  }
LABEL_7:
  long long v9 = self->mSublayerToPrecompute;
  [(MRLayerClock *)[(MRLayer *)v9 clock] externalTime];
  id v10 = -[MRLayer retainedByUserRenderedImageAtTime:inContext:withArguments:](v9, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
  unint64_t mPrecomputingType = self->mPrecomputingType;
  if (mPrecomputingType == 3)
  {
    [self->mPrecomputingTarget setTargetLayerImage:v10];
  }
  else if (mPrecomputingType == 2)
  {
    [self->mPrecomputingTarget setSourceLayerImage:v10];
  }
  [v10 releaseByUser];
  [(MRLayer *)self->mSublayerToPrecompute deactivate];
  [(MRLayer *)self->mSublayerToPrecompute depreactivate:0];
  [(MRLayer *)self->mSublayerToPrecompute cleanup];

  self->mSublayerToPrecompute = 0;
  self->mPrecomputingTarget = 0;
  self->unint64_t mPrecomputingType = 0;
}

- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  -[MRLayerNavigator _precomputeAtTime:inContext:withArguments:](self, "_precomputeAtTime:inContext:withArguments:", a3);
  int mElementToDraw = self->mElementToDraw;
  if (mElementToDraw == 3)
  {
    [(MRRenderer *)self->super.mRenderer addIDToDisplay:[(MRTransition *)self->mCurrentTransition transitionID] :[(MRTransition *)self->mCurrentTransition presetID]];
    mCurrentTransition = self->mCurrentTransition;
    [(MRTransition *)mCurrentTransition progress];
    -[MRTransition renderAtTime:inContext:withArguments:](mCurrentTransition, "renderAtTime:inContext:withArguments:", a4, a5);
    [(MRTransition *)self->mCurrentTransition progress];
    self->_previouslyRenderedTransitionProgress = v11;
  }
  else
  {
    if (mElementToDraw == 2)
    {
      uint64_t v9 = 240;
    }
    else
    {
      if (mElementToDraw != 1) {
        goto LABEL_8;
      }
      uint64_t v9 = 496;
    }
    double v12 = *(Class *)((char *)&self->super.super.isa + v9);
    objc_msgSend(objc_msgSend(v12, "clock"), "externalTime");
    objc_msgSend(v12, "renderAtTime:inContext:withArguments:", a4, a5);
  }
LABEL_8:
  if (self->mIsFastScrubbing)
  {
    [a4 depthTest:1];
    id v13 = (long long *)[a4 modelViewMatrix];
    long long v15 = *v13;
    long long v14 = v13[1];
    long long v16 = v13[3];
    v41[2] = v13[2];
    long long v42 = v16;
    v41[0] = v15;
    v41[1] = v14;
    int v33 = DWORD2(v16);
    [a4 setShader:@"PlainTexture"];
    id v17 = objc_msgSend(-[MCContainer orderedPlugs](self->mContainer, "orderedPlugs"), "count");
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v18 = [(MCContainer *)self->mContainer orderedPlugs];
    id v19 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v37;
      double v34 = (double)(unint64_t)v17;
      double v35 = (float)(unint64_t)v17;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          [v23 container];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = objc_msgSend(objc_msgSend(v23, "container"), "slideAtIndex:", 0);
            if (v24)
            {
              id v25 = objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserThumbnailForAssetAtPath:", objc_msgSend(objc_msgSend(v24, "asset"), "path"));
              float v26 = ((double)((unint64_t)[v23 index] - self->mFastScrubbingStartIndex)
                   - self->mFastScrubbingProgress)
                  / v35
                  * 10.0;
              float v27 = exp((float)-(float)(v26 * v26));
              *((float *)&v42 + 2) = v27;
              [a4 setModelViewMatrix:v41 saveTo:0];
              id v28 = [v23 index];
              double v29 = v27 * -0.577 + 1.0;
              double v30 = ((double)(unint64_t)v28 * 1.8 / v34 + -0.9) * v29;
              double v31 = v29 * -0.8;
              [a4 localAspectRatio];
              +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderDumbImage:inContext:atPosition:andSize:", v25, a4, v30, v31, 0.1, 0.15 / v32);
            }
          }
        }
        id v20 = [v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v20);
    }
    [a4 unsetShader];
    DWORD2(v42) = v33;
    [a4 setModelViewMatrix:v41 saveTo:0];
    [a4 depthTest:0];
  }
}

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  -[MRLayerNavigator _precomputeAtTime:inContext:withArguments:](self, "_precomputeAtTime:inContext:withArguments:", a3);
  int mElementToDraw = self->mElementToDraw;
  if ((mElementToDraw - 1) >= 2)
  {
    if (mElementToDraw == 3)
    {
      [(MRRenderer *)self->super.mRenderer addIDToDisplay:[(MRTransition *)self->mCurrentTransition transitionID] :[(MRTransition *)self->mCurrentTransition presetID]];
      mCurrentTransition = self->mCurrentTransition;
      [(MRTransition *)mCurrentTransition progress];
      id v14 = -[MRTransition retainedByUserRenderedImageAtTime:inContext:withArguments:](mCurrentTransition, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
      [(MRTransition *)self->mCurrentTransition progress];
      self->_previouslyRenderedTransitionProgress = v15;
      return v14;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (mElementToDraw == 2) {
      uint64_t v9 = &OBJC_IVAR___MRLayerNavigator_mNextSublayer;
    }
    else {
      uint64_t v9 = &OBJC_IVAR___MRLayerNavigator_mCurrentSublayer;
    }
    id v10 = *(Class *)((char *)&self->super.super.isa + *v9);
    double v11 = (char *)[v10 renderingState];
    v11[240] = 1;
    *((_DWORD *)v11 + 4) = 0;
    *((void *)v11 + 1) = 0;
    *((_DWORD *)v11 + 11) = 1065353216;
    *(_OWORD *)(v11 + 28) = xmmword_1652A0;
    v11[244] = self->super.mRenderingState->var19;
    objc_msgSend(objc_msgSend(v10, "clock"), "externalTime");
    id result = objc_msgSend(v10, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
    v11[244] = 0;
  }
  return result;
}

- (void)_prerenderSublayersAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  double mForcedTransitionProgress = self->mForcedTransitionProgress;
  if (mForcedTransitionProgress > -1.0)
  {
LABEL_6:
    if (mForcedTransitionProgress <= 1.0) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  [(MRLayerClock *)self->super.mClock containerTime];
  double v8 = v7 - self->mTransitionStartTime;
  double mTotalMotionDuration = 1.0;
  if (!self->mIsInnerTransitioning) {
    double mTotalMotionDuration = self->mTotalMotionDuration;
  }
  if (v8 < mTotalMotionDuration)
  {
    double mForcedTransitionProgress = self->mForcedTransitionProgress;
    goto LABEL_6;
  }
LABEL_7:
  if (self->mIsTransitioning)
  {
    [(MRLayerNavigator *)self endTransitionToSublayer];
  }
  else if (self->mIsInnerTransitioning)
  {
    [(MRLayerNavigator *)self endMovingCurrentSublayer];
  }
LABEL_11:
  mSublayers = self->mSublayers;
  objc_sync_enter(mSublayers);
  if (!self->mTransitionChanges)
  {
    objc_sync_exit(mSublayers);
    goto LABEL_83;
  }
  mCurrentTransition = self->mCurrentTransition;
  if (mCurrentTransition) {
    [(MRTransition *)mCurrentTransition releaseByTransitioner:self];
  }
  if ([a5 skipsAnimations]) {
    goto LABEL_17;
  }
  mTransitionChanges = self->mTransitionChanges;
  if (mTransitionChanges->duration > 0.0)
  {
LABEL_35:
    p_mCurrentSublayer = &self->mCurrentSublayer;
    self->mCurrentSublayer = [(MRTransitionChanges *)mTransitionChanges currentSublayer];
    p_mNextSublayer = &self->mNextSublayer;
    self->mNextSublayer = [(MRTransitionChanges *)self->mTransitionChanges nextSublayer];
    self->mPausedSublayersForTransition = 0;
    self->mControlsSublayerTimes = 0;
    self->mTransitionStartTime = self->mTransitionChanges->startTime;
    self->double mTransitionDuration = self->mTransitionChanges->duration;
    self->BOOL mTransitionIsBackwards = self->mTransitionChanges->isBackwards;
    id v28 = [(MRLayerNavigator *)self _transitionWithTransitionTrigger:[(MRTransitionChanges *)self->mTransitionChanges transition]];
    self->mCurrentTransition = v28;
    if (!v28) {
      goto LABEL_63;
    }
    if (![(MRTransitionChanges *)self->mTransitionChanges pzr]) {
      goto LABEL_59;
    }
    double v87 = [(MRTransitionChanges *)self->mTransitionChanges pzr];
    [(MRTransition *)self->mCurrentTransition pzrStart:v87];
    self->double mForcedTransitionProgress = 0.0;
    self->mPausedSublayersForTransition = 1;
    if ([(MRTransition *)self->mCurrentTransition controlsLayersTime]) {
      goto LABEL_44;
    }
    if (self->mTransitionIsBackwards)
    {
      [(MRLayerClock *)[(MRLayer *)*p_mCurrentSublayer clock] phaseInDuration];
      if (v29 > 0.0) {
        goto LABEL_44;
      }
      [(MCPlug *)[(MRLayer *)*p_mNextSublayer plug] phaseOutDuration];
      if (v30 > 0.0) {
        goto LABEL_44;
      }
      if (self->mTransitionIsBackwards)
      {
        char v31 = 0;
        goto LABEL_45;
      }
    }
    [(MRLayerClock *)[(MRLayer *)*p_mCurrentSublayer clock] phaseOutDuration];
    if (v32 <= 0.0)
    {
      [(MCPlug *)[(MRLayer *)*p_mNextSublayer plug] phaseInDuration];
      char v31 = v86 > 0.0;
LABEL_45:
      self->mControlsSublayerTimes = v31;
      if ([(MRTransition *)self->mCurrentTransition supportsDirectionOverride])
      {
        int direction = v87->direction;
        if (direction == 12)
        {
          double speedY = v87->speedY;
        }
        else
        {
          if (direction != 255)
          {
            double speedX = v87->speedX;
            goto LABEL_55;
          }
          double speedX = v87->speedX;
          double speedY = v87->speedY;
          if (fabs(speedX) > fabs(speedY))
          {
LABEL_55:
            if (self->mTransitionIsBackwards == speedX < 0.0) {
              char v36 = 2;
            }
            else {
              char v36 = 1;
            }
LABEL_58:
            [(MRTransition *)self->mCurrentTransition setDirection:v36];
            goto LABEL_59;
          }
        }
        if (self->mTransitionIsBackwards == speedY < 0.0) {
          char v36 = 4;
        }
        else {
          char v36 = 8;
        }
        goto LABEL_58;
      }
LABEL_59:
      long long v37 = self->mCurrentTransition;
      if (self->mTransitionIsBackwards)
      {
        [(MRTransition *)v37 setSourceLayer:*p_mNextSublayer];
        long long v38 = &self->mCurrentSublayer;
      }
      else
      {
        [(MRTransition *)v37 setSourceLayer:*p_mCurrentSublayer];
        long long v38 = &self->mNextSublayer;
      }
      [(MRTransition *)self->mCurrentTransition setTargetLayer:*v38];
      self->_previouslyRenderedTransitionProgress = -1.0;
LABEL_63:
      unsigned __int8 v39 = [(MRLayer *)*p_mNextSublayer isPreactivated];
      double v40 = *p_mNextSublayer;
      if (v39)
      {
        if ([(MRLayer *)v40 isActivated]) {
          [(MRLayer *)*p_mNextSublayer deactivate];
        }
      }
      else
      {
        [(MRLayer *)v40 preactivate];
      }
      double startTime = self->mTransitionChanges->startTime;
      if ([(MRTransition *)self->mCurrentTransition isSplit])
      {
        double v41 = *p_mCurrentSublayer;
        if (self->mTransitionIsBackwards)
        {
          [(MRLayerClock *)[(MRLayer *)v41 clock] phaseInDuration];
          double v43 = v42;
          [(MCPlug *)[(MRLayer *)*p_mNextSublayer plug] phaseOutDuration];
        }
        else
        {
          [(MRLayerClock *)[(MRLayer *)v41 clock] phaseOutDuration];
          double v43 = v45;
          [(MCPlug *)[(MRLayer *)*p_mNextSublayer plug] phaseInDuration];
        }
        self->double mTransitionDuration = v43 + v44;
        if (self->mControlsSublayerTimes) {
          goto LABEL_75;
        }
        [(MRLayerClock *)[(MRLayer *)*p_mCurrentSublayer clock] phaseOutDuration];
        double v47 = v46;
        [(MRLayerClock *)[(MRLayer *)*p_mCurrentSublayer clock] containerTime];
        [(MRLayer *)*p_mCurrentSublayer setDuration:v47 + v48];
        double startTime = startTime + v47;
      }
      if (!self->mControlsSublayerTimes)
      {
        self->double mTotalMotionDuration = self->mTransitionDuration;
LABEL_77:
        if (self->mPausedSublayersForTransition || self->mIsInSlideFocusMode)
        {
          [(MRLayerClock *)[(MRLayer *)*p_mCurrentSublayer clock] pauseOnNextUpdate];
          [(MRLayerClock *)[(MRLayer *)*p_mNextSublayer clock] pauseOnNextUpdate];
          [(MRLayerClock *)[(MRLayer *)*p_mNextSublayer clock] setContainerTime:self->mNextSublayerInterestingTime];
        }
        self->_pauseWhenTransitionEnds = [(MRLayerClock *)self->super.mClock selfIsPaused];
        [(MRLayerClock *)self->super.mClock resumeOnNextUpdate];
        BOOL v24 = 1;
        goto LABEL_81;
      }
LABEL_75:
      [(MRLayerNavigator *)self _getInterestingTimesForSublayerControl];
      goto LABEL_77;
    }
LABEL_44:
    char v31 = 1;
    goto LABEL_45;
  }
  id v13 = [(MCTransitionTrigger *)[(MRTransitionChanges *)mTransitionChanges transition] transitionID];
  if (v13 == kMRLayerTransitionIDPhaseInOut)
  {
    mTransitionChanges = self->mTransitionChanges;
    goto LABEL_35;
  }
LABEL_17:
  id v14 = [(MRTransitionChanges *)self->mTransitionChanges nextSublayer];
  self->mCurrentSublayer = v14;
  unsigned __int8 v15 = [(MRLayer *)v14 isPreactivated];
  mCurrentSublayer = self->mCurrentSublayer;
  if (v15)
  {
    if ([(MRLayer *)mCurrentSublayer isActivated]) {
      [(MRLayer *)self->mCurrentSublayer deactivate];
    }
  }
  else
  {
    [(MRLayer *)mCurrentSublayer preactivate];
  }
  [(MRLayer *)self->mCurrentSublayer activate];
  double v17 = self->mTransitionChanges->startTime;
  [(MRLayer *)self->mCurrentSublayer phaseInDuration];
  [(MRLayer *)self->mCurrentSublayer setTimeIn:v17 - v18];
  if (self->mTransitionIsNextPrevious)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v20 = self->mCurrentSublayer;
    if (isKindOfClass)
    {
      id v21 = [(MRLayer *)v20 effect];
      double v22 = 1000000000.0;
      if (self->mTransitionStartedWithNext) {
        double v22 = 0.0;
      }
      [v21 interestingTimeForTime:v22];
    }
    else
    {
      [(MRLayer *)v20 phaseInDuration];
    }
    self->double mCurrentSublayerInterestingTime = v23;
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] setContainerTime:v23];
  }
  if (self->mIsInSlideFocusMode) {
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] pauseOnNextUpdate];
  }
  if (![(MRLayer *)self->mCurrentSublayer isLoadedForTime:0.0]) {
    [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] pauseOnNextUpdate];
  }
  BOOL v24 = 0;
  self->mNextSublayer = 0;
  self->mTransitionIsNextPrevious = 0;
  self->BOOL mTransitionStartedWithNext = 0;
  double startTime = -1.0;
LABEL_81:
  self->BOOL mIsTransitioning = v24;

  self->mTransitionChanges = 0;
  self->mNeedsToUpdatePotentialTargetSublayers = 1;
  objc_sync_exit(mSublayers);
  if (startTime >= 0.0) {
    [(MRLayer *)self->mNextSublayer setTimeIn:startTime];
  }
LABEL_83:
  if (self->mNeedsToUpdatePotentialTargetSublayers)
  {
    [(NSMutableSet *)self->mPotentialTargetSublayers removeAllObjects];
    double v49 = self->mCurrentSublayer;
    if (self->mIsSerializerBased)
    {
      unint64_t v50 = [(MCPlugSerial *)[(MRLayer *)v49 plugAsSerial] index];
      unint64_t v51 = (unint64_t)[(NSMutableArray *)self->mSublayers count];
      if (v50) {
        unint64_t v52 = v50;
      }
      else {
        unint64_t v52 = v51;
      }
      mExtraSublayer = self->mExtraSublayer;
      if ((mExtraSublayer
         || (mExtraSublayer = (MRLayer *)-[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", (v50 + 1) % v51), "objectID"))) != 0)&& mExtraSublayer != self->mCurrentSublayer)
      {
        [(NSMutableSet *)self->mPotentialTargetSublayers addObject:mExtraSublayer];
        if (!self->mNextSublayer)
        {
          [(MRLayer *)self->mCurrentSublayer timeIn];
          double v55 = v54;
          [(MRLayer *)self->mCurrentSublayer duration];
          double v57 = v55 + v56;
          [(MCPlugSerial *)[(MRLayer *)self->mCurrentSublayer plugAsSerial] transitionDuration];
          [(MRLayer *)mExtraSublayer setTimeIn:v57 - v58];
        }
      }
      v59 = self->mExtraSublayer;
      if ((v59
         || (v59 = (MRLayer *)-[NSMutableDictionary objectForKey:](self->mSublayersForPlugs, "objectForKey:", objc_msgSend(-[MCContainer plugAtIndex:](self->mContainer, "plugAtIndex:", v52 - 1), "objectID"))) != 0)&& v59 != mExtraSublayer&& v59 != self->mCurrentSublayer)
      {
        -[NSMutableSet addObject:](self->mPotentialTargetSublayers, "addObject:");
      }
    }
    else
    {
      v60 = [(MRLayer *)v49 nextTransition];
      double v61 = self->mExtraSublayer;
      if ((v61
         || (double v61 = [(MRLayerNavigator *)self sublayerForKey:[(MCTransitionTrigger *)v60 transitionDestinationPlugID]]) != 0)&& v61 != self->mCurrentSublayer)
      {
        [(NSMutableSet *)self->mPotentialTargetSublayers addObject:v61];
        if (v61 != self->mNextSublayer) {
          [(MRLayer *)v61 setTimeIn:1.0e36];
        }
      }
      v62 = [(MRLayer *)self->mCurrentSublayer previousTransition];
      double v63 = self->mExtraSublayer;
      if ((v63
         || (double v63 = [(MRLayerNavigator *)self sublayerForKey:[(MCTransitionTrigger *)v62 transitionDestinationPlugID]]) != 0)&& v63 != v61&& v63 != self->mCurrentSublayer)
      {
        [(NSMutableSet *)self->mPotentialTargetSublayers addObject:v63];
        if (v63 != self->mNextSublayer) {
          [(MRLayer *)v63 setTimeIn:1.0e36];
        }
      }
    }
    self->mNeedsToUpdatePotentialTargetSublayers = 0;
  }
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  v64 = self->mSublayers;
  id v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v90 objects:v94 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v91;
    do
    {
      for (i = 0; i != v65; i = (char *)i + 1)
      {
        if (*(void *)v91 != v66) {
          objc_enumerationMutation(v64);
        }
        double v68 = *(MRLayer **)(*((void *)&v90 + 1) + 8 * i);
        unsigned int v69 = [(MRLayer *)v68 isPreactivated];
        unsigned int v70 = [(MRLayer *)v68 isActivated];
        if (self->super.mIsPreactivated)
        {
          if (v68 == self->mCurrentSublayer
            || v68 == self->mNextSublayer
            || [(MCPlug *)[(MRLayer *)v68 plug] preactivatesWithParent])
          {
            unsigned int v71 = 1;
          }
          else
          {
            unsigned int v71 = [(NSMutableSet *)self->mPotentialTargetSublayers containsObject:v68];
          }
        }
        else
        {
          unsigned int v71 = 0;
        }
        if (!self->super.mIsActivated) {
          goto LABEL_127;
        }
        if (v68 != self->mCurrentSublayer)
        {
          if (self->mIsTransitioning)
          {
            BOOL v72 = v68 == self->mNextSublayer;
            if (!v71) {
              goto LABEL_143;
            }
            goto LABEL_128;
          }
LABEL_127:
          BOOL v72 = 0;
          if (!v71) {
            goto LABEL_143;
          }
          goto LABEL_128;
        }
        BOOL v72 = 1;
        if (!v71)
        {
LABEL_143:
          if (v70) {
            [(MRLayer *)v68 deactivate];
          }
          if (v69) {
            [(MRLayer *)v68 depreactivate:1];
          }
          continue;
        }
LABEL_128:
        if ((v69 & 1) == 0) {
          [(MRLayer *)v68 preactivate];
        }
        if ((!v72 | v70))
        {
          if (((v72 | v70 ^ 1) & 1) == 0) {
            [(MRLayer *)v68 deactivate];
          }
        }
        else
        {
          [(MRLayer *)v68 activate];
          if (![(MRLayer *)v68 isLoadedForTime:0.0]) {
            [(MRLayerClock *)[(MRLayer *)v68 clock] pauseOnNextUpdate];
          }
        }
        if (!v72)
        {
          [(MRLayer *)v68 timeIn];
          BOOL v75 = v74 == 1.0e36;
          double v76 = -6.0;
          if (!v75)
          {
            if ([(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] selfIsPaused]
              && ![(MRLayerClock *)[(MRLayer *)v68 clock] selfIsPaused])
            {
              [(MRLayerClock *)[(MRLayer *)v68 clock] pauseOnNextUpdate];
            }
            else if (![(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] selfIsPaused] {
                   && [(MRLayerClock *)[(MRLayer *)v68 clock] selfIsPaused])
            }
            {
              [(MRLayerClock *)[(MRLayer *)v68 clock] resumeOnNextUpdate];
            }
            [(MRLayerClock *)self->super.mClock containerTime];
            double v78 = v77;
            [(MRLayer *)v68 timeIn];
            double v80 = v79;
            [(MRLayer *)self->mCurrentSublayer timeIn];
            double v82 = v81;
            [(MRLayer *)v68 timeIn];
            double v73 = v78 - v80;
            double v84 = v82 - v83 + 2.0;
            BOOL v85 = v78 - v80 < v84 || v84 <= 2.0;
            double v76 = v84 + -0.001;
            if (v85) {
              double v76 = v78 - v80;
            }
            if (v76 <= -6.0) {
              double v76 = -6.0;
            }
          }
          -[MRLayer prerenderForTime:inContext:withArguments:](v68, "prerenderForTime:inContext:withArguments:", a4, a5, v76, v73);
          if ([(MRLayerClock *)[(MRLayer *)v68 clock] jumpedBackInTime]) {
            [(MRLayer *)v68 synchronizeTime];
          }
        }
      }
      id v65 = [(NSMutableArray *)v64 countByEnumeratingWithState:&v90 objects:v94 count:16];
    }
    while (v65);
  }
}

- (void)_getInterestingTimesForSublayerControl
{
  [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
  self->double mCurrentSublayerContainerTimeOnTransitionStart = v3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  mCurrentSublayer = self->mCurrentSublayer;
  if (isKindOfClass)
  {
    id v6 = [(MRLayer *)mCurrentSublayer effect];
    [v6 interestingTimeForTime:self->mCurrentSublayerContainerTimeOnTransitionStart];
    self->double mCurrentSublayerInterestingTime = v7;
    objc_msgSend(v6, "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:", &self->mCurrentSublayerLazyDuration, &self->mCurrentSublayerLazyFactor, &self->mCurrentSublayerAnimationDuration);
  }
  else
  {
    [(MRLayer *)mCurrentSublayer phaseInDuration];
    self->double mCurrentSublayerInterestingTime = v8;
    [(MRLayer *)self->mCurrentSublayer phaseOutDuration];
    self->mCurrentSublayerAnimationDuration = v9;
    [(MRLayer *)self->mCurrentSublayer duration];
    self->mCurrentSublayerLazyDuration = v10
                                       - self->mCurrentSublayerInterestingTime
                                       - self->mCurrentSublayerAnimationDuration;
    self->double mCurrentSublayerLazyFactor = 0.0;
  }
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();
  mNextSublayer = self->mNextSublayer;
  if (v11)
  {
    id v13 = [(MRLayer *)mNextSublayer effect];
    id v14 = v13;
    double v15 = 1000000000.0;
    if (!self->mTransitionIsBackwards) {
      double v15 = 0.0;
    }
    [v13 interestingTimeForTime:v15];
    self->double mNextSublayerInterestingTime = v16;
    objc_msgSend(v14, "getLazyDuration:lazyFactor:animationDuration:fromInterestingTime:", &self->mNextSublayerLazyDuration, &self->mNextSublayerLazyFactor, &self->mNextSublayerAnimationDuration);
  }
  else
  {
    [(MRLayer *)mNextSublayer phaseInDuration];
    self->double mNextSublayerInterestingTime = v17;
    [(MRLayer *)self->mNextSublayer phaseOutDuration];
    self->double mNextSublayerAnimationDuration = v18;
    [(MRLayer *)self->mNextSublayer duration];
    self->double mNextSublayerLazyDuration = v19 - self->mNextSublayerInterestingTime - self->mNextSublayerAnimationDuration;
    self->double mNextSublayerLazyFactor = 0.0;
  }
  if (self->mTransitionIsBackwards)
  {
    double v20 = self->mTransitionDuration
        + (self->mCurrentSublayerContainerTimeOnTransitionStart - self->mCurrentSublayerInterestingTime)
        * self->mCurrentSublayerLazyFactor
        + self->mNextSublayerLazyDuration * self->mNextSublayerLazyFactor;
    id v21 = &OBJC_IVAR___MRLayerNavigator_mTotalMotionDuration;
  }
  else
  {
    double v22 = self->mTransitionDuration + self->mCurrentSublayerLazyDuration * self->mCurrentSublayerLazyFactor;
    self->double mTotalMotionDuration = v22;
    double v20 = 1.0;
    if (v22 > 0.0)
    {
      [(MRLayerClock *)[(MRLayer *)self->mCurrentSublayer clock] containerTime];
      double v20 = (v23 - self->mCurrentSublayerInterestingTime)
          * self->mCurrentSublayerLazyFactor
          / self->mTotalMotionDuration;
    }
    self->double mForcedTransitionProgressOffset = v20;
    id v21 = &OBJC_IVAR___MRLayerNavigator_mForcedTransitionProgress;
  }
  *(double *)((char *)&self->super.super.isa + *v21) = v20;
}

@end