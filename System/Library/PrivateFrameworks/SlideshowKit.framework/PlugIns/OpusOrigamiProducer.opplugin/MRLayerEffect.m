@interface MRLayerEffect
- (BOOL)_hideTextWhileEditing;
- (BOOL)_isNative3D;
- (BOOL)_setStateValue:(id)a3 forKey:(id)a4;
- (BOOL)asynchronousOperationsAreSuspended;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 forElement:;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)isAlphaFriendly;
- (BOOL)isInInteractiveMode;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isOpaque;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDynamicExpansion;
- (CGSize)_maxSizeForTextElement:(id)a3;
- (CGSize)_rendererSize;
- (MCContainerEffect)container;
- (MREffect)effect;
- (MRLayerEffect)initWithEffectID:(id)a3 andParameters:(id)a4;
- (MRLayerEffect)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (NSDictionary)slideProvidersForElementIDs;
- (NSDictionary)textsForElementIDs;
- (NSString)editedElement;
- (NSString)targetedElement;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)panoramaPanningCancel:(id)a3;
- (double)panoramaPanningEnd:(id)a3;
- (double)panoramaPanningStart:(id)a3;
- (double)panoramaPanningUpdate:(id)a3;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_effectAttributes;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)elementHitAtPoint:(CGPoint)a3 localPoint:(CGPoint *)a4;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)_maxLinesForTextElement:(id)a3;
- (void)_addAudioDucker:(id)a3;
- (void)_cleanupProviders;
- (void)_effectTriggeredStop;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_rebuildEffect;
- (void)_removeAudioDucker:(id)a3;
- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)_requestRendering;
- (void)_stallRenderer;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_updateEffectAttributes;
- (void)_updateSlides;
- (void)_updateTexts;
- (void)_updateTiming;
- (void)activate;
- (void)animateCenterOfSlide:(id)a3 to:(CGPoint)a4 withDuration:(double)a5;
- (void)animateCenterOfSlide:(id)a3 to:(CGPoint)a4 withDuration:(double)a5 andInitialSpeed:(CGSize)a6;
- (void)animateRotationOfSlide:(id)a3 to:(double)a4 withDuration:(double)a5;
- (void)animateScaleOfSlide:(id)a3 to:(double)a4 withDuration:(double)a5;
- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preactivate;
- (void)resumeOrPause:(BOOL)a3;
- (void)setAssetPath:(id)a3 ofSlide:(id)a4;
- (void)setCenter:(CGPoint)a3 ofSlide:(id)a4;
- (void)setDuration:(double)a3;
- (void)setEditedElement:(id)a3;
- (void)setIsInInteractiveMode:(BOOL)a3;
- (void)setKenBurnsType:(int)a3 ofSlide:(id)a4;
- (void)setMaxScale:(double)a3 ofSlide:(id)a4;
- (void)setPixelSize:(CGSize)a3;
- (void)setPlayerHint:(id)a3 ofSlide:(id)a4;
- (void)setRotation:(double)a3 ofSlide:(id)a4;
- (void)setScale:(double)a3 ofSlide:(id)a4;
- (void)setTargetedElement:(id)a3;
- (void)setTime:(double)a3 ofSlide:(id)a4;
- (void)suspendAsynchronousOperations:(BOOL)a3;
- (void)synchronizeTime;
- (void)unload;
@end

@implementation MRLayerEffect

- (MRLayerEffect)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MRLayerEffect;
  v6 = [(MRLayer *)&v9 initWithPlug:a3 andParameters:a4 inSuperlayer:a5];
  if (v6)
  {
    v7 = (MCContainerEffect *)[a3 container];
    v6->mContainer = v7;
    v6->mEffectID = (NSString *)[(NSString *)[(MCContainerEffect *)v7 effectID] copy];
    v6->mSlideProvidersForElementIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mTextsForElementIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v6->mNeedsToUpdateEffect = 1;
    v6->mNeedsToUpdateEffectAttributes = 0;
    v6->mNeedsToUpdateTexts = 0;
    v6->mNeedsToUpdateSlides = 0;
    v6->mSlidesAreReadonly = objc_msgSend(-[NSDictionary objectForKey:](v6->super.mParameters, "objectForKey:", @"slidesAreReadonly"), "BOOLValue");
    if (!v6->super.mIsReadonly) {
      [(MRLayerEffect *)v6 _observePlug];
    }
  }
  return v6;
}

- (MRLayerEffect)initWithEffectID:(id)a3 andParameters:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MRLayerEffect;
  v5 = [(MRLayer *)&v7 initWithParameters:a4];
  if (v5)
  {
    v5->mEffectID = (NSString *)[a3 copy];
    v5->mSlideProvidersForElementIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5->mTextsForElementIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5->mNeedsToUpdateEffect = 1;
    v5->mSlidesAreReadonly = 1;
    [(MRLayerEffect *)v5 _rebuildEffect];
  }
  return v5;
}

- (void)cleanup
{
  if (self->super.mUUID)
  {
    [(MRLayerEffect *)self _cleanupProviders];
    [(MREffect *)self->mEffect releaseByEffectLayer:self];
    self->mEffect = 0;
    v3.receiver = self;
    v3.super_class = (Class)MRLayerEffect;
    [(MRLayer *)&v3 cleanup];

    self->mContainer = 0;
    self->mEffectID = 0;

    self->mSlideProvidersForElementIDs = 0;
    self->mMultiImageModelInput = 0;

    self->mSlideProviders = 0;
    self->mTextsForElementIDs = 0;

    self->mEditedElement = 0;
    self->mTargetedElement = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ([a3 isEqualToString:@"effectID"])
  {
    v11 = &OBJC_IVAR___MRLayerEffect_mNeedsToUpdateEffect;
LABEL_5:
    *((unsigned char *)&self->super.super.isa + *v11) = 1;
    BOOL mDoAudio = self->super.mDoAudio;
    v13 = &OBJC_IVAR___MRLayer_mNeedsToRequestRebuildAudio;
LABEL_6:
    *((unsigned char *)&self->super.super.isa + *v13) = mDoAudio;
    goto LABEL_7;
  }
  if ([a3 isEqualToString:@"slides"])
  {
    v11 = &OBJC_IVAR___MRLayerEffect_mNeedsToUpdateSlides;
    goto LABEL_5;
  }
  if ([a3 isEqualToString:@"asset.path"])
  {
    BOOL mDoAudio = 1;
    v13 = &OBJC_IVAR___MRLayerEffect_mNeedsToUpdateSlides;
    goto LABEL_6;
  }
  if (([a3 isEqualToString:@"plug"] & 1) == 0)
  {
    if ([a3 isEqualToString:@"texts"])
    {
      BOOL mDoAudio = 1;
      v13 = &OBJC_IVAR___MRLayerEffect_mNeedsToUpdateTexts;
      goto LABEL_6;
    }
    if ([a3 isEqualToString:@"fullDuration"])
    {
      BOOL mDoAudio = 1;
      v13 = &OBJC_IVAR___MRLayerEffect_mNeedsToUpdateTiming;
      goto LABEL_6;
    }
    if (![a3 isEqualToString:@"effectAttributes"])
    {
      if ([a3 isEqualToString:@"audioNoVolume"])
      {
        BOOL v14 = self->super.mDoAudio;
        v15 = &OBJC_IVAR___MRLayer_mNeedsToRequestRebuildAudio;
      }
      else
      {
        if (![a3 isEqualToString:@"builtVolume"]) {
          goto LABEL_9;
        }
        BOOL v14 = self->super.mDoAudio;
        v15 = &OBJC_IVAR___MRLayer_mNeedsToRequestRebuildVolume;
      }
      *((unsigned char *)&self->super.super.isa + *v15) = v14;
      goto LABEL_9;
    }
    self->mNeedsToUpdateEffectAttributes = 1;
    v11 = &OBJC_IVAR___MRLayerEffect_mNeedsToUpdateTexts;
    goto LABEL_5;
  }
LABEL_7:
  if (!self->super.mIsPrecomputing)
  {
    [(MRLayer *)self->super.mSuperlayer setNeedsUpdateForPluggerOfSublayer:self];
    [(MRLayer *)self stampTime];
  }
LABEL_9:
  v16.receiver = self;
  v16.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v16 observeValueForKeyPath:a3 ofObject:a4 change:a5 context:a6];
}

- (void)resumeOrPause:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 resumeOrPause:a3];
}

- (void)synchronizeTime
{
  v13.receiver = self;
  v13.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v13 synchronizeTime];
  if (self->_ignoresNextTimeSynchronization)
  {
    self->_ignoresNextTimeSynchronization = 0;
  }
  else if (!self->_isInInteractiveMode)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    mSlideProviders = self->mSlideProviders;
    id v4 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v9 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(mSlideProviders);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          [(MRLayerClock *)self->super.mClock containerTime];
          objc_msgSend(v8, "setTime:");
        }
        id v5 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v9 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)beginMorphingToAspectRatio:(double)a3 withDuration:(double)a4
{
  [(MREffect *)self->mEffect beginMorphingToAspectRatio:a3 withDuration:a4];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mSlideProviders = self->mSlideProviders;
  id v6 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(mSlideProviders);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) beginLiveUpdate];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)activate
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 activate];
  [(MRLayerEffect *)self _updateTiming];
  self->super.mNeedsToSynchronizeTime = 1;
}

- (void)setDuration:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v4 setDuration:a3];
  [(MRLayerEffect *)self _updateTiming];
}

- (void)preactivate
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 preactivate];
  if (self->mNeedsToUpdateEffect) {
    [(MRLayerEffect *)self _rebuildEffect];
  }
  if (self->mNeedsToUpdateSlides) {
    [(MRLayerEffect *)self _updateSlides];
  }
  if (self->mNeedsToUpdateTexts) {
    [(MRLayerEffect *)self _updateTexts];
  }
  if (self->mNeedsToUpdateEffectAttributes) {
    [(MRLayerEffect *)self _updateEffectAttributes];
  }
}

- (BOOL)isLoadedForTime:(double)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MRLayerEffect;
  unsigned int v5 = -[MRLayer isLoadedForTime:](&v23, "isLoadedForTime:");
  if (v5)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    mSlideProviders = self->mSlideProviders;
    id v7 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v20;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(mSlideProviders);
          }
          long long v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (([v11 isLoaded] & 1) == 0)
          {
            [v11 showTime];
            if (v12 <= a3)
            {
              [v11 showDuration];
              if (v13 < 0.0
                || ([v11 showTime], double v15 = v14, objc_msgSend(v11, "showDuration"), v15 + v16 > a3))
              {
                LOBYTE(v5) = 0;
                return v5;
              }
            }
          }
        }
        id v8 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    mEffect = self->mEffect;
    if (mEffect) {
      LOBYTE(v5) = [(MREffect *)mEffect isLoadedForTime:a3];
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)unload
{
  self->mEffect = 0;
  self->mNeedsToUpdateEffect = 1;
  [(MRLayerEffect *)self _cleanupProviders];
  self->mMultiImageSlideRange.location = 0;
  self->mMultiImageSlideRange.length = 0;
}

- (BOOL)isOpaque
{
  return [(MREffect *)self->mEffect isOpaque];
}

- (BOOL)isAlphaFriendly
{
  return [(MREffect *)self->mEffect isAlphaFriendly];
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  v49.receiver = self;
  v49.super_class = (Class)MRLayerEffect;
  unsigned __int8 v8 = -[MRLayer prerenderForTime:inContext:withArguments:](&v49, "prerenderForTime:inContext:withArguments:");
  if (!self->mHasRequestedMoreSlides)
  {
    if ([(MREffect *)self->mEffect supportsDynamicExpansion])
    {
      mEffect = self->mEffect;
      [(MRLayerClock *)self->super.mClock containerTime];
      if (-[MREffect needsMoreSlidesAtTime:](mEffect, "needsMoreSlidesAtTime:"))
      {
        self->mHasRequestedMoreSlides = 1;
        [(MRRenderer *)self->super.mRenderer effect:self->mContainer requestedNumberOfSlides:[(MREffect *)self->mEffect typicalSlideBatchSize] firstSlideIndexStillNeeded:[(MREffect *)self->mEffect firstSlideIndexStillNeededAtTime:a3]];
      }
    }
  }
  [a4 localAspectRatio];
  int v10 = LODWORD(v12);
  double height = self->super.mPixelSize.height;
  LODWORD(v12) = 1.0;
  if (height > 0.0)
  {
    CGFloat v12 = self->super.mPixelSize.width / height;
    *(float *)&CGFloat v12 = v12;
  }
  [a4 setLocalAspectRatio:v12];
  if (self->mNeedsToUpdateEffect)
  {
    [(MRLayerEffect *)self _rebuildEffect];
    if (!self->mNeedsToUpdateSlides) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (self->mNeedsToUpdateSlides)
  {
LABEL_11:
    [(MRLayerEffect *)self _updateSlides];
LABEL_12:
    char v13 = 1;
    goto LABEL_13;
  }
  if (self->mNeedsToUpdateTexts || self->mNeedsToUpdateEffectAttributes) {
    goto LABEL_12;
  }
  if (self->mNeedsToUpdateEffectLiveAttributes) {
    char v13 = 1;
  }
  else {
    char v13 = v8;
  }
LABEL_13:
  char v39 = v13;
  if (self->mNeedsToUpdateTexts) {
    [(MRLayerEffect *)self _updateTexts];
  }
  if (self->mNeedsToUpdateEffectAttributes) {
    [(MRLayerEffect *)self _updateEffectAttributes];
  }
  if (self->mNeedsToUpdateEffectLiveAttributes)
  {
    self->mNeedsToUpdateEffectLiveAttributes = 0;
    [(MREffect *)self->mEffect setLiveAttributes:self->super.mPersistentState];
  }
  id v14 = [a5 currentLayoutIndex];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  mSlideProviders = self->mSlideProviders;
  id v16 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(mSlideProviders);
        }
        long long v20 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v20, "slide"), "currentLayoutIndex") != v14)
        {
          objc_msgSend(objc_msgSend(v20, "slide"), "setCurrentLayoutIndex:", v14);
          [v20 setNeedsToUpdateLayout:1];
        }
        objc_msgSend(v20, "updateStuffWithAssetManager:", objc_msgSend(a4, "assetManager"));
      }
      id v17 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v17);
  }
  if (self->mNeedsToUpdateTiming) {
    [(MRLayerEffect *)self _updateTiming];
  }
  [(MRLayerClock *)self->super.mClock containerTime];
  double v22 = v21;
  double previouslyRenderedContainerTime = self->_previouslyRenderedContainerTime;
  v24 = self->mEffect;
  [(MRLayerClock *)self->super.mClock containerTime];
  unsigned __int8 v25 = -[MREffect prerenderForTime:inContext:withArguments:](v24, "prerenderForTime:inContext:withArguments:", a4, a5);
  if (v22 == previouslyRenderedContainerTime) {
    unsigned __int8 v26 = 0;
  }
  else {
    unsigned __int8 v26 = v25;
  }
  char v27 = v26 | v39;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  v28 = self->mSlideProviders;
  id v29 = [(NSArray *)v28 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v29)
  {
    id v31 = v29;
    uint64_t v32 = *(void *)v42;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(v28);
        }
        v34 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
        if (self->super.mIsPrecomputing)
        {
          [(MRLayerClock *)self->super.mClock containerTime];
          *(float *)&double v35 = v35;
          [v34 setStillTime:v35];
        }
        [(MRLayerClock *)self->super.mClock containerTime];
        unsigned __int8 v36 = objc_msgSend(v34, "prerenderForTime:inContext:withArguments:", a4, a5);
        if (v22 == previouslyRenderedContainerTime) {
          unsigned __int8 v37 = 0;
        }
        else {
          unsigned __int8 v37 = v36;
        }
        v27 |= v37;
      }
      id v31 = [(NSArray *)v28 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v31);
  }
  LODWORD(v30) = v10;
  [a4 setLocalAspectRatio:v30];
  return self->super.mIsActivated & v27;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->super.mPixelSize.width <= 0.0 || self->super.mPixelSize.height <= 0.0) {
    return 0;
  }
  [(MRLayerClock *)self->super.mClock containerTime];
  double v10 = v9;
  id v11 = -[MREffect patchworkAtTime:inContext:withArguments:](self->mEffect, "patchworkAtTime:inContext:withArguments:", a4, a5);
  if (v11
    || (v13.receiver = self,
        v13.super_class = (Class)MRLayerEffect,
        (id v11 = [(MRLayer *)&v13 patchworkAtTime:a4 inContext:a5 withArguments:a3]) != 0))
  {
    [(MRRenderer *)self->super.mRenderer addIDToDisplay:self->mEffectID :[(NSDictionary *)[(MREffect *)self->mEffect attributes] objectForKey:@"PresetID"]];
  }
  self->_double previouslyRenderedContainerTime = v10;
  return v11;
}

- (BOOL)supportsDynamicExpansion
{
  return [(MREffect *)self->mEffect supportsDynamicExpansion];
}

- (void)setPixelSize:(CGSize)a3
{
  p_mPixelSize = &self->super.mPixelSize;
  if (a3.width != self->super.mPixelSize.width || a3.height != self->super.mPixelSize.height)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRLayerEffect;
    -[MRLayer setPixelSize:](&v15, "setPixelSize:");
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    mSlideProviders = self->mSlideProviders;
    id v7 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(mSlideProviders);
          }
          objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "setDefaultSize:", p_mPixelSize->width, p_mPixelSize->height);
        }
        id v8 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
    -[MREffect setPixelSize:](self->mEffect, "setPixelSize:", p_mPixelSize->width, p_mPixelSize->height);
  }
}

- (BOOL)hasSomethingToRender
{
  v5.receiver = self;
  v5.super_class = (Class)MRLayerEffect;
  BOOL v3 = [(MRLayer *)&v5 hasSomethingToRender];
  if (v3) {
    LOBYTE(v3) = self->mEffect != 0;
  }
  return v3;
}

- (void)setTargetedElement:(id)a3
{
  if (([a3 isEqualToString:self->mTargetedElement] & 1) == 0)
  {

    self->mTargetedElement = (NSString *)[a3 copy];
    self->super.mNeedsRendering = 1;
  }
}

- (void)setEditedElement:(id)a3
{
  if (([a3 isEqualToString:self->mEditedElement] & 1) == 0)
  {

    self->mEditedElement = (NSString *)[a3 copy];
    self->super.mNeedsRendering = 1;
  }
}

- (BOOL)hasAudio
{
  BOOL v3 = [(MCAudioPlaylist *)[(MCContainer *)self->mContainer audioPlaylist] songs];
  if (!v3 || ![(NSSet *)v3 count])
  {
    objc_super v5 = [(MRRenderer *)self->super.mRenderer assetManagementDelegate];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = [(MCContainerEffect *)self->mContainer slides];
    id v4 = [(NSSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (!v4) {
      return (char)v4;
    }
    id v7 = v4;
    uint64_t v8 = *(void *)v13;
LABEL_6:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v6);
      }
      double v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
      if ([v10 song]
        || (-[MZMediaManagement isSupportedMovieForAssetAtPath:](v5, "isSupportedMovieForAssetAtPath:", objc_msgSend(objc_msgSend(v10, "asset"), "path")) & 1) != 0)
      {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [(NSSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
        LOBYTE(v4) = 0;
        if (v7) {
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
  mEffect = self->mEffect;
  if (mEffect) {
    return [(MREffect *)mEffect isNative3D];
  }
  else {
    return 1;
  }
}

- (BOOL)_setStateValue:(id)a3 forKey:(id)a4
{
  v23.receiver = self;
  v23.super_class = (Class)MRLayerEffect;
  BOOL v7 = -[MRLayer _setStateValue:forKey:](&v23, "_setStateValue:forKey:");
  self->mNeedsToUpdateEffectLiveAttributes = v7;
  if ([a4 isEqualToString:@"isPlaying"])
  {
    BOOL v18 = v7;
    unsigned int v8 = [a3 BOOLValue];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    mSlideProviders = self->mSlideProviders;
    id v10 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(mSlideProviders);
          }
          long long v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          [v14 setIsStill:v8 ^ 1];
          char v15 = v8 ^ 1;
          double v16 = 0.0;
          if (!self->super.mIsActivated) {
            char v15 = 1;
          }
          if ((v15 & 1) == 0) {
            [(MRLayerClock *)self->super.mClock containerTime];
          }
          [v14 setShowTime:v16];
        }
        id v11 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v11);
    }
    [(MRRenderer *)self->super.mRenderer requestRendering:0];
    return v18;
  }
  return v7;
}

- (void)setAssetPath:(id)a3 ofSlide:(id)a4
{
  objc_msgSend(-[NSMutableDictionary objectForKey:](self->mSlideProvidersForElementIDs, "objectForKey:", a4), "setAssetPath:", a3);
  if (objc_opt_respondsToSelector())
  {
    mEffect = self->mEffect;
    [(MREffect *)mEffect resetPZR];
  }
}

- (void)setPlayerHint:(id)a3 ofSlide:(id)a4
{
  self->_ignoresNextTimeSynchronization = 1;
}

- (void)setTime:(double)a3 ofSlide:(id)a4
{
  self->_ignoresNextTimeSynchronization = 1;
}

- (void)setKenBurnsType:(int)a3 ofSlide:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a4];
  [v5 setDefaultKenBurnsType:v4];
}

- (void)setCenter:(CGPoint)a3 ofSlide:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a4];
  objc_msgSend(v6, "setCenter:", x, y);
}

- (void)setScale:(double)a3 ofSlide:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a4];
  [v5 setScale:a3];
}

- (void)setRotation:(double)a3 ofSlide:(id)a4
{
  id v5 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a4];
  [v5 setRotation:a3];
}

- (void)setMaxScale:(double)a3 ofSlide:(id)a4
{
  id v6 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a4];
  if (a3 <= 0.0) {
    double v7 = 1.0;
  }
  else {
    double v7 = a3;
  }
  double v8 = v7 * self->super.mPixelSize.width;
  double v9 = v7 * self->super.mPixelSize.height;
  objc_msgSend(v6, "setDefaultSize:", v8, v9);
}

- (void)animateCenterOfSlide:(id)a3 to:(CGPoint)a4 withDuration:(double)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a3];
  if (v8)
  {
    double v9 = v8;
    if (a5 <= 0.0)
    {
      objc_msgSend(v8, "setCenter:", x, y);
    }
    else
    {
      id v10 = +[MCAnimationPathKeyframed animationPathWithKey:@"center"];
      [v10 setIsTriggered:1];
      [v9 center];
      id v11 = objc_msgSend(v10, "createKeyframeWithPoint:atTime:offsetKind:", 100);
      LODWORD(v12) = 0.5;
      [v11 setPostControl:v12];
      id v13 = objc_msgSend(v10, "createKeyframeWithPoint:atTime:offsetKind:", 100, x, y, a5);
      LODWORD(v14) = -0.5;
      [v13 setPreControl:v14];
      [v9 setCenterAnimationPath:v10];
    }
  }
}

- (void)animateScaleOfSlide:(id)a3 to:(double)a4 withDuration:(double)a5
{
  id v7 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a3];
  if (v7)
  {
    id v8 = v7;
    if (a5 <= 0.0)
    {
      [v7 setScale:a4];
    }
    else
    {
      id v9 = +[MCAnimationPathKeyframed animationPathWithKey:@"scale"];
      [v9 setIsTriggered:1];
      [v8 scale];
      *(float *)&double v10 = v10;
      id v11 = [v9 createKeyframeWithScalar:100 atTime:v10 offsetKind:0.0];
      LODWORD(v12) = 0.5;
      [v11 setPostControl:v12];
      *(float *)&double v13 = a4;
      id v14 = [v9 createKeyframeWithScalar:100 atTime:v13 offsetKind:a5];
      LODWORD(v15) = -0.5;
      [v14 setPreControl:v15];
      [v8 setScaleAnimationPath:v9];
    }
  }
}

- (void)animateRotationOfSlide:(id)a3 to:(double)a4 withDuration:(double)a5
{
  id v7 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a3];
  if (v7)
  {
    id v8 = v7;
    if (a5 <= 0.0)
    {
      [v7 setRotation:a4];
    }
    else
    {
      id v9 = +[MCAnimationPathKeyframed animationPathWithKey:@"angle"];
      [v9 setIsTriggered:1];
      [v8 rotation];
      *(float *)&double v10 = v10;
      id v11 = [v9 createKeyframeWithScalar:100 atTime:v10 offsetKind:0.0];
      LODWORD(v12) = 0.5;
      [v11 setPostControl:v12];
      *(float *)&double v13 = a4;
      id v14 = [v9 createKeyframeWithScalar:100 atTime:v13 offsetKind:a5];
      LODWORD(v15) = -0.5;
      [v14 setPreControl:v15];
      [v8 setRotationAnimationPath:v9];
    }
  }
}

- (void)animateCenterOfSlide:(id)a3 to:(CGPoint)a4 withDuration:(double)a5 andInitialSpeed:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  double y = a4.y;
  double x = a4.x;
  id v11 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:a3];
  if (v11)
  {
    double v12 = v11;
    if (a5 <= 0.0)
    {
      objc_msgSend(v11, "setCenter:", x, y);
    }
    else
    {
      id v13 = +[MCAnimationPathKeyframed animationPathWithKey:@"center"];
      [v13 setIsTriggered:1];
      [v12 center];
      objc_msgSend(objc_msgSend(v13, "createKeyframeWithPoint:atTime:offsetKind:", 100), "setC2:", x + width, y + height);
      id v14 = objc_msgSend(v13, "createKeyframeWithPoint:atTime:offsetKind:", 100, x, y, a5);
      LODWORD(v15) = -1.0;
      [v14 setPreControl:v15];
      [v12 setCenterAnimationPath:v13];
    }
  }
}

- (id)elementHitAtPoint:(CGPoint)a3 localPoint:(CGPoint *)a4
{
  if (self->super.mIsActivated
    && (double y = a3.y,
        double x = a3.x,
        memset(v13, 0, sizeof(v13)),
        memset(v12, 0, sizeof(v12)),
        MRMatrix_MultiplyWithMatrix(self->super.mRenderingState->var13, self->super.mRenderingState->var14, (float *)v13), v8 = MRMatrix_ProjectPoint((float *)v13, x, y * (self->super.mPixelSize.height / self->super.mPixelSize.width)), double v10 = v9, MRMatrix_Invert((float *)v13, (float *)v12)))
  {
    return -[MREffect elementHitAtPoint:withInverseMatrix:localPoint:](self->mEffect, "elementHitAtPoint:withInverseMatrix:localPoint:", v12, a4, v8, v10);
  }
  else
  {
    return 0;
  }
}

- (BOOL)getVerticesCoordinates:(CGPoint *)(a3 forElement:
{
  if (self->super.mIsActivated)
  {
    mSuperlayer = self;
    memset(v28, 0, sizeof(v28));
    *(float *)&double v7 = MRMatrix_MultiplyWithMatrix(self->super.mRenderingState->var13, self->super.mRenderingState->var14, (float *)v28);
    unsigned int v8 = -[MREffect getVerticesCoordinates:withMatrix:forElement:](mSuperlayer->mEffect, "getVerticesCoordinates:withMatrix:forElement:", a3, v28, a4, v7);
    if (v8)
    {
      while (1)
      {
        mSuperlayer = (MRLayerEffect *)mSuperlayer->super.mSuperlayer;
        if (!mSuperlayer) {
          break;
        }
        double v9 = [(MRLayer *)mSuperlayer renderingState];
        if (v9->var18)
        {
          (*a3)[0].double y = -(*a3)[0].y;
          (*a3)[1].double y = -(*a3)[1].y;
          (*a3)[2].double y = -(*a3)[2].y;
          (*a3)[3].double y = -(*a3)[3].y;
        }
        if (v9->var17)
        {
          *(float *)&double v10 = MRMatrix_MultiplyWithMatrix(v9->var13, v9->var14, (float *)v28);
          [(MRLayer *)mSuperlayer pixelSize];
          double v12 = v11;
          [(MRLayer *)mSuperlayer pixelSize];
          *(float *)&double v13 = v12 / v13;
          double v14 = *(float *)&v13;
          double x = (*a3)[0].x;
          CGFloat v16 = (*a3)[0].y * v14;
          (*a3)[0].double y = v16;
          (*a3)[0].double x = MRMatrix_ProjectPoint((float *)v28, x, v16);
          (*a3)[0].double y = v17;
          double v18 = (*a3)[1].x;
          CGFloat v19 = (*a3)[1].y * v14;
          (*a3)[1].double y = v19;
          (*a3)[1].double x = MRMatrix_ProjectPoint((float *)v28, v18, v19);
          (*a3)[1].double y = v20;
          double v21 = (*a3)[2].x;
          CGFloat v22 = (*a3)[2].y * v14;
          (*a3)[2].double y = v22;
          (*a3)[2].double x = MRMatrix_ProjectPoint((float *)v28, v21, v22);
          (*a3)[2].double y = v23;
          double v24 = (*a3)[3].x;
          CGFloat v25 = (*a3)[3].y * v14;
          (*a3)[3].double y = v25;
          (*a3)[3].double x = MRMatrix_ProjectPoint((float *)v28, v24, v25);
          (*a3)[3].double y = v26;
        }
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)hasSlides
{
  unsigned int v3 = [(NSString *)self->mEffectID isEqualToString:@"JustASlide"];
  mSlideProviders = self->mSlideProviders;
  if (v3)
  {
    if (objc_msgSend(-[NSArray lastObject](mSlideProviders, "lastObject"), "assetPath")) {
      return 1;
    }
    id v6 = objc_msgSend(objc_msgSend(objc_msgSend(-[NSArray lastObject](self->mSlideProviders, "lastObject"), "slide"), "asset"), "path");
  }
  else
  {
    id v6 = [(NSArray *)mSlideProviders count];
  }
  return v6 != 0;
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
  self->_isInInteractiveMode = a3;
  mEffect = self->mEffect;
  if (a3)
  {
    [(MRLayerClock *)self->super.mClock containerTime];
    -[MREffect enterInteractiveModeAtTime:](mEffect, "enterInteractiveModeAtTime:");
  }
  else
  {
    uint64_t v4 = self->mEffect;
    [(MREffect *)v4 exitInteractiveMode];
  }
}

- (id)currentSlideInfoForElement:(id)a3
{
  if (!NSStringHasPrefix(a3, "image")) {
    return 0;
  }
  id v5 = (MRSlideInfo *)objc_msgSend(-[NSMutableDictionary objectForKey:](self->mSlideProvidersForElementIDs, "objectForKey:", a3), "currentSlideInfo");
  if (v5)
  {
    id v6 = v5;
    CGPoint v43 = CGPointZero;
    double v41 = 0.0;
    double v42 = 1.0;
    unsigned __int8 v40 = 0;
    if (![(MREffect *)self->mEffect getCurrentCenter:&v43 scale:&v42 rotation:&v41 isMain:&v40 forElement:a3])
    {
      float64x2_t v46 = 0u;
      float64x2_t v47 = 0u;
      float64x2_t v44 = 0u;
      float64x2_t v45 = 0u;
      if ([(MRLayerEffect *)self getVerticesCoordinates:&v44 forElement:a3])
      {
        float64x2_t v38 = v44;
        float64x2_t v39 = v45;
        __asm { FMOV            V1.2D, #0.25 }
        CGPoint v43 = (CGPoint)vmulq_f64(vaddq_f64(vaddq_f64(vaddq_f64(v44, v45), v46), v47), _Q1);
        float64x2_t v11 = vsubq_f64(v45, v44);
        double v12 = v11.f64[1];
        float64x2_t v37 = v11;
        long double v13 = atan2(v11.f64[1], v11.f64[0]);
        double v41 = v13;
        if (vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vceqq_f64(v39, v38))).u8[0])
        {
          double v14 = v37.f64[0] * 0.5;
          double v15 = cos(v13);
        }
        else
        {
          double v14 = v12 * 0.5;
          double v15 = sin(v13);
        }
        double v42 = v14 / v15;
        unsigned __int8 v40 = 1;
      }
    }
    [(MRSlideInfo *)v6 center];
    double v24 = v23;
    double v26 = v25;
    [(MRSlideInfo *)v6 scale];
    double v28 = v27;
    [(MRSlideInfo *)v6 rotation];
    double v30 = v29;
    if (v24 != CGPointZero.x || v26 != CGPointZero.y)
    {
      __double2 v32 = __sincos_stret(v29);
      double y = v43.y;
      v43.double x = v43.x + -(v42 * v28) * (v24 * v32.__cosval - v26 * v32.__sinval);
      double v34 = (v26 * v32.__cosval + v24 * v32.__sinval) * (v28 * v42);
      [(MRSlideInfo *)v6 aspectRatio];
      v43.double y = y - v34 / v35;
    }
    double v41 = v30 + v41;
    double v42 = v28 * v42;
    [(MRSlideInfo *)v6 setCenter:v43.x];
    [(MRSlideInfo *)v6 setScale:v42];
    [(MRSlideInfo *)v6 setRotation:v41];
    [(MRSlideInfo *)v6 setIsMain:v40];
  }
  else
  {
    signed int v16 = objc_msgSend(objc_msgSend(a3, "substringFromIndex:", 5), "intValue");
    CGFloat v17 = [(MCContainerEffect *)self->mContainer orderedSlides];
    if ([(NSArray *)v17 count] <= v16)
    {
      NSLog(@"Request for info about a non-existent slide");
      id v6 = 0;
    }
    else
    {
      uint64_t v18 = v16;
      id v6 = objc_alloc_init(MRSlideInfo);
      id v19 = objc_msgSend(objc_msgSend(-[NSArray objectAtIndex:](v17, "objectAtIndex:", v18), "asset"), "path");
      [(MRSlideInfo *)v6 setAssetPath:v19];
      [(MZMediaManagement *)[(MRRenderer *)self->super.mRenderer assetManagementDelegate] resolutionForAssetAtPath:v19];
      double v22 = v20 / v21;
      if (v21 <= 0.0) {
        double v22 = 1.0;
      }
      [(MRSlideInfo *)v6 setAspectRatio:v22];
    }
  }
  -[MRSlideInfo setIndex:](v6, "setIndex:", (int)objc_msgSend(objc_msgSend(a3, "substringFromIndex:", 5), "intValue"));
  return v6;
}

- (id)currentSlideInfos
{
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = objc_msgSend(objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "descriptionForEffectID:", self->mEffectID), "objectForKey:", @"numberOfSlides");
  if (v4) {
    NSUInteger v5 = (int)[v4 intValue];
  }
  else {
    NSUInteger v5 = [(NSArray *)self->mSlideProviders count];
  }
  mSlideProvidersForElementIDs = self->mSlideProvidersForElementIDs;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100838;
  v8[3] = &unk_1AB680;
  v8[5] = v3;
  v8[6] = v5;
  v8[4] = self;
  [(NSMutableDictionary *)mSlideProvidersForElementIDs enumerateKeysAndObjectsUsingBlock:v8];
  return v3;
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return [(MREffect *)self->mEffect getStartTime:a3 andDuration:a4 forMovingToElementID:a5 backwards:a6];
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  return [(MREffect *)self->mEffect hasMoreSlidesFromTime:a4 backwards:a5 startTime:a6 duration:a3];
}

- (double)interestingTimeForTime:(double)a3
{
  [(MREffect *)self->mEffect interestingTimeForTime:a3];
  return result;
}

- (double)interestingTimeForElement:(id)a3
{
  [(MREffect *)self->mEffect interestingTimeForElement:a3];
  return result;
}

- (void)getLazyDuration:(double *)a3 lazyFactor:(double *)a4 animationDuration:(double *)a5 fromInterestingTime:(double)a6
{
}

- (CGSize)_maxSizeForTextElement:(id)a3
{
  if (objc_opt_respondsToSelector())
  {
    [(MREffect *)self->mEffect _maxSizeForTextElement:a3];
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)_maxLinesForTextElement:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  mEffect = self->mEffect;
  return [(MREffect *)mEffect _maxLinesForTextElement:a3];
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRLayerEffect;
  return [-[MRLayer _dumpLayerWithOptions:](&v4 _dumpLayerWithOptions:a3), "stringByAppendingFormat:", @"%@/%@", self->mEffectID, -[NSDictionary objectForKey:](-[MCContainerEffect effectAttributes](self->mContainer, "effectAttributes"), "objectForKey:", @"PresetID"];
}

- (void)_stallRenderer
{
}

- (BOOL)asynchronousOperationsAreSuspended
{
  return [(MRRenderer *)self->super.mRenderer asynchronousOperationsAreSuspended];
}

- (void)suspendAsynchronousOperations:(BOOL)a3
{
}

- (void)_requestRendering
{
}

- (id)_effectAttributes
{
  return [(MCContainerEffect *)self->mContainer effectAttributes];
}

- (BOOL)_hideTextWhileEditing
{
  return [(MRRenderer *)self->super.mRenderer hideTextWhileEditing];
}

- (CGSize)_rendererSize
{
  [(MRRenderer *)self->super.mRenderer size];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)_effectTriggeredStop
{
  if (objc_msgSend(-[NSMutableDictionary objectForKey:](self->super.mPersistentState, "objectForKey:", @"isPlaying"), "BOOLValue"))
  {
    id v3 = +[MCStateOperationScalarSet stateOperationForTargetPlugObjectID:&stru_1AC850 withStateKey:@"isPlaying" andScalar:0.0];
    [(MRLayer *)self _sendAction:v3 withStates:0 async:0 yesterday:0];
  }
}

- (void)_addAudioDucker:(id)a3
{
  if (self->super.mDoAudio) {
    [(MRRenderer *)self->super.mRenderer addAudioObject:a3];
  }
}

- (void)_removeAudioDucker:(id)a3
{
  if (self->super.mDoAudio) {
    [(MRRenderer *)self->super.mRenderer removeAudioObject:a3];
  }
}

- (BOOL)isInInteractiveMode
{
  return self->_isInInteractiveMode;
}

- (MREffect)effect
{
  return self->mEffect;
}

- (NSString)targetedElement
{
  return self->mTargetedElement;
}

- (NSString)editedElement
{
  return self->mEditedElement;
}

- (MCContainerEffect)container
{
  return self->mContainer;
}

- (NSDictionary)slideProvidersForElementIDs
{
  return &self->mSlideProvidersForElementIDs->super;
}

- (NSDictionary)textsForElementIDs
{
  return &self->mTextsForElementIDs->super;
}

- (void)_rebuildEffect
{
  uint64_t v3 = 216;
  [(MREffect *)self->mEffect releaseByEffectLayer:self];
  self->mEffect = 0;
  [(MRLayerEffect *)self _cleanupProviders];
  uint64_t v4 = 360;
  mEffectID = self->mEffectID;
  if (self->mContainer)
  {

    mEffectID = (NSString *)[(NSString *)[(MCContainerEffect *)self->mContainer effectID] copy];
    self->mEffectID = mEffectID;
  }
  p_info = MRTiledSprite.info;
  if (mEffectID)
  {
    self->mEffect = (MREffect *)+[MREffect retainedEffectWithEffectID:mEffectID forEffectLayer:self];
    id v7 = objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "imageInputInfosForEffectID:", self->mEffectID);
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v7;
    id v8 = [v7 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v40 = 216;
      int v10 = 0;
      uint64_t v42 = *(void *)v48;
      while (1)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v48 != v42) {
            objc_enumerationMutation(obj);
          }
          double v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          long double v13 = ImageKey((v10 + i));
          double v14 = [[MRSlideProvider alloc] initWithEffectLayer:self];
          double v15 = v14;
          BOOL v16 = self->super.mIsReadonly || self->mSlidesAreReadonly;
          -[MRSlideProvider setSlideIsReadonly:](v14, "setSlideIsReadonly:", v16, v40);
          [(MRSlideProvider *)v15 setIsMuted:!self->super.mDoAudio];
          -[MRSlideProvider setWantsMonochromatic:](v15, "setWantsMonochromatic:", objc_msgSend(objc_msgSend(v12, "objectForKey:", @"isMonochromatic"), "BOOLValue"));
          BOOL v17 = (objc_msgSend(objc_msgSend(v12, "objectForKey:", @"usesMipmapping"), "BOOLValue") & 1) != 0
             || [(NSString *)self->mEffectID isEqualToString:@"Floating"];
          [(MRSlideProvider *)v15 setWantsMipmap:v17];
          uint64_t v18 = v4;
          id v19 = objc_msgSend(objc_msgSend(*(id *)((char *)&self->super.super.isa + v4), "effectAttributes"), "objectForKey:", -[NSString stringByAppendingString:](v13, "stringByAppendingString:", @"StillTime"));
          if (!v19) {
            id v19 = [v12 objectForKey:@"isStillWithTime"];
          }
          if ((objc_msgSend(objc_msgSend(v12, "objectForKey:", @"isStill"), "BOOLValue") & 1) != 0
            || v19)
          {
            [(MRSlideProvider *)v15 setIsStill:1];
            if (v19)
            {
              [v19 floatValue];
              goto LABEL_23;
            }
          }
          else
          {
            [(MRSlideProvider *)v15 setIsStill:self->super.mIsPrecomputing];
          }
          LODWORD(v20) = -1.0;
LABEL_23:
          [(MRSlideProvider *)v15 setStillTime:v20];
          -[MRSlideProvider setImageSizeScript:](v15, "setImageSizeScript:", [v12 objectForKey:@"sizeScript"]);
          id v21 = [v12 objectForKey:@"kenBurnsType"];
          id v22 = [v12 objectForKey:@"showTimeScript"];
          if (v22) {
            [(MRSlideProvider *)v15 setShowTimeScript:v22];
          }
          if ([v21 isEqualToString:@"Crop to Fit"])
          {
            uint64_t v23 = 1;
          }
          else if ([v21 isEqualToString:@"Scale to Fit"])
          {
            uint64_t v23 = 2;
          }
          else if ([v21 isEqualToString:@"Scrop to Fit"])
          {
            uint64_t v23 = 3;
          }
          else
          {
            uint64_t v23 = 0;
          }
          [(MRSlideProvider *)v15 setDefaultKenBurnsType:v23];
          -[MRSlideProvider setDefaultSize:](v15, "setDefaultSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
          [(NSMutableDictionary *)self->mSlideProvidersForElementIDs setObject:v15 forKey:v13];

          uint64_t v4 = v18;
        }
        id v9 = [obj countByEnumeratingWithState:&v47 objects:v52 count:16];
        v10 += (int)i;
        if (!v9)
        {
          uint64_t v3 = v40;
          p_info = (__objc2_class_ro **)(MRTiledSprite + 32);
          break;
        }
      }
    }
    if (self->super.mPixelSize.width > 0.0) {
      objc_msgSend(*(id *)((char *)&self->super.super.isa + v3), "setPixelSize:");
    }
  }
  if (objc_msgSend(objc_msgSend(p_info + 121, "sharedManager"), "hasMultiImageInputForEffectID:", self->mEffectID))
  {
    int64_t v24 = [(NSMutableDictionary *)self->mSlideProvidersForElementIDs count] - 1;
    self->mIndexOfFirstMultiImageInput = v24;
    double v25 = ImageKey(v24);
    self->mMultiImageModelInput = (MRSlideProvider *)[(NSMutableDictionary *)self->mSlideProvidersForElementIDs objectForKey:v25];
    [(NSMutableDictionary *)self->mSlideProvidersForElementIDs removeObjectForKey:v25];
  }
  double v26 = (NSArray *)[(NSMutableDictionary *)self->mSlideProvidersForElementIDs allValues];
  self->mSlideProviders = v26;
  if (self->super.mIsActivated)
  {
    double v27 = v26;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v28 = [(NSArray *)v26 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v44;
      do
      {
        for (j = 0; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v44 != v30) {
            objc_enumerationMutation(v27);
          }
          __double2 v32 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          [(MRLayerClock *)self->super.mClock containerTime];
          double v34 = v33;
          objc_msgSend(v32, "setTime:");
          if (([v32 isStill] & 1) == 0)
          {
            if ([(MRRenderer *)self->super.mRenderer isPlaying]
              && ([v32 showTime], v34 >= v35))
            {
              [v32 showTime];
              double v38 = v37;
              [v32 showDuration];
              BOOL v36 = v34 < v38 + v39;
            }
            else
            {
              BOOL v36 = 0;
            }
            [v32 setIsPlaying:v36];
          }
        }
        id v29 = [(NSArray *)v27 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v29);
    }
  }
  self->mNeedsToUpdateEffect = 0;
  self->mNeedsToUpdateSlides = 1;
  self->mNeedsToUpdateTexts = 1;
  self->mNeedsToUpdateEffectAttributes = 1;
  self->mNeedsToUpdateTiming = 1;
  self->mNeedsToUpdateEffectLiveAttributes = 1;
}

- (void)_cleanupProviders
{
  mSlideProviders = self->mSlideProviders;
  if (mSlideProviders && [(NSArray *)mSlideProviders count])
  {
    mMultiImageModelInput = self->mMultiImageModelInput;
    if (mMultiImageModelInput)
    {

      self->mMultiImageModelInput = 0;
    }
    if (!self->super.mIsPrecomputing && !self->super.mIsReadonly && !self->mSlidesAreReadonly)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      NSUInteger v5 = self->mSlideProviders;
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v21;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v21 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = [*(id *)(*((void *)&v20 + 1) + 8 * i) slide];
            [v10 removeObserver:self forKeyPath:@"animationPaths"];
            [v10 removeObserver:self forKeyPath:@"asset.path"];
            [v10 removeObserver:self forKeyPath:@"plug"];
            if (self->super.mDoAudio)
            {
              [v10 removeObserver:self forKeyPath:@"audioNoVolume"];
              [v10 removeObserver:self forKeyPath:@"builtVolume"];
            }
          }
          id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v7);
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    float64x2_t v11 = self->mSlideProviders;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v11);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) cleanup];
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
    [(NSMutableDictionary *)self->mSlideProvidersForElementIDs removeAllObjects];

    self->mSlideProviders = 0;
  }
}

- (void)_updateTiming
{
  self->mNeedsToUpdateTiming = 0;
  if (([(id)objc_opt_class() hasCustomTiming] & 1) == 0)
  {
    uint64_t v3 = [(MCContainerEffect *)self->mContainer effectAttributes];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    mSlideProviders = self->mSlideProviders;
    id v5 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(mSlideProviders);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * i) updateShowTimeAndDurationWithPlugTiming:self->super.mClock andAttributes:v3];
        }
        id v6 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
  mEffect = self->mEffect;
  [(MRLayerClock *)self->super.mClock phaseInDuration];
  double v11 = v10;
  [(MRLayerClock *)self->super.mClock loopDuration];
  double v13 = v12;
  [(MRLayerClock *)self->super.mClock phaseOutDuration];
  [(MREffect *)mEffect setPhaseInDuration:v11 mainDuration:v13 phaseOutDuration:v14];
}

- (void)_updateSlides
{
  self->mNeedsToUpdateSlides = 0;
  uint64_t v3 = &OBJC_IVAR___MPNavigatorInternal_zIndex;
  if (self->mMultiImageModelInput) {
    id v28 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithArray:", -[NSMutableDictionary allKeys](self->mSlideProvidersForElementIDs, "allKeys"));
  }
  else {
    id v28 = 0;
  }
  self->mMultiImageSlideRange = (_NSRange)xmmword_165B40;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(MCContainerEffect *)self->mContainer slides];
  id v4 = [(NSSet *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(MCSlide **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v8 = [(MCSlide *)v7 index];
        id v9 = ImageKey((int64_t)v8);
        uint64_t v10 = v3[73];
        double v11 = (MRSlideProvider *)[*(id *)((char *)&self->super.super.isa + v10) objectForKey:v9];
        if (v11) {
          goto LABEL_55;
        }
        if (self->mMultiImageModelInput)
        {
          long long v15 = ImageKey((int64_t)v8);
          long long v16 = [[MRSlideProvider alloc] initWithEffectLayer:self];
          double v11 = v16;
          BOOL v17 = self->super.mIsReadonly || (unint64_t)self->mSlidesAreReadonly;
          [(MRSlideProvider *)v16 setSlideIsReadonly:v17];
          [(MRSlideProvider *)v11 setIsMuted:!self->super.mDoAudio];
          [(MRSlideProvider *)v11 setWantsMonochromatic:[(MRSlideProvider *)self->mMultiImageModelInput wantsMonochromatic]];
          [(MRSlideProvider *)v11 setWantsMipmap:[(MRSlideProvider *)self->mMultiImageModelInput wantsMipmap]];
          [(MRSlideProvider *)v11 setIsStill:[(MRSlideProvider *)self->mMultiImageModelInput isStill]];
          [(MRSlideProvider *)self->mMultiImageModelInput stillTime];
          -[MRSlideProvider setStillTime:](v11, "setStillTime:");
          [(MRSlideProvider *)v11 setImageSizeScript:[(MRSlideProvider *)self->mMultiImageModelInput imageSizeScript]];
          [(MRSlideProvider *)v11 setShowTimeScript:[(MRSlideProvider *)self->mMultiImageModelInput showTimeScript]];
          [(MRSlideProvider *)v11 setDefaultKenBurnsType:[(MRSlideProvider *)self->mMultiImageModelInput defaultKenBurnsType]];
          -[MRSlideProvider setDefaultSize:](v11, "setDefaultSize:", self->super.mPixelSize.width, self->super.mPixelSize.height);
          [*(id *)((char *)&self->super.super.isa + v10) setObject:v11 forKey:v15];

          uint64_t v3 = &OBJC_IVAR___MPNavigatorInternal_zIndex;
          if (v11)
          {
LABEL_55:
            if ([(MCSlide *)v7 asset] || [(MCSlide *)v7 plug])
            {
              [v28 removeObject:v9];
              if ((unint64_t)v8 >= self->mIndexOfFirstMultiImageInput)
              {
                uint64_t v12 = *v26;
                uint64_t v13 = v26[1];
                if (*v26 <= (unint64_t)v8)
                {
                  if ((unint64_t)v8 >= v13 + v12) {
                    v26[1] = &v8[-v12 + 1];
                  }
                }
                else
                {
                  uint64_t v14 = *v26 - (void)v8 + v13;
                  if (!v13) {
                    uint64_t v14 = 1;
                  }
                  *double v26 = v8;
                  v26[1] = v14;
                }
              }
              int v18 = 1;
            }
            else
            {
              int v18 = 0;
            }
            long long v19 = [(MRSlideProvider *)v11 slide];
            if (v7 != v19)
            {
              if (!self->super.mIsReadonly && !self->mSlidesAreReadonly)
              {
                long long v20 = v19;
                [(MCSlide *)v19 removeObserver:self forKeyPath:@"animationPaths"];
                [(MCSlide *)v20 removeObserver:self forKeyPath:@"asset.path"];
                [(MCSlide *)v20 removeObserver:self forKeyPath:@"plug"];
                if (self->super.mDoAudio)
                {
                  [(MCSlide *)v20 removeObserver:self forKeyPath:@"audioNoVolume"];
                  [(MCSlide *)v20 removeObserver:self forKeyPath:@"builtVolume"];
                }
              }
              if (v18)
              {
                [(MRSlideProvider *)v11 setSlide:v7];
                uint64_t v3 = &OBJC_IVAR___MPNavigatorInternal_zIndex;
                if (!self->super.mIsReadonly && !self->mSlidesAreReadonly)
                {
                  [(MCSlide *)v7 addObserver:self forKeyPath:@"animationPaths" options:0 context:0];
                  [(MCSlide *)v7 addObserver:self forKeyPath:@"asset.path" options:0 context:0];
                  [(MCSlide *)v7 addObserver:self forKeyPath:@"plug" options:0 context:0];
                  if (self->super.mDoAudio)
                  {
                    [(MCSlide *)v7 addObserver:self forKeyPath:@"audioNoVolume" options:0 context:0];
                    [(MCSlide *)v7 addObserver:self forKeyPath:@"builtVolume" options:0 context:0];
                  }
                }
              }
              else
              {
                [(MRSlideProvider *)v11 setSlide:0];
                uint64_t v3 = &OBJC_IVAR___MPNavigatorInternal_zIndex;
              }
            }
          }
        }
      }
      id v5 = [(NSSet *)obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v5);
  }
  if (v28)
  {
    if (!self->super.mIsReadonly && !self->mSlidesAreReadonly)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v21 = [v28 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v31;
        do
        {
          for (j = 0; j != v22; j = (char *)j + 1)
          {
            if (*(void *)v31 != v23) {
              objc_enumerationMutation(v28);
            }
            id v25 = objc_msgSend(-[NSMutableDictionary objectForKey:](self->mSlideProvidersForElementIDs, "objectForKey:", *(void *)(*((void *)&v30 + 1) + 8 * (void)j)), "slide");
            [v25 removeObserver:self forKeyPath:@"animationPaths"];
            [v25 removeObserver:self forKeyPath:@"asset.path"];
            [v25 removeObserver:self forKeyPath:@"plug"];
            if (self->super.mDoAudio)
            {
              [v25 removeObserver:self forKeyPath:@"audioNoVolume"];
              [v25 removeObserver:self forKeyPath:@"builtVolume"];
            }
          }
          id v22 = [v28 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v22);
      }
    }
    -[NSMutableDictionary removeObjectsForKeys:](self->mSlideProvidersForElementIDs, "removeObjectsForKeys:", [v28 allObjects]);

    self->mSlideProviders = (NSArray *)[(NSMutableDictionary *)self->mSlideProvidersForElementIDs allValues];
  }
  [(MREffect *)self->mEffect setNeedsToUpdateSlides:1];
  -[MREffect setMultiImageSlideRange:](self->mEffect, "setMultiImageSlideRange:", *v26, v26[1]);
  self->mHasRequestedMoreSlides = 0;
}

- (void)_updateTexts
{
  self->mNeedsToUpdateTexts = 0;
  [(NSMutableDictionary *)self->mTextsForElementIDs removeAllObjects];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id obj = [(MCContainerEffect *)self->mContainer texts];
  id v3 = [(NSSet *)obj countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(obj);
        }
        -[NSMutableDictionary setObject:forKey:](self->mTextsForElementIDs, "setObject:forKey:", [*(id *)(*((void *)&v8 + 1) + 8 * (void)v6) attributedString], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"text%d", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v6), "index")));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [(NSSet *)obj countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
  [(MREffect *)self->mEffect setNeedsToUpdateTexts:1];
}

- (void)_updateEffectAttributes
{
  self->mNeedsToUpdateEffectAttributes = 0;
  id v3 = [(MCContainerEffect *)self->mContainer effectAttributes];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "attributesForEffectID:andPresetID:", self->mEffectID, -[NSDictionary objectForKey:](v3, "objectForKey:", @"PresetID"));
  if (v5) {
    [v4 addEntriesFromDictionary:v5];
  }
  [v4 addEntriesFromDictionary:v3];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  mSlideProviders = self->mSlideProviders;
  id v7 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(mSlideProviders);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * i) setEffectAttributes:v4];
      }
      id v8 = [(NSArray *)mSlideProviders countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [(MREffect *)self->mEffect setAttributes:[(MCContainerEffect *)self->mContainer effectAttributes]];
  self->mNeedsToUpdateTiming = 1;
}

- (void)_observePlug
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 _observePlug];
  [(MCContainerEffect *)self->mContainer addObserver:self forKeyPath:@"effectID" options:0 context:0];
  [(MCContainerEffect *)self->mContainer addObserver:self forKeyPath:@"slides" options:0 context:0];
  [(MCContainerEffect *)self->mContainer addObserver:self forKeyPath:@"effectAttributes" options:0 context:0];
}

- (void)_unobservePlug
{
  [(MCContainerEffect *)self->mContainer removeObserver:self forKeyPath:@"effectID"];
  [(MCContainerEffect *)self->mContainer removeObserver:self forKeyPath:@"slides"];
  [(MCContainerEffect *)self->mContainer removeObserver:self forKeyPath:@"effectAttributes"];
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 _unobservePlug];
}

- (void)_observePlugOnPreactivate
{
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 _observePlugOnPreactivate];
  [(MCContainerEffect *)self->mContainer addObserver:self forKeyPath:@"texts" options:0 context:0];
  if (self->super.mDoAudio)
  {
    [(MCContainerEffect *)self->mContainer addObserver:self forKeyPath:@"audioPlaylist.audioNoVolume" options:0 context:0];
    [(MCContainerEffect *)self->mContainer addObserver:self forKeyPath:@"audioPlaylist.builtVolume" options:0 context:0];
  }
}

- (void)_unobservePlugOnDepreactivate
{
  [(MCContainerEffect *)self->mContainer removeObserver:self forKeyPath:@"texts"];
  if (self->super.mDoAudio)
  {
    [(MCContainerEffect *)self->mContainer removeObserver:self forKeyPath:@"audioPlaylist.audioNoVolume"];
    [(MCContainerEffect *)self->mContainer removeObserver:self forKeyPath:@"audioPlaylist.builtVolume"];
  }
  v3.receiver = self;
  v3.super_class = (Class)MRLayerEffect;
  [(MRLayer *)&v3 _unobservePlugOnDepreactivate];
}

- (void)_renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [(MRRenderer *)self->super.mRenderer addIDToDisplay:self->mEffectID :[(NSDictionary *)[(MREffect *)self->mEffect attributes] objectForKey:@"PresetID"]];
  [(MRLayerClock *)self->super.mClock containerTime];
  double v9 = v8;
  -[MREffect renderAtTime:inContext:withArguments:](self->mEffect, "renderAtTime:inContext:withArguments:", a4, a5);
  self->_double previouslyRenderedContainerTime = v9;
}

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  [(MRRenderer *)self->super.mRenderer addIDToDisplay:self->mEffectID :[(NSDictionary *)[(MREffect *)self->mEffect attributes] objectForKey:@"PresetID"]];
  [(MRLayerClock *)self->super.mClock containerTime];
  double v9 = v8;
  id result = -[MREffect retainedByUserRenderedImageAtTime:inContext:withArguments:](self->mEffect, "retainedByUserRenderedImageAtTime:inContext:withArguments:", a4, a5);
  self->_double previouslyRenderedContainerTime = v9;
  return result;
}

- (double)pzrStart:(id)a3
{
  if (!self->mEffect || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  mEffect = self->mEffect;
  id v6 = [a3 specificObject];
  [(MREffect *)mEffect pzrStart:v6];
  return result;
}

- (double)pzrUpdate:(id)a3
{
  if (!self->super.mIsActivated || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  mEffect = self->mEffect;
  id v6 = [a3 specificObject];
  [(MREffect *)mEffect pzrUpdate:v6];
  return result;
}

- (double)pzrEnd:(id)a3
{
  if (!self->super.mIsActivated || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  mEffect = self->mEffect;
  id v6 = [a3 specificObject];
  [(MREffect *)mEffect pzrEnd:v6];
  return result;
}

- (double)pzrCancel:(id)a3
{
  if (!self->super.mIsActivated || (objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  mEffect = self->mEffect;
  id v6 = [a3 specificObject];
  [(MREffect *)mEffect pzrCancel:v6];
  return result;
}

- (double)panoramaPanningStart:(id)a3
{
  id v4 = (double *)[a3 specificObject];
  memset(v9, 0, sizeof(v9));
  MRMatrix_Invert(self->super.mRenderingState->var13, (float *)v9);
  id v5 = -[MREffect elementHitAtPoint:withInverseMatrix:localPoint:](self->mEffect, "elementHitAtPoint:withInverseMatrix:localPoint:", v9, 0, v4[2], v4[3]);
  if (v5)
  {
    objc_msgSend(-[NSMutableDictionary objectForKey:](self->mSlideProvidersForElementIDs, "objectForKey:", v5), "imageAspectRatio");
    double v7 = v6;
  }
  else
  {
    double v7 = 1.0;
  }
  if (v7 < 0.5 || v7 > 2.0)
  {
    if ([(MREffect *)self->mEffect startPanoramaPanningForElementID:v5 isLandscape:&self->_panoramaPanningIsLandscape])
    {
      self->_panoramaPanningIsLandscape = v7 >= 1.0;
      self->_panoramaPanningSlideID = (NSString *)v5;
      self->_panoramaPanningPreviousDelta = 0.0;
      [(MRLayerClock *)self->super.mClock pauseOnNextUpdate];
    }
  }
  return 0.0;
}

- (double)panoramaPanningUpdate:(id)a3
{
  if (self->_panoramaPanningSlideID)
  {
    id v4 = (char *)[a3 specificObject];
    if (self->_panoramaPanningIsLandscape) {
      id v5 = &OBJC_IVAR___MRGesturePanZoomRotation_deltaX;
    }
    else {
      id v5 = &OBJC_IVAR___MRGesturePanZoomRotation_deltaY;
    }
    [(MREffect *)self->mEffect updatePanoramaPanningForElementID:self->_panoramaPanningSlideID withDelta:*(double *)&v4[*v5] - self->_panoramaPanningPreviousDelta];
    if (self->_panoramaPanningIsLandscape) {
      double v6 = &OBJC_IVAR___MRGesturePanZoomRotation_deltaX;
    }
    else {
      double v6 = &OBJC_IVAR___MRGesturePanZoomRotation_deltaY;
    }
    self->_panoramaPanningPreviousDelta = *(double *)&v4[*v6];
  }
  return 0.0;
}

- (double)panoramaPanningEnd:(id)a3
{
  if (self->_panoramaPanningSlideID)
  {
    [(MREffect *)self->mEffect endPanoramaPanning];

    self->_panoramaPanningSlideID = 0;
    [(MRLayerClock *)self->super.mClock resumeAfter:2.0];
  }
  return 0.0;
}

- (double)panoramaPanningCancel:(id)a3
{
  if (self->_panoramaPanningSlideID)
  {
    [(MREffect *)self->mEffect endPanoramaPanning];

    self->_panoramaPanningSlideID = 0;
    [(MRLayerClock *)self->super.mClock resumeAfter:2.0];
  }
  return 0.0;
}

@end