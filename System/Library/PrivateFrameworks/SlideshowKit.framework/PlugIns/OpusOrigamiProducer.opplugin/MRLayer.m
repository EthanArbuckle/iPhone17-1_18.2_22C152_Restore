@interface MRLayer
+ (MRLayer)layerWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- ($7518ED76D6D65702929FCC9465E04884)renderingState;
- (BOOL)_isNative3D;
- (BOOL)_setStateValue:(id)a3 forKey:(id)a4;
- (BOOL)enterSlideFocusModeWithState:(id)a3;
- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6;
- (BOOL)hasAudio;
- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6;
- (BOOL)hasSlides;
- (BOOL)hasSomethingToRender;
- (BOOL)isActivated;
- (BOOL)isAdhocLayer;
- (BOOL)isAlphaFriendly;
- (BOOL)isDimmed;
- (BOOL)isFlatAndSquare;
- (BOOL)isInInteractiveMode;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isPreactivated;
- (BOOL)isScheduledForDestruction;
- (BOOL)isSelected;
- (BOOL)isTriggered;
- (BOOL)needsToSynchronizeTime;
- (BOOL)needsToUpdateGeometry;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)shouldBeActivatedAtTime:(double)a3;
- (BOOL)shouldBePreactivatedAtTime:(double)a3;
- (BOOL)supportsDynamicExpansion;
- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4;
- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4;
- (CGPoint)convertGlobalPoint:(CGPoint)a3;
- (CGPoint)convertLocalPoint:(CGPoint)a3;
- (CGSize)pixelSize;
- (MCPlug)plug;
- (MCPlugHaven)plugAsHaven;
- (MCPlugParallel)plugAsParallel;
- (MCPlugSerial)plugAsSerial;
- (MCTransitionTrigger)nextTransition;
- (MCTransitionTrigger)previousTransition;
- (MRLayer)initWithParameters:(id)a3;
- (MRLayer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5;
- (MRLayer)superlayer;
- (MRLayerClock)clock;
- (NSDictionary)animationTriggers;
- (NSDictionary)parameters;
- (NSDictionary)persistentState;
- (NSMutableDictionary)motions;
- (NSString)filterID;
- (NSString)idInSupercontainer;
- (NSString)uuid;
- (double)_serial_gotoNextWithObject:(id)a3;
- (double)_serial_gotoPreviousWithObject:(id)a3;
- (double)doActionTrigger:(id)a3;
- (double)doAnimationTrigger:(id)a3;
- (double)doGenericAction:(id)a3;
- (double)doMotionTrigger:(id)a3;
- (double)doStateOperation:(id)a3;
- (double)duration;
- (double)interestingTimeForElement:(id)a3;
- (double)interestingTimeForTime:(double)a3;
- (double)opacity;
- (double)phaseInDuration;
- (double)phaseOutDuration;
- (double)timeIn;
- (double)timeStamp;
- (id)__retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)_currentState;
- (id)_dumpLayerWithOptions:(unint64_t)a3;
- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)actions;
- (id)currentSlideInfoForElement:(id)a3;
- (id)currentSlideInfos;
- (id)parentHelper;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int64_t)zIndex;
- (unint64_t)index;
- (void)_applyState:(id)a3;
- (void)_observePlug;
- (void)_observePlugOnPreactivate;
- (void)_queueLayerCommand:(int)a3 object:(id)a4;
- (void)_rebuildAudio;
- (void)_sendAction:(id)a3 withStates:(id)a4 async:(BOOL)a5 yesterday:(BOOL)a6;
- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3;
- (void)_setPlug:(id)a3 andSuperlayer:(id)a4;
- (void)_setScissorRectOnContext:(id)a3 saveTo:(int *)a4;
- (void)_unobservePlug;
- (void)_unobservePlugOnDepreactivate;
- (void)_updateStateWithContext:(id)a3;
- (void)activate;
- (void)animateOpacityTo:(double)a3 withDuration:(double)a4;
- (void)cleanup;
- (void)deactivate;
- (void)dealloc;
- (void)depreactivate:(BOOL)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)preactivate;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)resumeOrPause:(BOOL)a3;
- (void)scheduleForDestruction;
- (void)setDuration:(double)a3;
- (void)setFilterID:(id)a3;
- (void)setIdInSupercontainer:(id)a3;
- (void)setIsDimmed:(BOOL)a3;
- (void)setIsSelected:(BOOL)a3;
- (void)setIsTriggered:(BOOL)a3;
- (void)setNeedsToSynchronizeTime:(BOOL)a3;
- (void)setNeedsToUpdateGeometry:(BOOL)a3;
- (void)setNextTransition:(id)a3;
- (void)setOpacity:(double)a3;
- (void)setParentHelper:(id)a3;
- (void)setPhaseInDuration:(double)a3;
- (void)setPhaseOutDuration:(double)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setPreviousTransition:(id)a3;
- (void)setTimeIn:(double)a3;
- (void)setZIndex:(int64_t)a3;
- (void)stampTime;
- (void)synchronizeTime;
- (void)updateGeometry;
@end

@implementation MRLayer

- (MRLayer)initWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  v8 = [(MRLayer *)self init];
  if (!v8) {
    return v8;
  }
  v8->mSuperlayer = (MRLayer *)a5;
  v8->mUUID = (NSString *)objc_msgSend(objc_msgSend(a3, "objectID"), "copy");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(-[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"readonly"), "BOOLValue") & 1) == 0)
  {
    v10 = (NSDictionary *)[a4 mutableCopy];
    v8->mParameters = v10;
    [(NSDictionary *)v10 setObject:&__kCFBooleanTrue forKey:@"readonly"];
    mParameters = v8->mParameters;
  }
  else
  {
    mParameters = (NSDictionary *)a4;
    v8->mParameters = mParameters;
  }
  v8->mRenderer = (MRRenderer *)[(NSDictionary *)mParameters objectForKey:@"renderer"];
  unsigned int v11 = objc_msgSend(-[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"precomputing"), "BOOLValue");
  v8->BOOL mIsPrecomputing = v11;
  if (v11)
  {
    LOBYTE(v12) = 0;
    v8->mIsReadonly = 1;
  }
  else
  {
    unsigned __int8 v13 = objc_msgSend(-[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"readonly"), "BOOLValue");
    BOOL mIsPrecomputing = v8->mIsPrecomputing;
    v8->mIsReadonly = v13;
    if (mIsPrecomputing) {
      LOBYTE(v12) = 0;
    }
    else {
      unsigned int v12 = objc_msgSend(-[NSDictionary objectForKey:](v8->mParameters, "objectForKey:", @"noAudio"), "BOOLValue") ^ 1;
    }
  }
  v8->BOOL mDoAudio = v12;
  id v15 = objc_msgSend(objc_msgSend(a3, "container"), "initialState");
  if (v15) {
    v8->mPersistentState = (NSMutableDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v15];
  }
  v8->mPixelSize = CGSizeZero;
  v8->mNeedsToUpdateGeometry = 1;
  BOOL mDoAudio = v8->mDoAudio;
  v8->mNeedsToRequestRebuildAudio = mDoAudio;
  v8->mNeedsToRequestRebuildVolume = mDoAudio;
  *(_WORD *)&v8->mIsPreactivated = 0;
  v8->mIsSelected = 0;
  *(_OWORD *)&v8->mTimeStamp = xmmword_164F40;
  v8->mLayerCommandQueue = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  v8->mIsScheduledForDestruction = 0;
  v8->mPlug = (MCPlug *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    mPlug = (MCPlugSerial *)v8->mPlug;
  }
  else {
    mPlug = 0;
  }
  v8->mPlugAsSerial = mPlug;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v18 = (MCPlugParallel *)v8->mPlug;
  }
  else {
    v18 = 0;
  }
  v8->mPlugAsParallel = v18;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  mPlugAsParallel = 0;
  if (isKindOfClass) {
    mPlugAsParallel = (MCPlugHaven *)v8->mPlug;
  }
  v8->mPlugAsHaven = mPlugAsParallel;
  if (v8->mPlugAsParallel)
  {
    [(MCPlugParallel *)v8->mPlugAsParallel timeIn];
    mPlugAsParallel = (MCPlugHaven *)v8->mPlugAsParallel;
    v8->mTimeIn = v21;
    if (mPlugAsParallel)
    {
LABEL_28:
      v8->mIDInSupercontainer = (NSString *)[(NSString *)[(MCPlugHaven *)mPlugAsParallel idInSupercontainer] copy];
      return v8;
    }
    goto LABEL_26;
  }
  if (a5)
  {
    v8->mTimeIn = 1.0e36;
LABEL_26:
    mPlugAsParallel = v8->mPlugAsHaven;
  }
  if (mPlugAsParallel) {
    goto LABEL_28;
  }
  mPlugAsSerial = v8->mPlugAsSerial;
  if (mPlugAsSerial) {
    v8->mIndex = [(MCPlugSerial *)mPlugAsSerial index];
  }
  return v8;
}

- (MRLayer)initWithParameters:(id)a3
{
  v4 = [(MRLayer *)self init];
  if (v4)
  {
    CFUUIDRef v5 = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef v6 = CFUUIDCreateString(kCFAllocatorDefault, v5);
    v4->mUUID = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"/%@", v6];
    CFRelease(v6);
    CFRelease(v5);
    v7 = (NSDictionary *)a3;
    v4->mParameters = v7;
    v4->mRenderer = (MRRenderer *)[(NSDictionary *)v7 objectForKey:@"renderer"];
    unsigned __int8 v8 = objc_msgSend(-[NSDictionary objectForKey:](v4->mParameters, "objectForKey:", @"precomputing"), "BOOLValue");
    v4->BOOL mIsPrecomputing = v8;
    if (v8) {
      char v9 = 0;
    }
    else {
      char v9 = objc_msgSend(-[NSDictionary objectForKey:](v4->mParameters, "objectForKey:", @"noAudio"), "BOOLValue") ^ 1;
    }
    v4->BOOL mDoAudio = v9;
    v4->mNeedsToUpdateGeometry = 1;
    v4->mNeedsToRequestRebuildAudio = v9;
    v4->mNeedsToRequestRebuildVolume = v9;
    v4->mTimeStamp = 1.0;
    v4->mLayerCommandQueue = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mTimeIn = 1.0e36;
    v4->_isAdhocLayer = 1;
  }
  return v4;
}

- (void)dealloc
{
  [(MRLayer *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRLayer;
  [(MRLayer *)&v3 dealloc];
}

- (void)cleanup
{
  if (self->mUUID)
  {
    if (!self->mIsReadonly && !self->mIsScheduledForDestruction && !self->_isAdhocLayer) {
      [(MRLayer *)self _unobservePlug];
    }
    if (self->mIsActivated) {
      [(MRLayer *)self deactivate];
    }
    if (self->mIsPreactivated) {
      [(MRLayer *)self depreactivate:0];
    }

    self->mSuperlayer = 0;
    self->mRenderer = 0;

    self->mParameters = 0;
    self->mPersistentState = 0;
    mIDInSupercontainer = self->mIDInSupercontainer;
    if (mIDInSupercontainer)
    {

      self->mIDInSupercontainer = 0;
    }
    self->mPlugAsSerial = 0;
    self->mPlugAsParallel = 0;
    self->mPlugAsHaven = 0;

    self->mPlug = 0;
    id mParentHelper = self->mParentHelper;
    if (mParentHelper)
    {

      self->id mParentHelper = 0;
    }
    mLayerCommandQueue = self->mLayerCommandQueue;
    objc_sync_enter(mLayerCommandQueue);
    [(NSMutableArray *)self->mLayerCommandQueue removeAllObjects];
    CFStringRef v6 = self->mLayerCommandQueue;
    self->mLayerCommandQueue = 0;
    objc_sync_exit(mLayerCommandQueue);

    self->mUUID = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((objc_msgSend(a3, "isEqualToString:", @"positionRotationAndSize", a4, a5, a6) & 1) != 0
    || ([a3 isEqualToString:@"animationPaths"] & 1) != 0
    || ([a3 isEqualToString:@"opacity"] & 1) != 0
    || ([a3 isEqualToString:@"transition"] & 1) != 0)
  {
    goto LABEL_15;
  }
  if (![a3 isEqualToString:@"timeIn"])
  {
    if (([a3 isEqualToString:@"size"] & 1) != 0
      || ([a3 isEqualToString:@"currentLayoutIndex"] & 1) != 0)
    {
      BOOL mDoAudio = 1;
      uint64_t v11 = 193;
      goto LABEL_14;
    }
    if ([a3 isEqualToString:@"fullDuration"])
    {
      self->mNeedsToResyncClockToPlug = 1;
      mPlugAsParallel = self->mPlugAsParallel;
      if (!mPlugAsParallel || ![(MCPlugParallel *)mPlugAsParallel isTriggered] || !self->mIsActivated) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
    if ([a3 isEqualToString:@"container.initialState"])
    {
      BOOL mDoAudio = 1;
      uint64_t v11 = 194;
      goto LABEL_14;
    }
    if (([a3 isEqualToString:@"audioPlaylist.audioNoVolume"] & 1) != 0
      || ([a3 isEqualToString:@"numberOfLoops"] & 1) != 0)
    {
      uint64_t v13 = 195;
    }
    else
    {
      if (([a3 isEqualToString:@"audioPlaylist.builtVolume"] & 1) == 0)
      {
LABEL_16:
        if (![a3 isEqualToString:@"timeStamp"]) {
          return;
        }
        goto LABEL_19;
      }
      uint64_t v13 = 196;
    }
    *((unsigned char *)&self->super.isa + v13) = self->mDoAudio;
    goto LABEL_16;
  }
  unsigned __int8 v8 = self->mPlugAsParallel;
  if (v8 && (![(MCPlugParallel *)v8 isTriggered] || !self->mIsActivated))
  {
    [(MCPlugParallel *)self->mPlugAsParallel timeIn];
    self->mTimeIn = v9;
LABEL_10:
    BOOL mDoAudio = self->mDoAudio;
    uint64_t v11 = 195;
LABEL_14:
    *((unsigned char *)&self->super.isa + v11) = mDoAudio;
  }
LABEL_15:
  if (self->mIsPrecomputing) {
    goto LABEL_16;
  }
  [(MRLayer *)self->mSuperlayer setNeedsUpdateForPluggerOfSublayer:self];
LABEL_19:
  [(MRLayer *)self stampTime];
}

+ (MRLayer)layerWithPlug:(id)a3 andParameters:(id)a4 inSuperlayer:(id)a5
{
  [a3 container];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned __int8 v8 = &off_1A4DF0;
  }
  else
  {
    [a3 container];
    objc_opt_class();
    unsigned __int8 v8 = off_1A4DE8;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [a3 container];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        unsigned __int8 v8 = off_1A4DE0;
      }
    }
  }
  id v9 = [objc_alloc(*v8) initWithPlug:a3 andParameters:a4 inSuperlayer:a5];
  return (MRLayer *)v9;
}

- (void)_setPlug:(id)a3 andSuperlayer:(id)a4
{
  mPlug = self->mPlug;
  if (mPlug)
  {
    if (self->mIsPreactivated)
    {
      [(MRLayer *)self _unobservePlugOnDepreactivate];
      mPlug = self->mPlug;
    }
  }
  unsigned __int8 v8 = (MCPlug *)a3;
  self->mPlug = v8;
  self->mPlugAsSerial = 0;
  self->mPlugAsParallel = 0;
  self->mPlugAsHaven = 0;
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      self->mPlugAsParallel = (MCPlugParallel *)self->mPlug;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self->mPlugAsHaven = (MCPlugHaven *)self->mPlug;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          self->mPlugAsSerial = (MCPlugSerial *)self->mPlug;
        }
      }
    }
    if (self->mIsPreactivated) {
      [(MRLayer *)self _observePlugOnPreactivate];
    }
  }

  self->mSuperlayer = (MRLayer *)a4;
}

- (MRLayerClock)clock
{
  return self->mClock;
}

- ($7518ED76D6D65702929FCC9465E04884)renderingState
{
  return self->mRenderingState;
}

- (void)setPixelSize:(CGSize)a3
{
  if (a3.width != self->mPixelSize.width || a3.height != self->mPixelSize.height)
  {
    self->mPixelSize = a3;
    if (!self->mIsPrecomputing) {
      [(MRLayer *)self stampTime];
    }
  }
}

- (void)updateGeometry
{
  if (self->mPlugAsParallel)
  {
    mSuperlayer = self->mSuperlayer;
    if (mSuperlayer)
    {
      [(MRLayer *)mSuperlayer pixelSize];
      double v5 = v4;
      double v7 = v6;
      [(MCPlugParallel *)self->mPlugAsParallel sizeForParentAspectRatio:v4 / v6];
      double v9 = round(v5 * v8 * 0.5);
      double v11 = round(v7 * v10 * 0.5);
LABEL_8:
      -[MRLayer setPixelSize:](self, "setPixelSize:", v9, v11);
    }
  }
  else
  {
    if (!self->mPlugAsSerial && !self->mPlugAsHaven)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_9;
      }
      [(MRRenderer *)self->mRenderer size];
      goto LABEL_8;
    }
    unsigned int v12 = self->mSuperlayer;
    if (v12)
    {
      [(MRLayer *)v12 pixelSize];
      goto LABEL_8;
    }
  }
LABEL_9:
  self->mNeedsToUpdateGeometry = 0;
}

- (BOOL)hasSomethingToRender
{
  BOOL result = self->mPixelSize.width > 0.0
        && self->mPixelSize.height > 0.0
        && self->mIsActivated
        && (mRenderingState = self->mRenderingState, mRenderingState->var15)
        && mRenderingState->var5 > 0.0
        && mRenderingState->var11 > 0.0;
  return result;
}

- (void)resumeOrPause:(BOOL)a3
{
  if (self->mDoAudio)
  {
    mAudioPlayer = self->mAudioPlayer;
    if (mAudioPlayer)
    {
      BOOL v5 = a3;
      if (a3)
      {
        [(MRAudioPlayer *)mAudioPlayer resyncAudioItem];
        mAudioPlayer = self->mAudioPlayer;
      }
      [(MRAudioPlayer *)mAudioPlayer setShouldBePlaying:v5];
    }
  }
}

- (void)synchronizeTime
{
  mAudioPlayer = self->mAudioPlayer;
  if (mAudioPlayer) {
    [(MRAudioPlayer *)mAudioPlayer resyncAudioItem];
  }
}

- (double)duration
{
  mClock = self->mClock;
  if (!mClock) {
    mClock = self->mPlug;
  }
  [mClock fullDuration];
  return result;
}

- (void)setDuration:(double)a3
{
  mClock = self->mClock;
  if (mClock)
  {
    [(MRLayerClock *)mClock setFullDuration:a3];
  }
  else
  {
    NSLog(@"Inconsistency error: setting duration on depreactivated layer", a2, a3);
  }
}

- (int64_t)zIndex
{
  return [(MCPlugParallel *)self->mPlugAsParallel zIndex];
}

- (void)setZIndex:(int64_t)a3
{
}

- (double)phaseInDuration
{
  mClock = self->mClock;
  if (!mClock) {
    mClock = self->mPlug;
  }
  [mClock phaseInDuration];
  return result;
}

- (void)setPhaseInDuration:(double)a3
{
  -[MCPlug setPhaseInDuration:](self->mPlug, "setPhaseInDuration:");
  mClock = self->mClock;
  if (mClock)
  {
    [(MRLayerClock *)mClock setPhaseInDuration:a3];
  }
}

- (double)phaseOutDuration
{
  mClock = self->mClock;
  if (!mClock) {
    mClock = self->mPlug;
  }
  [mClock phaseOutDuration];
  return result;
}

- (void)setPhaseOutDuration:(double)a3
{
  -[MCPlug setPhaseOutDuration:](self->mPlug, "setPhaseOutDuration:");
  mClock = self->mClock;
  if (mClock)
  {
    [(MRLayerClock *)mClock setPhaseOutDuration:a3];
  }
}

- (double)opacity
{
  mRenderingState = self->mRenderingState;
  if (mRenderingState) {
    return mRenderingState->var11;
  }
  [(MCPlugParallel *)self->mPlugAsParallel opacity];
  return result;
}

- (void)setOpacity:(double)a3
{
  id mParentHelper = self->mParentHelper;
  -[MCPlugParallel setOpacity:](self->mPlugAsParallel, "setOpacity:");
  objc_msgSend(objc_msgSend(mParentHelper, "plug"), "setOpacity:", a3);
  [mParentHelper setOpacityAnimationPath:0];
  mRenderingState = self->mRenderingState;
  if (mRenderingState)
  {
    float v7 = a3;
    mRenderingState->var11 = v7;
  }
}

- (void)animateOpacityTo:(double)a3 withDuration:(double)a4
{
  if (a4 <= 0.0)
  {
    -[MRLayer setOpacity:](self, "setOpacity:");
  }
  else
  {
    id mParentHelper = self->mParentHelper;
    id v8 = +[MCAnimationPathKeyframed animationPathWithKey:@"opacity"];
    mRenderingState = self->mRenderingState;
    if (mRenderingState)
    {
      float var11 = mRenderingState->var11;
    }
    else
    {
      [(MCPlugParallel *)self->mPlugAsParallel opacity];
      float var11 = v11;
    }
    [(MRLayerClock *)self->mClock externalTime];
    double v13 = v12;
    *(float *)&double v12 = var11;
    [v8 createKeyframeWithScalar:100 atTime:v12 offsetKind:v13];
    [(MRLayerClock *)self->mClock externalTime];
    double v16 = v15 + a4;
    float v14 = a3;
    *(float *)&double v15 = v14;
    [v8 createKeyframeWithScalar:100 atTime:v15 offsetKind:v16];
    [mParentHelper setOpacityAnimationPath:v8];
  }
}

- (BOOL)isTriggered
{
  return [(MCPlugParallel *)self->mPlugAsParallel isTriggered];
}

- (void)setIsTriggered:(BOOL)a3
{
}

- (void)preactivate
{
  self->mIsPreactivated = 1;
  self->mClock = [[MRLayerClock alloc] initWithPlug:self->mPlug];
  if (!self->mIsReadonly) {
    [(MRLayer *)self _observePlugOnPreactivate];
  }
  if (self->mDoAudio) {
    *(_WORD *)&self->mNeedsToRequestRebuildAudio = 257;
  }
}

- (void)activate
{
  self->mIsActivated = 1;
  self->mNeedsRendering = 1;
  objc_super v3 = ($7518ED76D6D65702929FCC9465E04884 *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1000040F899A5DCuLL);
  self->mRenderingState = v3;
  *(_OWORD *)&v3->var4 = xmmword_164F60;
  *(_OWORD *)&v3->var8 = xmmword_164F50;
  *(_OWORD *)&v3->var0 = xmmword_164F70;
  [(MRLayerClock *)self->mClock reactivateWithPlug:self->mPlug];
  id v4 = [(MCPlug *)self->mPlug actionForKey:@"onPhaseIn"];
  if (v4) {
    [(MRLayer *)self _sendAction:v4 withStates:0 async:0 yesterday:0];
  }
  if (!self->mIsPrecomputing && ![(MRRenderer *)self->mRenderer isOffscreen])
  {
    BOOL v5 = +[NSNotificationCenter defaultCenter];
    double v6 = kMRNotificationLayerIsIn;
    [(NSNotificationCenter *)v5 postNotificationName:v6 object:self];
  }
}

- (void)deactivate
{
  id v3 = [(MCPlug *)self->mPlug actionForKey:@"onCompletion"];
  if (v3) {
    [(MRLayer *)self _sendAction:v3 withStates:0 async:0 yesterday:0];
  }
  [(MRLayer *)self resumeOrPause:0];
  [(MRLayerClock *)self->mClock deactivate];
  self->mIsActivated = 0;
  free(self->mRenderingState);
  self->mRenderingState = 0;
  [(NSMutableDictionary *)self->mAnimationTriggers removeAllObjects];
  [(NSMutableDictionary *)self->mMotions removeAllObjects];
  if (!self->mIsPrecomputing && ![(MRRenderer *)self->mRenderer isOffscreen])
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    BOOL v5 = kMRNotificationLayerIsOut;
    [(NSNotificationCenter *)v4 postNotificationName:v5 object:self];
  }
}

- (void)depreactivate:(BOOL)a3
{
  self->mIsPreactivated = 0;

  self->mClock = 0;
  mAnimationTriggers = self->mAnimationTriggers;
  if (mAnimationTriggers)
  {

    self->mAnimationTriggers = 0;
  }
  mMotions = self->mMotions;
  if (mMotions)
  {

    self->mMotions = 0;
  }
  if (!self->mIsReadonly) {
    [(MRLayer *)self _unobservePlugOnDepreactivate];
  }
  mPlugAsParallel = self->mPlugAsParallel;
  if (!mPlugAsParallel || [(MCPlugParallel *)mPlugAsParallel isTriggered]) {
    self->mTimeIn = 1.0e36;
  }
  [(MRLayer *)self unload];
  if (self->mDoAudio)
  {
    if (self->mAudioPlayer)
    {
      -[MRRenderer removeAudioObject:](self->mRenderer, "removeAudioObject:");

      self->mAudioPlayer = 0;
    }
  }
}

- (BOOL)shouldBePreactivatedAtTime:(double)a3
{
  if (a3 < -6.0) {
    return 0;
  }
  [(MRLayer *)self duration];
  return v5 + 0.1 > a3;
}

- (BOOL)shouldBeActivatedAtTime:(double)a3
{
  if (a3 < 0.0) {
    return 0;
  }
  [(MRLayer *)self duration];
  return v5 > a3;
}

- (BOOL)isLoadedForTime:(double)a3
{
  return self->mIsPreactivated;
}

- (BOOL)isNative3D
{
  BOOL v3 = [(MRLayer *)self _isNative3D];
  if (v3) {
    LOBYTE(v3) = self->_filterID == 0;
  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)isAlphaFriendly
{
  return 1;
}

- (BOOL)isFlatAndSquare
{
  long long v5 = 0u;
  long long v6 = 0u;
  long long v3 = 0u;
  long long v4 = 0u;
  MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, (float *)&v3);
  BOOL result = 0;
  if (*(float *)&v4 == 0.0
    && *(float *)&v5 == 0.0
    && *((float *)&v3 + 1) == 0.0
    && *((float *)&v5 + 1) == 0.0
    && *((float *)&v3 + 2) == 0.0)
  {
    return *((float *)&v4 + 2) == 0.0;
  }
  return result;
}

- (void)_setScissorRectOnContext:(id)a3 saveTo:(int *)a4
{
  float v6 = self->mPixelSize.height / self->mPixelSize.width;
  memset(v26, 0, sizeof(v26));
  MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, (float *)v26);
  double v7 = MRMatrix_ProjectPoint((float *)v26, -1.0, (float)-v6);
  double v9 = v8;
  double v10 = (v7 + 1.0) * 0.5;
  [a3 pixelSize];
  double v12 = v11 * v10;
  [a3 pixelSize];
  double v14 = (v9 + 1.0) * 0.5 * v13;
  double v15 = MRMatrix_ProjectPoint((float *)v26, 1.0, v6);
  double v17 = v16;
  double v18 = (v15 + 1.0) * 0.5;
  [a3 pixelSize];
  double v20 = v19 * v18;
  [a3 pixelSize];
  double v22 = (v17 + 1.0) * 0.5 * v21;
  v27[0] = (int)v12;
  if ([a3 isFlipped]) {
    double v23 = v22;
  }
  else {
    double v23 = v14;
  }
  v27[1] = (int)v23;
  v27[2] = (int)(v20 - v12);
  unsigned int v24 = [a3 isFlipped];
  double v25 = v14 - v22;
  if (!v24) {
    double v25 = v22 - v14;
  }
  v27[3] = (int)v25;
  [a3 setScissorRect:v27 saveTo:a4];
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  mPlugAsParallel = self->mPlugAsParallel;
  if (mPlugAsParallel)
  {
    mIDInSupercontainer = self->mIDInSupercontainer;
    if (mIDInSupercontainer != [(MCPlugParallel *)mPlugAsParallel idInSupercontainer])
    {

      double v10 = self->mPlugAsParallel;
LABEL_7:
      self->mIDInSupercontainer = (NSString *)objc_msgSend(objc_msgSend(v10, "idInSupercontainer"), "copy");
    }
  }
  else
  {
    mPlugAsHaven = self->mPlugAsHaven;
    if (mPlugAsHaven)
    {
      double v12 = self->mIDInSupercontainer;
      if (v12 != [(MCPlugHaven *)mPlugAsHaven idInSupercontainer])
      {

        double v10 = self->mPlugAsHaven;
        goto LABEL_7;
      }
    }
    else
    {
      mPlugAsSerial = self->mPlugAsSerial;
      if (mPlugAsSerial) {
        self->mIndex = [(MCPlugSerial *)mPlugAsSerial index];
      }
    }
  }
  if (!self->mIsPreactivated) {
    return 0;
  }
  if (self->mNeedsToUpdateInitialState)
  {
    self->mNeedsToUpdateInitialState = 0;
    double v13 = [(MCContainer *)[(MCPlug *)self->mPlug container] initialState];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v14 = [(NSDictionary *)v13 countByEnumeratingWithState:&v61 objects:v66 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v62;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v62 != v16) {
            objc_enumerationMutation(v13);
          }
          [(MRLayer *)self _setStateValue:[(NSDictionary *)v13 objectForKey:*(void *)(*((void *)&v61 + 1) + 8 * i)] forKey:*(void *)(*((void *)&v61 + 1) + 8 * i)];
        }
        id v15 = [(NSDictionary *)v13 countByEnumeratingWithState:&v61 objects:v66 count:16];
      }
      while (v15);
    }
  }
  BOOL v18 = self->mIsActivated && self->mNeedsRendering;
  self->mNeedsRendering = 0;
  double v19 = [(MRLayerClock *)self->mClock currentLoopIndex];
  BOOL v20 = [(MRLayerClock *)self->mClock _isPaused];
  unsigned int v21 = [(MRLayerClock *)self->mClock isInPhaseOut];
  if (self->mNeedsToResyncClockToPlug)
  {
    self->mNeedsToResyncClockToPlug = 0;
    [(MRLayerClock *)self->mClock syncToPlug:self->mPlug];
  }
  [(MRLayerClock *)self->mClock updateForExternalTime:a3];
  mSuperlayer = self->mSuperlayer;
  if (mSuperlayer) {
    [(MRLayerClock *)self->mClock setParentIsPaused:[(MRLayerClock *)[(MRLayer *)mSuperlayer clock] isPaused]];
  }
  if ([a5 forcedState])
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v23 = objc_msgSend(objc_msgSend(a5, "forcedState", 0), "objectForKey:", @"actions");
    id v24 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v58;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v58 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [(MCPlug *)self->mPlug actionForKey:*(void *)(*((void *)&v57 + 1) + 8 * (void)j)];
          if (v28) {
            [(MRLayer *)self _sendAction:v28 withStates:self->mPersistentState async:0 yesterday:1];
          }
        }
        id v25 = [v23 countByEnumeratingWithState:&v57 objects:v65 count:16];
      }
      while (v25);
    }
  }
  v29 = self->mPlugAsParallel;
  if (v29 && (![(MCPlugParallel *)v29 isTriggered] || !self->mIsActivated))
  {
    [(MCPlugParallel *)self->mPlugAsParallel timeIn];
    self->mTimeIn = v30;
  }
  if (self->mNeedsToUpdateGeometry) {
    [(MRLayer *)self updateGeometry];
  }
  unsigned int v31 = [(MRLayerClock *)self->mClock isPaused];
  if (self->mDoAudio)
  {
    if (self->mNeedsToRequestRebuildAudio
      && ![(MRRenderer *)self->mRenderer ignoresBackgroundAudio])
    {
      if (self->mAudioPlayer) {
        -[MRRenderer removeAudioObject:](self->mRenderer, "removeAudioObject:");
      }
      [(MRLayer *)self _rebuildAudio];
      if (self->mAudioPlayer)
      {
        -[MRRenderer addAudioObject:](self->mRenderer, "addAudioObject:");
        char v34 = self->mIsActivated ? v31 : 1;
        if ((v34 & 1) == 0)
        {
          [(MRAudioPlayer *)self->mAudioPlayer resyncAudioItem];
          [(MRAudioPlayer *)self->mAudioPlayer setShouldBePlaying:1];
        }
      }
    }
    else if (self->mNeedsToRequestRebuildVolume)
    {
      mAudioPlayer = self->mAudioPlayer;
      if (mAudioPlayer) {
        [(MRAudioPlayer *)mAudioPlayer syncVolumeToAudioPlaylist:[(MCContainer *)[(MCPlug *)self->mPlug container] audioPlaylist]];
      }
    }
    *(_WORD *)&self->mNeedsToRequestRebuildAudio = 0;
    if (self->mAudioPlayer)
    {
      [(MRLayerClock *)self->mClock containerTime];
      -[MRAudioPlayer setLocalTime:](self->mAudioPlayer, "setLocalTime:");
      if ([(MRLayerClock *)self->mClock jumpedBackInTime]) {
        [(MRAudioPlayer *)self->mAudioPlayer resyncAudioItem];
      }
    }
  }
  if (!self->mIsActivated) {
    return 0;
  }
  self->mRenderingState->var15 = 1;
  v35 = self->mPlugAsSerial;
  if (v35) {
    char v36 = v31;
  }
  else {
    char v36 = 1;
  }
  if ((v36 & 1) == 0)
  {
    v37 = self->mSuperlayer;
    v38 = [(MCPlugSerial *)v35 transitionID];
    v39 = self->mPlugAsSerial;
    if (v38) {
      [(MCPlugSerial *)v39 transitionDuration];
    }
    else {
      [(MCPlug *)v39 phaseOutDuration];
    }
    double v41 = v40;
    [(MRLayerClock *)self->mClock containerTime];
    double v43 = v42;
    [(MRLayer *)self duration];
    double v45 = v44 - v41;
    double v46 = 0.0;
    if (v41 <= 0.0)
    {
      [(MRRenderer *)self->mRenderer timeQuantum];
      double v46 = -v47;
    }
    double v48 = v43 - v45;
    if (![(MCPlugSerial *)self->mPlugAsSerial transitionID] && v48 >= 0.0)
    {
      v49 = self->mSuperlayer;
      v50 = (char *)[(MCPlugSerial *)self->mPlugAsSerial index] + 1;
      if (v50 >= objc_msgSend(-[MRLayer sublayers](v49, "sublayers"), "count"))
      {
        double v51 = (double)[(MRLayerClock *)[(MRLayer *)v49 clock] currentLoopIndex];
        [(MRLayerClock *)[(MRLayer *)v49 clock] numberOfLoops];
        if (v52 + -1.0 <= v51
          || ([(MRRenderer *)self->mRenderer renderingDelegate],
              (objc_opt_respondsToSelector() & 1) == 0)
          || ([(MRRenderingDelegate *)[(MRRenderer *)self->mRenderer renderingDelegate] slideshowShouldWrap] & 1) == 0)
        {
          double v48 = v48 - v41;
          double v46 = -0.002;
        }
      }
    }
    if (v48 > 0.05)
    {
      [(MRRenderer *)self->mRenderer timeQuantum];
      double v46 = -v53;
      double v48 = 0.0;
    }
    if (v48 >= v46
      && ([(MRLayer *)v37 isTransitioning] & 1) == 0
      && [(MRLayer *)v37 isReadyToTransitionToNextSublayer])
    {
      [(MRLayer *)v37 transitionToNextSublayerWithDeltaStartTime:v48];
    }
  }
  if (v21 != [(MRLayerClock *)self->mClock isInPhaseOut])
  {
    id v54 = [(MCPlug *)self->mPlug actionForKey:@"onPhaseOut"];
    if (v54) {
      [(MRLayer *)self _sendAction:v54 withStates:0 async:0 yesterday:0];
    }
  }
  if (v20 == v31)
  {
    if (self->mNeedsToSynchronizeTime) {
      [(MRLayer *)self synchronizeTime];
    }
  }
  else
  {
    [(MRLayer *)self resumeOrPause:v20];
  }
  self->mNeedsToSynchronizeTime = 0;
  if (!self->mIsPrecomputing && (void *)[(MRLayerClock *)self->mClock currentLoopIndex] != v19)
  {
    v55 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v55 postNotificationName:kMRNotificationLayerLooped object:self];
    [(NSMutableDictionary *)self->mAnimationTriggers removeAllObjects];
  }
  return v18;
}

- (id)__retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  *(_WORD *)&self->mRenderingState->var17 = 257;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v9 = [(MRLayer *)self backgroundColor];
    if (v9) {
      goto LABEL_5;
    }
  }
  if (self->mRenderingState->var19)
  {
    double v9 = [a4 backColor];
LABEL_5:
    double v10 = (float *)(v9 + 3);
    double v11 = v9 + 2;
    double v12 = v9 + 1;
    goto LABEL_7;
  }
  double v10 = (float *)&v22;
  double v11 = (_DWORD *)&v22 + 1;
  double v12 = (int *)&v23;
  double v9 = (_DWORD *)&v23 + 1;
LABEL_7:
  v24[0] = 0;
  v24[1] = 0;
  int v13 = *v12;
  v25[0] = *v9;
  v25[1] = v13;
  float v14 = *v10;
  if (self->mRenderingState->var19) {
    float v14 = 1.0;
  }
  v25[2] = *v11;
  *(float *)&v25[3] = v14;
  if ([(MRLayer *)self isOpaque] && !self->mRenderingState->var19) {
    id v15 = 0;
  }
  else {
    id v15 = v25;
  }
  id v16 = objc_msgSend(a4, "beginLocalContextWithSize:backgroundColor:state:", v15, v24, self->mPixelSize.width, self->mPixelSize.height);
  double v17 = +[EAGLContext currentContext];
  BOOL v18 = v17;
  if (v17 != [v16 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v16 glContext]);
  }
  CGFloat v19 = self->mPixelSize.width / self->mPixelSize.height;
  *(float *)&CGFloat v19 = v19;
  [v16 setLocalAspectRatio:v19];
  objc_msgSend(v16, "setBackColor:saveTo:", objc_msgSend(a4, "backColor"), 0);
  [(MRLayer *)self _renderAtTime:v16 inContext:a5 withArguments:a3];
  if (+[EAGLContext currentContext] != v17) {
    +[EAGLContext setCurrentContext:v17];
  }

  id v20 = [a4 retainedByUserImageByEndingLocalContext:v16 andRestoreState:v24];
  [v20 setSourceTimestamp:self->mTimeStamp];
  [v20 setRenderTime:a3];
  return v20;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (![(MRLayer *)self hasSomethingToRender]) {
    return;
  }
  [(MRLayer *)self _updateStateWithContext:a4];
  unsigned __int8 v9 = [(MRLayer *)self isNative3D];
  mRenderingState = self->mRenderingState;
  mRenderingState->var16 = v9 ^ 1;
  *(_WORD *)&mRenderingState->var17 = 0;
  if (![(MRLayer *)self isInfinite])
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, (float *)&v66);
    CGFloat v11 = self->mPixelSize.height / self->mPixelSize.width;
    v64[0] = -0.99999;
    float v12 = 0.00001 - v11;
    v64[1] = v12;
    uint64_t v65 = 0x3F80000000000000;
    float32x2_t v62 = 0;
    uint64_t v63 = 0;
    v60[0] = -0.99999;
    *(float *)&CGFloat v11 = v11 + -0.00001;
    v60[1] = *(float *)&v11;
    uint64_t v61 = 0x3F80000000000000;
    v59[0] = 0;
    v59[1] = 0;
    v57[0] = 0.99999;
    v57[1] = v12;
    uint64_t v58 = 0x3F80000000000000;
    v56[0] = 0;
    v56[1] = 0;
    v54[0] = 0.99999;
    v54[1] = *(float *)&v11;
    uint64_t v55 = 0x3F80000000000000;
    v53[0] = 0;
    v53[1] = 0;
    MRMatrix_TransformVector((float *)&v66, v64, (float *)&v62);
    MRMatrix_TransformVector((float *)&v66, v60, (float *)v59);
    MRMatrix_TransformVector((float *)&v66, v57, (float *)v56);
    MRMatrix_TransformVector((float *)&v66, v54, (float *)v53);
    double v47 = -*((float *)&v63 + 1);
    double v48 = v47;
    double v49 = v47;
    double v50 = *((float *)&v63 + 1);
    double v51 = *((float *)&v63 + 1);
    double v52 = v47;
    v46[0] = *((float *)&v63 + 1);
    v46[1] = *((float *)&v63 + 1);
    v46[2] = v47;
    v46[3] = *((float *)&v63 + 1);
    v46[4] = *((float *)&v63 + 1);
    v46[5] = v47;
    float64x2_t v41 = vcvtq_f64_f32(v62);
    double v42 = *(float *)v59;
    double v43 = *((float *)v59 + 1);
    double v44 = *(float *)v56;
    double v45 = *((float *)v56 + 1);
    float64x2_t v36 = vcvtq_f64_f32(v53[0]);
    double v37 = *(float *)v59;
    double v38 = *((float *)v59 + 1);
    double v39 = *(float *)v56;
    double v40 = *((float *)v56 + 1);
    if (TrianglesAreDisjoint(&v47, v41.f64)
      && TrianglesAreDisjoint(&v47, v36.f64)
      && TrianglesAreDisjoint(v46, v41.f64)
      && TrianglesAreDisjoint(v46, v36.f64))
    {
      return;
    }
  }
  int v13 = +[EAGLContext currentContext];
  float v14 = v13;
  if (v13 != [a4 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [a4 glContext]);
  }
  if (self->mIsDimmed)
  {
    unsigned __int8 v15 = [(MRLayer *)self->mSuperlayer isDimmed];
    id v16 = self->mRenderingState;
    if ((v15 & 1) == 0) {
      v16->var10 = v16->var10 * 0.5;
    }
  }
  else
  {
    id v16 = self->mRenderingState;
  }
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  [a4 setModelViewMatrix:v16->var13 saveTo:&v66];
  double v17 = self->mRenderingState;
  *(float *)&double v18 = v17->var10;
  *(float *)&double v19 = v17->var11;
  LODWORD(v20) = LODWORD(v18);
  LODWORD(v21) = LODWORD(v18);
  [a4 composeForeColorRed:&v47 green:v18 blue:v20 alpha:v21 saveTo:v19];
  [a4 localAspectRatio];
  int v23 = v22;
  CGFloat v24 = self->mPixelSize.width / self->mPixelSize.height;
  *(float *)&CGFloat v24 = v24;
  [a4 setLocalAspectRatio:v24];
  id v25 = self->mRenderingState;
  float v26 = *((float *)&v48 + 1) * v25->var11;
  if (!v25->var16)
  {
    if (v26 < 1.0) {
      uint64_t v29 = 3;
    }
    else {
      uint64_t v29 = 0;
    }
    [a4 blend:v29];
    if ([(MCPlugParallel *)self->mPlugAsParallel clipsContainer]
      && [(MRLayer *)self isFlatAndSquare])
    {
      [(MRLayer *)self _setScissorRectOnContext:a4 saveTo:v46];
      [(MRLayer *)self _renderAtTime:a4 inContext:a5 withArguments:a3];
      [a4 restoreScissorRect:v46];
    }
    else
    {
      [(MRLayer *)self _renderAtTime:a4 inContext:a5 withArguments:a3];
    }
    if (v26 < 1.0) {
      [a4 blend:0];
    }
    goto LABEL_35;
  }
  if ([(MRLayer *)self _isNative3D]) {
    id v27 = [(MRLayer *)self __retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  }
  else {
    id v27 = [(MRLayer *)self _retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  }
  double v30 = v27;
  if (v27)
  {
    BOOL v31 = v26 >= 1.0;
    [v27 setFilterID:self->_filterID];
    unsigned int v32 = [(MRLayer *)self isOpaque];
    char v33 = v31 & v32;
    if ((v31 & v32) != 0) {
      uint64_t v34 = 0;
    }
    else {
      uint64_t v34 = 2;
    }
    [a4 blend:v34];
    if ([v30 filterID] || objc_msgSend(v30, "shader"))
    {
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:", v30, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0);
      if (v33)
      {
LABEL_31:
        [v30 releaseByUser];
        goto LABEL_35;
      }
    }
    else
    {
      if ([v30 hasKenBurns]) {
        CFStringRef v35 = @"PlainTextureHigh";
      }
      else {
        CFStringRef v35 = @"PlainTexture";
      }
      [a4 setShader:v35];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:", v30, a4, CGPointZero.x, CGPointZero.y, 2.0, 2.0);
      [a4 unsetShader];
      if (v33) {
        goto LABEL_31;
      }
    }
    [a4 blend:0];
    goto LABEL_31;
  }
LABEL_35:
  LODWORD(v28) = v23;
  [a4 setLocalAspectRatio:v28];
  [a4 restoreForeColor:&v47];
  [a4 restoreModelViewMatrix:&v66];
  if (+[EAGLContext currentContext] != v13) {
    +[EAGLContext setCurrentContext:v13];
  }
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if ([(MRLayer *)self hasSomethingToRender])
  {
    [(MRLayer *)self _updateStateWithContext:a4];
    mRenderingState = self->mRenderingState;
    *(_WORD *)&mRenderingState->var16 = 1;
    mRenderingState->var18 = 0;
    if ([(MRLayer *)self _isNative3D]) {
      id v10 = [(MRLayer *)self __retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    }
    else {
      id v10 = [(MRLayer *)self _retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
    }
    id v17 = v10;
    [v10 setFilterID:self->_filterID];
  }
  else
  {
    BOOL var19 = self->mRenderingState->var19;
    id v12 = [a4 imageManager];
    id v13 = v12;
    if (var19)
    {
      id v14 = [a4 backColor];
      double width = 1.0;
      double height = 1.0;
      id v12 = v13;
    }
    else
    {
      double width = CGSizeZero.width;
      double height = CGSizeZero.height;
      id v14 = 0;
    }
    id v17 = objc_msgSend(v12, "retainedByUserImageWithSize:andColor:", v14, width, height);
    [v17 setLabel:@"Marimba Layer Background"];
    [v17 setClampMode:2];
  }
  [v17 setSourceTimestamp:self->mTimeStamp];
  [v17 setRenderTime:a3];
  return v17;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0;
  }
  id v6 = [(MRLayer *)self retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [a4 localAspectRatio];
  id v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v6, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7), @"rectangle", 0);
  unsigned __int8 v9 = +[NSArray arrayWithObject:v8];

  [v6 releaseByUser];
  return v9;
}

- (BOOL)supportsDynamicExpansion
{
  return 0;
}

- (void)stampTime
{
  [(MRLayer *)self willChangeValueForKey:@"timeStamp"];
  self->mTimeStamp = MRGetCurrentTime();
  self->mNeedsRendering = 1;
  [(MRLayer *)self didChangeValueForKey:@"timeStamp"];
}

- (void)scheduleForDestruction
{
  if (!self->mIsReadonly && !self->mIsScheduledForDestruction) {
    [(MRLayer *)self _unobservePlug];
  }
  self->mIsScheduledForDestruction = 1;
}

- (BOOL)hasAudio
{
  return 0;
}

- (CGPoint)convertLocalPoint:(CGPoint)a3
{
  if (self->mIsActivated)
  {
    double x = a3.x;
    double v4 = a3.y * (self->mPixelSize.height / self->mPixelSize.width);
    memset(v7, 0, sizeof(v7));
    MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, (float *)v7);
    double v5 = MRMatrix_ProjectPoint((float *)v7, x, v4);
  }
  else
  {
    double v5 = CGPointZero.x;
    double y = CGPointZero.y;
  }
  result.double y = y;
  result.double x = v5;
  return result;
}

- (CGPoint)convertGlobalPoint:(CGPoint)a3
{
  if (self->mIsActivated)
  {
    double y = a3.y;
    double x = a3.x;
    memset(v10, 0, sizeof(v10));
    memset(v9, 0, sizeof(v9));
    MRMatrix_MultiplyWithMatrix(self->mRenderingState->var13, self->mRenderingState->var14, (float *)v10);
    MRMatrix_Invert((float *)v10, (float *)v9);
    double v6 = MRMatrix_UnprojectPoint((float *)v9, x, y);
    double v8 = v7 * (self->mPixelSize.width / self->mPixelSize.height);
  }
  else
  {
    double v6 = CGPointZero.x;
    double v8 = CGPointZero.y;
  }
  result.double y = v8;
  result.double x = v6;
  return result;
}

- (void)_applyState:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(a3);
        }
        v7 |= -[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", [a3 objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)], *(void *)(*((void *)&v11 + 1) + 8 * i));
      }
      id v6 = [a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
    if (v7)
    {
      id v10 = [(MCPlug *)self->mPlug actionForKey:@"onStateChange"];
      if (v10) {
        [(MRLayer *)self _sendAction:v10 withStates:0 async:0 yesterday:1];
      }
    }
  }
}

- (id)actions
{
  return [(MCPlug *)self->mPlug actions];
}

- (double)doAnimationTrigger:(id)a3
{
  double v3 = 0.0;
  if (self->mIsActivated)
  {
    id v6 = -[MCPlug animationPathForKey:](self->mPlug, "animationPathForKey:", objc_msgSend(objc_msgSend(a3, "mcAction"), "animationKey"));
    if (v6)
    {
LABEL_14:
      [a3 time];
      if (v14 != -1.0e10) {
        [(MRLayerClock *)self->mClock externalTime];
      }
      objc_msgSend(a3, "setTime:");
      mAnimationTriggers = self->mAnimationTriggers;
      if (!mAnimationTriggers)
      {
        mAnimationTriggers = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        self->mAnimationTriggers = mAnimationTriggers;
      }
      id v16 = -[NSMutableDictionary objectForKey:](mAnimationTriggers, "objectForKey:", [v6 key]);
      if (v16)
      {
        id v17 = v16;
        [v16 setAction:a3];
        [v17 disarm];
      }
      else
      {
        -[NSMutableDictionary setObject:forKey:](self->mAnimationTriggers, "setObject:forKey:", -[MRAnimationTrigger initWithAction:]([MRAnimationTrigger alloc], "initWithAction:", a3), [v6 key]);
      }
      id v18 = objc_msgSend(objc_msgSend(v6, "orderedKeyframesWithPlugTiming:", self->mPlug), "lastObject");
      if (v18)
      {
        double v19 = v18;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v19 timeOffset];
          [v19 duration];
          TimeForKeyframeAttributesInPlug([v19 timeOffsetKind], 0, self->mPlug);
        }
        else
        {
          +[MCAnimationPathKeyframed timeForKeyframe:v19 withPlugTiming:self->mPlug];
        }
        return v20;
      }
    }
    else
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      int v7 = [(MCPlug *)self->mPlug animationPaths];
      id v8 = [(NSSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(v7);
            }
            long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = objc_msgSend(v12, "animationPathForKey:", objc_msgSend(objc_msgSend(a3, "mcAction"), "animationKey"));
              if (v13)
              {
                id v6 = v13;
                goto LABEL_14;
              }
            }
          }
          id v9 = [(NSSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
    }
  }
  return v3;
}

- (double)_serial_gotoNextWithObject:(id)a3
{
  unint64_t v5 = [(MCPlugSerial *)self->mPlugAsSerial index];
  mSuperlayer = self->mSuperlayer;
  unint64_t v7 = v5 + 1;
  id v8 = objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count");
  objc_msgSend(objc_msgSend(-[MRLayer currentSublayer](mSuperlayer, "currentSublayer"), "clock"), "pauseOnNextUpdate");
  mPlugAsSerial = self->mPlugAsSerial;
  id v10 = +[MCTransitionTrigger transitionForTargetPlugObjectID:0 withTransitionID:[(MCPlugSerial *)mPlugAsSerial transitionID]];
  objc_msgSend(v10, "setTransitionAttributes:", -[MCPlugSerial transitionAttributes](mPlugAsSerial, "transitionAttributes"));
  [(MCPlugSerial *)mPlugAsSerial transitionDuration];
  objc_msgSend(v10, "setTransitionDuration:");
  if (v7 >= (unint64_t)v8) {
    uint64_t v11 = 0;
  }
  else {
    uint64_t v11 = v7;
  }
  [v10 setTransitionDestinationPlugID:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", v11)];
  [(MRLayer *)mSuperlayer doTransition:v10 backwards:0 pzr:a3];
  return result;
}

- (double)_serial_gotoPreviousWithObject:(id)a3
{
  unint64_t v5 = [(MCPlugSerial *)self->mPlugAsSerial index];
  mSuperlayer = self->mSuperlayer;
  if (!v5) {
    unint64_t v5 = (char *)objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count");
  }
  unint64_t v7 = v5 - 1;
  objc_msgSend(objc_msgSend(-[MRLayer currentSublayer](mSuperlayer, "currentSublayer"), "clock"), "pauseOnNextUpdate");
  id v8 = [(MCContainer *)[(MCPlug *)[(MRLayer *)mSuperlayer plug] container] plugAtIndex:v7];
  id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:](MCTransitionTrigger, "transitionForTargetPlugObjectID:withTransitionID:", 0, [v8 transitionID]);
  objc_msgSend(v9, "setTransitionAttributes:", objc_msgSend(v8, "transitionAttributes"));
  [v8 transitionDuration];
  objc_msgSend(v9, "setTransitionDuration:");
  [v9 setTransitionDestinationPlugID:+[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%u", v7)];
  [(MRLayer *)mSuperlayer doTransition:v9 backwards:1 pzr:a3];
  return result;
}

- (MCTransitionTrigger)nextTransition
{
  mPlugAsSerial = self->mPlugAsSerial;
  if (mPlugAsSerial)
  {
    double v4 = (char *)[(MCPlugSerial *)mPlugAsSerial index] + 1;
    mSuperlayer = self->mSuperlayer;
    if (v4 >= objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count"))
    {
      double v10 = (double)[(MRLayerClock *)[(MRLayer *)mSuperlayer clock] currentLoopIndex];
      [(MRLayerClock *)[(MRLayer *)mSuperlayer clock] numberOfLoops];
      if (v11 + -1.0 <= v10) {
        return 0;
      }
      [(MRRenderer *)self->mRenderer renderingDelegate];
      if ((objc_opt_respondsToSelector() & 1) == 0) {
        return 0;
      }
      double v4 = 0;
      unint64_t v7 = 0;
      if (![(MRRenderingDelegate *)[(MRRenderer *)self->mRenderer renderingDelegate] slideshowShouldWrap])return v7; {
    }
      }
    id v6 = self->mPlugAsSerial;
    unint64_t v7 = +[MCTransitionTrigger transitionForTargetPlugObjectID:0 withTransitionID:[(MCPlugSerial *)v6 transitionID]];
    [(MCTransitionTrigger *)v7 setTransitionAttributes:[(MCPlugSerial *)v6 transitionAttributes]];
    [(MCPlugSerial *)v6 transitionDuration];
    -[MCTransitionTrigger setTransitionDuration:](v7, "setTransitionDuration:");
    [(MCTransitionTrigger *)v7 setTransitionDestinationPlugID:+[NSString stringWithFormat:@"%u", v4]];
    return v7;
  }
  mPlug = self->mPlug;
  return (MCTransitionTrigger *)[(MCPlug *)mPlug actionForKey:@"onNext"];
}

- (void)setNextTransition:(id)a3
{
}

- (MCTransitionTrigger)previousTransition
{
  mPlugAsSerial = self->mPlugAsSerial;
  if (mPlugAsSerial)
  {
    double v4 = [(MCPlugSerial *)mPlugAsSerial index];
    mSuperlayer = self->mSuperlayer;
    if (!v4)
    {
      [(MRRenderer *)self->mRenderer renderingDelegate];
      if ((objc_opt_respondsToSelector() & 1) == 0
        || ![(MRRenderingDelegate *)[(MRRenderer *)self->mRenderer renderingDelegate] slideshowShouldWrap])
      {
        return 0;
      }
      double v4 = (char *)objc_msgSend(-[MRLayer sublayers](mSuperlayer, "sublayers"), "count");
    }
    id v6 = v4 - 1;
    id v7 = [(MCContainer *)[(MCPlug *)[(MRLayer *)mSuperlayer plug] container] plugAtIndex:v4 - 1];
    id v8 = +[MCTransitionTrigger transitionForTargetPlugObjectID:withTransitionID:](MCTransitionTrigger, "transitionForTargetPlugObjectID:withTransitionID:", 0, [v7 transitionID]);
    -[MCTransitionTrigger setTransitionAttributes:](v8, "setTransitionAttributes:", [v7 transitionAttributes]);
    [v7 transitionDuration];
    -[MCTransitionTrigger setTransitionDuration:](v8, "setTransitionDuration:");
    [(MCTransitionTrigger *)v8 setTransitionDestinationPlugID:+[NSString stringWithFormat:@"%u", v6]];
    return v8;
  }
  mPlug = self->mPlug;
  return (MCTransitionTrigger *)[(MCPlug *)mPlug actionForKey:@"onPrevious"];
}

- (void)setPreviousTransition:(id)a3
{
}

- (double)doActionTrigger:(id)a3
{
  if (self->mIsActivated)
  {
    id v5 = -[MCPlug actionForKey:](self->mPlug, "actionForKey:", objc_msgSend(objc_msgSend(a3, "mcAction"), "actionKey"));
    if (v5) {
      -[MRLayer _sendAction:withStates:async:yesterday:](self, "_sendAction:withStates:async:yesterday:", v5, [a3 states], 0, 0);
    }
    else {
      NSLog(@"Error: couldn't find action %@ on layer %@", objc_msgSend(objc_msgSend(a3, "mcAction"), "actionKey"), self);
    }
  }
  return 0.0;
}

- (double)doStateOperation:(id)a3
{
  id v5 = [a3 mcAction];
  id v6 = [v5 stateKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = (NSNumber *)[v5 string];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = -[MUMathExpressionFloatBased initWithString:error:]([MUMathExpressionFloatBased alloc], "initWithString:error:", [v5 expression], 0);
      id v9 = [a3 states];
      if (v9) {
        [(MUMathExpressionFloatBased *)v8 setVariableValues:v9];
      }
      if (self->mPersistentState) {
        -[MUMathExpressionFloatBased setVariableValues:](v8, "setVariableValues:");
      }
      [(MUMathExpressionFloatBased *)v8 evaluate];
      float v11 = v10;
    }
    else
    {
      [v5 scalar];
      float v11 = v12;
    }
    *(float *)&double v12 = v11;
    id v7 = +[NSNumber numberWithFloat:v12];
  }
  unsigned __int8 v13 = [(MRLayer *)self _setStateValue:v7 forKey:v6];
  if ([v5 recordsTime])
  {
    mClock = self->mClock;
    if (mClock)
    {
      [(MRLayerClock *)mClock containerTime];
      *(float *)&double v14 = v14;
    }
    else
    {
      LODWORD(v14) = -803929351;
    }
    -[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v14), [v6 stringByAppendingString:@"Time"]);
  }
  if ((v13 & 1) != 0 || [v5 alwaysNotifies])
  {
    id v16 = [(MCPlug *)self->mPlug actionForKey:@"onStateChange"];
    if (v16) {
      [(MRLayer *)self _sendAction:v16 withStates:0 async:0 yesterday:0];
    }
  }
  return 0.0;
}

- (double)doMotionTrigger:(id)a3
{
  id v5 = [a3 mcAction];
  [v5 duration];
  double v7 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v5 value];
    double v9 = v8;
  }
  else
  {
    float v10 = -[MUMathExpressionFloatBased initWithString:error:]([MUMathExpressionFloatBased alloc], "initWithString:error:", [v5 expression], 0);
    id v11 = [a3 states];
    if (v11) {
      [(MUMathExpressionFloatBased *)v10 setVariableValues:v11];
    }
    if (self->mPersistentState) {
      -[MUMathExpressionFloatBased setVariableValues:](v10, "setVariableValues:");
    }
    id v12 = [v5 attributes];
    if (v12) {
      [(MUMathExpressionFloatBased *)v10 setVariableValues:v12];
    }
    [(MUMathExpressionFloatBased *)v10 evaluate];
    double v9 = v13;
  }
  double v14 = [MRMotion alloc];
  id v15 = [v5 key];
  [v5 easeIn];
  double v17 = v16;
  [v5 easeOut];
  double v19 = [(MRMotion *)v14 initWithKey:v15 value:v9 duration:v7 easeIn:v17 easeOut:v18];
  mMotions = self->mMotions;
  if (mMotions)
  {
    id v21 = -[NSMutableDictionary objectForKey:](mMotions, "objectForKey:", [v5 key]);
    if (v21)
    {
      long long v22 = v21;
      [(MRLayerClock *)[(MRLayer *)self clock] containerTime];
      double v24 = v23;
      -[MRMotion setStartTime:](v19, "setStartTime:");
      [v22 valueAtTime:v24];
      -[MRMotion setStartValue:](v19, "setStartValue:");
    }
    -[NSMutableDictionary setObject:forKey:](self->mMotions, "setObject:forKey:", v19, [v5 key]);
  }
  else
  {
    self->mMotions = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", v19, objc_msgSend(v5, "key"), 0);
  }

  return v7;
}

- (double)doGenericAction:(id)a3
{
  if (!self->mIsActivated) {
    return 0.0;
  }
  id v5 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
  id v6 = [v5 objectForKey:@"type"];
  if ([v6 isEqualToString:@"stateForward"])
  {
    id v7 = [v5 objectForKey:@"sourceStateKey"];
    if (!v7) {
      return 0.0;
    }
    id v8 = v7;
    id v9 = [v5 objectForKey:@"destinationStateKey"];
    id v10 = v9 ? v9 : v8;
    if (!-[MRLayer _setStateValue:forKey:](self, "_setStateValue:forKey:", objc_msgSend(objc_msgSend(a3, "states"), "objectForKey:", v8), v10))return 0.0; {
    id v11 = [(MCPlug *)self->mPlug actionForKey:@"onStateChange"];
    }
    if (!v11) {
      return 0.0;
    }
    id v12 = v11;
    float v13 = self;
    uint64_t v14 = 0;
LABEL_10:
    [(MRLayer *)v13 _sendAction:v12 withStates:0 async:0 yesterday:v14];
    return 0.0;
  }
  if ([v6 isEqualToString:@"pauseOrResume"])
  {
    unsigned int v15 = objc_msgSend(objc_msgSend(v5, "objectForKey:", @"resume"), "BOOLValue");
    mClock = self->mClock;
    if (v15) {
      [(MRLayerClock *)mClock resumeOnNextUpdate];
    }
    else {
      [(MRLayerClock *)mClock pauseOnNextUpdate];
    }
    return 0.0;
  }
  if ([v6 isEqualToString:@"goBack"])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(@"Consistency error: 'goBack' action can only be sent to MRLayerNavigator");
      return 0.0;
    }
    [(MRLayer *)self goBack];
  }
  else
  {
    if (![v6 isEqualToString:@"goForth"])
    {
      if ([v6 isEqualToString:@"setState"])
      {
        id v17 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes"), "objectForKey:", @"state");
        if (v17) {
          [(MRLayer *)self _applyState:v17];
        }
        return 0.0;
      }
      if (![v6 isEqualToString:@"loadState"])
      {
        if ([v6 isEqualToString:@"saveState"])
        {
          [a3 sender];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
            id v25 = objc_alloc_init((Class)NSMutableDictionary);
            id v26 = [v24 objectForKey:@"stateKeys"];
            id v27 = objc_msgSend(objc_msgSend(a3, "sender"), "persistentState");
            long long v46 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v28 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v47;
              do
              {
                for (i = 0; i != v29; i = (char *)i + 1)
                {
                  if (*(void *)v47 != v30) {
                    objc_enumerationMutation(v26);
                  }
                  uint64_t v32 = *(void *)(*((void *)&v46 + 1) + 8 * i);
                  id v33 = [v27 objectForKey:v32];
                  if (v33) {
                    [v25 setObject:v33 forKey:v32];
                  }
                }
                id v29 = [v26 countByEnumeratingWithState:&v46 objects:v54 count:16];
              }
              while (v29);
            }
            if ([v25 count])
            {
              mPersistentState = self->mPersistentState;
              if (!mPersistentState)
              {
                mPersistentState = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                self->mPersistentState = mPersistentState;
              }
              -[NSMutableDictionary setObject:forKey:](mPersistentState, "setObject:forKey:", v25, [v24 objectForKey:@"blobKey"]);
            }
          }
          else
          {
            NSLog(@"Consistency error: 'saveState' action can only be sent to MRLayers");
          }
        }
        return 0.0;
      }
      [a3 sender];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSLog(@"Consistency error: 'loadState' action can only be sent to MRLayers");
        return 0.0;
      }
      double v18 = (MRLayer *)[a3 sender];
      id v19 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
      id v20 = [v19 objectForKey:@"blobKey"];
      if (v20 && (id v21 = v20, (v22 = self->mPersistentState) != 0)) {
        id v23 = [(NSMutableDictionary *)v22 objectForKey:v21];
      }
      else {
        id v23 = 0;
      }
      id v35 = [v19 objectForKey:@"stateKeys"];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v36 = [v35 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (!v36) {
        return 0.0;
      }
      id v37 = v36;
      int v38 = 0;
      uint64_t v39 = *(void *)v51;
      do
      {
        for (j = 0; j != v37; j = (char *)j + 1)
        {
          if (*(void *)v51 != v39) {
            objc_enumerationMutation(v35);
          }
          uint64_t v41 = *(void *)(*((void *)&v50 + 1) + 8 * (void)j);
          if (v23)
          {
            id v42 = [v23 objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * (void)j)];
            id v43 = [v35 objectForKey:v41];
            if (v42)
            {
              v38 |= [v42 isEqual:v43] ^ 1;
              id v43 = v42;
            }
          }
          else
          {
            id v43 = [v35 objectForKey:*(void *)(*((void *)&v50 + 1) + 8 * (void)j)];
          }
          [(MRLayer *)v18 _setStateValue:v43 forKey:v41];
        }
        id v37 = [v35 countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v37);
      if ((v38 & 1) == 0) {
        return 0.0;
      }
      id v44 = [(MCPlug *)[(MRLayer *)v18 plug] actionForKey:@"onStateChange"];
      if (!v44) {
        return 0.0;
      }
      id v12 = v44;
      float v13 = v18;
      uint64_t v14 = 1;
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      NSLog(@"Consistency error: 'goForth' action can only be sent to MRLayerNavigator");
      return 0.0;
    }
    [(MRLayer *)self goForth];
  }
  return result;
}

- (void)_updateStateWithContext:(id)a3
{
  MRMatrix_SetRotationFromAnglesYXZDeg((uint64_t)self->mRenderingState->var12, self->mRenderingState->var8, self->mRenderingState->var7, self->mRenderingState->var9);
  mRenderingState = (float32x2_t *)self->mRenderingState;
  float v6 = (float)(mRenderingState->f32[0] * mRenderingState[2].f32[1]) * 0.5;
  if (v6 != 1.0)
  {
    mRenderingState[6] = vmul_n_f32(mRenderingState[6], v6);
    mRenderingState[7].f32[0] = v6 * mRenderingState[7].f32[0];
    mRenderingState[8] = vmul_n_f32(mRenderingState[8], v6);
    mRenderingState[9].f32[0] = v6 * mRenderingState[9].f32[0];
    mRenderingState[10] = vmul_n_f32(mRenderingState[10], v6);
    mRenderingState[11].f32[0] = v6 * mRenderingState[11].f32[0];
  }
  float v7 = mRenderingState[3].f32[0];
  if (v7 != 1.0)
  {
    mRenderingState[7].f32[0] = v7 * mRenderingState[7].f32[0];
    mRenderingState[9].f32[0] = v7 * mRenderingState[9].f32[0];
    mRenderingState[11].f32[0] = v7 * mRenderingState[11].f32[0];
  }
  mRenderingState[12] = mRenderingState[1];
  if (self->mSuperlayer)
  {
    [a3 localAspectRatio];
    mRenderingState = (float32x2_t *)self->mRenderingState;
    mRenderingState[12].f32[1] = mRenderingState[12].f32[1] / v8;
  }
  mRenderingState[13].i32[0] = mRenderingState[2].i32[0];
  mSuperlayer = self->mSuperlayer;
  if (!mSuperlayer)
  {
    var12 = (float *)&mRenderingState[6];
    goto LABEL_11;
  }
  id v10 = [(MRLayer *)mSuperlayer renderingState];
  var12 = self->mRenderingState->var12;
  if (v10->var17)
  {
LABEL_11:
    *(float *)&double v14 = MRMatrix_MultiplyWithMatrix(var12, (float *)[a3 modelViewMatrix], self->mRenderingState->var13);
    float v13 = (long long *)objc_msgSend(a3, "projectionMatrix", v14);
    goto LABEL_12;
  }
  *(float *)&double v12 = MRMatrix_MultiplyWithMatrix(var12, (float *)[(MRLayer *)self->mSuperlayer renderingState] + 28, self->mRenderingState->var13);
  float v13 = (long long *)((char *)[(MRLayer *)self->mSuperlayer renderingState] + 176);
LABEL_12:
  unsigned int v15 = self->mRenderingState;
  long long v16 = *v13;
  long long v17 = v13[1];
  long long v18 = v13[3];
  *(_OWORD *)&v15->var14[8] = v13[2];
  *(_OWORD *)&v15->var14[12] = v18;
  *(_OWORD *)v15->var14 = v16;
  *(_OWORD *)&v15->var14[4] = v17;
}

- (void)_sendAction:(id)a3 withStates:(id)a4 async:(BOOL)a5 yesterday:(BOOL)a6
{
  BOOL v7 = a5;
  double v14 = [[MRAction alloc] initWithAction:a3 inRenderer:self->mRenderer];
  [(MRAction *)v14 setSender:self];
  if (a4)
  {
    id v10 = +[NSMutableDictionary dictionaryWithDictionary:a4];
    id v11 = v10;
    if (self->mPersistentState) {
      -[NSMutableDictionary addEntriesFromDictionary:](v10, "addEntriesFromDictionary:");
    }
  }
  else if (self->mPersistentState)
  {
    id v11 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:");
  }
  else
  {
    id v11 = 0;
  }
  [(MRAction *)v14 setStates:v11];
  if (a6) {
    double v12 = -1.0e10;
  }
  else {
    [(MRRenderer *)self->mRenderer time];
  }
  [(MRAction *)v14 setTime:v12];
  mRenderer = self->mRenderer;
  if (v7) {
    [(MRRenderer *)mRenderer performSelectorOnMainThread:"doAction:" withObject:v14 waitUntilDone:0];
  }
  else {
    [(MRRenderer *)mRenderer doAction:v14];
  }
}

- (BOOL)_setStateValue:(id)a3 forKey:(id)a4
{
  mPersistentState = self->mPersistentState;
  if (mPersistentState)
  {
    id v8 = [(NSMutableDictionary *)mPersistentState objectForKey:a4];
    [(NSMutableDictionary *)self->mPersistentState setObject:a3 forKey:a4];
  }
  else
  {
    id v8 = 0;
    self->mPersistentState = (NSMutableDictionary *)objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a3, a4, 0);
  }
  if (v8 == a3) {
    return 0;
  }
  else {
    return [a3 isEqual:v8] ^ 1;
  }
}

- (void)_rebuildAudio
{
  mAudioPlayer = self->mAudioPlayer;
  if (mAudioPlayer)
  {

    self->mAudioPlayer = 0;
  }
  double v4 = [(MCContainer *)[(MCPlug *)self->mPlug container] audioPlaylist];
  if (v4)
  {
    id v5 = v4;
    if ([(MCAudioPlaylist *)v4 countOfSongs])
    {
      id v6 = objc_alloc_init((Class)NSMutableArray);
      id v27 = v5;
      BOOL v7 = [(MCAudioPlaylist *)v5 orderedSongs];
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v29;
        double v11 = 0.0;
        do
        {
          double v12 = 0;
          do
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            float v13 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v12);
            id v14 = -[MZMediaManagement absolutePathForAssetAtPath:](-[MRRenderer assetManagementDelegate](self->mRenderer, "assetManagementDelegate"), "absolutePathForAssetAtPath:", objc_msgSend(objc_msgSend(v13, "asset"), "path"));
            if ([v13 startTimeIsDefined]) {
              [v13 startTime];
            }
            else {
              [(MZMediaManagement *)[(MRRenderer *)self->mRenderer assetManagementDelegate] startTimeForAssetAtPath:v14];
            }
            double v16 = v15;
            if ([v13 durationIsDefined])
            {
              [v13 duration];
              double v18 = v17;
              if (!v14) {
                goto LABEL_19;
              }
            }
            else
            {
              [(MZMediaManagement *)[(MRRenderer *)self->mRenderer assetManagementDelegate] stopTimeForAssetAtPath:v14];
              double v18 = v19 - v16;
              if (!v14) {
                goto LABEL_19;
              }
            }
            id v20 = [[MRAudioItem alloc] initWithURL:+[NSURL fileURLWithPath:v14] startTime:v16 andDuration:v18];
            if (v20)
            {
              id v21 = v20;
              [v6 addObject:v20];
              [(MRAudioItem *)v21 setLocalTimeOffset:v11];
            }
LABEL_19:
            [(MZMediaManagement *)[(MRRenderer *)self->mRenderer assetManagementDelegate] stopTimeForAssetAtPath:v14];
            double v23 = v22;
            [(MZMediaManagement *)[(MRRenderer *)self->mRenderer assetManagementDelegate] startTimeForAssetAtPath:v14];
            double v11 = v11 + v23 - v24;
            double v12 = (char *)v12 + 1;
          }
          while (v9 != v12);
          id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v9);
      }
      self->mAudioPlayer = [[MRAudioPlayer alloc] initWithAudioItems:v6 andAudioPlaylist:v27];

      for (i = self; ; i = v26)
      {
        id v26 = [(MRLayer *)i superlayer];
        if (![[(MRLayer *)v26 superlayer] superlayer]) {
          break;
        }
      }
      if ([(MRLayer *)v26 plugAsParallel]) {
        [(MRAudioPlayer *)self->mAudioPlayer setPriority:[(MCPlugParallel *)[(MRLayer *)v26 plugAsParallel] audioPriority]];
      }
      [(MCPlug *)self->mPlug fullDuration];
      -[MRAudioPlayer setParentDuration:](self->mAudioPlayer, "setParentDuration:");
    }
  }
}

- (id)_currentState
{
  id v3 = +[NSMutableDictionary dictionary];
  double v4 = v3;
  mPersistentState = self->mPersistentState;
  if (mPersistentState) {
    [v3 setObject:mPersistentState forKey:@"persistentState"];
  }
  return v4;
}

- (id)_dumpLayerWithOptions:(unint64_t)a3
{
  uint64_t v4 = BYTE1(a3);
  if (BYTE1(a3)) {
    __memset_chk();
  }
  else {
    uint64_t v4 = 0;
  }
  v9[v4] = 0;
  id v5 = +[NSString stringWithUTF8String:v9];
  if (!self->mPlugAsParallel)
  {
    if (self->mPlugAsSerial)
    {
      id v6 = +[NSString stringWithFormat:@"%d - ", self->mIDInSupercontainer];
      goto LABEL_8;
    }
    if (!self->mPlugAsHaven)
    {
      CFStringRef v7 = &stru_1AC850;
      return [(NSString *)v5 stringByAppendingString:v7];
    }
  }
  id v6 = +[NSString stringWithFormat:@"%@ - ", self->mIDInSupercontainer];
LABEL_8:
  CFStringRef v7 = (const __CFString *)v6;
  return [(NSString *)v5 stringByAppendingString:v7];
}

- (void)setIsDimmed:(BOOL)a3
{
  self->mNeedsRendering = self->mIsDimmed != a3;
  self->mIsDimmed = a3;
}

- (BOOL)enterSlideFocusModeWithState:(id)a3
{
  return 0;
}

- (BOOL)willFocusOnNextSlideWithState:(id)a3 animate:(BOOL)a4
{
  return 0;
}

- (BOOL)willFocusOnPreviousSlideWithState:(id)a3 animate:(BOOL)a4
{
  return 0;
}

- (BOOL)hasSlides
{
  return 0;
}

- (BOOL)isInInteractiveMode
{
  return 0;
}

- (id)currentSlideInfoForElement:(id)a3
{
  return 0;
}

- (id)currentSlideInfos
{
  return 0;
}

- (BOOL)getStartTime:(double *)a3 andDuration:(double *)a4 forMovingToElementID:(id)a5 backwards:(BOOL)a6
{
  return 0;
}

- (BOOL)hasMoreSlidesFromTime:(double)a3 backwards:(BOOL)a4 startTime:(double *)a5 duration:(double *)a6
{
  return 0;
}

- (double)interestingTimeForTime:(double)a3
{
  return 0.0;
}

- (double)interestingTimeForElement:(id)a3
{
  return 0.0;
}

- (MRLayer)superlayer
{
  return self->mSuperlayer;
}

- (MCPlug)plug
{
  return self->mPlug;
}

- (MCPlugSerial)plugAsSerial
{
  return self->mPlugAsSerial;
}

- (MCPlugParallel)plugAsParallel
{
  return self->mPlugAsParallel;
}

- (MCPlugHaven)plugAsHaven
{
  return self->mPlugAsHaven;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)uuid
{
  return self->mUUID;
}

- (NSDictionary)parameters
{
  return self->mParameters;
}

- (double)timeIn
{
  return self->mTimeIn;
}

- (void)setTimeIn:(double)a3
{
  self->mTimeIn = a3;
}

- (BOOL)isActivated
{
  return self->mIsActivated;
}

- (BOOL)isPreactivated
{
  return self->mIsPreactivated;
}

- (BOOL)isSelected
{
  return self->mIsSelected;
}

- (void)setIsSelected:(BOOL)a3
{
  self->mIsSelected = a3;
}

- (BOOL)isDimmed
{
  return self->mIsDimmed;
}

- (double)timeStamp
{
  return self->mTimeStamp;
}

- (BOOL)isScheduledForDestruction
{
  return self->mIsScheduledForDestruction;
}

- (NSDictionary)persistentState
{
  return &self->mPersistentState->super;
}

- (NSDictionary)animationTriggers
{
  return &self->mAnimationTriggers->super;
}

- (NSMutableDictionary)motions
{
  return self->mMotions;
}

- (id)parentHelper
{
  return objc_getProperty(self, a2, 176, 1);
}

- (void)setParentHelper:(id)a3
{
}

- (NSString)idInSupercontainer
{
  return self->mIDInSupercontainer;
}

- (void)setIdInSupercontainer:(id)a3
{
}

- (unint64_t)index
{
  return self->mIndex;
}

- (BOOL)needsToSynchronizeTime
{
  return self->mNeedsToSynchronizeTime;
}

- (void)setNeedsToSynchronizeTime:(BOOL)a3
{
  self->mNeedsToSynchronizeTime = a3;
}

- (BOOL)needsToUpdateGeometry
{
  return self->mNeedsToUpdateGeometry;
}

- (void)setNeedsToUpdateGeometry:(BOOL)a3
{
  self->mNeedsToUpdateGeometrdouble y = a3;
}

- (NSString)filterID
{
  return self->_filterID;
}

- (void)setFilterID:(id)a3
{
}

- (BOOL)isAdhocLayer
{
  return self->_isAdhocLayer;
}

- (BOOL)_isNative3D
{
  return 1;
}

- (id)_retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (void)_queueLayerCommand:(int)a3 object:(id)a4
{
  id v6 = [[MRLayerCommand alloc] initWithCommand:*(void *)&a3 andObject:a4];
  mLayerCommandQueue = self->mLayerCommandQueue;
  objc_sync_enter(mLayerCommandQueue);
  self->mLayerCommandQueueNeedsAttention = 1;
  [(NSMutableArray *)self->mLayerCommandQueue addObject:v6];
  objc_sync_exit(mLayerCommandQueue);
}

- (void)_observePlug
{
  [(MCPlug *)self->mPlug addObserver:self forKeyPath:@"fullDuration" options:0 context:0];
  [(MCPlug *)self->mPlug addObserver:self forKeyPath:@"numberOfLoops" options:0 context:0];
  if (self->mPlugAsParallel) {
    mPlug = self->mPlug;
  }
  else {
    mPlug = self;
  }
  [mPlug addObserver:self forKeyPath:@"timeIn" options:0 context:0];
}

- (void)_unobservePlug
{
  [(MCPlug *)self->mPlug removeObserver:self forKeyPath:@"fullDuration"];
  [(MCPlug *)self->mPlug removeObserver:self forKeyPath:@"numberOfLoops"];
  if (self->mPlugAsParallel) {
    mPlugAsParallel = self->mPlugAsParallel;
  }
  else {
    mPlugAsParallel = self;
  }
  [mPlugAsParallel removeObserver:self forKeyPath:@"timeIn"];
}

- (void)_observePlugOnPreactivate
{
  [(MCPlug *)self->mPlug addObserver:self forKeyPath:@"animationPaths" options:0 context:0];
  mPlugAsParallel = self->mPlugAsParallel;
  if (mPlugAsParallel)
  {
    [(MCPlugParallel *)mPlugAsParallel addObserver:self forKeyPath:@"size" options:0 context:0];
    [(MCPlugParallel *)self->mPlugAsParallel addObserver:self forKeyPath:@"currentLayoutIndex" options:0 context:0];
    [(MCPlugParallel *)self->mPlugAsParallel addObserver:self forKeyPath:@"positionRotationAndSize" options:0 context:0];
    CFStringRef v4 = @"opacity";
    mPlugAsSerial = self->mPlugAsParallel;
  }
  else
  {
    mPlugAsSerial = self->mPlugAsSerial;
    if (!mPlugAsSerial) {
      return;
    }
    CFStringRef v4 = @"transition";
  }
  [mPlugAsSerial addObserver:self forKeyPath:v4 options:0 context:0];
}

- (void)_unobservePlugOnDepreactivate
{
  [(MCPlug *)self->mPlug removeObserver:self forKeyPath:@"animationPaths"];
  mPlugAsParallel = self->mPlugAsParallel;
  if (mPlugAsParallel)
  {
    [(MCPlugParallel *)mPlugAsParallel removeObserver:self forKeyPath:@"size"];
    [(MCPlugParallel *)self->mPlugAsParallel removeObserver:self forKeyPath:@"currentLayoutIndex"];
    [(MCPlugParallel *)self->mPlugAsParallel removeObserver:self forKeyPath:@"positionRotationAndSize"];
    mPlugAsSerial = self->mPlugAsParallel;
    CFStringRef v5 = @"opacity";
  }
  else
  {
    mPlugAsSerial = self->mPlugAsSerial;
    if (!mPlugAsSerial) {
      return;
    }
    CFStringRef v5 = @"transition";
  }
  [mPlugAsSerial removeObserver:self forKeyPath:v5];
}

- (void)_setNeedsToRequestRebuildAudio:(BOOL)a3
{
  self->mNeedsToRequestRebuildAudio = self->mDoAudio;
}

@end