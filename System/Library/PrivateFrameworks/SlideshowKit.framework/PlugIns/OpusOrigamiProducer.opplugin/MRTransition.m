@interface MRTransition
+ (id)retainedTransitionWithTransitionID:(id)a3 forTransitioner:(id)a4;
- (BOOL)controlsLayersTime;
- (BOOL)dependsOnFingerPosition;
- (BOOL)isAlphaFriendly;
- (BOOL)isInfinite;
- (BOOL)isLoadedForTime:(double)a3;
- (BOOL)isNative3D;
- (BOOL)isOpaque;
- (BOOL)isRetainedByTransitioner;
- (BOOL)isSplit;
- (BOOL)isTransitioning;
- (BOOL)needsSourceLayerImageForPrecomputing;
- (BOOL)needsTargetLayerImageForPrecomputing;
- (BOOL)noContentsMotion;
- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (BOOL)supportsDirectionOverride;
- (CGSize)pixelSize;
- (MRImage)sourceLayerImage;
- (MRImage)targetLayerImage;
- (MRLayer)sourceLayer;
- (MRLayer)targetLayer;
- (MRTransition)initWithTransitionID:(id)a3;
- (NSDictionary)attributes;
- (NSString)presetID;
- (NSString)transitionID;
- (char)direction;
- (double)progress;
- (double)pzrCancel:(id)a3;
- (double)pzrEnd:(id)a3;
- (double)pzrStart:(id)a3;
- (double)pzrUpdate:(id)a3;
- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)cleanup;
- (void)dealloc;
- (void)releaseByTransitioner:(id)a3;
- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5;
- (void)retainByTransitioner:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setDirection:(char)a3;
- (void)setPixelSize:(CGSize)a3;
- (void)setPresetID:(id)a3;
- (void)setSourceLayer:(id)a3;
- (void)setSourceLayerImage:(id)a3;
- (void)setTargetLayer:(id)a3;
- (void)setTargetLayerImage:(id)a3;
- (void)unload;
@end

@implementation MRTransition

+ (id)retainedTransitionWithTransitionID:(id)a3 forTransitioner:(id)a4
{
  id v5 = objc_msgSend(+[MRTransitionManager sharedManager](MRTransitionManager, "sharedManager"), "transitionWithTransitionID:", a3);
  [v5 retainByTransitioner:a4];
  return v5;
}

- (MRTransition)initWithTransitionID:(id)a3
{
  v4 = [(MRTransition *)self init];
  if (v4)
  {
    v4->mTransitionID = (NSString *)[a3 copy];
    v4->mPresetID = 0;
    v4->mDescription = (NSDictionary *)objc_msgSend(+[MRTransitionManager sharedManager](MRTransitionManager, "sharedManager"), "descriptionForTransitionID:", v4->mTransitionID);
    *(_OWORD *)&v4->mTransitioner = 0u;
    *(_OWORD *)&v4->mTargetLayer = 0u;
    *(_OWORD *)&v4->mTargetLayerImage = 0u;
    v4->mAttributes = 0;
    v4->mFlattenedAttributes = 0;
    v4->mNeedsToUpdateAttributes = 0;
    v4->mPixelSize = CGSizeZero;
  }
  return v4;
}

- (void)dealloc
{
  [(MRTransition *)self cleanup];
  v3.receiver = self;
  v3.super_class = (Class)MRTransition;
  [(MRTransition *)&v3 dealloc];
}

- (void)cleanup
{
  if (self->mDescription)
  {

    self->mTransitionID = 0;
    self->mPresetID = 0;

    self->mDescription = 0;
  }
}

- (void)retainByTransitioner:(id)a3
{
  self->mTransitioner = a3;
}

- (void)releaseByTransitioner:(id)a3
{
  self->mTransitioner = 0;
  self->mAttributes = 0;

  self->mFlattenedAttributes = 0;
  self->mSourceLayer = 0;

  self->mTargetLayer = 0;
  [(MRTransition *)self unload];
  id v4 = +[MRTransitionManager sharedManager];
  [v4 recycleTransition:self];
}

- (BOOL)isRetainedByTransitioner
{
  return self->mTransitioner != 0;
}

- (BOOL)noContentsMotion
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"noContentsMotion"];
  return [v2 BOOLValue];
}

- (BOOL)controlsLayersTime
{
  return 0;
}

- (BOOL)supportsDirectionOverride
{
  return 0;
}

- (BOOL)needsSourceLayerImageForPrecomputing
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"needsSourceLayerImageForPrecomputing"];
  return [v2 BOOLValue];
}

- (BOOL)needsTargetLayerImageForPrecomputing
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"needsTargetLayerImageForPrecomputing"];
  return [v2 BOOLValue];
}

- (BOOL)isSplit
{
  return 0;
}

- (void)setAttributes:(id)a3
{
  if (a3)
  {
    if (self->mAttributes == a3) {
      return;
    }
    self->mAttributes = (NSDictionary *)a3;

    self->mPresetID = (NSString *)[a3 objectForKey:@"PresetID"];
    id v5 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v6 = objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "attributesForTransitionID:andPresetID:", self->mTransitionID, self->mPresetID);
    if (v6) {
      [(NSDictionary *)v5 addEntriesFromDictionary:v6];
    }
    [(NSDictionary *)v5 addEntriesFromDictionary:a3];
    self->mFlattenedAttributes = v5;
  }
  else
  {

    self->mFlattenedAttributes = (NSDictionary *)objc_msgSend(+[MPTransitionManager sharedManager](MPTransitionManager, "sharedManager"), "attributesForTransitionID:andPresetID:", self->mTransitionID, self->mPresetID);
  }
  self->mNeedsToUpdateAttributes = 1;
}

- (void)setSourceLayerImage:(id)a3
{
  mSourceLayerImage = self->mSourceLayerImage;
  if (mSourceLayerImage) {
    [(MRImage *)mSourceLayerImage releaseByUser];
  }
  self->mSourceLayerImage = (MRImage *)[a3 retainByUser];
}

- (void)setTargetLayerImage:(id)a3
{
  mTargetLayerImage = self->mTargetLayerImage;
  if (mTargetLayerImage) {
    [(MRImage *)mTargetLayerImage releaseByUser];
  }
  self->mTargetLayerImage = (MRImage *)[a3 retainByUser];
}

- (BOOL)isLoadedForTime:(double)a3
{
  return 1;
}

- (void)unload
{
  self->_progress = 0.0;

  self->mOutputImage = 0;
  mSourceLayerImage = self->mSourceLayerImage;
  if (mSourceLayerImage)
  {
    [(MRImage *)mSourceLayerImage releaseByUser];
    self->mSourceLayerImage = 0;
  }
  mTargetLayerImage = self->mTargetLayerImage;
  if (mTargetLayerImage)
  {
    [(MRImage *)mTargetLayerImage releaseByUser];
    self->mTargetLayerImage = 0;
  }
}

- (BOOL)isNative3D
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"isNative3D"];
  return [v2 BOOLValue];
}

- (BOOL)isOpaque
{
  id v2 = [(NSDictionary *)self->mDescription objectForKey:@"isOpaque"];
  return [v2 BOOLValue];
}

- (BOOL)isAlphaFriendly
{
  if (![(NSDictionary *)self->mDescription objectForKey:@"isAlphaFriendly"]) {
    return 1;
  }
  id v3 = [(NSDictionary *)self->mDescription objectForKey:@"isAlphaFriendly"];
  return [v3 BOOLValue];
}

- (BOOL)isInfinite
{
  return 0;
}

- (BOOL)prerenderForTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  self->_progress = a3;
  mSourceLayer = self->mSourceLayer;
  [(MRLayerClock *)[(MRLayer *)mSourceLayer clock] externalTime];
  -[MRLayer prerenderForTime:inContext:withArguments:](mSourceLayer, "prerenderForTime:inContext:withArguments:", a4, a5);
  mTargetLayer = self->mTargetLayer;
  [(MRLayerClock *)[(MRLayer *)mTargetLayer clock] externalTime];
  -[MRLayer prerenderForTime:inContext:withArguments:](mTargetLayer, "prerenderForTime:inContext:withArguments:", a4, a5);
  return 1;
}

- (void)renderAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
}

- (id)retainedByUserRenderedImageAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  return 0;
}

- (id)patchworkAtTime:(double)a3 inContext:(id)a4 withArguments:(id)a5
{
  if (self->mPixelSize.width <= 0.0 || self->mPixelSize.height <= 0.0) {
    return 0;
  }
  id v6 = [(MRTransition *)self retainedByUserRenderedImageAtTime:a4 inContext:a5 withArguments:a3];
  [a4 localAspectRatio];
  id v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", objc_msgSend(v6, "insertingInCollection"), @"image", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", -1.0, 2.0 / v7 * -0.5, 2.0, 2.0 / v7), @"rectangle", 0);
  v9 = +[NSArray arrayWithObject:v8];

  [v6 releaseByUser];
  return v9;
}

- (MRLayer)sourceLayer
{
  return (MRLayer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSourceLayer:(id)a3
{
}

- (MRLayer)targetLayer
{
  return (MRLayer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTargetLayer:(id)a3
{
}

- (MRImage)sourceLayerImage
{
  return self->mSourceLayerImage;
}

- (MRImage)targetLayerImage
{
  return self->mTargetLayerImage;
}

- (NSString)transitionID
{
  return self->mTransitionID;
}

- (NSString)presetID
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPresetID:(id)a3
{
}

- (NSDictionary)attributes
{
  return self->mAttributes;
}

- (CGSize)pixelSize
{
  double width = self->mPixelSize.width;
  double height = self->mPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPixelSize:(CGSize)a3
{
  self->mPixelSize = a3;
}

- (double)progress
{
  return self->_progress;
}

- (char)direction
{
  return self->_direction;
}

- (void)setDirection:(char)a3
{
  self->_direction = a3;
}

- (BOOL)isTransitioning
{
  return 1;
}

- (BOOL)dependsOnFingerPosition
{
  return 0;
}

- (double)pzrStart:(id)a3
{
  return 0.0;
}

- (double)pzrUpdate:(id)a3
{
  return 0.0;
}

- (double)pzrEnd:(id)a3
{
  return 0.0;
}

- (double)pzrCancel:(id)a3
{
  return 0.0;
}

@end