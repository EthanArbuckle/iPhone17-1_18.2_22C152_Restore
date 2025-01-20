@interface MRSlideProvider
- (BOOL)beginLiveUpdate;
- (BOOL)canPlay;
- (BOOL)endLiveUpdate;
- (BOOL)hasFilters;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoaded;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isMuted;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isPlaying;
- (BOOL)isStill;
- (BOOL)needsToUpdateLayout;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)slideIsReadonly;
- (BOOL)updateStuffWithAssetManager:(id)a3;
- (BOOL)wantsMipmap;
- (BOOL)wantsMonochromatic;
- (CGPoint)center;
- (CGSize)defaultSize;
- (CGSize)framedImageSizeAtIndex:(unsigned int)a3 aspectRatio:(float)a4;
- (CGSize)requestedSize;
- (CGSize)sizeFactor;
- (CGSize)unframedImageSizeForAspectRatio:(float)a3 frameID:(id)a4 andFrameAttributes:(id)a5 atIndex:(unsigned int)a6 framedImageSize:(CGSize *)a7;
- (MCAnimationPathKeyframed)centerAnimationPath;
- (MCAnimationPathKeyframed)rotationAnimationPath;
- (MCAnimationPathKeyframed)scaleAnimationPath;
- (MCSlide)slide;
- (MRFrame)frame;
- (MRSlideProvider)initWithEffectLayer:(id)a3;
- (NSDictionary)effectAttributes;
- (NSString)assetPath;
- (NSString)filterID;
- (NSString)imageSizeScript;
- (NSString)showTimeScript;
- (double)imageAspectRatio;
- (double)rotation;
- (double)scale;
- (double)showDuration;
- (double)showTime;
- (double)slideDuration;
- (double)slideStartTime;
- (double)time;
- (float)stillTime;
- (id)currentSlideInfo;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)playerHint;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (int)defaultKenBurnsType;
- (void)_computeImageSizeInContext:(id)a3 withArguments:(id)a4;
- (void)_unloadIfNotUpdatingLive;
- (void)applyKenBurnsAtTime:(double)a3 withTargetSize:(CGSize)a4 kenBurnsType:(int)a5 translation:(CGPoint *)a6 scale:(double *)a7 rotation:(double *)a8;
- (void)cancelLoading;
- (void)cleanup;
- (void)dealloc;
- (void)imageIsAvailableFromAssetPlayer:(id)a3;
- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6;
- (void)loadWithArguments:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)printFlags;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)setAssetPath:(id)a3;
- (void)setCenter:(CGPoint)a3;
- (void)setCenterAnimationPath:(id)a3;
- (void)setDefaultKenBurnsType:(int)a3;
- (void)setDefaultSize:(CGSize)a3;
- (void)setEffectAttributes:(id)a3;
- (void)setFilterID:(id)a3;
- (void)setImageSizeScript:(id)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setIsPlaying:(BOOL)a3;
- (void)setIsStill:(BOOL)a3;
- (void)setNeedsToUpdateLayout:(BOOL)a3;
- (void)setPlayerHint:(id)a3;
- (void)setRotation:(double)a3;
- (void)setRotationAnimationPath:(id)a3;
- (void)setScale:(double)a3;
- (void)setScaleAnimationPath:(id)a3;
- (void)setShowDuration:(double)a3;
- (void)setShowTime:(double)a3;
- (void)setShowTimeScript:(id)a3;
- (void)setSizeFactor:(CGSize)a3;
- (void)setSlide:(id)a3;
- (void)setSlideIsReadonly:(BOOL)a3;
- (void)setStillTime:(float)a3;
- (void)setTime:(double)a3;
- (void)setWantsMipmap:(BOOL)a3;
- (void)setWantsMonochromatic:(BOOL)a3;
- (void)unload;
- (void)updateShowTimeAndDurationWithPlugTiming:(id)a3 andAttributes:(id)a4;
@end

@implementation MRSlideProvider

- (MRSlideProvider)initWithEffectLayer:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MRSlideProvider;
  v4 = [(MRSlideProvider *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->mEffectLayer = (MRLayerEffect *)a3;
    v4->mKenBurnsType = 1;
    v4->mLastTime = -1.0;
    __asm { FMOV            V0.2D, #1.0 }
    v4->mSizeFactor = _Q0;
    v4->mDefaultSize = CGSizeZero;
    v4->mOriginalImageAspectRatio = 1.0;
    v11 = (NSLock *)objc_alloc_init((Class)NSLock);
    v5->mPreloadOperationLock = v11;
    [(NSLock *)v11 setName:@"MRSlideProvider.preloadOperationLock"];
    v5->mSlideIndex = 0x7FFFFFFFFFFFFFFFLL;
    v5->_scale = 1.0;
    v5->_rotationAnimationPathTriggerTime = -1.0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_centerAnimationPathTriggerTime = _Q0;
  }
  return v5;
}

- (void)dealloc
{
  [(MRSlideProvider *)self cleanup];

  self->mPreloadOperationLock = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRSlideProvider;
  [(MRSlideProvider *)&v3 dealloc];
}

- (void)cleanup
{
  objc_sync_enter(self);
  if (self->mEffectLayer)
  {
    [(MRSlideProvider *)self setSlide:0];
    [(MRSlideProvider *)self setAssetPath:0];
    self->mEffectLayer = 0;

    self->mEffectAttributes = 0;
    self->mImageSizeScript = 0;

    self->mShowTimeScript = 0;
  }
  objc_sync_exit(self);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"asset.path", a4, a5, a6))
  {
    char v8 = 2;
LABEL_6:
    BYTE1(self->mFlags) |= v8;
    goto LABEL_7;
  }
  if (([a3 isEqualToString:@"startTime"] & 1) != 0
    || [a3 isEqualToString:@"duration"])
  {
    char v8 = 1;
    goto LABEL_6;
  }
LABEL_7:
  if (([a3 isEqualToString:@"frameID"] & 1) != 0
    || ([a3 isEqualToString:@"frameAttributes"] & 1) != 0)
  {
    char v9 = 64;
LABEL_17:
    BYTE2(self->mFlags) |= v9;
    return;
  }
  if (([a3 isEqualToString:@"animationPaths"] & 1) != 0
    || ([a3 isEqualToString:@"kenBurnsType"] & 1) != 0
    || ([a3 isEqualToString:@"center"] & 1) != 0
    || ([a3 isEqualToString:@"scale"] & 1) != 0
    || ([a3 isEqualToString:@"rotation"] & 1) != 0
    || ([a3 isEqualToString:@"filters"] & 1) != 0)
  {
    char v9 = 0x80;
    goto LABEL_17;
  }
  if ([a3 isEqualToString:@"builtVolume"])
  {
    char v9 = 4;
    goto LABEL_17;
  }
}

- (void)setDefaultSize:(CGSize)a3
{
  if (a3.width != self->mDefaultSize.width || a3.height != self->mDefaultSize.height)
  {
    self->mDefaultSize = a3;
    [(MRSlideProvider *)self _unloadIfNotUpdatingLive];
  }
}

- (BOOL)wantsMonochromatic
{
  return (LOBYTE(self->mFlags) >> 6) & 1;
}

- (void)setWantsMonochromatic:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 0x40) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xBF;
    if (a3) {
      char v5 = 64;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    [(MRSlideProvider *)self unload];
  }
}

- (BOOL)wantsMipmap
{
  return (LOBYTE(self->mFlags) >> 5) & 1;
}

- (void)setWantsMipmap:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 0x20) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xDF;
    if (a3) {
      char v5 = 32;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    [(MRSlideProvider *)self unload];
  }
}

- (void)setImageSizeScript:(id)a3
{
  if (self->mImageSizeScript != a3 && (objc_msgSend(a3, "isEqualToString:") & 1) == 0)
  {

    self->mImageSizeScript = (NSString *)[a3 copy];
    [(MRSlideProvider *)self _unloadIfNotUpdatingLive];
  }
}

- (void)setEffectAttributes:(id)a3
{
  mEffectAttributes = self->mEffectAttributes;
  if (mEffectAttributes != a3)
  {

    self->mEffectAttributes = (NSDictionary *)a3;
    [(MRSlideProvider *)self _unloadIfNotUpdatingLive];
  }
}

- (BOOL)isStill
{
  return (LOBYTE(self->mFlags) >> 3) & 1;
}

- (void)setIsStill:(BOOL)a3
{
  char mFlags = self->mFlags;
  if (((((mFlags & 8) == 0) ^ a3) & 1) == 0)
  {
    char v4 = mFlags & 0xF7;
    if (a3) {
      char v5 = 8;
    }
    else {
      char v5 = 0;
    }
    LOBYTE(self->mFlags) = v4 | v5;
    [(MRSlideProvider *)self unload];
  }
}

- (BOOL)slideIsReadonly
{
  return (BYTE1(self->mFlags) >> 6) & 1;
}

- (void)setSlideIsReadonly:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  BYTE1(self->mFlags) = BYTE1(self->mFlags) & 0xBF | v3;
}

- (BOOL)isMuted
{
  return (BYTE1(self->mFlags) >> 5) & 1;
}

- (void)setIsMuted:(BOOL)a3
{
  if (a3) {
    char v4 = 32;
  }
  else {
    char v4 = 0;
  }
  BYTE1(self->mFlags) = BYTE1(self->mFlags) & 0xDF | v4;
  mSlidePlayer = self->mSlidePlayer;
  if (mSlidePlayer)
  {
    BOOL v6 = a3;
    if ([(MRAssetPlayer *)mSlidePlayer conformsToProtocol:&OBJC_PROTOCOL___MRAudioPlayer])
    {
      v7 = self->mSlidePlayer;
      [(MRAssetPlayer *)v7 setIsMuted:v6];
    }
  }
}

- (BOOL)canPlay
{
  if ((self->mFlags & 4) != 0)
  {
    LOBYTE(mSlideLayer) = 1;
  }
  else
  {
    mSlideLayer = self->mSlideLayer;
    if (mSlideLayer) {
      LOBYTE(mSlideLayer) = [(MRLayer *)mSlideLayer hasSomethingToRender];
    }
  }
  return (char)mSlideLayer;
}

- (BOOL)isPlaying
{
  return BYTE1(self->mFlags) >> 7;
}

- (BOOL)isLoaded
{
  return self->mFlags & 1;
}

- (BOOL)needsToUpdateLayout
{
  return 0;
}

- (void)setNeedsToUpdateLayout:(BOOL)a3
{
  if (a3 && [(MCSlide *)self->_slide countOfLayouts] >= 2) {
    BYTE1(self->mFlags) |= 2u;
  }
}

- (BOOL)hasFilters
{
  return self->_filterID != 0;
}

- (CGSize)framedImageSizeAtIndex:(unsigned int)a3 aspectRatio:(float)a4
{
  double width = self->mDefaultSize.width;
  double height = self->mDefaultSize.height;
  if (self->mImageSizeScript)
  {
    id v9 = objc_alloc((Class)NSDictionary);
    *(float *)&double v10 = width;
    v11 = +[NSNumber numberWithFloat:v10];
    *(float *)&double v12 = height;
    v13 = +[NSNumber numberWithFloat:v12];
    LODWORD(v14) = 1.0;
    v15 = +[NSNumber numberWithFloat:v14];
    *(float *)&double v16 = (float)a3;
    v17 = +[NSNumber numberWithFloat:v16];
    *(float *)&double v18 = a4;
    id v19 = objc_msgSend(v9, "initWithObjectsAndKeys:", v11, @"layerWidth", v13, @"layerHeight", v15, @"numOfImages", v17, @"indexOfImage", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18), @"imageAspectRatio", 0);
    v20 = +[MRUtilities executeScript:self->mImageSizeScript withHeader:v19 andAttributes:self->mEffectAttributes];

    if (v20)
    {
      CGSize v21 = CGSizeFromString(v20);
      double width = v21.width;
      double height = v21.height;
    }
  }
  double v22 = width;
  double v23 = height;
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (CGSize)unframedImageSizeForAspectRatio:(float)a3 frameID:(id)a4 andFrameAttributes:(id)a5 atIndex:(unsigned int)a6 framedImageSize:(CGSize *)a7
{
  -[MRSlideProvider framedImageSizeAtIndex:aspectRatio:](self, "framedImageSizeAtIndex:aspectRatio:", *(void *)&a6);
  double width = v11;
  double height = v12;
  if (a7)
  {
    a7->double width = v11;
    a7->double height = v12;
  }
  id v15 = objc_msgSend(+[MRFrameManager sharedManager](MRFrameManager, "sharedManager"), "sizeScriptForFrameID:", a4);
  if (v15)
  {
    id v16 = v15;
    id v17 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", width), @"layerWidth", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", height), @"layerHeight", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3), @"imageAspectRatio", 0);
    double v18 = +[MRUtilities executeScript:v16 withHeader:v17 andAttributes:a5];

    if (v18)
    {
      CGSize v19 = CGSizeFromString(v18);
      if (v19.width >= 0.0) {
        double width = v19.width;
      }
      else {
        double width = 0.0;
      }
      if (v19.height >= 0.0) {
        double height = v19.height;
      }
      else {
        double height = 0.0;
      }
    }
  }
  double v20 = width;
  double v21 = height;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (void)setShowDuration:(double)a3
{
  self->_showDuration = a3;
  audioDucker = self->_audioDucker;
  if (audioDucker) {
    -[MRAudioDucker setParentDuration:](audioDucker, "setParentDuration:");
  }
}

- (void)updateShowTimeAndDurationWithPlugTiming:(id)a3 andAttributes:(id)a4
{
  [a3 phaseInDuration];
  double v8 = v7;
  [a3 loopDuration];
  double v10 = v9;
  [a3 phaseOutDuration];
  double v12 = v11;
  if (!self->mShowTimeScript) {
    goto LABEL_6;
  }
  id v13 = objc_alloc((Class)NSDictionary);
  double v14 = +[NSNumber numberWithDouble:v8];
  id v15 = +[NSNumber numberWithDouble:v10];
  id v16 = +[NSNumber numberWithDouble:v12];
  [a3 fullDuration];
  id v17 = objc_msgSend(v13, "initWithObjectsAndKeys:", v14, @"phaseInDuration", v15, @"mainDuration", v16, @"phaseOutDuration", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"fullDuration", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)-[MCSlide index](self->_slide, "index")), @"indexOfImage", 0);
  double v18 = +[MRUtilities executeScript:self->mShowTimeScript withHeader:v17 andAttributes:a4];

  if (v18)
  {
    CGSize v19 = CGSizeFromString(v18);
    self->_showTime = v19.width;
    CGFloat height = v8 + v10 + v12 - v19.width;
    if (v19.height >= 0.0) {
      CGFloat height = v19.height;
    }
  }
  else
  {
LABEL_6:
    self->_showTime = 0.0;
    CGFloat height = v8 + v10 + v12;
  }
  self->_showDuration = height;
  audioDucker = self->_audioDucker;
  if (audioDucker)
  {
    -[MRAudioDucker setParentDuration:](audioDucker, "setParentDuration:");
  }
}

- (void)setSlide:(id)a3
{
  if (self->_slide != a3)
  {
    [(MRSlideProvider *)self unload];
    slide = self->_slide;
    if (slide)
    {
      if ((self->mFlags & 0x4000) == 0)
      {
        unsigned __int8 v6 = [(MCObject *)slide isSnapshot];
        slide = self->_slide;
        if ((v6 & 1) == 0)
        {
          [(MCSlide *)slide removeObserver:self forKeyPath:@"startTime"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"duration"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"frameID"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"frameAttributes"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"index"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"kenBurnsType"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"animationPaths"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"center"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"scale"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"rotation"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"asset.path"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"filters"];
          [(MCSlide *)self->_slide removeObserver:self forKeyPath:@"builtVolume"];
          slide = self->_slide;
        }
      }

      self->_slide = 0;
    }
    if (a3)
    {
      double v7 = (MCSlide *)a3;
      self->_slide = v7;
      if ((self->mFlags & 0x4000) == 0 && ![(MCObject *)v7 isSnapshot])
      {
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"startTime" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"duration" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"frameID" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"frameAttributes" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"index" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"animationPaths" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"center" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"scale" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"rotation" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"kenBurnsType" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"asset.path" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"filters" options:0 context:0];
        [(MCSlide *)self->_slide addObserver:self forKeyPath:@"builtVolume" options:0 context:0];
      }
    }
    BYTE1(self->mFlags) |= 2u;
    BYTE2(self->mFlags) |= 0x40u;
  }
}

- (void)setAssetPath:(id)a3
{
  if (self->_assetPath != a3)
  {
    [(MRSlideProvider *)self unload];

    self->_assetPath = (NSString *)a3;
    BYTE1(self->mFlags) |= 2u;
    BYTE2(self->mFlags) |= 0x40u;
  }
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
  if (self->_centerAnimationPath) {
    [(MRSlideProvider *)self setCenterAnimationPath:0];
  }
  BYTE1(self->mFlags) |= 8u;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
  if (self->_scaleAnimationPath) {
    [(MRSlideProvider *)self setScaleAnimationPath:0];
  }
  BYTE1(self->mFlags) |= 8u;
}

- (void)setRotation:(double)a3
{
  self->_rotation = a3;
  if (self->_rotationAnimationPath) {
    [(MRSlideProvider *)self setRotationAnimationPath:0];
  }
  BYTE1(self->mFlags) |= 8u;
}

- (void)setCenterAnimationPath:(id)a3
{
  centerAnimationPath = self->_centerAnimationPath;
  if (centerAnimationPath != a3)
  {

    self->_centerAnimationPath = (MCAnimationPathKeyframed *)a3;
    self->_centerAnimationPathTriggerTime = -1.0;
  }
}

- (void)setScaleAnimationPath:(id)a3
{
  scaleAnimationPath = self->_scaleAnimationPath;
  if (scaleAnimationPath != a3)
  {

    self->_scaleAnimationPath = (MCAnimationPathKeyframed *)a3;
    self->_scaleAnimationPathTriggerTime = -1.0;
  }
}

- (void)setRotationAnimationPath:(id)a3
{
  rotationAnimationPath = self->_rotationAnimationPath;
  if (rotationAnimationPath != a3)
  {

    self->_rotationAnimationPath = (MCAnimationPathKeyframed *)a3;
    self->_rotationAnimationPathTriggerTime = -1.0;
  }
}

- (void)setIsPlaying:(BOOL)a3
{
  char mFlags = self->mFlags;
  if ((mFlags & 8) == 0)
  {
    BOOL v4 = a3;
    char v6 = a3 ? 0x80 : 0;
    BYTE1(self->mFlags) = v6 & 0x80 | BYTE1(self->mFlags) & 0x7F;
    if (mFlags)
    {
      mSlidePlayer = self->mSlidePlayer;
      if (mSlidePlayer)
      {
        if ([(MRAssetPlayer *)mSlidePlayer conformsToProtocol:&OBJC_PROTOCOL___MRAssetPlayerTimeSupport])
        {
          double v8 = self->mSlidePlayer;
          [(MRAssetPlayer *)v8 setIsPlaying:v4];
        }
      }
      else
      {
        mSlideLayer = self->mSlideLayer;
        if (mSlideLayer)
        {
          double v10 = [(MRLayer *)mSlideLayer clock];
          if (v4)
          {
            [(MRLayerClock *)v10 resumeOnNextUpdate];
          }
          else
          {
            [(MRLayerClock *)v10 pauseOnNextUpdate];
          }
        }
      }
    }
  }
}

- (double)time
{
  return 0.0;
}

- (void)setTime:(double)a3
{
  double v4 = a3 - self->_showTime;
  mSlidePlayer = self->mSlidePlayer;
  if (mSlidePlayer)
  {
    if ([(MRAssetPlayer *)mSlidePlayer conformsToProtocol:&OBJC_PROTOCOL___MRAssetPlayerTimeSupport])[(MRAssetPlayer *)self->mSlidePlayer setTime:v4]; {
  }
    }
  else
  {
    mSlideLayer = self->mSlideLayer;
    if (mSlideLayer) {
      [(MRLayerClock *)[(MRLayer *)mSlideLayer clock] setExternalTime:v4];
    }
    else {
      self->_timeToPreloadFor = v4;
    }
  }
  self->mLastTime = -1.0e15;
}

- (BOOL)beginLiveUpdate
{
  BYTE1(self->mFlags) |= 0x10u;
  return 1;
}

- (BOOL)endLiveUpdate
{
  BYTE1(self->mFlags) &= ~0x10u;
  if ((self->mFlags & 0x200000) != 0)
  {
    BYTE2(self->mFlags) &= ~0x20u;
    [(MRSlideProvider *)self unload];
  }
  return 1;
}

- (void)_unloadIfNotUpdatingLive
{
  if ((self->mFlags & 0x1000) != 0)
  {
    BYTE2(self->mFlags) |= 0x20u;
    objc_sync_enter(self);
    self->mRequestedSize = CGSizeZero;
    mOutputImage = self->mOutputImage;
    if (mOutputImage)
    {
      [(MRImage *)mOutputImage releaseByUser];
      self->mOutputImage = 0;
    }
    BYTE2(self->mFlags) |= 2u;
    objc_sync_exit(self);
  }
  else
  {
    [(MRSlideProvider *)self unload];
  }
}

- (id)currentSlideInfo
{
  char v3 = objc_alloc_init(MRSlideInfo);
  [(MRSlideInfo *)v3 setAssetPath:self->_assetPath];
  if (self->mOutputImage)
  {
    [(MRImage *)self->mOriginalImage aspectRatio];
    -[MRSlideInfo setAspectRatio:](v3, "setAspectRatio:");
    mSlidePlayer = self->mSlidePlayer;
    if (mSlidePlayer)
    {
      unsigned int v5 = [(MRAssetPlayer *)mSlidePlayer conformsToProtocol:&OBJC_PROTOCOL___MRAssetPlayerTimeSupport];
      double timeToPreloadFor = 0.0;
      if (v5) {
        [(MRAssetPlayer *)self->mSlidePlayer time];
      }
    }
    else
    {
      mSlideLayer = self->mSlideLayer;
      if (mSlideLayer) {
        [(MRLayerClock *)[(MRLayer *)mSlideLayer clock] externalTime];
      }
      else {
        double timeToPreloadFor = self->_timeToPreloadFor;
      }
    }
    [(MRSlideInfo *)v3 setTime:timeToPreloadFor];
    [(MRImage *)self->mOutputImage centerX];
    double v9 = v8;
    [(MRImage *)self->mOutputImage centerY];
    -[MRSlideInfo setCenter:](v3, "setCenter:", v9, v10);
    [(MRImage *)self->mOutputImage scale];
    -[MRSlideInfo setScale:](v3, "setScale:");
    [(MRImage *)self->mOutputImage rotationAngle];
    -[MRSlideInfo setRotation:](v3, "setRotation:");
  }
  else
  {
    [(MRSlideInfo *)v3 setAspectRatio:self->mOriginalImageAspectRatio];
  }
  [(MRSlideInfo *)v3 setPlayer:self->mSlidePlayer];
  return v3;
}

- (BOOL)isLoadedForTime:(double)a3
{
  return self->mFlags & 1;
}

- (void)loadForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5 now:(BOOL)a6
{
  if ((self->mFlags & 3) == 0)
  {
    LOBYTE(self->mFlags) |= 2u;
    self->_double timeToPreloadFor = a3;
    if (self->_assetPath)
    {
      BOOL v8 = a6;
      double v10 = objc_alloc_init(MRAssetPlayerOptions);
      [(MRAssetPlayerOptions *)v10 setWantsMonochromatic:(LOBYTE(self->mFlags) >> 6) & 1];
      [(MRAssetPlayerOptions *)v10 setWantsMipmap:(LOBYTE(self->mFlags) >> 5) & 1];
      if ([(MRAssetPlayerOptions *)v10 wantsMipmap]) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = (LOBYTE(self->mFlags) >> 4) & 1;
      }
      [(MRAssetPlayerOptions *)v10 setWantsPowerOfTwo:v11];
      -[MRAssetPlayerOptions setIsForExport:](v10, "setIsForExport:", objc_msgSend(objc_msgSend(a5, "renderer"), "mode") == 1);
      if ((self->mFlags & 8) != 0)
      {
        float mStillTime = self->mStillTime;
        if (mStillTime >= 0.0)
        {
          double v16 = mStillTime;
          double slideStartTime = self->_slideStartTime;
          BOOL v18 = slideStartTime < 0.0;
          double v19 = slideStartTime + v16;
          if (!v18) {
            double v16 = v19;
          }
        }
        else
        {
          double v16 = 1000000000.0;
        }
        [(MRAssetPlayerOptions *)v10 setStillTime:v16];
      }
      unsigned int v20 = [a5 thumbnailPolicy];
      unsigned int v21 = !v8;
      if (v20 != 1) {
        unsigned int v21 = 0;
      }
      if (v20) {
        uint64_t v22 = v21;
      }
      else {
        uint64_t v22 = 1;
      }
      [(MRAssetPlayerOptions *)v10 setThumbnailIsOK:v22];
      [(MRAssetPlayerOptions *)v10 setPlayerHint:self->_playerHint];
      double v23 = [(MRLayer *)self->mEffectLayer plugAsSerial];
      v24 = [(MRLayer *)self->mEffectLayer superlayer];
      if (v23
        || (double v23 = [[(MRLayer *)self->mEffectLayer superlayer] plugAsSerial],
            v24 = [[(MRLayer *)self->mEffectLayer superlayer] superlayer],
            v23))
      {
        v25 = v24;
        v26 = [(MCPlugSerial *)v23 index];
        if (!v26) {
          v26 = (char *)objc_msgSend(-[MRLayer sublayers](v25, "sublayers"), "count");
        }
        objc_msgSend(-[MCContainer plugAtIndex:](-[MCPlug container](-[MRLayer plug](v25, "plug"), "container"), "plugAtIndex:", v26 - 1), "transitionDuration");
        -[MRAssetPlayerOptions setIntroDuration:](v10, "setIntroDuration:");
        [(MCPlugSerial *)v23 transitionDuration];
        -[MRAssetPlayerOptions setOutroDuration:](v10, "setOutroDuration:");
        [(MCPlug *)v23 fullDuration];
        double v28 = v27;
        [(MRAssetPlayerOptions *)v10 introDuration];
        double v30 = v28 - v29;
        [(MRAssetPlayerOptions *)v10 outroDuration];
        [(MRAssetPlayerOptions *)v10 setMainDuration:v30 - v31];
      }
      [(MRAssetPlayerOptions *)v10 introDuration];
      if (v32 == 0.0)
      {
        [(MRAssetPlayerOptions *)v10 setIntroDuration:0.5];
        [(MRAssetPlayerOptions *)v10 mainDuration];
        [(MRAssetPlayerOptions *)v10 setMainDuration:v33 + -0.5];
      }
      [(MRAssetPlayerOptions *)v10 outroDuration];
      if (v34 == 0.0)
      {
        [(MRAssetPlayerOptions *)v10 setOutroDuration:0.5];
        [(MRAssetPlayerOptions *)v10 mainDuration];
        [(MRAssetPlayerOptions *)v10 setMainDuration:v35 + -0.5];
      }
      double showDuration = self->_showDuration;
      [(MRAssetPlayerOptions *)v10 introDuration];
      double v38 = v37;
      [(MRAssetPlayerOptions *)v10 mainDuration];
      double v40 = v38 + v39;
      [(MRAssetPlayerOptions *)v10 outroDuration];
      if (showDuration < v40 + v41)
      {
        double v42 = self->_showDuration;
        [(MRAssetPlayerOptions *)v10 introDuration];
        double v44 = v42 - v43;
        [(MRAssetPlayerOptions *)v10 outroDuration];
        [(MRAssetPlayerOptions *)v10 setMainDuration:v44 - v45];
      }
      self->mSlidePlayer = (MRAssetPlayer *)objc_msgSend(objc_msgSend(a4, "imageManager"), "retainedByUserPlayerForAssetAtPath:size:andOptions:", self->_assetPath, v10, self->mImageSize.width, self->mImageSize.height);

      [(MRAssetPlayer *)self->mSlidePlayer setDelegate:self];
      BYTE2(self->mFlags) |= 0xCu;
      objc_sync_enter(self);
      if (self->mEffectLayer)
      {
        [(NSLock *)self->mPreloadOperationLock lock];
        if (!self->mPreloadOperation)
        {
          id v46 = [a5 preloadQueue];
          if (v46)
          {
            id v47 = [a5 copyForPreloading];
            id v48 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a4, @"context", objc_msgSend(a4, "imageManager"), @"imageManager", v47, @"renderArguments", self->mSlidePlayer, @"slidePlayer", 0);
            v49 = (NSInvocationOperation *)[objc_alloc((Class)NSInvocationOperation) initWithTarget:self selector:"loadWithArguments:" object:v48];
            self->mPreloadOperation = v49;
            if (v8) {
              uint64_t v50 = 33;
            }
            else {
              uint64_t v50 = 9;
            }
            [(NSInvocationOperation *)v49 setQualityOfService:v50];
            objc_msgSend(v48, "setObject:forKey:", +[NSValue valueWithPointer:](NSValue, "valueWithPointer:", self->mPreloadOperation), @"preloadOperationPointer");
            [v46 addOperation:self->mPreloadOperation];
          }
        }
        if (v8) {
          uint64_t v51 = 8;
        }
        else {
          uint64_t v51 = 0;
        }
        [(NSInvocationOperation *)self->mPreloadOperation setQueuePriority:v51];
        [(NSLock *)self->mPreloadOperationLock unlock];
      }
      objc_sync_exit(self);
    }
    else if ([(MCSlide *)self->_slide plug])
    {
      LOBYTE(self->mFlags) |= 1u;
      double v12 = +[MRLayer layerWithPlug:andParameters:inSuperlayer:](MRLayer, "layerWithPlug:andParameters:inSuperlayer:", -[MCSlide plug](self->_slide, "plug"), objc_msgSend(objc_msgSend(a5, "renderer"), "parameters"), 0);
      self->mSlideLayer = v12;
      -[MRLayer setPixelSize:](v12, "setPixelSize:", self->mImageSize.width, self->mImageSize.height);
      if (![(MRLayer *)self->mSlideLayer isPreactivated])
      {
        [(MRLayer *)self->mSlideLayer preactivate];
        [(MRLayerClock *)[(MRLayer *)self->mSlideLayer clock] setContainerTime:self->_timeToPreloadFor];
        int v13 = SBYTE1(self->mFlags);
        double v14 = [(MRLayer *)self->mSlideLayer clock];
        if (v13 < 0)
        {
          [(MRLayerClock *)v14 resumeOnNextUpdate];
        }
        else
        {
          [(MRLayerClock *)v14 pauseOnNextUpdate];
        }
      }
    }
  }
}

- (void)loadWithArguments:(id)a3
{
  pthread_setname_np([+[NSString stringWithFormat:@"MRSlideProvider %p: Loading", self] UTF8String]);
  unsigned int v5 = (NSInvocationOperation *)objc_msgSend(objc_msgSend(a3, "objectForKey:", @"preloadOperationPointer"), "pointerValue");
  if (self->mPreloadOperation == v5 && (self->mFlags & 1) == 0)
  {
    char v6 = v5;
    id v7 = [a3 objectForKey:@"renderArguments"];
    objc_msgSend(objc_msgSend(v7, "renderer"), "imagePreloadingBegan");
    objc_msgSend(objc_msgSend(a3, "objectForKey:", @"slidePlayer"), "loadForTime:", self->_timeToPreloadFor);
    [(NSLock *)self->mPreloadOperationLock lock];
    if (self->mPreloadOperation == v6 && (self->mFlags & 1) == 0)
    {
      LOBYTE(self->mFlags) = self->mFlags & 0xFC | 1;
      BYTE1(self->mFlags) &= ~0x80u;

      self->mPreloadOperation = 0;
    }
    [(NSLock *)self->mPreloadOperationLock unlock];
    objc_msgSend(objc_msgSend(v7, "renderer"), "imagePreloadingEnded");
  }
  pthread_setname_np("");
}

- (void)unload
{
  if ((self->mFlags & 3) != 0)
  {
    objc_sync_enter(self);
    [(MRSlideProvider *)self cancelLoading];
    LOBYTE(self->mFlags) &= ~1u;
    HIBYTE(self->mFlags) &= ~0x80u;
    mOriginalImage = self->mOriginalImage;
    if (mOriginalImage)
    {
      [(MRImage *)mOriginalImage releaseByUser];
      self->mOriginalImage = 0;
    }
    mOutputImage = self->mOutputImage;
    if (mOutputImage)
    {
      [(MRImage *)mOutputImage releaseByUser];
      self->mOutputImage = 0;
    }
    mFrame = self->mFrame;
    if (mFrame)
    {
      [(MRFrame *)mFrame releaseBySlideProvider:self];
      self->mFrame = 0;
    }
    BYTE2(self->mFlags) |= 1u;
    mSlidePlayer = self->mSlidePlayer;
    if (mSlidePlayer)
    {
      [(MRAssetPlayer *)mSlidePlayer releaseByUser];
      self->mSlidePlayer = 0;
    }
    if (self->_audioDucker)
    {
      -[MRLayerEffect _removeAudioDucker:](self->mEffectLayer, "_removeAudioDucker:");

      self->_audioDucker = 0;
    }
    mSlideLayer = self->mSlideLayer;
    if (mSlideLayer)
    {
      if ([(MRLayer *)mSlideLayer isActivated]) {
        [(MRLayer *)self->mSlideLayer deactivate];
      }
      if ([(MRLayer *)self->mSlideLayer isPreactivated]) {
        [(MRLayer *)self->mSlideLayer depreactivate:0];
      }
      BOOL v8 = self->mSlideLayer;
      if (v8)
      {
        [(MRLayer *)v8 cleanup];

        self->mSlideLayer = 0;
      }
    }
    CGSize v9 = CGSizeZero;
    self->mImageSize = CGSizeZero;
    self->mLastImageSize = v9;
    self->mRequestedSize = v9;
    BYTE2(self->mFlags) |= 2u;
    self->_double timeToPreloadFor = 0.0;
    objc_sync_exit(self);
  }
}

- (void)cancelLoading
{
  [(NSLock *)self->mPreloadOperationLock lock];
  mPreloadOperation = self->mPreloadOperation;
  if (mPreloadOperation)
  {
    [(NSInvocationOperation *)mPreloadOperation cancel];

    self->mPreloadOperation = 0;
  }
  LOBYTE(self->mFlags) &= ~2u;
  mPreloadOperationLock = self->mPreloadOperationLock;
  [(NSLock *)mPreloadOperationLock unlock];
}

- (BOOL)isNative3D
{
  return 0;
}

- (BOOL)isOpaque
{
  BOOL v3 = [(MRImage *)self->mOriginalImage isOpaque];
  if (v3) {
    LOBYTE(v3) = self->mKenBurnsType == 1;
  }
  return v3;
}

- (BOOL)isAlphaFriendly
{
  return 1;
}

- (BOOL)isInfinite
{
  return 0;
}

- (void)_computeImageSizeInContext:(id)a3 withArguments:(id)a4
{
  p_mRequestedSize = &self->mRequestedSize;
  double height = CGSizeZero.height;
  if (self->mRequestedSize.width == CGSizeZero.width && self->mRequestedSize.height == height)
  {
    float mOriginalImageAspectRatio = self->mOriginalImageAspectRatio;
    double v10 = [(MCSlide *)self->_slide frameID];
    id v11 = [(NSDictionary *)[(MCSlide *)self->_slide frameAttributes] objectForKey:@"specificAttributes"];
    *(float *)&double v12 = mOriginalImageAspectRatio;
    [(MRSlideProvider *)self unframedImageSizeForAspectRatio:v10 frameID:v11 andFrameAttributes:0 atIndex:0 framedImageSize:v12];
    self->mRequestedSize.double width = v13;
    self->mRequestedSize.double height = v14;
    self->mSlideIndex = [(MCSlide *)self->_slide index];
    double width = self->mRequestedSize.width;
    double v16 = self->mRequestedSize.height;
    if (width == 0.0)
    {
      self->mRequestedSize.double width = v16 * self->mOriginalImageAspectRatio;
    }
    else if (v16 == 0.0)
    {
      self->mRequestedSize.double height = width / self->mOriginalImageAspectRatio;
    }
    BYTE2(self->mFlags) |= 2u;
  }
  p_mImageSize = (float64x2_t *)&self->mImageSize;
  BOOL v18 = self->mImageSize.width == CGSizeZero.width && self->mImageSize.height == height;
  if (v18
    || (self->mFlags & 0x1000) == 0 && (objc_msgSend(a4, "freezesSizeOfImageRequests", a3) & 1) == 0)
  {
    float64x2_t *p_mImageSize = *(float64x2_t *)p_mRequestedSize;
    if (![(MCSlide *)self->_slide countOfAnimationPaths]) {
      goto LABEL_28;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = objc_msgSend(-[MCSlide animationPathForKey:](self->_slide, "animationPathForKey:", @"scale", 0), "keyframes");
    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (!v20) {
      goto LABEL_28;
    }
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    float v23 = 0.0;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        [v25 value];
        if (v26 > v23)
        {
          [v25 value];
          float v23 = v27;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
    if (v23 == 0.0)
    {
LABEL_28:
      [(MCSlide *)self->_slide scale];
      float v23 = v28;
    }
    if (v23 > 0.0) {
      float64x2_t *p_mImageSize = vmulq_n_f64(*p_mImageSize, v23);
    }
    switch(self->mKenBurnsType)
    {
      case 0:
        MRFitHeightToAspectRatio();
        goto LABEL_38;
      case 1:
        double v31 = self->mOriginalImageAspectRatio;
        goto LABEL_36;
      case 2:
        double v31 = self->mOriginalImageAspectRatio;
        goto LABEL_37;
      case 3:
        double v31 = self->mOriginalImageAspectRatio;
        if (self->mRequestedSize.width < self->mRequestedSize.height == v31 >= 1.0) {
LABEL_37:
        }
          double v29 = MRFitInToAspectRatio(self->mImageSize.width, self->mImageSize.height, v31);
        else {
LABEL_36:
        }
          double v29 = MRFitOutToAspectRatio(self->mImageSize.width, self->mImageSize.height, v31);
LABEL_38:
        self->mImageSize.double width = v29;
        self->mImageSize.double height = v30;
        break;
      default:
        break;
    }
    BYTE2(self->mFlags) &= ~2u;
  }
}

- (BOOL)updateStuffWithAssetManager:(id)a3
{
  unsigned __int8 v5 = atomic_fetch_and((atomic_uchar *volatile)&self->mFlags + 1, 0xFDu);
  int v6 = v5 & 2 | atomic_fetch_and((atomic_uchar *volatile)&self->mFlags + 2, 0xBFu) & 0x40;
  int v7 = (char)atomic_fetch_and((atomic_uchar *volatile)&self->mFlags + 2, 0x7Fu);
  BOOL v8 = v6 != 0;
  BOOL v9 = v7 < 0;
  unsigned __int8 v10 = atomic_fetch_and((atomic_uchar *volatile)&self->mFlags + 1, 0xFEu);
  BOOL v11 = v7 < 0 || v6 != 0;
  char v12 = v11 | v10;
  int v13 = atomic_fetch_and((atomic_uchar *volatile)&self->mFlags + 2, 0xFEu) & 1;
  if (((v11 | v10) & 1) == 0 && !v13) {
    return v12 & 1;
  }
  objc_sync_enter(self);
  if ((v12 & 1) == 0)
  {
LABEL_50:
    if (!v13) {
      goto LABEL_66;
    }
LABEL_59:
    long long v34 = [(MCSlide *)self->_slide frameID];
    mFrame = self->mFrame;
    if (v34)
    {
      if (![(NSString *)v34 isEqualToString:[(MRFrame *)mFrame frameID]])
      {
        v36 = +[MRFrame retainedFrameWithFrameID:v34 forSlideProvider:self];
        self->mFrame = v36;
        -[MRFrame setPixelSize:](v36, "setPixelSize:", self->mDefaultSize.width, self->mDefaultSize.height);
      }
    }
    else if (mFrame)
    {
      [(MRFrame *)mFrame releaseBySlideProvider:self];
      self->mFrame = 0;
    }
    if (self->mFrame) {
      [(MRFrame *)self->mFrame setAttributes:[(MCSlide *)self->_slide frameAttributes]];
    }
    goto LABEL_66;
  }
  if (v8) {
    goto LABEL_10;
  }
  if ((v10 & 1) == 0) {
    goto LABEL_41;
  }
  if ((self->mFlags & 8) != 0)
  {
LABEL_10:
    [(MRSlideProvider *)self unload];
    if ((v5 & 2) == 0)
    {
LABEL_26:
      int v13 = 1;
      BOOL v9 = 1;
      goto LABEL_27;
    }
    slide = self->_slide;
    if (slide)
    {
      id v15 = (NSString *)[(NSString *)[(MCAsset *)[(MCSlide *)slide asset] path] copy];
      self->_assetPath = v15;
      if (v15)
      {
LABEL_13:
        objc_msgSend(a3, "resolutionForAssetAtPath:");
        double v18 = v16 / v17;
        if (v17 <= 0.0) {
          double v18 = 1.0;
        }
        self->float mOriginalImageAspectRatio = v18;
        if ([a3 isSupportedMovieForAssetAtPath:self->_assetPath]) {
          char v19 = 4;
        }
        else {
          char v19 = 0;
        }
        char v20 = self->mFlags & 0xFB | v19;
        goto LABEL_24;
      }
    }
    else if (self->_assetPath)
    {
      goto LABEL_13;
    }
    if ([(MCSlide *)self->_slide plug]) {
      self->float mOriginalImageAspectRatio = self->mDefaultSize.width / self->mDefaultSize.height;
    }
    else {
      self->float mOriginalImageAspectRatio = 1.0;
    }
    char v20 = self->mFlags & 0xFB;
LABEL_24:
    LOBYTE(self->mFlags) = v20;
    self->mKenBurnsType = self->mDefaultKenBurnsType;
    id v21 = self->_slide;
    if (v21) {
      self->_filterID = (NSString *)objc_msgSend(-[NSSet anyObject](-[MCSlide filters](v21, "filters"), "anyObject"), "filterID");
    }
    goto LABEL_26;
  }
LABEL_27:
  if ([(MCSlide *)self->_slide startTimeIsDefined])
  {
    [(MCSlide *)self->_slide startTime];
    self->_double slideStartTime = v22;
  }
  if ([(MCSlide *)self->_slide durationIsDefined])
  {
    [(MCSlide *)self->_slide duration];
    self->_slideDuration = v23;
  }
  if (self->_assetPath)
  {
    if ((self->mFlags & 4) != 0)
    {
      if (![(MCSlide *)self->_slide startTimeIsDefined])
      {
        [a3 startTimeForAssetAtPath:self->_assetPath];
        self->_double slideStartTime = v24;
      }
      if (![(MCSlide *)self->_slide durationIsDefined])
      {
        [a3 stopTimeForAssetAtPath:self->_assetPath];
        self->_slideDuration = v25 - self->_slideStartTime;
      }
    }
    if (self->_slideDuration < 0.0)
    {
      self->_slideDuration = 0.0;
      goto LABEL_49;
    }
LABEL_41:
    BYTE2(self->mFlags) |= 0xEu;
    if (!v9) {
      goto LABEL_50;
    }
    goto LABEL_42;
  }
  if (![(MCSlide *)self->_slide plug] || [(MCSlide *)self->_slide durationIsDefined]) {
    goto LABEL_41;
  }
  [(MCPlug *)[(MCSlide *)self->_slide plug] fullDuration];
  self->_slideDuration = v28;
LABEL_49:
  BYTE2(self->mFlags) |= 0xEu;
  if (!v9) {
    goto LABEL_50;
  }
LABEL_42:
  float v26 = [(MCSlide *)self->_slide kenBurnsType];
  if ([(NSString *)v26 isEqualToString:@"Crop to Fit"])
  {
    int mDefaultKenBurnsType = 1;
  }
  else if ([(NSString *)v26 isEqualToString:@"Scale to Fit"])
  {
    int mDefaultKenBurnsType = 2;
  }
  else if ([(NSString *)v26 isEqualToString:@"Linear"])
  {
    int mDefaultKenBurnsType = 0;
  }
  else if ([(NSString *)v26 isEqualToString:@"Scrop to Fit"])
  {
    int mDefaultKenBurnsType = 3;
  }
  else
  {
    int mDefaultKenBurnsType = self->mDefaultKenBurnsType;
  }
  self->mKenBurnsType = mDefaultKenBurnsType;
  [(MCSlide *)self->_slide center];
  self->_center.x = v29;
  self->_center.y = v30;
  [(MCSlide *)self->_slide scale];
  self->_scale = v31;
  [(MCSlide *)self->_slide rotation];
  self->_rotation = v32;
  if ([(NSSet *)[(MCSlide *)self->_slide animationPaths] count])
  {
    self->_centerAnimationPath = (MCAnimationPathKeyframed *)[(MCSlide *)self->_slide animationPathForKey:@"center"];
    self->_scaleAnimationPath = (MCAnimationPathKeyframed *)[(MCSlide *)self->_slide animationPathForKey:@"scale"];
    self->_rotationAnimationPath = (MCAnimationPathKeyframed *)[(MCSlide *)self->_slide animationPathForKey:@"angle"];
    char v33 = BYTE1(self->mFlags) | 4;
  }
  else
  {
    char v33 = BYTE1(self->mFlags) & 0xFB;
  }
  BYTE1(self->mFlags) = v33;
  if (v13) {
    goto LABEL_59;
  }
LABEL_66:
  mOutputImage = self->mOutputImage;
  if (mOutputImage)
  {
    [(MRImage *)mOutputImage releaseByUser];
    self->mOutputImage = 0;
  }
  objc_sync_exit(self);
  return v12 & 1;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(_OWORD *)&self->mSlidePlayer == 0 && !self->_assetPath)
  {
    audioDucker = [(MCSlide *)self->_slide plug];
    if (!audioDucker) {
      return (char)audioDucker;
    }
  }
  double v10 = a3 - self->_showTime;
  unsigned int mFlags_low = LOBYTE(self->mFlags);
  int v12 = SBYTE1(self->mFlags);
  if (v10 < -10.0 || v10 >= self->_showDuration || ![(MRLayer *)self->mEffectLayer isPreactivated])
  {
    if (v12 < 0) {
      [(MRSlideProvider *)self setIsPlaying:0];
    }
    HIBYTE(self->mFlags) &= ~0x80u;
    double showDuration = self->_showDuration;
    if (self->mSlidePlayer)
    {
      [(MCSlide *)self->_slide audioDuckOutDuration];
      double v23 = fmax(v22, 2.0);
    }
    else
    {
      double v23 = 2.0;
    }
    if ((mFlags_low & 3) != 0)
    {
      double v24 = showDuration + v23;
      BOOL v25 = v10 >= -10.0 && v10 < v24;
      if (!v25 || ![(MRLayer *)self->mEffectLayer isPreactivated]) {
        [(MRSlideProvider *)self unload];
      }
    }
    audioDucker = (MCPlugSlide *)self->_audioDucker;
    if (audioDucker)
    {
      [(MCPlugSlide *)audioDucker setTime:v10];
      LOBYTE(audioDucker) = 0;
    }
    return (char)audioDucker;
  }
  if ((self->mFlags & 0x20000) != 0) {
    [(MRSlideProvider *)self _computeImageSizeInContext:a4 withArguments:a5];
  }
  if (self->mSlidePlayer)
  {
    double width = self->mLastImageSize.width;
    double height = self->mLastImageSize.height;
    int v15 = (mFlags_low >> 1) & 1;
    char v16 = mFlags_low & 1;
    BOOL v17 = width == CGSizeZero.width && height == CGSizeZero.height;
    if (!v17 && (width != self->mImageSize.width || height != self->mImageSize.height))
    {
      objc_sync_enter(self);
      [(MRSlideProvider *)self cancelLoading];
      LOBYTE(self->mFlags) &= ~1u;
      mOriginalImage = self->mOriginalImage;
      if (mOriginalImage)
      {
        [(MRImage *)mOriginalImage releaseByUser];
        self->mOriginalImage = 0;
      }
      mOutputImage = self->mOutputImage;
      if (mOutputImage)
      {
        [(MRImage *)mOutputImage releaseByUser];
        self->mOutputImage = 0;
      }
      mSlidePlayer = self->mSlidePlayer;
      if (mSlidePlayer)
      {
        [(MRAssetPlayer *)mSlidePlayer releaseByUser];
        self->mSlidePlayer = 0;
      }
      if (self->_audioDucker)
      {
        -[MRLayerEffect _removeAudioDucker:](self->mEffectLayer, "_removeAudioDucker:");

        self->_audioDucker = 0;
      }
      objc_sync_exit(self);
      LOBYTE(v15) = 0;
      char v16 = 0;
    }
  }
  else
  {
    mSlideLayer = self->mSlideLayer;
    int v15 = (mFlags_low >> 1) & 1;
    char v16 = mFlags_low & 1;
    if (mSlideLayer)
    {
      [(MRLayer *)mSlideLayer pixelSize];
      if (v28 != self->mImageSize.width || v27 != self->mImageSize.height) {
        -[MRLayer setPixelSize:](self->mSlideLayer, "setPixelSize:");
      }
    }
  }
  if (v10 >= 0.0)
  {
    BOOL v29 = [(MRLayer *)self->mEffectLayer isActivated];
    if (v16) {
      goto LABEL_53;
    }
  }
  else
  {
    BOOL v29 = 0;
    if (v16) {
      goto LABEL_53;
    }
  }
  if (v15)
  {
    if (v29)
    {
      [(NSLock *)self->mPreloadOperationLock lock];
      [(NSInvocationOperation *)self->mPreloadOperation setQueuePriority:8];
      [(NSLock *)self->mPreloadOperationLock unlock];
    }
  }
  else
  {
    [(MRSlideProvider *)self loadForTime:a4 inContext:a5 withArguments:v29 now:v10];
  }
LABEL_53:
  CGFloat v30 = self->mSlidePlayer;
  if (v30)
  {
    char v31 = BYTE2(self->mFlags);
    if ((v31 & 4) != 0)
    {
      if (self->_audioDucker)
      {
        -[MRLayerEffect _removeAudioDucker:](self->mEffectLayer, "_removeAudioDucker:");
        CGFloat v30 = self->mSlidePlayer;
      }
      if ([(MRAssetPlayer *)v30 conformsToProtocol:&OBJC_PROTOCOL___MRAudioPlayer])
      {
        double v32 = self->mSlidePlayer;
        slide = self->_slide;
        if (slide)
        {
          [(MCSlide *)slide audioVolume];
          [(MRAssetPlayer *)v32 setVolume:v34];
          [(MCSlide *)self->_slide audioFadeInDuration];
          -[MRAssetPlayer setFadeInDuration:](v32, "setFadeInDuration:");
          [(MCSlide *)self->_slide audioFadeOutDuration];
          double v36 = v35;
        }
        else
        {
          double v36 = 1.0;
          [(MRAssetPlayer *)self->mSlidePlayer setVolume:1.0];
          [(MRAssetPlayer *)v32 setFadeInDuration:1.0];
        }
        [(MRAssetPlayer *)v32 setFadeOutDuration:v36];
        [(MRAssetPlayer *)v32 setIsMuted:(BYTE1(self->mFlags) >> 5) & 1];
        if (!self->_audioDucker) {
          self->_audioDucker = objc_alloc_init(MRAudioDucker);
        }
        [(MRAssetPlayer *)v32 duration];
        -[MRAudioDucker setDuration:](self->_audioDucker, "setDuration:");
        double v40 = self->_audioDucker;
        if (v40)
        {
          if (self->_slide)
          {
            [(MCSlide *)self->_slide audioDuckLevel];
            [(MRAudioDucker *)self->_audioDucker setDuckLevel:v41];
            [(MCSlide *)self->_slide audioDuckInDuration];
            -[MRAudioDucker setDuckInDuration:](self->_audioDucker, "setDuckInDuration:");
            [(MCSlide *)self->_slide audioDuckOutDuration];
            double v43 = v42;
          }
          else
          {
            [(MRAudioDucker *)v40 setDuckLevel:0.25];
            double v43 = 1.0;
            [(MRAudioDucker *)self->_audioDucker setDuckInDuration:1.0];
          }
          [(MRAudioDucker *)self->_audioDucker setDuckOutDuration:v43];
          [(MRAudioDucker *)self->_audioDucker setParentDuration:self->_showDuration];
          mEffectLayer = self->mEffectLayer;
          for (i = mEffectLayer;
                [[(MRLayer *)i superlayer] superlayer];
                mEffectLayer = i)
          {
            i = [(MRLayer *)mEffectLayer superlayer];
          }
          [(MRAudioDucker *)self->_audioDucker setPriority:[(MCPlugParallel *)[(MRLayer *)mEffectLayer plugAsParallel] audioPriority]];
          [(MRLayerEffect *)self->mEffectLayer _addAudioDucker:self->_audioDucker];
        }
      }
      else
      {
        double v39 = self->_audioDucker;
        if (v39)
        {

          self->_audioDucker = 0;
        }
      }
      char v31 = BYTE2(self->mFlags) & 0xFB;
      BYTE2(self->mFlags) = v31;
    }
    if ((v31 & 8) != 0
      && [(MRAssetPlayer *)self->mSlidePlayer conformsToProtocol:&OBJC_PROTOCOL___MRAssetPlayerTimeSupport])
    {
      [(MRAssetPlayer *)self->mSlidePlayer setStartTime:self->_slideStartTime];
      [(MRAssetPlayer *)self->mSlidePlayer setDuration:self->_slideDuration];
      id v46 = self->_audioDucker;
      if (v46) {
        [(MRAudioDucker *)v46 setDuration:self->_slideDuration];
      }
      BYTE2(self->mFlags) &= ~8u;
    }
    id v47 = self->_audioDucker;
    if (v47) {
      [(MRAudioDucker *)v47 setTime:v10];
    }
  }
  else
  {
    double v37 = self->mSlideLayer;
    if (v37 && [(MRLayer *)v37 isPreactivated])
    {
      unsigned int v38 = [(MRLayer *)self->mSlideLayer isActivated];
      if (!v29 || (v38 & 1) != 0)
      {
        if (!(v29 | v38 ^ 1)) {
          [(MRLayer *)self->mSlideLayer deactivate];
        }
      }
      else
      {
        [(MRLayer *)self->mSlideLayer activate];
      }
      [(MRLayer *)self->mSlideLayer prerenderForTime:a4 inContext:a5 withArguments:v10];
    }
    else
    {
      NSLog(@"Slide provider has no slide player nor layer at the end of prerender");
    }
  }
  if (v29
    && (self->mFlags & 8) == 0
    && objc_msgSend(objc_msgSend(a5, "renderer"), "isPlaying")
    && [(MRLayer *)self->mEffectLayer isActivated])
  {
    unsigned int v48 = ![(MRLayerClock *)[(MRLayer *)self->mEffectLayer clock] isPaused];
  }
  else
  {
    unsigned int v48 = 0;
  }
  v49 = self->_audioDucker;
  if (!v49) {
    goto LABEL_105;
  }
  if ((v48 & 1) == 0)
  {
    unsigned int v51 = [(MRLayerClock *)[(MRLayer *)self->mEffectLayer clock] isPaused];
    double v52 = -1000.0;
    if (v51) {
      double v52 = v10;
    }
    [(MRAudioDucker *)self->_audioDucker setDuckInTime:v52];
    if ((v12 & 0x80000000) == 0) {
      goto LABEL_116;
    }
    [(MRAudioDucker *)self->_audioDucker setDuckOutTime:v10];
LABEL_105:
    if (v12 >= 0) {
      int v53 = 1;
    }
    else {
      int v53 = v48;
    }
    if (v53 != 1)
    {
      uint64_t v55 = 0;
LABEL_115:
      [(MRSlideProvider *)self setIsPlaying:v55];
      goto LABEL_116;
    }
LABEL_109:
    if (v12 >= 0) {
      unsigned int v54 = v48;
    }
    else {
      unsigned int v54 = 0;
    }
    if (v54 != 1) {
      goto LABEL_116;
    }
    uint64_t v55 = 1;
    goto LABEL_115;
  }
  [(MRAudioDucker *)v49 setDuckOutTime:-1000.0];
  if ((v12 & 0x80000000) == 0)
  {
    [(MRAudioDucker *)self->_audioDucker duckInTime];
    if (v50 > v10) {
      [(MRAudioDucker *)self->_audioDucker setDuckInTime:-1000.0];
    }
    goto LABEL_109;
  }
LABEL_116:
  if (v29)
  {
    if (self->_centerAnimationPath || self->_scaleAnimationPath)
    {
      int v56 = 1;
      if (v48)
      {
LABEL_120:
        v57 = self->mSlidePlayer;
        if (v57) {
          LODWORD(v57) = [(MRAssetPlayer *)v57 newImageIsAvailable];
        }
        v56 |= v57;
        audioDucker = (MCPlugSlide *)self->mSlideLayer;
        if (audioDucker) {
          LODWORD(audioDucker) = [(MCPlugSlide *)audioDucker hasSomethingToRender];
        }
        goto LABEL_130;
      }
    }
    else
    {
      int v56 = self->_rotationAnimationPath != 0;
      if (v48) {
        goto LABEL_120;
      }
    }
    LODWORD(audioDucker) = 0;
LABEL_130:
    unsigned int v59 = BYTE2(self->mFlags);
    LOBYTE(audioDucker) = (audioDucker | v56 | (v59 >> 4) & 1) != 0;
    BYTE2(self->mFlags) = v59 & 0xEF;
    return (char)audioDucker;
  }
  if ([(MRAssetPlayer *)self->mSlidePlayer conformsToProtocol:&OBJC_PROTOCOL___MRAssetPlayerTimeSupport])
  {
    [(MRAssetPlayer *)self->mSlidePlayer time];
    if (v58 > 0.0) {
      [(MRAssetPlayer *)self->mSlidePlayer setTime:0.0];
    }
  }
  LOBYTE(audioDucker) = 0;
  HIBYTE(self->mFlags) &= ~0x80u;
  return (char)audioDucker;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (*(_OWORD *)&self->mSlidePlayer == 0)
  {
    NSLog(@"Slide was unloaded although expected", a2, a3);
    return 0;
  }
  double v8 = a3 - self->_showTime;
  if (v8 < 0.0 || v8 >= self->_showDuration) {
    return 0;
  }
  if ((SHIBYTE(self->mFlags) & 0x80000000) == 0
    && (objc_msgSend(objc_msgSend(a5, "renderer"), "isOffscreen") & 1) == 0
    && self->_assetPath)
  {
    if (self->mEffectLayer)
    {
      slide = self->_slide;
      if (slide)
      {
        double v10 = +[NSDictionary dictionaryWithObjectsAndKeys:@"layer", slide, @"slide", 0];
        BOOL v11 = +[NSNotificationCenter defaultCenter];
        -[NSNotificationCenter postNotificationName:object:userInfo:](v11, "postNotificationName:object:userInfo:", kMRNotificationSlideIsOn, [a5 renderer], v10);
      }
    }
    HIBYTE(self->mFlags) |= 0x80u;
  }
  if (self->mSlidePlayer)
  {
    CGFloat width = self->mImageSize.width;
    CGFloat height = self->mImageSize.height;
    if ([a5 thumbnailPolicy]) {
      [(MRAssetPlayer *)self->mSlidePlayer setThumbnailIsOK:0];
    }
    mSlidePlayer = self->mSlidePlayer;
    [a5 displayLinkTimestamp];
    char v16 = [(MRAssetPlayer *)mSlidePlayer retainedByUserImageAtTime:v8 displayLinkTimestamp:v15];
    if (!v16) {
      goto LABEL_30;
    }
  }
  else
  {
    mSlideLayer = self->mSlideLayer;
    if (!mSlideLayer
      || v8 == self->mLastTime
      && self->mOriginalImage
      && self->mLastImageSize.width == self->mImageSize.width
      && self->mLastImageSize.height == self->mImageSize.height
      || (v16 = [(MRLayer *)mSlideLayer retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v8], [(MRImage *)v16 width], CGFloat width = v19, [(MRImage *)v16 height], height = v20, !v16))
    {
LABEL_30:
      BOOL v22 = 0;
      goto LABEL_31;
    }
  }
  mOriginalImage = self->mOriginalImage;
  BOOL v22 = v16 != mOriginalImage;
  if (v16 == mOriginalImage)
  {
    [(MRImage *)v16 releaseByUser];
  }
  else
  {
    if (mOriginalImage) {
      [(MRImage *)mOriginalImage releaseByUser];
    }
    self->mOriginalImage = v16;
  }
  self->mLastImageSize.CGFloat width = width;
  self->mLastImageSize.CGFloat height = height;
  self->mLastTime = v8;
LABEL_31:
  double v23 = self->mOriginalImage;
  if (v23)
  {
    double v24 = self->mSizeFactor.width;
    double v25 = self->mSizeFactor.height;
    if (self->_centerAnimationPath || self->_scaleAnimationPath || self->_rotationAnimationPath)
    {
      uint64_t v26 = 1;
      int v27 = 1;
    }
    else
    {
      uint64_t v26 = 0;
      int v27 = (BYTE1(self->mFlags) >> 3) & 1;
    }
    double v28 = self->mRequestedSize.width * v24;
    double v29 = self->mRequestedSize.height * v25;
    if (v22
      || ((mOutputImage = self->mOutputImage) == 0 ? (char v31 = 1) : (char v31 = v27),
          (v31 & 1) != 0 || (v28 == self->mLastDaSize.width ? (BOOL v32 = v29 == self->mLastDaSize.height) : (BOOL v32 = 0), !v32)))
    {
      BYTE1(self->mFlags) &= ~8u;
      CGPoint v58 = CGPointZero;
      if (v24 < v25) {
        double v24 = v25;
      }
      double v33 = 1.0 / v24;
      double v57 = 1.0 / v24;
      double v56 = 0.0;
      uint64_t mKenBurnsType = self->mKenBurnsType;
      if (mKenBurnsType == 3)
      {
        [(MRImage *)v23 width];
        double v36 = v35;
        [(MRImage *)self->mOriginalImage height];
        if (v28 < v29 != v36 >= v37) {
          uint64_t mKenBurnsType = 1;
        }
        else {
          uint64_t mKenBurnsType = 2;
        }
      }
      if (self->mOriginalImageAspectRatio < 1.0
        || ([(MRImage *)self->mOriginalImage width],
            double v39 = v38 / self->mOriginalImageAspectRatio,
            [(MRImage *)self->mOriginalImage height],
            vabdd_f64(v39, v40) < 2.0)
        || self->mOriginalImageAspectRatio >= 1.0
        || ([(MRImage *)self->mOriginalImage height],
            double v42 = v41,
            double mOriginalImageAspectRatio = self->mOriginalImageAspectRatio,
            [(MRImage *)self->mOriginalImage width],
            fabs(-(v44 - v42 * mOriginalImageAspectRatio)) < 2.0))
      {
        -[MRSlideProvider applyKenBurnsAtTime:withTargetSize:kenBurnsType:translation:scale:rotation:](self, "applyKenBurnsAtTime:withTargetSize:kenBurnsType:translation:scale:rotation:", mKenBurnsType, &v58, &v57, &v56, v8, v28, v29);
        uint64_t v45 = 0;
LABEL_56:
        [(MRImage *)self->mOutputImage releaseByUser];
        id v46 = [(MRImage *)self->mOriginalImage retainedByUserImage];
        self->mOutputImage = v46;
        [(MRImage *)v46 setCenterX:v58.x];
        [(MRImage *)self->mOutputImage setCenterY:v58.y];
        [(MRImage *)self->mOutputImage setScale:v57];
        [(MRImage *)self->mOutputImage setRotationAngle:v56];
        double v47 = -1.0;
        if (v27) {
          double v47 = v8;
        }
        [(MRImage *)self->mOutputImage setRenderTime:v47];
        if (mKenBurnsType == 1) {
          uint64_t v48 = 2;
        }
        else {
          uint64_t v48 = 1;
        }
        [(MRImage *)self->mOutputImage setClampMode:v48];
        [(MRImage *)self->mOutputImage setHasKenBurns:v26];
        [(MRImage *)self->mOutputImage setScaleWasFixedForTargetAspectRatio:v45];
        [(MRImage *)self->mOutputImage setFilterID:self->_filterID];
        mFrame = self->mFrame;
        mOutputImage = self->mOutputImage;
        if (mFrame)
        {
          [(MRFrame *)mFrame setInputImage:mOutputImage];
          double v50 = [(MRFrame *)self->mFrame retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:v8];
          mOutputImage = self->mOutputImage;
          if (v50)
          {
            unsigned int v51 = v50;
            [(MRImage *)self->mOutputImage releaseByUser];
            self->mOutputImage = v51;
            mOutputImage = v51;
          }
        }
        self->mLastDaSize.CGFloat width = v28;
        self->mLastDaSize.CGFloat height = v29;
        return [(MRImage *)mOutputImage retainByUser];
      }
      [(MRImage *)self->mOriginalImage aspectRatio];
      float v54 = v53;
      float v55 = v28 / v29;
      if (mKenBurnsType >= 2)
      {
        if (mKenBurnsType != 2 || v54 >= v55) {
          goto LABEL_76;
        }
      }
      else if (v54 <= v55)
      {
        goto LABEL_76;
      }
      double v57 = v33 * (float)(v54 / v55);
LABEL_76:
      uint64_t v45 = 1;
      goto LABEL_56;
    }
  }
  else
  {
    double v52 = self->mOutputImage;
    if (v52)
    {
      [(MRImage *)v52 releaseByUser];
      mOutputImage = 0;
      self->mOutputImage = 0;
    }
    else
    {
      mOutputImage = 0;
    }
  }
  return [(MRImage *)mOutputImage retainByUser];
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  id v6 = [(MRSlideProvider *)self retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  double v7 = 2.0 / (self->mDefaultSize.width / self->mDefaultSize.height);
  id v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v6, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, v7 * -0.5, 2.0, v7), @"rectangle", 0);
  BOOL v9 = +[NSArray arrayWithObject:v8];

  [v6 releaseByUser];
  return v9;
}

- (void)imageIsAvailableFromAssetPlayer:(id)a3
{
  BYTE2(self->mFlags) |= 0x10u;
  if ([(MRLayer *)self->mEffectLayer isActivated])
  {
    mEffectLayer = self->mEffectLayer;
    [(MRLayerEffect *)mEffectLayer _requestRendering];
  }
}

- (CGSize)defaultSize
{
  double width = self->mDefaultSize.width;
  double height = self->mDefaultSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (float)stillTime
{
  return self->mStillTime;
}

- (void)setStillTime:(float)a3
{
  self->float mStillTime = a3;
}

- (NSString)imageSizeScript
{
  return self->mImageSizeScript;
}

- (NSDictionary)effectAttributes
{
  return self->mEffectAttributes;
}

- (NSString)showTimeScript
{
  return self->mShowTimeScript;
}

- (void)setShowTimeScript:(id)a3
{
}

- (double)showTime
{
  return self->_showTime;
}

- (void)setShowTime:(double)a3
{
  self->_showTime = a3;
}

- (double)showDuration
{
  return self->_showDuration;
}

- (CGSize)requestedSize
{
  objc_copyStruct(v4, &self->mRequestedSize, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeFactor
{
  double width = self->mSizeFactor.width;
  double height = self->mSizeFactor.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSizeFactor:(CGSize)a3
{
  self->mSizeFactor = a3;
}

- (MCSlide)slide
{
  return self->_slide;
}

- (int)defaultKenBurnsType
{
  return self->mDefaultKenBurnsType;
}

- (void)setDefaultKenBurnsType:(int)a3
{
  self->int mDefaultKenBurnsType = a3;
}

- (MRFrame)frame
{
  return self->mFrame;
}

- (double)imageAspectRatio
{
  return self->mOriginalImageAspectRatio;
}

- (double)slideStartTime
{
  return self->_slideStartTime;
}

- (double)slideDuration
{
  return self->_slideDuration;
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (double)rotation
{
  return self->_rotation;
}

- (MCAnimationPathKeyframed)centerAnimationPath
{
  return self->_centerAnimationPath;
}

- (MCAnimationPathKeyframed)scaleAnimationPath
{
  return self->_scaleAnimationPath;
}

- (MCAnimationPathKeyframed)rotationAnimationPath
{
  return self->_rotationAnimationPath;
}

- (NSString)filterID
{
  return self->_filterID;
}

- (void)setFilterID:(id)a3
{
}

- (id)playerHint
{
  return self->_playerHint;
}

- (void)setPlayerHint:(id)a3
{
  self->_playerHint = a3;
}

- (void)applyKenBurnsAtTime:(double)a3 withTargetSize:(CGSize)a4 kenBurnsType:(int)a5 translation:(CGPoint *)a6 scale:(double *)a7 rotation:(double *)a8
{
  double height = a4.height;
  double width = a4.width;
  [(MRImage *)self->mOriginalImage aspectRatio];
  double v17 = v16;
  [(MRImage *)self->mOriginalImage width];
  double v19 = v18;
  [(MRImage *)self->mOriginalImage height];
  double v21 = v20;
  CGPoint center = self->_center;
  CGPoint v69 = center;
  double scale = self->_scale;
  double v67 = scale;
  mEffectLayer = self->mEffectLayer;
  if ((self->mFlags & 0x400) != 0) {
    double v23 = [(MRLayer *)mEffectLayer plug];
  }
  else {
    double v23 = [(MRLayer *)mEffectLayer clock];
  }
  double v24 = v23;
  centerAnimationPath = self->_centerAnimationPath;
  if (centerAnimationPath)
  {
    if ([(MCAnimationPath *)centerAnimationPath isTriggered]
      && self->_centerAnimationPathTriggerTime < 0.0)
    {
      self->_double centerAnimationPathTriggerTime = a3;
    }
    char v65 = 0;
    uint64_t v26 = self->_centerAnimationPath;
    unsigned int v27 = [(MCAnimationPath *)v26 isTriggered];
    double centerAnimationPathTriggerTime = 0.0;
    if (v27) {
      double centerAnimationPathTriggerTime = self->_centerAnimationPathTriggerTime;
    }
    +[MRUtilities valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:](MRUtilities, "valueForPointAnimationPath:withPlugTiming:atTime:defaultsTo:previousKeyPoint:nextKeyPoint:animationIsOver:", v26, v24, &v69, &center, &v65, a3 - centerAnimationPathTriggerTime, self->_center.x, self->_center.y);
    self->_center.double x = v29;
    self->_center.double y = v30;
    if (v65 && [(MCAnimationPath *)self->_centerAnimationPath isTriggered])
    {

      self->_centerAnimationPath = 0;
      self->_double centerAnimationPathTriggerTime = -1.0;
    }
  }
  scaleAnimationPath = self->_scaleAnimationPath;
  if (scaleAnimationPath)
  {
    if ([(MCAnimationPath *)scaleAnimationPath isTriggered] && self->_scaleAnimationPathTriggerTime < 0.0) {
      self->_double scaleAnimationPathTriggerTime = a3;
    }
    char v65 = 0;
    BOOL v32 = self->_scaleAnimationPath;
    unsigned int v33 = [(MCAnimationPath *)v32 isTriggered];
    double scaleAnimationPathTriggerTime = 0.0;
    if (v33) {
      double scaleAnimationPathTriggerTime = self->_scaleAnimationPathTriggerTime;
    }
    +[MRUtilities valueForScalarAnimationPath:v32 withPlugTiming:v24 atTime:&v67 defaultsTo:&scale previousKeyValue:&v65 nextKeyValue:a3 - scaleAnimationPathTriggerTime animationIsOver:self->_scale];
    self->_double scale = v35;
    if (v65 && [(MCAnimationPath *)self->_scaleAnimationPath isTriggered])
    {

      self->_scaleAnimationPath = 0;
      self->_double scaleAnimationPathTriggerTime = -1.0;
    }
  }
  rotationAnimationPath = self->_rotationAnimationPath;
  if (rotationAnimationPath)
  {
    if ([(MCAnimationPath *)rotationAnimationPath isTriggered]
      && self->_rotationAnimationPathTriggerTime < 0.0)
    {
      self->_double rotationAnimationPathTriggerTime = a3;
    }
    char v65 = 0;
    double v37 = self->_rotationAnimationPath;
    unsigned int v38 = [(MCAnimationPath *)v37 isTriggered];
    double rotationAnimationPathTriggerTime = 0.0;
    if (v38) {
      double rotationAnimationPathTriggerTime = self->_rotationAnimationPathTriggerTime;
    }
    +[MRUtilities valueForScalarAnimationPath:v37 withPlugTiming:v24 atTime:0 defaultsTo:0 previousKeyValue:&v65 nextKeyValue:a3 - rotationAnimationPathTriggerTime animationIsOver:self->_rotation];
    self->_double rotation = v40;
    if (v65 && [(MCAnimationPath *)self->_rotationAnimationPath isTriggered])
    {

      self->_rotationAnimationPath = 0;
      self->_double rotationAnimationPathTriggerTime = -1.0;
    }
  }
  double x = self->_center.x;
  double y = self->_center.y;
  if (a6)
  {
    double x = x + a6->x;
    double y = y + a6->y;
  }
  double v43 = self->_scale;
  if (a7) {
    double v43 = v43 * *a7;
  }
  double rotation = self->_rotation;
  if (a8) {
    double rotation = rotation + *a8;
  }
  double v45 = width / height;
  double v46 = height / width;
  if (a5 == 2)
  {
    double v47 = v19 / v43;
    if (v45 > 0.0)
    {
      if (v45 >= v17)
      {
        double v60 = v21 / v67;
        double v47 = v45 * (v21 / v43);
        double v61 = v21 / scale;
        if (center.x == v69.x)
        {
          double v50 = v19 + v47 * -0.5 + (1.0 - x) * (v47 - v19);
        }
        else
        {
          double v62 = v19 - v45 * v61 * 0.5 + (1.0 - center.x) * (v45 * v61 - v19);
          double v63 = v19 - v45 * v60 * 0.5 + (1.0 - v69.x) * (v45 * v60 - v19);
          double v50 = v63 + (x - v69.x) * (v62 - v63) / (center.x - v69.x);
        }
        if (center.y == v69.y) {
          double v56 = v21 / v43 * 0.5 + y * (v21 - v21 / v43);
        }
        else {
          double v56 = v60 * 0.5
        }
              + v69.y * (v21 - v60)
              + (y - v69.y)
              * (v61 * 0.5 + center.y * (v21 - v61) - (v60 * 0.5 + v69.y * (v21 - v60)))
              / (center.y - v69.y);
        goto LABEL_66;
      }
      double v48 = v19 / v67;
      double v49 = v19 / scale;
      if (center.x == v69.x) {
        double v50 = v47 * 0.5 + x * (v19 - v47);
      }
      else {
        double v50 = v48 * 0.5
      }
            + v69.x * (v19 - v48)
            + (x - v69.x)
            * (v49 * 0.5 + center.x * (v19 - v49) - (v48 * 0.5 + v69.x * (v19 - v48)))
            / (center.x - v69.x);
      if (center.y != v69.y)
      {
        double v64 = v21 - v46 * v48 * 0.5 + (1.0 - v69.y) * (v46 * v48 - v21);
        double v56 = v64
            + (y - v69.y) * (v21 - v46 * v49 * 0.5 + (1.0 - center.y) * (v46 * v49 - v21) - v64) / (center.y - v69.y);
        goto LABEL_66;
      }
      double y = 1.0 - y;
      double v57 = v46 * v47 - v21;
      double v58 = v21 + v46 * v47 * -0.5;
      goto LABEL_65;
    }
    double v50 = CGPointZero.x;
    double v56 = CGPointZero.y;
LABEL_66:
    if (!a6) {
      goto LABEL_69;
    }
    a6->double x = (v50 + v50) / v19 + -1.0;
    double v59 = (v56 + v56) / v21 + -1.0;
    goto LABEL_68;
  }
  if (a5 == 1)
  {
    double v47 = v19 / v43;
    double v51 = v19 / v67;
    double v52 = v19 / scale;
    if (v45 <= v17)
    {
      double v53 = v21 / v43;
      double v54 = v21 / v67;
      double v55 = v21 / scale;
      if (v45 > 0.0)
      {
        double v47 = v45 * v53;
        double v51 = v45 * v54;
        double v52 = v45 * v55;
      }
    }
    else
    {
      double v53 = v46 * v47;
      double v54 = v46 * v51;
      double v55 = v46 * v52;
    }
    if (center.x == v69.x) {
      double v50 = v47 * 0.5 + x * (v19 - v47);
    }
    else {
      double v50 = v51 * 0.5
    }
          + v69.x * (v19 - v51)
          + (x - v69.x) * (v52 * 0.5 + center.x * (v19 - v52) - (v51 * 0.5 + v69.x * (v19 - v51))) / (center.x - v69.x);
    if (center.y == v69.y)
    {
      double v57 = v21 - v53;
      double v58 = v53 * 0.5;
LABEL_65:
      double v56 = v58 + y * v57;
      goto LABEL_66;
    }
    double v56 = v54 * 0.5
        + v69.y * (v21 - v54)
        + (y - v69.y) * (v55 * 0.5 + center.y * (v21 - v55) - (v54 * 0.5 + v69.y * (v21 - v54))) / (center.y - v69.y);
    goto LABEL_66;
  }
  double v47 = v19;
  if (a5) {
    goto LABEL_69;
  }
  if (scale == v67)
  {
    double v47 = v19 / v43;
    if (!a6) {
      goto LABEL_69;
    }
    goto LABEL_59;
  }
  double v47 = v19 * (1.0 / v67 + (v43 - v67) * (1.0 / scale - 1.0 / v67) / (scale - v67));
  if (a6)
  {
LABEL_59:
    a6->double x = x * 2.0 + -1.0;
    double v59 = y * 2.0 + -1.0;
LABEL_68:
    a6->double y = v59;
  }
LABEL_69:
  if (a7) {
    *a7 = v19 / v47;
  }
  if (a8) {
    *a8 = -rotation;
  }
}

- (void)printFlags
{
  NSLog(@"%@", -[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](-[NSString stringByAppendingFormat:](+[NSString stringWithFormat:](
                                        NSString,
                                        "stringWithFormat:",
                                        @"\n\tisMonochromatic = %d",
                                        (LOBYTE(self->mFlags) >> 6) & 1),
                                      "stringByAppendingFormat:",
                                      @"\n\tusesMipmapping = %d",
                                      (LOBYTE(self->mFlags) >> 5) & 1),
                                    "stringByAppendingFormat:",
                                    @"\n\tisStill = %d",
                                    (LOBYTE(self->mFlags) >> 3) & 1),
                                  "stringByAppendingFormat:",
                                  @"\n\tisSupportedMovie = %d",
                                  (LOBYTE(self->mFlags) >> 2) & 1),
                                "stringByAppendingFormat:",
                                @"\n\tisPreloading = %d",
                                (LOBYTE(self->mFlags) >> 1) & 1),
                              "stringByAppendingFormat:",
                              @"\n\tisLoaded = %d",
                              self->mFlags & 1),
                            "stringByAppendingFormat:",
                            @"\n\tisPlaying = %d",
                            BYTE1(self->mFlags) >> 7),
                          "stringByAppendingFormat:",
                          @"\n\tslideIsReadonldouble y = %d",
                          (BYTE1(self->mFlags) >> 6) & 1),
                        "stringByAppendingFormat:",
                        @"\n\tisUpdatingLive = %d",
                        (BYTE1(self->mFlags) >> 4) & 1),
                      "stringByAppendingFormat:",
                      @"\n\tneedsToUpdateSlide = %d",
                      (BYTE1(self->mFlags) >> 1) & 1),
                    "stringByAppendingFormat:",
                    @"\n\tneedsToUpdateKenBurns = %d",
                    BYTE2(self->mFlags) >> 7),
                  "stringByAppendingFormat:",
                  @"\n\tneedsToUpdateFrame = %d",
                  (BYTE2(self->mFlags) >> 6) & 1),
                "stringByAppendingFormat:",
                @"\n\tneedsToUnloadOnEndLiveUpdate = %d",
                (BYTE2(self->mFlags) >> 5) & 1),
              "stringByAppendingFormat:",
              @"\n\tneedsRendering = %d",
              (BYTE2(self->mFlags) >> 4) & 1),
            "stringByAppendingFormat:",
            @"\n\tneedsToUpdateTiming = %d",
            (BYTE2(self->mFlags) >> 3) & 1),
          "stringByAppendingFormat:",
          @"\n\tneedsToUpdateAudio = %d",
          (BYTE2(self->mFlags) >> 2) & 1),
        "stringByAppendingFormat:",
        @"\n\tneedsToUpdateImageSize = %d",
        (BYTE2(self->mFlags) >> 1) & 1),
      "stringByAppendingFormat:",
      @"\n\tsentSlideInOnNotification = %d",
      HIBYTE(self->mFlags) >> 7));
}

@end