@interface PVMotionEffect
+ (BOOL)replacedMappedEffectWithNewPath:(id)a3;
+ (id)_bundleLibPaths;
+ (id)_effectPathFromID:(id)a3;
+ (id)_userLibPaths;
+ (id)effectMap;
+ (id)motionComponentClasses;
+ (id)motionEffectPropertyKeyToPublishedParameterNameMap;
+ (id)newEffectWithData:(id)a3;
+ (id)newEffectWithURL:(id)a3;
+ (id)publishedParameterNameToMotionEffectPropertyKeyMap;
+ (void)extractMetadataFromContentsOfFile:(id)a3 toCacheEntry:(id)a4;
+ (void)handleApplicationDidReceiveMemoryWarning;
+ (void)handleApplicationWillTerminate;
+ (void)handleCleanupEffectsCache;
+ (void)initializeMotion;
+ (void)initializeMotionInternal;
+ (void)mapTemplatesInDirectory:(id)a3 doingRescan:(BOOL)a4 origCache:(id)a5 newCache:(id)a6;
+ (void)registerEffects;
+ (void)registerNoneEffectForType:(id)a3 effectID:(id)a4 origCache:(id)a5 newCache:(id)a6;
+ (void)registerTemplateInDirectory:(id)a3 relPath:(id)a4 effectID:(id)a5 doingRescan:(BOOL)a6 origCache:(id)a7 newCache:(id)a8;
+ (void)scanTemplatesInDirectory:(id)a3 doingRescan:(BOOL)a4 replaceMappedEffectPath:(BOOL)a5 origCache:(id)a6 newCache:(id)a7;
- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3;
- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration;
- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (BOOL)didCacheInvalidatingParameterChange_NoLock:(id)a3 key:(id)a4;
- (BOOL)didSetCacheInvalidatingParameter_NoLock:(id)a3 forKey:(id)a4;
- (BOOL)forceDisableBuildAnimation;
- (BOOL)forceDisableLoop;
- (BOOL)forceRenderAtPosterFrame;
- (BOOL)hasAllNecessaryResources;
- (BOOL)hasBuiltInEnvironment;
- (BOOL)hasPlayableAspectOverride_NoLock;
- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- (BOOL)isBuildInAnimationEnabled;
- (BOOL)isBuildOutAnimationEnabled;
- (BOOL)isCameraOverrideEnabled;
- (BOOL)isEphemeralProperty:(id)a3;
- (BOOL)isLandscape:(id)a3;
- (BOOL)isLoopedRangeRenderCacheable;
- (BOOL)isReady;
- (BOOL)isRenderCachingDisabled_NoLock:(id *)a3;
- (BOOL)isSketch;
- (BOOL)isTemporalProperty:(id)a3;
- (BOOL)isTextFlipped;
- (BOOL)isTitleCard;
- (BOOL)isTranscription;
- (BOOL)isVisibleAtTime_NoLock:(id *)a3 timedProperties:(id)a4 defaultProperties:(id)a5;
- (BOOL)loadResources;
- (BOOL)loadResources_NoLock;
- (BOOL)loopTimeOverrideEnabled;
- (BOOL)parameterInvalidatesCache_NoLock:(id)a3;
- (BOOL)resourcesAreReady;
- (BOOL)supportsExtendedRangeInputs;
- (BOOL)supportsFlippingText;
- (BOOL)supportsOrientation;
- (BOOL)supportsParam:(id)a3;
- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4;
- (BOOL)transformUnitsAreInMeters;
- (BOOL)useLocalLoopTime;
- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11;
- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:;
- (CGRect)outputROI;
- (CGRect)outputROI_NoLock:(const void *)a3 scale:(double)a4;
- (CGSize)documentSize;
- (CGSize)outputSize;
- (HGRect)makeCropRectForDOD:(HGRect)a3 renderRect:(CGRect)a4 renderScale:(float)a5;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8;
- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9;
- (PVMotionEffect)initWithContentID:(id)a3 andDictionary:(id)a4;
- (PVMotionEffect)initWithEffectID:(id)a3;
- (PVMotionEffectHitAreaComponent)hitAreaComponent;
- (PVMotionEffectSceneManagerComponent)sceneManagerComponent;
- (PVMotionEffectTextComponent)textComponent;
- (PVMotionEffectTimelineComponent)timelineComponent;
- (PVMotionEffectTranscriptionComponent)transcriptionComponent;
- (PVMotionEffectTransformComponent)transformComponent;
- (double)playableAspectRatio_NoLock;
- (double)timelineDurationInSeconds;
- (double)timelineFrameRate;
- (double)topLevelOpacity;
- (id)addToTopLevelTransform:(_OWORD *)a3 atTime:(long long *)a4 forcePosterFrame:restrictToBounds:viewSize:viewOrigin:;
- (id)attributedStringAtIndex:(unint64_t)a3;
- (id)cameraProjection;
- (id)cameraTransform;
- (id)debugDisplayName;
- (id)defaultAttributedString:(unint64_t)a3;
- (id)effectParameters;
- (id)ephemeralProperties;
- (id)handleForOZID:(unsigned int)a3;
- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)mainTitle;
- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- (id)posterFrameMarker;
- (id)projectPath;
- (id)projectURL;
- (id)publishedParam_NoLock:(const void *)a3 forKey:(id)a4 atTime:(id *)a5 includeHidden:(BOOL)a6;
- (id)publishedParams_NoLock:(const void *)a3;
- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8;
- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7;
- (id)subtitle;
- (id)temporalProperties;
- (id)textEditingBounds:(id *)a3;
- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6;
- (id)timelineMarkers;
- (id)timelineMarkersOfType:(int)a3;
- (id)topLevelGroupTransform;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6;
- (int)getOSFAOption:(id)a3;
- (int)orientation;
- (int)origin;
- (int)playableContentMode_NoLock;
- (int)stillImageInverseToneMapOperator:(id)a3;
- (int8x16_t)convertPointFromView:(uint64_t)a1@<X0> atTime:(long long *)a2@<X2> viewSize:(__n128 *)a3@<X8> viewOrigin:(__n128)a4@<Q2>;
- (int8x16_t)getScale;
- (uint64_t)convertPointToView:(long long *)a3 withEffectToViewTransform:(_OWORD *)a4 viewSize:;
- (unsigned)timelineDurationInFrames;
- (void)_commonInitWithProjectPathOverride:(id)a3;
- (void)_configureComponents;
- (void)_documentDidUnload_NoLock;
- (void)add3DObject:(id)a3 handle:(id)a4;
- (void)adjustCamera:(id)a3;
- (void)adjustCutawayBorder:(id)a3;
- (void)adjustCutawayFadeAnimation:(id)a3;
- (void)adjustCutawayInputs:(void *)a3 splitCropRectA:(id)a4 splitCropRectB:(id)a5 pipRect:(id)a6 pipScaleFactor:(id)a7 renderScale:(float)a8 pipNeedsCrop:(BOOL)a9 isHDRRender:(BOOL)a10 workingColorSpace:(CGColorSpace *)a11;
- (void)adjustKenBurnsAnimation:(id)a3;
- (void)adjustPosition:(id)a3;
- (void)adjustTransitionInputs:(void *)a3 renderScale:(float)a4 renderer:(const void *)a5 inputANeedsBackground:(BOOL)a6 inputBNeedsBackground:(BOOL)a7 slideCropRectA:(id)a8 slideCropRectB:(id)a9;
- (void)applyARData:(id)a3 time:(id *)a4 renderParams:(_OZXRenderParams *)a5;
- (void)applyInspectableProperties;
- (void)applyInspectableProperties_NoLock;
- (void)beginEditingTextAtIndex:(unsigned int)a3;
- (void)beginTextEditing;
- (void)buildDropZoneIdMap_NoLock;
- (void)clearTranscription;
- (void)dealloc;
- (void)deleteObjectsWithHandles:(id)a3;
- (void)deleteTemporalInspectableProperties;
- (void)disableBackgroundMovie:(BOOL)a3;
- (void)disableCameraOverride;
- (void)disableElementWithPublishedParam:(PCString *)a3 disable:(BOOL)a4;
- (void)enableCameraOverride:(id)a3 projection:(id)a4;
- (void)endEditingTextAtIndex:(unsigned int)a3;
- (void)endTextEditing;
- (void)loadDocument_NoLock;
- (void)loadEffectInternal_NoLock;
- (void)releaseResources;
- (void)resetToDefaultTranscriptionForLocaleID:(id)a3;
- (void)runEnsuringDocumentReadyAndLockingDocument:(id)a3;
- (void)runEnsuringDocumentReady_NoLock:(id)a3;
- (void)runWithDocument_NoLock:(id)a3;
- (void)setAttributedString:(id)a3 atIndex:(unint64_t)a4;
- (void)setBuildInAnimationEnabled:(BOOL)a3;
- (void)setBuildOutAnimationEnabled:(BOOL)a3;
- (void)setEffectOutputAspectWithProperties_NoLock:(id)a3 allProperties:(id)a4;
- (void)setEffectOutputAspect_NoLock:(double)a3 playableAspect:(double)a4 playableContentMode:(int)a5;
- (void)setEffectParameters:(id)a3;
- (void)setForceDisableBuildAnimation:(BOOL)a3;
- (void)setForceDisableLoop:(BOOL)a3;
- (void)setForceRenderAtPosterFrame:(BOOL)a3;
- (void)setIsFrontFacingCamera:(BOOL)a3;
- (void)setLoopTimeOverride:(id *)a3;
- (void)setLoopTimeOverrideEnabled:(BOOL)a3;
- (void)setLoopedRangeRenderIsCacheable:(BOOL)a3;
- (void)setMainTitle:(id)a3;
- (void)setMaskPoints:(id)a3;
- (void)setNodeIDToCache:(unsigned int)a3;
- (void)setQuaternion:(double)a3 :(double)a4 :(double)a5 :(double)a6;
- (void)setRollRadians:(double)a3;
- (void)setScale:(PVMotionEffect *)self;
- (void)setSketchStrokes:(id)a3;
- (void)setString:(id)a3 atIndex:(unint64_t)a4;
- (void)setSubtitle:(id)a3;
- (void)setTopLevelGroupTransform:(id)a3;
- (void)setTopLevelOpacity:(double)a3;
- (void)setTranscriptionText:(id)a3;
- (void)setTransform:(id)a3;
- (void)setTransformUnitsAreInMeters:(BOOL)a3;
- (void)setUseLocalLoopTime:(BOOL)a3;
- (void)setupPublishedParameters:(id)a3;
- (void)setupTransitionParameters:(id)a3;
- (void)updateInspectableProperties;
- (void)updateInspectableProperties:(id)a3;
- (void)updateInspectableProperties_NoLock:(id)a3 componentTime:(id *)a4;
- (void)updateSketchAnimation:(id)a3 defaultProperties:(id)a4 time:(id *)a5;
@end

@implementation PVMotionEffect

- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  textComponent = self->_textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  v8 = [(PVMotionEffectTextComponent *)textComponent textEditingBoundsAtTime:&v10 forcePosterFrame:a4 useParagraphBounds:a5 includeDropShadow:a6 includeMasks:a7];

  return v8;
}

- (id)textEditingBounds:(id *)a3
{
  textComponent = self->_textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a3;
  v4 = [(PVMotionEffectTextComponent *)textComponent textEditingBounds:&v6];

  return v4;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  textComponent = self->_textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  v7 = -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:viewSize:viewOrigin:](textComponent, "textTransformsAtTime:forcePosterFrame:viewSize:viewOrigin:", &v9, a4, *(void *)&a6, a5.width, a5.height);

  return v7;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  textComponent = self->_textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  v8 = -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](textComponent, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v10, a4, a5, *(void *)&a7, a6.width, a6.height);

  return v8;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  textComponent = self->_textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = -[PVMotionEffectTextComponent textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](textComponent, "textTransformsAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v11, a4, a5, a6, *(void *)&a8, a7.width, a7.height);

  return v9;
}

- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9
{
  result = (PVCGPointQuad *)self->_textComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  if (result) {
    return (PVCGPointQuad *)-[PVCGPointQuad textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](result, "textCornersAtTime:index:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v11, a5, a6, a7, *(void *)&a10, a8.x, a8.y, a9.width, a9.height);
  }
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  return result;
}

- (void)beginTextEditing
{
}

- (void)beginEditingTextAtIndex:(unsigned int)a3
{
}

- (void)endTextEditing
{
}

- (void)endEditingTextAtIndex:(unsigned int)a3
{
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  return [(PVMotionEffectTextComponent *)self->_textComponent attributedStringAtIndex:a3];
}

- (id)defaultAttributedString:(unint64_t)a3
{
  return [(PVMotionEffectTextComponent *)self->_textComponent defaultAttributedString:a3];
}

- (void)setString:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setAttributedString:(id)a3 atIndex:(unint64_t)a4
{
}

- (id)mainTitle
{
  return [(PVMotionEffectTextComponent *)self->_textComponent mainTitle];
}

- (void)setMainTitle:(id)a3
{
}

- (id)subtitle
{
  return [(PVMotionEffectTextComponent *)self->_textComponent subtitle];
}

- (void)setSubtitle:(id)a3
{
}

- (BOOL)supportsFlippingText
{
  return [(PVMotionEffectTextComponent *)self->_textComponent supportsFlippingText];
}

- (BOOL)supportsOrientation
{
  return [(PVMotionEffectTextComponent *)self->_textComponent supportsOrientation];
}

- (BOOL)isTextFlipped
{
  return [(PVMotionEffectTextComponent *)self->_textComponent isTextFlipped];
}

- (BOOL)isTitleCard
{
  return [(PVMotionEffectTextComponent *)self->_textComponent isTitleCard];
}

- (int)orientation
{
  return [(PVMotionEffectTextComponent *)self->_textComponent orientation];
}

- (BOOL)isTranscription
{
  return [(PVMotionEffectTranscriptionComponent *)self->_transcriptionComponent isTranscription];
}

- (void)clearTranscription
{
}

- (void)resetToDefaultTranscriptionForLocaleID:(id)a3
{
}

- (void)setTranscriptionText:(id)a3
{
}

- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4
{
  transcriptionComponent = self->_transcriptionComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v6 = *a4;
  return -[PVMotionEffectTranscriptionComponent transcriptionHitTest:time:](transcriptionComponent, "transcriptionHitTest:time:", &v6, a3.x, a3.y);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_transcriptionComponent;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result transcriptionDuration];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8
{
  result = (PVCGPointQuad *)self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  if (result) {
    return (PVCGPointQuad *)-[PVCGPointQuad cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](result, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v10, a5, a6, *(void *)&a9, a7.x, a7.y, a8.width, a8.height);
  }
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  return result;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  transformComponent = self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a3;
  v7 = -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:viewSize:viewOrigin:](transformComponent, "transformAtTime:forcePosterFrame:viewSize:viewOrigin:", &v9, a4, *(void *)&a6, a5.width, a5.height);

  return v7;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  transformComponent = self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  v8 = -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](transformComponent, "transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v10, a4, a5, *(void *)&a7, a6.width, a6.height);

  return v8;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  transformComponent = self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:](transformComponent, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:", &v11, a4, a5, a6, *(void *)&a8, a7.width, a7.height);

  return v9;
}

- (id)addToTopLevelTransform:(_OWORD *)a3 atTime:(long long *)a4 forcePosterFrame:restrictToBounds:viewSize:viewOrigin:
{
  v4 = *(void **)(a1 + 280);
  long long v5 = a3[5];
  v13[4] = a3[4];
  v13[5] = v5;
  long long v6 = a3[7];
  v13[6] = a3[6];
  v13[7] = v6;
  long long v7 = a3[1];
  v13[0] = *a3;
  v13[1] = v7;
  long long v8 = a3[3];
  v13[2] = a3[2];
  v13[3] = v8;
  uint64_t v12 = *((void *)a4 + 2);
  long long v11 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = objc_msgSend(v4, "addToTopLevelTransform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:", v13, &v11);

  return v9;
}

- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:
{
  long long v8 = *(_OWORD *)&a3->var0;
  transformComponent = self->_transformComponent;
  long long v10 = *(_OWORD *)a4;
  v13[1] = *(_OWORD *)&a3->var3;
  long long v14 = v10;
  uint64_t v15 = *(void *)(a4 + 16);
  v13[0] = v8;
  [(PVMotionEffectTransformComponent *)transformComponent convertPointToView:v13 atTime:&v14 forcePosterFrame:a5 includeTransformAnimation:a6 includePlayableAspectScale:*(void *)&a8 viewSize:a7.width viewOrigin:a7.height];
  result.y = v12;
  result.x = v11;
  return result;
}

- (uint64_t)convertPointToView:(long long *)a3 withEffectToViewTransform:(_OWORD *)a4 viewSize:
{
  long long v4 = *a3;
  long long v5 = a3[1];
  long long v6 = *(void **)(a1 + 280);
  long long v7 = a4[5];
  v13[4] = a4[4];
  v13[5] = v7;
  long long v8 = a4[7];
  v13[6] = a4[6];
  v13[7] = v8;
  long long v9 = a4[1];
  v13[0] = *a4;
  v13[1] = v9;
  long long v10 = a4[3];
  _OWORD v13[2] = a4[2];
  v13[3] = v10;
  v12[0] = v4;
  v12[1] = v5;
  return objc_msgSend(v6, "convertPointToView:withEffectToViewTransform:viewSize:", v12, v13);
}

- (int8x16_t)convertPointFromView:(uint64_t)a1@<X0> atTime:(long long *)a2@<X2> viewSize:(__n128 *)a3@<X8> viewOrigin:(__n128)a4@<Q2>
{
  long long v5 = *(void **)(a1 + 280);
  long long v10 = *a2;
  uint64_t v11 = *((void *)a2 + 2);
  if (v5)
  {
    objc_msgSend(v5, "convertPointFromView:atTime:viewSize:viewOrigin:", &v10);
    int8x16_t result = v8;
    unint64_t v7 = vextq_s8(result, result, 8uLL).u64[0];
    a4.n128_u64[0] = v9;
  }
  else
  {
    result.i64[0] = 0;
    unint64_t v7 = 0;
    a4.n128_u64[0] = 0;
  }
  result.i64[1] = v7;
  *a3 = (__n128)result;
  a3[1] = a4;
  return result;
}

- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  transformComponent = self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  int8x16_t v8 = -[PVMotionEffectTransformComponent setPositionInView:atTime:viewSize:viewOrigin:restrictToBounds:](transformComponent, "setPositionInView:atTime:viewSize:viewOrigin:restrictToBounds:", &v10, *(void *)&a6, a7, a3.x, a3.y, a5.width, a5.height);

  return v8;
}

- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8
{
  transformComponent = self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  unint64_t v9 = -[PVMotionEffectTransformComponent scaleToFit:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:](transformComponent, "scaleToFit:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:", &v11, a5, *(void *)&a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a6.width, a6.height);

  return v9;
}

- (void)setTopLevelGroupTransform:(id)a3
{
}

- (id)topLevelGroupTransform
{
  return [(PVMotionEffectTransformComponent *)self->_transformComponent topLevelGroupTransform];
}

- (void)setTransform:(id)a3
{
}

- (void)setScale:(PVMotionEffect *)self
{
  long long v3 = v2[1];
  transformComponent = self->_transformComponent;
  v5[0] = *v2;
  v5[1] = v3;
  [(PVMotionEffectTransformComponent *)transformComponent setScale:v5];
}

- (int8x16_t)getScale
{
  long long v4 = *(void **)(a1 + 280);
  if (v4)
  {
    [v4 getScale];
    int8x16_t result = v7;
    unint64_t v6 = vextq_s8(result, result, 8uLL).u64[0];
    a3.n128_u64[0] = v8;
  }
  else
  {
    result.i64[0] = 0;
    unint64_t v6 = 0;
    a3.n128_u64[0] = 0;
  }
  result.i64[1] = v6;
  *a2 = (__n128)result;
  a2[1] = a3;
  return result;
}

- (id)cameraTransform
{
  return [(PVMotionEffectTransformComponent *)self->_transformComponent cameraTransform];
}

- (id)cameraProjection
{
  return [(PVMotionEffectTransformComponent *)self->_transformComponent cameraProjection];
}

- (void)enableCameraOverride:(id)a3 projection:(id)a4
{
}

- (void)disableCameraOverride
{
}

- (BOOL)isCameraOverrideEnabled
{
  return [(PVMotionEffectTransformComponent *)self->_transformComponent isCameraOverrideEnabled];
}

- (BOOL)transformUnitsAreInMeters
{
  return [(PVMotionEffectTransformComponent *)self->_transformComponent transformUnitsAreInMeters];
}

- (void)setTransformUnitsAreInMeters:(BOOL)a3
{
}

- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  transformComponent = self->_transformComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = *a4;
  return [(PVMotionEffectTransformComponent *)transformComponent bounds:a3 atTime:&v9 forcePosterFrame:a5 includeDropShadow:a6 includeMasks:a7];
}

- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  hitAreaComponent = self->_hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = -[PVMotionEffectHitAreaComponent hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:](hitAreaComponent, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v11, a4, a5, *(void *)&a8, a6.x, a6.y, a7.width, a7.height);

  return v9;
}

- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  hitAreaComponent = self->_hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  return -[PVMotionEffectHitAreaComponent hitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:](hitAreaComponent, "hitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:", &v13, a5, a7, *(void *)&a11, a3.x, a3.y, a6.x, a6.y, a8, a9, a10.width, a10.height);
}

- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11
{
  hitAreaComponent = self->_hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a3;
  return -[PVMotionEffectHitAreaComponent createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:](hitAreaComponent, "createPathsForHitTestingAtTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:outExpandedPath:", &v13, a4, a6, *(void *)&a10, a11, a5.x, a5.y, a7, a8, a9.width, a9.height);
}

- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  hitAreaComponent = self->_hitAreaComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  double v12 = -[PVMotionEffectHitAreaComponent objectHitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:](hitAreaComponent, "objectHitTest:atTime:forcePosterFrame:scale:adjustForMinimumSize:minimumSize:sizeThreshold:viewSize:viewOrigin:", &v14, a5, a7, *(void *)&a11, a3.x, a3.y, a6.x, a6.y, a8, a9, a10.width, a10.height);

  return v12;
}

- (void)add3DObject:(id)a3 handle:(id)a4
{
}

- (void)deleteObjectsWithHandles:(id)a3
{
}

- (id)handleForOZID:(unsigned int)a3
{
  return [(PVMotionEffectSceneManagerComponent *)self->_sceneManagerComponent handleForOZID:*(void *)&a3];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration
{
  int8x16_t result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result timelineDuration];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (unsigned)timelineDurationInFrames
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent timelineDurationInFrames];
}

- (double)timelineDurationInSeconds
{
  [(PVMotionEffectTimelineComponent *)self->_timelineComponent timelineDurationInSeconds];
  return result;
}

- (double)timelineFrameRate
{
  [(PVMotionEffectTimelineComponent *)self->_timelineComponent timelineFrameRate];
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result timelineFrameDuration];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result timelineLastFrame];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result componentTimeFromTimelineTime:&v5];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a4;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result timelineTimeFromComponentTime:&v5];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3
{
  double result = ($202A6A048D39AE170264FF71A65A9479 *)self->_timelineComponent;
  long long v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  if (result) {
    return ($202A6A048D39AE170264FF71A65A9479 *)[($202A6A048D39AE170264FF71A65A9479 *)result componentTimeRangeFromTimelineTimeRange:v6];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3
{
  double result = ($202A6A048D39AE170264FF71A65A9479 *)self->_timelineComponent;
  long long v5 = *(_OWORD *)&a4->var0.var3;
  v6[0] = *(_OWORD *)&a4->var0.var0;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&a4->var1.var1;
  if (result) {
    return ($202A6A048D39AE170264FF71A65A9479 *)[($202A6A048D39AE170264FF71A65A9479 *)result timelineTimeRangeFromComponentTimeRange:v6];
  }
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return result;
}

- (id)timelineMarkers
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent timelineMarkers];
}

- (id)timelineMarkersOfType:(int)a3
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent timelineMarkersOfType:*(void *)&a3];
}

- (id)posterFrameMarker
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent posterFrameMarker];
}

- (void)setLoopTimeOverrideEnabled:(BOOL)a3
{
}

- (BOOL)loopTimeOverrideEnabled
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent loopTimeOverrideEnabled];
}

- (void)setLoopTimeOverride:(id *)a3
{
  timelineComponent = self->_timelineComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  [(PVMotionEffectTimelineComponent *)timelineComponent setLoopTimeOverride:&v4];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride
{
  double result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_timelineComponent;
  if (result) {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)[($3CC8671D27C23BF42ADDB32F2B5E48AE *)result loopTimeOverride];
  }
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)setForceDisableLoop:(BOOL)a3
{
}

- (BOOL)forceDisableLoop
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent forceDisableLoop];
}

- (void)setForceDisableBuildAnimation:(BOOL)a3
{
}

- (BOOL)forceDisableBuildAnimation
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent forceDisableBuildAnimation];
}

- (void)setUseLocalLoopTime:(BOOL)a3
{
}

- (BOOL)useLocalLoopTime
{
  return [(PVMotionEffectTimelineComponent *)self->_timelineComponent useLocalLoopTime];
}

+ (id)newEffectWithURL:(id)a3
{
  id v3 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = [PVMotionEffect alloc];
  long long v5 = [v3 path];
  unint64_t v6 = [(PVMotionEffect *)v4 initWithEffectID:v5];

  return v6;
}

+ (id)newEffectWithData:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = NSTemporaryDirectory();
    long long v5 = [v4 stringByAppendingPathComponent:@"/EffectWithData.moef"];

    unint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
    id v10 = 0;
    [v3 writeToURL:v6 options:1073741825 error:&v10];
    id v7 = v10;
    unint64_t v8 = [[PVMotionEffect alloc] initWithEffectID:v5];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

+ (void)handleApplicationWillTerminate
{
}

+ (void)handleApplicationDidReceiveMemoryWarning
{
  if (s_isMotionInitialized == 1)
  {
    v2 = (OZCacheManager *)OZCacheManager::Instance((OZCacheManager *)a1);
    OZCacheManager::clearTextureCache(v2);
    Instance = (OZFontManagerBase *)TXFontManager::getInstance(v3);
    long long v5 = (PGHelium *)OZFontManagerBase::purgeCachedFonts(Instance);
    PGHelium::purge(v5);
  }
}

+ (void)handleCleanupEffectsCache
{
}

+ (void)extractMetadataFromContentsOfFile:(id)a3 toCacheEntry:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  unint64_t v8 = [[TBXMLHelper alloc] initWithContentsOfURL:v7];
  if ([(TBXMLHelper *)v8 parse])
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = [(TBXMLHelper *)v8 sceneSettings];
    id v10 = [v9 objectForKey:@"theme"];
    if ([v10 length])
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = [@"Themes" stringByAppendingPathComponent:v10];
      double v12 = +[PVHostApplicationDelegateHandler sharedInstance];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = [v12 effectTemplatesBundle];
      $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = [v13 localizedStringForKey:v11 value:@"***MISSING STRING***" table:0];
      if (([v14 isEqualToString:@"***MISSING STRING***"] & 1) == 0)
      {
        id v15 = v14;
        v16 = v10;
        v17 = v9;
        id v18 = v6;
        id v19 = v15;

        id v20 = v19;
        id v6 = v18;
        $3CC8671D27C23BF42ADDB32F2B5E48AE v9 = v17;
        id v10 = v20;
      }
      [v6 setObject:v10 forKey:@"theme"];
    }
    v21 = [v5 pathExtension];
    if ([v21 isEqualToString:@"motn"])
    {
    }
    else
    {
      v22 = [v5 pathExtension];
      char v23 = [v22 isEqualToString:@"moti"];

      if ((v23 & 1) == 0)
      {
        v36 = [v5 pathExtension];
        int v37 = [v36 isEqualToString:@"motr"];

        if (!v37) {
          goto LABEL_34;
        }
        v38 = [v9 objectForKey:@"shouldOverrideFCDuration"];
        v39 = v38;
        if (!v38) {
          goto LABEL_34;
        }
        char v40 = [v38 BOOLValue];

        if ((v40 & 1) == 0) {
          goto LABEL_34;
        }
      }
    }
    v24 = [v9 objectForKey:@"duration"];
    int32_t v25 = [v24 integerValue];

    v26 = [v9 objectForKey:@"frameRate"];
    v27 = v26;
    if (v25 < 1 || !v26 || ([v26 doubleValue], v28 <= 0.0))
    {
LABEL_33:

LABEL_34:
      goto LABEL_35;
    }
    [v27 doubleValue];
    double v30 = v29;
    v31 = [v9 objectForKey:@"NTSC"];
    char v32 = [v31 BOOLValue];

    memset(&v47, 0, sizeof(v47));
    signed int v33 = vcvtmd_s64_f64(v30 + 0.5 + 0.0000001);
    if (v33 == 30) {
      char v34 = v32;
    }
    else {
      char v34 = 0;
    }
    if (v34)
    {
      int64_t v35 = 4004;
    }
    else
    {
      if (v33 == 24) {
        char v41 = v32;
      }
      else {
        char v41 = 0;
      }
      if (v41)
      {
        int64_t v35 = 5005;
      }
      else
      {
        if (v33 == 60) {
          char v42 = v32;
        }
        else {
          char v42 = 0;
        }
        if ((v42 & 1) == 0)
        {
          if (v33)
          {
            if (600 / v33 * v33 == 600)
            {
              int64_t v35 = (uint64_t)(600 / v33) << 8;
              int32_t v43 = 153600;
              goto LABEL_32;
            }
            int32_t v43 = v33 << 8;
          }
          else
          {
            int32_t v43 = 7680;
          }
          int64_t v35 = 256;
LABEL_32:
          CMTimeMake(&v46, v35, v43);
          operator*(&v46, v25, &v47);
          CMTime v45 = v47;
          v44 = +[FigTimeObj timeWithTime:&v45];
          [v6 setObject:v44 forKey:@"suggestedDuration"];

          goto LABEL_33;
        }
        int64_t v35 = 2002;
      }
    }
    int32_t v43 = 120000;
    goto LABEL_32;
  }
LABEL_35:
}

+ (id)effectMap
{
  if (+[PVMotionEffect effectMap]::once != -1) {
    dispatch_once(&+[PVMotionEffect effectMap]::once, &__block_literal_global_14);
  }
  v2 = (void *)+[PVMotionEffect effectMap]::sEffectMap;

  return v2;
}

void __27__PVMotionEffect_effectMap__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", @".../Transitions.localized/iMovie.localized/Basics.localized/Cross Dissolve.localized/Cross Dissolve.motr", @"1434131D-6C72-4FDB-8365-01B93DD44905", @".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Left.localized/Slide To Left.motr", @"17546984-5563-442C-A5AA-ABC8DD26C3AB", @".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Right.localized/Slide To Right.motr", @"1FF96A46-41CF-4454-9BA6-7887F249BCF2", @".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Top.localized/Slide To Top.motr", @"2039D994-9DAE-40E8-B34F-8F12B78672E7", @".../Transitions.localized/iMovie.localized/Basics.localized/Slide To Bottom.localized/Slide To Bottom.motr", @"2DDB4EC6-E394-470C-B326-7BFA9744BC65", @".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Left.localized/Wipe To Left.motr", @"35B74472-3827-492A-94F8-3AD495876439", @".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Right.localized/Wipe To Right.motr", @"3E6CF06F-CED2-41CF-B469-9FFD995C33B0", @".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Top.localized/Wipe To Top.motr", @"46B43980-CBDF-43C1-BA0C-AC35120C16EA", @".../Transitions.localized/iMovie.localized/Basics.localized/Wipe To Bottom.localized/Wipe To Bottom.motr",
         @"47BC340E-1358-4CEE-BCFD-3F9133B3ED8E",
         @".../Transitions.localized/iMovie.localized/Cutaways.localized/Picture In Picture.localized/Picture In Picture.motr",
         @"570D6022-EAA4-4075-8AAA-32223C7A8D4E",
         @".../Transitions.localized/iMovie.localized/Cutaways.localized/Split Screen.localized/Split Screen.motr",
         @"686E482D-F140-45D0-8136-1B8B4FDAB6D0",
         @".../Transitions.localized/iMovie.localized/Cutaways.localized/Green Screen.localized/Green Screen.motr",
         @"C2B90894-CDDC-4FFF-9B2A-CD31CB33B106",
         @".../Effects.localized/iMovie.localized/Ken Burns.localized/Ken Burns.moef",
         @"697D2F7A-CA06-48E5-82BF-95FD57AC6D1B",
         @".../Effects.localized/iMovie.localized/B&W.localized/B&W.moef",
         @"E50C1035-19C5-4EFF-AAB4-B3008BC14D04",
         @".../Effects.localized/iMovie.localized/Blast.localized/Blast.moef",
         @"CAA078D7-0ACA-432E-85B1-FB975BE96A80",
         @".../Effects.localized/iMovie.localized/Blockbuster.localized/Blockbuster.moef",
         @"7F57747E-6F2A-4D31-806C-67B4F09A93CA",
         @".../Effects.localized/iMovie.localized/Blue.localized/Blue.moef",
         @"8286EAE4-72A9-4739-970D-12A9EC5EE39D",
         @".../Effects.localized/iMovie.localized/Camo.localized/Camo.moef",
         @"AE493655-7441-401C-82DA-2B53150ADF04",
         @".../Effects.localized/iMovie.localized/Dreamy.localized/Dreamy.moef",
         @"BF65FA4F-DF9E-4BA1-AF3A-EDABE6AAC849",
         @".../Effects.localized/iMovie.localized/Duotone.localized/Duotone.moef",
         @"B1AF5729-DBD8-458F-AA8C-14431E269F91",
         @".../Effects.localized/iMovie.localized/Silent Era.localized/Silent Era.moef",
         @"F8AE5EB3-7B25-48EA-B553-A3ABC3BF4E22",
         @".../Effects.localized/iMovie.localized/Vintage.localized/Vintage.moef",
         @"FDA1996F-CE2F-4D2B-9C02-63C38F6D260E",
         @".../Effects.localized/iMovie.localized/Western.localized/Western.moef",
         @"F97E8C77-4E0D-4F19-9A5C-E738CB736808",
         @".../Effects.localized/iMovie.localized/FadeInOut Through Color.localized/FadeInOut Through Color.moef",
         @"2DE6E421-5B7A-429F-9FDE-2727F3F893D6",
         @".../Titles.localized/iMovie.localized/Simple.localized/Box.localized/Box.moti",
         @"67379F38-96D6-4E67-A5BD-DA0ADDA7BA45",
         @".../Titles.localized/iMovie.localized/Simple.localized/Lower Thirds.localized/Box.localized/Box.moti",
         @"AA106B51-6EA0-487B-8090-C64F523302C7",
         @".../Titles.localized/iMovie.localized/Simple.localized/Chromatic.localized/Chromatic.moti",
         @"F6F26720-0BEE-4E50-AF8B-F48333631B81",
         @".../Titles.localized/iMovie.localized/Simple.localized/Lower Thirds.localized/Chromatic.localized/Chromatic.moti",
         @"B7B8CD36-9550-4E75-BB6D-8B3DE402F502",
         @".../Titles.localized/iMovie.localized/Simple.localized/Expand.localized/Expand.moti",
         @"F2EDB25D-FDE3-4402-85FB-B977F3A2121D",
         @".../Titles.localized/iMovie.localized/Simple.localized/Lower Thirds.localized/Expand.localized/Expand.moti",
         @"1AA45B2B-274B-4925-A00C-C79F8E74EBAD",
         @".../Titles.localized/iMovie.localized/Simple.localized/Focus.localized/Focus.moti");
  v1 = (void *)+[PVMotionEffect effectMap]::sEffectMap;
  +[PVMotionEffect effectMap]::sEffectMap = v0;
}

+ (id)_effectPathFromID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 effectMap];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

+ (void)registerTemplateInDirectory:(id)a3 relPath:(id)a4 effectID:(id)a5 doingRescan:(BOOL)a6 origCache:(id)a7 newCache:(id)a8
{
  id v54 = a3;
  id v10 = a4;
  id v53 = a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = [v10 pathExtension];
  char v12 = [v11 isEqualToString:@"moef"];

  if (v12)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = @"Effects.localized";
    $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = kFFEffectType_VideoFilter;
  }
  else
  {
    id v15 = [v10 pathExtension];
    char v16 = [v15 isEqualToString:@"motn"];

    if (v16)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = @"Generators.localized";
      $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = kFFEffectType_VideoGenerator;
    }
    else
    {
      v17 = [v10 pathExtension];
      char v18 = [v17 isEqualToString:@"motr"];

      if (v18)
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = @"Transitions.localized";
        $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = kFFEffectType_VideoTransition;
      }
      else
      {
        id v19 = [v10 pathExtension];
        char v20 = [v19 isEqualToString:@"moti"];

        if ((v20 & 1) == 0) {
          goto LABEL_28;
        }
        $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = @"Titles.localized";
        $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = kFFEffectType_VideoTitle;
      }
    }
  }
  v52 = *v14;
  if ([v10 hasPrefix:@"..."])
  {
    uint64_t v21 = [v10 substringFromIndex:4];

    id v10 = (id)v21;
  }
  v22 = [v54 stringByAppendingPathComponent:v10];
  char v23 = [v22 lastPathComponent];
  v24 = [v23 stringByDeletingPathExtension];

  v50 = v24;
  int32_t v25 = [v22 stringByDeletingLastPathComponent];
  v26 = [v25 lastPathComponent];
  uint64_t v27 = [v26 stringByDeletingPathExtension];

  v49 = (void *)v27;
  if ([v24 isEqualToString:v27]) {
    [v25 lastPathComponent];
  }
  else {
  double v28 = [v10 lastPathComponent];
  }
  v51 = [v28 stringByDeletingPathExtension];

  double v29 = [v10 pathComponents];
  if ((unint64_t)[v29 count] >= 3)
  {
    v31 = [v54 stringByAppendingPathComponent:v13];
    char v32 = [v29 objectAtIndex:1];
    signed int v33 = [v31 stringByAppendingPathComponent:v32];

    char v34 = [v33 lastPathComponent];
    double v30 = [v34 stringByDeletingPathExtension];
  }
  else
  {
    double v30 = @"Motion";
  }
  int64_t v35 = [v22 stringByDeletingLastPathComponent];
  v36 = [v35 stringByAppendingPathComponent:@"large.png"];

  int v37 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v38 = [v37 fileExistsAtPath:v36];

  if ((v38 & 1) == 0)
  {

    v36 = 0;
  }
  v39 = [v22 stringByDeletingLastPathComponent];
  char v40 = [v39 stringByAppendingPathComponent:@"small.png"];

  char v41 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v42 = [v41 fileExistsAtPath:v40];

  if ((v42 & 1) == 0)
  {

    goto LABEL_23;
  }
  if (!v40)
  {
LABEL_23:
    int32_t v43 = [v22 stringByDeletingPathExtension];
    char v40 = [v43 stringByAppendingPathExtension:@"png"];

    v44 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v45 = [v44 fileExistsAtPath:v40];

    if ((v45 & 1) == 0)
    {

      char v40 = 0;
    }
  }
  CMTime v46 = (void *)MEMORY[0x1E4F1CA60];
  CMTime v47 = [NSNumber numberWithBool:1];
  v48 = objc_msgSend(v46, "dictionaryWithObjectsAndKeys:", v51, @"FFEffectProperty_DisplayName", v30, @"FFEffectProperty_Category", v52, @"FFEffectProperty_EffectType", v47, @"FFEffectProperty_AvailableInSimpleMode", v40, @"kFFEffectProperty_ThumbnailImagePath", v36, @"kFFEffectProperty_PreviewImagePath", 0);

  if ([0 length]) {
    [v48 setObject:0 forKey:@"kFFEffectProperty_Theme"];
  }
  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v53 withProperties:v48];

LABEL_28:
}

+ (void)mapTemplatesInDirectory:(id)a3 doingRescan:(BOOL)a4 origCache:(id)a5 newCache:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v19 = [a1 effectMap];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = [v19 allKeys];
  uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    id v13 = 0;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      char v16 = v13;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(id *)(*((void *)&v22 + 1) + 8 * v15);

        v17 = (void *)MEMORY[0x1BA9C0A20]();
        char v18 = [a1 _effectPathFromID:v13];
        [a1 registerTemplateInDirectory:v9 relPath:v18 effectID:v13 doingRescan:0 origCache:v10 newCache:v11];

        ++v15;
        char v16 = v13;
      }
      while (v12 != v15);
      uint64_t v12 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v12);
  }
  if ([v20 count])
  {
    NSLog(&cfstr_WarningSomeMap.isa);
    NSLog(&stru_1F119C630.isa, v20);
  }
}

+ (void)scanTemplatesInDirectory:(id)a3 doingRescan:(BOOL)a4 replaceMappedEffectPath:(BOOL)a5 origCache:(id)a6 newCache:(id)a7
{
  BOOL v9 = a5;
  id v19 = a3;
  id v11 = a6;
  id v12 = a7;
  char v18 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = [v18 enumeratorAtPath:v19];
  for (i = 0; ; i = (void *)v15)
  {
    uint64_t v15 = [v13 nextObject];

    if (!v15) {
      break;
    }
    char v16 = [v19 stringByAppendingPathComponent:v15];
    if (!v9 || ([a1 replacedMappedEffectWithNewPath:v16] & 1) == 0)
    {
      v17 = [@"..." stringByAppendingFormat:@"/%@", v15];
      [a1 registerTemplateInDirectory:v19 relPath:v15 effectID:v17 doingRescan:0 origCache:v11 newCache:v12];
    }
  }
}

+ (BOOL)replacedMappedEffectWithNewPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [a1 effectMap];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(v5, "allKeys", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v5 objectForKeyedSubscript:v10];
        id v12 = [v11 lastPathComponent];
        id v13 = [v4 lastPathComponent];
        if ([v13 isEqualToString:v12])
        {
          [v5 setObject:v4 forKeyedSubscript:v10];

          BOOL v14 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

+ (void)registerNoneEffectForType:(id)a3 effectID:(id)a4 origCache:(id)a5 newCache:(id)a6
{
  id v17 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = [MEMORY[0x1E4F1C9C8] date];
  id v13 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v12, @"modDate", 0);
  [v10 setObject:v13 forKey:v9];

  [v11 setObject:v13 forKey:v9];
  BOOL v14 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v15 = [NSNumber numberWithBool:1];
  long long v16 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", @"None", @"FFEffectProperty_DisplayName", @"Motion", @"FFEffectProperty_Category", v17, @"FFEffectProperty_EffectType", v15, @"FFEffectProperty_AvailableInSimpleMode", 0, @"kFFEffectProperty_ThumbnailImagePath", 0, @"kFFEffectProperty_PreviewImagePath", 0);

  +[PVEffect registerEffectClass:objc_opt_class() forEffectID:v9 withProperties:v16];
}

+ (id)_bundleLibPaths
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v2 = +[PVHostApplicationDelegateHandler sharedInstance];
  id v3 = [v2 effectTemplatesBundle];
  if (v3)
  {
    id v4 = [v2 effectTemplatesDirectoryName];
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    id v6 = v4;
    uint64_t v7 = v6;
    id v21 = v6;
    v22[0] = 0;
    if (v6)
    {
      uint64_t v8 = (void **)v22;
      id v9 = v6;
      do
      {
        id v10 = [v3 pathForResource:v9 ofType:0];
        if (v10) {
          [v5 addObject:v10];
        }

        id v11 = *v8++;
        id v9 = v11;
      }
      while (v11);
    }
    id v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v13 = [v12 integerForKey:@"PVVideoCompositingContextUserMotionEffectsKey"];

    if (v13)
    {
      BOOL v14 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
      uint64_t v15 = [v14 firstObject];

      long long v16 = [v15 stringByAppendingPathComponent:v7];

      id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
      LODWORD(v15) = [v17 fileExistsAtPath:v16];

      if (v15) {
        [v5 addObject:v16];
      }
    }
    if ([v5 count]) {
      long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v5];
    }
    else {
      long long v18 = 0;
    }
    for (uint64_t i = 1; i != -1; --i)
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

+ (id)_userLibPaths
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  id v3 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v4 = [v3 objectAtIndex:0];
  if (v4) {
    [v2 addObject:v4];
  }
  if ([v2 count]) {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v2];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

+ (void)registerEffects
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((+[PVMotionEffect registerEffects]::sRegistered & 1) == 0)
  {
    +[PVMotionEffect registerEffects]::sRegistered = 1;
    id v3 = [a1 _bundleLibPaths];
    id v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(0, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = [v3 reverseObjectEnumerator];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          [a1 mapTemplatesInDirectory:*(void *)(*((void *)&v22 + 1) + 8 * v8++) doingRescan:0 origCache:0 newCache:v4];
        }
        while (v6 != v8);
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }

    id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v10 = [v9 integerForKey:@"PVVideoCompositingContextUserMotionEffectsKey"];

    id v11 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    uint64_t v12 = [v11 integerForKey:@"PVReplaceShippingEffectsWithDocumentsEffects"];

    if (v10)
    {
      uint64_t v13 = [a1 _userLibPaths];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      BOOL v14 = objc_msgSend(v13, "reverseObjectEnumerator", 0);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v14);
            }
            [a1 scanTemplatesInDirectory:*(void *)(*((void *)&v18 + 1) + 8 * v17++) doingRescan:0 replaceMappedEffectPath:v12 != 0 origCache:0 newCache:v4];
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v18 objects:v26 count:16];
        }
        while (v15);
      }
    }
    [a1 registerNoneEffectForType:@"effect.video.filter" effectID:@"737C8717-70E0-4CCE-8F19-17A0532E836F" origCache:0 newCache:v4];
    [a1 registerNoneEffectForType:@"effect.video.title" effectID:@"4390FE7A-3408-4EB5-A049-AA394C03A911" origCache:0 newCache:v4];
    [a1 registerNoneEffectForType:@"effect.video.transition" effectID:@"67EB7544-E4A1-4508-9733-E201AADFBC15" origCache:0 newCache:v4];
    [a1 initializeMotion];
  }
}

+ (void)initializeMotion
{
  v2 = (PVDocumentAccessController *)PVDocumentAccessController::INSTANCE((PVDocumentAccessController *)a1);

  PVDocumentAccessController::InitializeMotion(v2);
}

+ (void)initializeMotionInternal
{
  {
    +[PVMotionEffect initializeMotionInternal]::s_initLock = (uint64_t)objc_alloc_init(MEMORY[0x1E4F28E08]);
  }
  [(id)+[PVMotionEffect initializeMotionInternal]::s_initLock lock];
  if ((s_isMotionInitialized & 1) == 0)
  {
    PCInit();
    v2 = +[PVHostApplicationDelegateHandler sharedInstance];
    OZXWaitForAsyncInitialization();
    OZXSetHostDelegate(v2);
    uint64_t v12 = objc_alloc_init(TXMain);
    [(TXMain *)v12 applicationDidFinishLaunching];
    id v3 = objc_alloc_init(BHBehaviorsBundle);
    [(BHBehaviorsBundle *)v3 applicationDidFinishLaunching];
    id v4 = objc_alloc_init(PSMain);
    [(PSMain *)v4 applicationDidFinishLaunching];
    id v5 = +[PROPlugInManager sharedPlugInManager];
    uint64_t v6 = +[OZFxPlugHostPropertiesAPI sharedHostPropertiesAPI];
    [v5 registerAPIObject:v6 forProtocol:&unk_1F121E168 version:1];

    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v5 scanForPlugInsInBundle:v7 deferralNotification:&__block_literal_global_2065];
    +[PAEDummyiOS setup];
    if (kNoPanZoomEnabled == -1)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      kNoPanZoomEnabled = [v8 BOOLForKey:@"noPanZoomAnchoring"];
    }
    s_isMotionInitialized = 1;
    id v9 = (void *)kPVAlignmentLeft;
    kPVAlignmentLeft = (uint64_t)&unk_1F11EC1A8;

    uint64_t v10 = (void *)kPVAlignmentRight;
    kPVAlignmentRight = (uint64_t)&unk_1F11EC1C0;
  }
  id v11 = (void *)+[PVMotionEffect initializeMotionInternal]::s_initLock;

  [v11 unlock];
}

- (PVMotionEffect)initWithEffectID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVMotionEffect;
  id v5 = [(PVEffect *)&v8 initWithEffectID:v4];
  uint64_t v6 = v5;
  if (v5) {
    [(PVMotionEffect *)v5 _commonInitWithProjectPathOverride:0];
  }

  return v6;
}

- (PVMotionEffect)initWithContentID:(id)a3 andDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PVMotionEffect;
  objc_super v8 = [(PVEffect *)&v11 initWithContentID:v6 andDictionary:v7];
  if (v8)
  {
    id v9 = [v7 objectForKeyedSubscript:@"contentPath"];
    [(PVMotionEffect *)v8 _commonInitWithProjectPathOverride:v9];
  }
  return v8;
}

- (void)_commonInitWithProjectPathOverride:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_projectPathOverride, a3);
  atomic_store(0, (unsigned int *)&self->_docLoadStatus);
  id v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
  documentLock = self->_documentLock;
  self->_documentLock = v6;

  self->_documentInfo = 0;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->super._components, "count"));
  objc_super v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  motionComponents = self->_motionComponents;
  self->_motionComponents = v8;

  components = self->super._components;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = *(void *)"";
  v21[2] = __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke;
  v21[3] = &unk_1E61698E0;
  v21[4] = self;
  [(NSMutableArray *)components enumerateObjectsUsingBlock:v21];
  objc_super v11 = (NSMutableDictionary *)objc_opt_new();
  cachedPublishedParams = self->_cachedPublishedParams;
  self->_cachedPublishedParams = v11;

  objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", @"kPVOutputAspectKey", @"kPVPlayableAspectRatioKey", @"kPVPlayableAspectRatioPreservationModeKey", @"kPVCachedTextureOutputSize", 0);
  uint64_t v13 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  parameterKeysThatInvalidateCache = self->_parameterKeysThatInvalidateCache;
  self->_parameterKeysThatInvalidateCache = v13;

  uint64_t v15 = (NSMutableDictionary *)objc_opt_new();
  parametersThatInvalidateCache = self->_parametersThatInvalidateCache;
  self->_parametersThatInvalidateCache = v15;

  uint64_t v17 = self->_motionComponents;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = *(void *)"";
  v20[2] = __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke_2;
  v20[3] = &unk_1E6169DA8;
  v20[4] = self;
  [(NSMutableArray *)v17 enumerateObjectsUsingBlock:v20];
  id v18 = [(PVMotionEffect *)self projectURL];
  id v19 = [(PVMotionEffect *)self projectPath];
  [(PVMotionEffect *)self supportsExtendedRangeInputs];
  [(NSLock *)self->_documentLock lock];
  [(PVMotionEffect *)self _documentDidUnload_NoLock];
  [(NSLock *)self->_documentLock unlock];
}

void __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(*(void *)(a1 + 32) + 152) addObject:v3];
  }
}

void __53__PVMotionEffect__commonInitWithProjectPathOverride___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 motionEffectPropertyKeysThatInvalidateCachedRender:*(void *)(a1 + 32)];
  if (v3)
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 240);
    id v6 = v3;
    id v5 = [v3 allObjects];
    [v4 addObjectsFromArray:v5];

    id v3 = v6;
  }
}

- (void)_documentDidUnload_NoLock
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsNotStarted];
  documentInfo = (PVMotionDocumentInfo *)self->_documentInfo;
  if (documentInfo)
  {
    PVMotionDocumentInfo::~PVMotionDocumentInfo(documentInfo);
    MEMORY[0x1BA9BFBA0]();
    self->_documentInfo = 0;
  }
  operator new();
}

uint64_t __43__PVMotionEffect__documentDidUnload_NoLock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 motionEffectDidUnload:*(void *)(a1 + 32)];
}

- (void)_configureComponents
{
  v15.receiver = self;
  v15.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v15 _configureComponents];
  id v3 = [[PVMotionEffectTimelineComponent alloc] initWithMotionEffect:self];
  timelineComponent = self->_timelineComponent;
  self->_timelineComponent = v3;

  [(NSMutableArray *)self->super._components addObject:self->_timelineComponent];
  id v5 = [[PVMotionEffectTransformComponent alloc] initWithMotionEffect:self];
  transformComponent = self->_transformComponent;
  self->_transformComponent = v5;

  [(NSMutableArray *)self->super._components addObject:self->_transformComponent];
  id v7 = [[PVMotionEffectTextComponent alloc] initWithMotionEffect:self];
  textComponent = self->_textComponent;
  self->_textComponent = v7;

  [(NSMutableArray *)self->super._components addObject:self->_textComponent];
  id v9 = [(PVMotionEffectComponent *)[PVMotionEffectTranscriptionComponent alloc] initWithMotionEffect:self];
  transcriptionComponent = self->_transcriptionComponent;
  self->_transcriptionComponent = v9;

  [(NSMutableArray *)self->super._components addObject:self->_transcriptionComponent];
  objc_super v11 = [(PVMotionEffectComponent *)[PVMotionEffectHitAreaComponent alloc] initWithMotionEffect:self];
  hitAreaComponent = self->_hitAreaComponent;
  self->_hitAreaComponent = v11;

  [(NSMutableArray *)self->super._components addObject:self->_hitAreaComponent];
  uint64_t v13 = [[PVMotionEffectSceneManagerComponent alloc] initWithMotionEffect:self];
  sceneManagerComponent = self->_sceneManagerComponent;
  self->_sceneManagerComponent = v13;

  [(NSMutableArray *)self->super._components addObject:self->_sceneManagerComponent];
}

- (void)releaseResources
{
  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v7 releaseResources];
  documentLock = self->_documentLock;
  if (documentLock)
  {
    id v4 = (PVDocumentAccessController *)[(NSLock *)documentLock lock];
    unsigned int v5 = atomic_load((unsigned int *)&self->_docLoadStatus);
    if ((v5 & 0xFFFFFFFE) == 2)
    {
      id v6 = (PVDocumentAccessController *)PVDocumentAccessController::INSTANCE(v4);
      PVDocumentAccessController::ReleaseOZXDocument(v6, *(void **)self->_documentInfo);
    }
    [(NSLock *)self->_documentLock unlock];
  }
}

- (void)dealloc
{
  [(PVMotionEffect *)self releaseResources];
  documentLock = self->_documentLock;
  self->_documentLock = 0;

  documentInfo = (PVMotionDocumentInfo *)self->_documentInfo;
  if (documentInfo)
  {
    PVMotionDocumentInfo::~PVMotionDocumentInfo(documentInfo);
    MEMORY[0x1BA9BFBA0]();
    self->_documentInfo = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v5 dealloc];
}

- (id)projectPath
{
  projectPath = self->_projectPath;
  if (!projectPath)
  {
    id v4 = [(PVMotionEffect *)self projectURL];
    objc_super v5 = [v4 path];
    id v6 = self->_projectPath;
    self->_projectPath = v5;

    projectPath = self->_projectPath;
  }
  objc_super v7 = projectPath;

  return v7;
}

- (BOOL)hasAllNecessaryResources
{
  v2 = [(PVMotionEffect *)self projectURL];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [v2 path];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (id)projectURL
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  projectURL = self->_projectURL;
  if (projectURL)
  {
    id v3 = projectURL;
    goto LABEL_31;
  }
  v26 = [(PVEffect *)self effectID];
  char v5 = self->_projectPathOverride;
  if (v5) {
    goto LABEL_29;
  }
  if ([v26 hasPrefix:@"..."])
  {
    uint64_t v27 = [v26 substringFromIndex:4];
    +[PVMotionEffect _userLibPaths];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    char v5 = 0;
    uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v33;
LABEL_7:
      uint64_t v8 = 0;
      id v9 = v5;
      while (1)
      {
        if (*(void *)v33 != v7) {
          objc_enumerationMutation(obj);
        }
        char v5 = [*(id *)(*((void *)&v32 + 1) + 8 * v8) stringByAppendingFormat:@"/%@", v27];

        uint64_t v10 = [MEMORY[0x1E4F28CB8] defaultManager];
        char v11 = [v10 fileExistsAtPath:v5];

        if (v11) {
          break;
        }
        ++v8;
        id v9 = v5;
        if (v6 == v8)
        {
          uint64_t v6 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
          if (v6) {
            goto LABEL_7;
          }
          break;
        }
      }
    }
  }
  else
  {
    uint64_t v12 = +[PVMotionEffect _effectPathFromID:v26];
    if ([v12 hasPrefix:@"..."])
    {
      uint64_t v27 = v12;
      id obja = [v12 substringFromIndex:4];
      +[PVMotionEffect _bundleLibPaths];
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      char v5 = 0;
      uint64_t v13 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v29;
LABEL_17:
        uint64_t v15 = 0;
        uint64_t v16 = v5;
        while (1)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(v23);
          }
          char v5 = [*(id *)(*((void *)&v28 + 1) + 8 * v15) stringByAppendingFormat:@"/%@", obja];

          uint64_t v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          char v18 = [v17 fileExistsAtPath:v5];

          if (v18) {
            break;
          }
          ++v15;
          uint64_t v16 = v5;
          if (v13 == v15)
          {
            uint64_t v13 = [v23 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v13) {
              goto LABEL_17;
            }
            break;
          }
        }
      }
    }
    else
    {
      if (v12)
      {
        char v5 = v12;

        goto LABEL_28;
      }
      uint64_t v27 = 0;
      char v5 = v26;
    }
  }

LABEL_28:
  if (!v5)
  {
    id v19 = 0;
    goto LABEL_30;
  }
LABEL_29:
  id v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5 isDirectory:0];
LABEL_30:
  long long v20 = self->_projectURL;
  self->_projectURL = v19;

  projectPath = self->_projectPath;
  self->_projectPath = 0;

  id v3 = self->_projectURL;
LABEL_31:

  return v3;
}

- (void)loadDocument_NoLock
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsNotStarted];
  id v3 = [(PVEffect *)self effectID];
  if (v3)
  {
    id v4 = [(PVMotionEffect *)self projectURL];
    char v5 = [(PVMotionEffect *)self projectPath];
    if (+[PVEnvironment PV_ENABLE_ENV_LOGS])
    {
      NSLog(&cfstr_Pvmotioneffect_0.isa, v4);
      uint64_t v6 = [(PVEffect *)self descriptionOfInspectableProperties];
      NSLog(&cfstr_Pvmotioneffect_1.isa, v6);
    }
    atomic_store(1u, (unsigned int *)&self->_docLoadStatus);
    motionComponents = self->_motionComponents;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = *(void *)"";
    v26[2] = __37__PVMotionEffect_loadDocument_NoLock__block_invoke;
    v26[3] = &unk_1E6169DA8;
    v26[4] = self;
    [(NSMutableArray *)motionComponents enumerateObjectsUsingBlock:v26];
    uint64_t v25 = 0;
    uint64_t v8 = +[PVDocumentCacheManager sharedInstance];
    uint64_t v9 = [v8 newOZXDocumentForKey:v5];

    if (!v9)
    {
      uint64_t v24 = 0;
      long long v22 = 0u;
      long long v23 = 0u;
      *(_OWORD *)long long v20 = 0u;
      long long v21 = 0u;
      PVGetMemUsageStats((uint64_t)v20);
      OZXLoadDocument();
    }
    uint64_t v25 = v9;
    *(void *)self->_documentInfo = v9;
    OZXGetDocInfo(*(void *)self->_documentInfo, (uint64_t)self->_documentInfo + 8);
    documentInfo = (char *)self->_documentInfo;
    uint64_t v11 = *(void *)(documentInfo + 12);
    v12.i64[0] = v11;
    v12.i64[1] = HIDWORD(v11);
    *((float64x2_t *)documentInfo + 11) = vcvtq_f64_u64(v12);
    v20[0] = 0;
    int v13 = OZXGetTopLevelGroupID(*(void **)documentInfo, v20);
    uint64_t v14 = self->_documentInfo;
    v14[41] = v13;
    if (!v13)
    {
      unsigned int v15 = v20[0];
      v14[40] = v20[0];
      self->_groupIDToCache = v15;
    }
    atomic_store(2u, (unsigned int *)&self->_docLoadStatus);
    uint64_t v16 = self->_motionComponents;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = *(void *)"";
    v19[2] = __37__PVMotionEffect_loadDocument_NoLock__block_invoke_2;
    v19[3] = &unk_1E6169DA8;
    v19[4] = self;
    [(NSMutableArray *)v16 enumerateObjectsUsingBlock:v19];
    if ([(PVMotionEffect *)self isTimeDurationIndefinite]) {
      OZXSetDuration(*(void **)self->_documentInfo, MEMORY[0x1E4F1F9F0]);
    }
  }
  else
  {
    atomic_store(4u, (unsigned int *)&self->_docLoadStatus);
    uint64_t v17 = self->_motionComponents;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = *(void *)"";
    v18[2] = __37__PVMotionEffect_loadDocument_NoLock__block_invoke_3;
    v18[3] = &unk_1E6169DA8;
    v18[4] = self;
    [(NSMutableArray *)v17 enumerateObjectsUsingBlock:v18];
  }
}

uint64_t __37__PVMotionEffect_loadDocument_NoLock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 motionEffectDidStartLoading:*(void *)(a1 + 32)];
}

uint64_t __37__PVMotionEffect_loadDocument_NoLock__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 motionEffect:*(void *)(a1 + 32) didLoad:*(void *)(*(void *)(a1 + 32) + 144)];
}

uint64_t __37__PVMotionEffect_loadDocument_NoLock__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 motionEffectDidFailToLoad:*(void *)(a1 + 32)];
}

- (BOOL)supportsExtendedRangeInputs
{
  v13[17] = *MEMORY[0x1E4F143B8];
  supportsExtendedRangeInputs = self->_supportsExtendedRangeInputs;
  if (!supportsExtendedRangeInputs)
  {
    id v4 = [(PVEffect *)self contentRegistryPropertyForKey:@"doesNotSupportExtendedRangeInputs"];
    char v5 = v4;
    if (v4)
    {
      objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "BOOLValue") ^ 1);
      uint64_t v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = self->_supportsExtendedRangeInputs;
      self->_supportsExtendedRangeInputs = v6;
    }
    else
    {
      uint64_t v8 = [(PVEffect *)self effectID];
      v13[0] = @"E50C1035-19C5-4EFF-AAB4-B3008BC14D04";
      v13[1] = @"CAA078D7-0ACA-432E-85B1-FB975BE96A80";
      _OWORD v13[2] = @"7F57747E-6F2A-4D31-806C-67B4F09A93CA";
      v13[3] = @"8286EAE4-72A9-4739-970D-12A9EC5EE39D";
      v13[4] = @"AE493655-7441-401C-82DA-2B53150ADF04";
      v13[5] = @"BF65FA4F-DF9E-4BA1-AF3A-EDABE6AAC849";
      v13[6] = @"B1AF5729-DBD8-458F-AA8C-14431E269F91";
      v13[7] = @"F8AE5EB3-7B25-48EA-B553-A3ABC3BF4E22";
      _OWORD v13[8] = @"FDA1996F-CE2F-4D2B-9C02-63C38F6D260E";
      v13[9] = @"F97E8C77-4E0D-4F19-9A5C-E738CB736808";
      v13[10] = @"E0EF8372-285B-48FE-91E8-484AA0C72566";
      v13[11] = @"73695A75-3662-44D6-B3B9-2D947512610D";
      v13[12] = @"CC50FB3A-4F1C-4A0E-844F-48B30842586A";
      v13[13] = @"330561EB-3193-4210-A735-3CAEFAED29D1";
      v13[14] = @"7195C532-014D-4F44-B0EF-18064B032172";
      v13[15] = @"20E1551C-1F0E-4C87-9C56-750D6D2FAB5E";
      v13[16] = @"CED1BDCE-1C6F-4ABF-85EB-E10DD5F04841";
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:17];
      if ([v9 containsObject:v8])
      {
        uint64_t v10 = self->_supportsExtendedRangeInputs;
        self->_supportsExtendedRangeInputs = (NSNumber *)MEMORY[0x1E4F1CC28];
      }
      uint64_t v11 = self->_supportsExtendedRangeInputs;
      self->_supportsExtendedRangeInputs = (NSNumber *)MEMORY[0x1E4F1CC38];
    }
    supportsExtendedRangeInputs = self->_supportsExtendedRangeInputs;
  }
  return [(NSNumber *)supportsExtendedRangeInputs BOOLValue];
}

- (BOOL)isReady
{
  unsigned int v2 = atomic_load((unsigned int *)&self->_docLoadStatus);
  return v2 == 3;
}

- (BOOL)resourcesAreReady
{
  if ([(PVMotionEffect *)self isReady]) {
    return 1;
  }
  id v4 = [(PVMotionEffect *)self projectPath];
  char v5 = +[PVDocumentCacheManager sharedInstance];
  uint64_t v6 = [v5 getOZXDocumentForKey:v4];

  BOOL v3 = v6 != 0;
  return v3;
}

- (BOOL)loadResources
{
  [(NSLock *)self->_documentLock lock];
  BOOL v3 = [(PVMotionEffect *)self loadResources_NoLock];
  [(NSLock *)self->_documentLock unlock];
  return v3;
}

- (BOOL)loadResources_NoLock
{
  unsigned int v2 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v2 != 3)
  {
    char v5 = (PVDocumentAccessController *)PVDocumentAccessController::INSTANCE((PVDocumentAccessController *)self);
    PVDocumentAccessController::LoadEffectDocument(v5, self);
  }
  return 1;
}

- (void)loadEffectInternal_NoLock
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  unsigned int v3 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v3 - 3 >= 2)
  {
    [(PVMotionEffect *)self assertDocumentStatusIsNotStarted];
    if (!v3)
    {
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v4) >= 1) {
        kdebug_trace();
      }
      [(PVMotionEffect *)self loadDocument_NoLock];
      if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v5) >= 1) {
        kdebug_trace();
      }
      unsigned int v7 = atomic_load((unsigned int *)&self->_docLoadStatus);
      if (v7 == 2)
      {
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v6) >= 1) {
          kdebug_trace();
        }
        [(PVMotionEffect *)self buildDropZoneIdMap_NoLock];
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v8) >= 1) {
          kdebug_trace();
        }
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v9) >= 1) {
          kdebug_trace();
        }
        [(NSLock *)self->super._inspectablePropertiesLock lock];
        motionComponents = self->_motionComponents;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = *(void *)"";
        v16[2] = __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke;
        v16[3] = &unk_1E6169DA8;
        v16[4] = self;
        [(NSMutableArray *)motionComponents enumerateObjectsUsingBlock:v16];
        [(PVMotionEffect *)self applyInspectableProperties_NoLock];
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v11) >= 1) {
          kdebug_trace();
        }
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v12) >= 1) {
          kdebug_trace();
        }
        OZXOpenDocumentMedia(*(void *)self->_documentInfo);
        OZXIsValidImageSequencePath(*(void *)self->_documentInfo);
        if ((int)HGLogger::getLevel((HGLogger *)"PVSignPost", v13) >= 1) {
          kdebug_trace();
        }
        atomic_store(3u, (unsigned int *)&self->_docLoadStatus);
        uint64_t v14 = self->_motionComponents;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = *(void *)"";
        v15[2] = __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke_2;
        v15[3] = &unk_1E6169DA8;
        v15[4] = self;
        [(NSMutableArray *)v14 enumerateObjectsUsingBlock:v15];
        [(NSLock *)self->super._inspectablePropertiesLock unlock];
      }
    }
  }
}

uint64_t __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 motionEffect:*(void *)(a1 + 32) willOpenMedia:*(void *)(*(void *)(a1 + 32) + 144) properties:*(void *)(*(void *)(a1 + 32) + 80)];
}

uint64_t __43__PVMotionEffect_loadEffectInternal_NoLock__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 motionEffect:*(void *)(a1 + 32) didBecomeReady:*(void *)(*(void *)(a1 + 32) + 144) properties:*(void *)(*(void *)(a1 + 32) + 80)];
}

- (BOOL)isSketch
{
  unsigned int v2 = [(PVEffect *)self effectID];
  if ([v2 isEqualToString:@"5FCD0612-3FD5-4079-BC2A-20E987BC5B59"]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:@"494B7BCF-0476-4EF7-ACFC-36480997C2A9"];
  }

  return v3;
}

- (void)runEnsuringDocumentReady_NoLock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsReadyAfterLoad:[(PVMotionEffect *)self loadResources_NoLock]];
  v4[2]();
}

- (void)runEnsuringDocumentReadyAndLockingDocument:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_documentLock lock];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = *(void *)"";
  uint64_t v8 = __61__PVMotionEffect_runEnsuringDocumentReadyAndLockingDocument___block_invoke;
  uint64_t v9 = &unk_1E6169DD0;
  id v5 = v4;
  uint64_t v10 = self;
  id v11 = v5;
  [(PVMotionEffect *)self runEnsuringDocumentReady_NoLock:&v6];
  [(NSLock *)self->_documentLock unlock];
}

uint64_t __61__PVMotionEffect_runEnsuringDocumentReadyAndLockingDocument___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)runWithDocument_NoLock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  v4[2](v4, self->_documentInfo);
}

- (void)deleteTemporalInspectableProperties
{
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  char v3 = objc_opt_new();
  inspectableProperties = self->super._inspectableProperties;
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = *(void *)"";
  uint64_t v8 = __53__PVMotionEffect_deleteTemporalInspectableProperties__block_invoke;
  uint64_t v9 = &unk_1E6169DF8;
  uint64_t v10 = self;
  id v5 = v3;
  id v11 = v5;
  [(NSMutableDictionary *)inspectableProperties enumerateKeysAndObjectsUsingBlock:&v6];
  if (objc_msgSend(v5, "count", v6, v7, v8, v9, v10)) {
    [(NSMutableDictionary *)self->super._inspectableProperties removeObjectsForKeys:v5];
  }
}

void __53__PVMotionEffect_deleteTemporalInspectableProperties__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isTemporalProperty:")) {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  uint64_t v342 = *MEMORY[0x1E4F143B8];
  int v9 = *((_DWORD *)a4 + 4);
  v246 = v6;
  *uint64_t v6 = 0;
  if (![(PVMotionEffect *)self hasBuiltInEnvironment]) {
    goto LABEL_14;
  }
  uint64_t v10 = *((void *)a4 + 1);
  if (!v10) {
    goto LABEL_14;
  }
  id v11 = (char *)a4 + 8;
  do
  {
    unsigned int v12 = *(_DWORD *)(v10 + 32);
    BOOL v13 = v12 >= 2;
    if (v12 >= 2) {
      uint64_t v14 = (uint64_t *)v10;
    }
    else {
      uint64_t v14 = (uint64_t *)(v10 + 8);
    }
    if (v13) {
      id v11 = (_DWORD *)v10;
    }
    uint64_t v10 = *v14;
  }
  while (*v14);
  if (v11 != (_DWORD *)((char *)a4 + 8) && v11[8] <= 2u) {
    PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 2u, (HGNode **)&v300);
  }
  else {
LABEL_14:
  }
    PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, (HGNode **)&v300);
  if (v300.start.value) {
    CMTimeValue *v246 = v300.start.value;
  }
  [(PVEffect *)self proxyRenderScale];
  float v16 = v15;
  uint64_t v17 = PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  int v244 = [v17 isRec2020LinearColorSpace];

  uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:11];
  timedPropertiesComponent = self->super._timedPropertiesComponent;
  long long v336 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  v245 = (void *)v18;
  BOOL v242 = [(PVEffectTimedPropertiesComponent *)timedPropertiesComponent addTimedPropertiesToDict:v18 time:&v336];
  m_Obuint64_t j = a6.m_Obj;
  [(NSLock *)self->_documentLock lock];
  unsigned int v21 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v21 != 3) {
    [(PVMotionEffect *)self assertDocumentStatusIsReadyAfterLoad:[(PVMotionEffect *)self loadResources_NoLock]];
  }
  [(PVMotionEffect *)self assertDocumentStatusIsReady];
  unsigned int v22 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v22 != 3)
  {
    double v30 = (*(double (**)(void))(**(void **)a6.m_Obj + 40))();
    (*(void (**)(void))(**(void **)a6.m_Obj + 40))();
    uint64_t v32 = HGRectMake4i(0, 0, (int)v30, (int)v31);
    uint64_t v34 = v33;
    long long v35 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(void *)&v344.int var0 = v32;
    *(void *)&v344.int var2 = v34;
    HGSolidColor::HGSolidColor(v35, v344);
  }
  [(PVMotionEffectTimelineComponent *)self->_timelineComponent updateSceneDuration_NoLock:self->_documentInfo];
  [(NSLock *)self->super._inspectablePropertiesLock lock];
  p_inspectableProperties = &self->super._inspectableProperties;
  v243 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"kPVIgnoreEffectRanges"];
  locatiouint64_t n = (id *)&self->super._inspectableProperties;
  if (v243 && [v243 count])
  {
    long long v335 = 0u;
    long long v334 = 0u;
    long long v333 = 0u;
    long long v332 = 0u;
    id v24 = v243;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v332 objects:v341 count:16];
    if (!v25) {
      goto LABEL_32;
    }
    uint64_t v26 = *(void *)v333;
LABEL_24:
    uint64_t v27 = 0;
    while (1)
    {
      if (*(void *)v333 != v26) {
        objc_enumerationMutation(v24);
      }
      long long v28 = *(void **)(*((void *)&v332 + 1) + 8 * v27);
      memset(&v300, 0, sizeof(v300));
      if (v28) {
        [v28 CMTimeRangeValue];
      }
      CMTimeRange range = v300;
      CMTime time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time)) {
        break;
      }
      if (v25 == ++v27)
      {
        uint64_t v25 = [v24 countByEnumeratingWithState:&v332 objects:v341 count:16];
        if (!v25)
        {
LABEL_32:

          m_Obuint64_t j = a6.m_Obj;
          p_inspectableProperties = &self->super._inspectableProperties;
          goto LABEL_33;
        }
        goto LABEL_24;
      }
    }
    [(NSLock *)self->super._inspectablePropertiesLock unlock];
    [(NSLock *)self->_documentLock unlock];

    goto LABEL_39;
  }
LABEL_33:
  long long v328 = *(_OWORD *)&a3->var0;
  int64_t v329 = a3->var3;
  if (![(PVMotionEffect *)self isVisibleAtTime_NoLock:&v328 timedProperties:v245 defaultProperties:*p_inspectableProperties])
  {
    [(NSLock *)self->super._inspectablePropertiesLock unlock];
    [(NSLock *)self->_documentLock unlock];
LABEL_39:

    goto LABEL_351;
  }
  if (v242)
  {
    uint64_t v29 = [(NSMutableDictionary *)*p_inspectableProperties mutableCopy];
    [(NSMutableDictionary *)*p_inspectableProperties addEntriesFromDictionary:v245];
  }
  else
  {
    uint64_t v29 = 0;
  }
  id obj = (id)v29;
  v232 = [(NSMutableDictionary *)*p_inspectableProperties objectForKeyedSubscript:@"kPVTopLevelOpacityKey"];
  if (v232)
  {
    [v232 doubleValue];
    -[PVMotionEffect setTopLevelOpacity:](self, "setTopLevelOpacity:");
  }
  double v36 = (*(double (**)(void))(**(void **)m_Obj + 40))();
  (*(void (**)(void))(**(void **)m_Obj + 40))();
  double v236 = v37;
  float v38 = (*(float (**)(void))(**(void **)m_Obj + 48))();
  float v39 = (*(float (**)(void))(**(void **)m_Obj + 48))();
  char v40 = [(NSMutableDictionary *)*p_inspectableProperties objectForKeyedSubscript:@"swapOutputAspect"];
  int v41 = [v40 BOOLValue];
  double v228 = v36;
  double v42 = v36 * v38;
  double v43 = v236 * v39;
  if (v43 == 0.0) {
    int v44 = 0;
  }
  else {
    int v44 = v41;
  }
  if (v42 == 0.0) {
    int v45 = 0;
  }
  else {
    int v45 = v44;
  }

  [*location objectForKeyedSubscript:@"kPVMotionEffectAdditionalTitleScale"];
  v233 = double v46 = 1.0;
  if (v233)
  {
    [v233 doubleValue];
    double v46 = v47;
  }
  if (v45) {
    double v48 = v43;
  }
  else {
    double v48 = v42;
  }
  double v49 = v48 * v46;
  if (v45) {
    double v50 = v42;
  }
  else {
    double v50 = v43;
  }
  double v51 = v50 * v46;
  double v52 = v50 * v46 / v49;
  if (v45) {
    double v53 = v52;
  }
  else {
    double v53 = 1.0;
  }
  [(PVMotionEffect *)self setEffectOutputAspectWithProperties_NoLock:0 allProperties:*location];
  if (v9 >= 1 && v51 != 0.0 && v49 != 0.0)
  {
    double effectOutputAspect = self->_effectOutputAspect;
    if (effectOutputAspect <= 0.0)
    {
      documentInfo = (double *)self->_documentInfo;
      LODWORD(v54) = *((_DWORD *)documentInfo + 3);
      LODWORD(v55) = *((_DWORD *)documentInfo + 4);
      if (vabdd_f64(documentInfo[7] * (double)v54 / (double)v55, v49 / v51) >= 0.0000001) {
        [(PVMotionEffect *)self setEffectOutputAspect_NoLock:self->_playableContentMode playableAspect:v49 / v51 playableContentMode:self->_playableAspectRatio];
      }
    }
    else if (vabdd_f64(effectOutputAspect, v36 / v236) >= 0.0000001)
    {
      NSLog(&cfstr_UnexpectedEffe.isa, *(void *)&self->_effectOutputAspect, v36 / v236);
    }
  }
  BOOL v58 = [(PVMotionEffectTimelineComponent *)self->_timelineComponent isForceRenderAtPosterFrameEnabled:*location];
  memset(&v327, 0, sizeof(v327));
  timelineComponent = self->_timelineComponent;
  long long v325 = *(_OWORD *)&a3->var0;
  int64_t v326 = a3->var3;
  if (timelineComponent) {
    [(PVMotionEffectTimelineComponent *)timelineComponent timelineTimeFromComponentTime_NoLock:&v325 forcePosterFrame:v58 documentInfo:self->_documentInfo];
  }
  v60 = objc_msgSend(*location, "objectForKeyedSubscript:", @"PVRestartEffectTime", v58);
  BOOL v61 = v60 == 0;

  if (!v61)
  {
    CMTime start = (CMTime)*a3;
    [(PVEffect *)self effectRange];
    duratiouint64_t n = v300.duration;
    CMTimeRangeMake(&v322, &start, &duration);
    CMTimeRange v321 = v322;
    [(PVEffect *)self setEffectRange:&v321];
  }
  v62 = [*location objectForKeyedSubscript:@"PVResetScene"];
  BOOL v63 = v62 == 0;

  if (!v63) {
    OZXResetScene(*(void **)self->_documentInfo);
  }
  v64 = [*location objectForKeyedSubscript:@"PVDisableObjects"];
  BOOL v65 = v64 == 0;

  if (!v65)
  {
    v66 = [*location objectForKeyedSubscript:@"PVDisableObjects"];
    long long v320 = 0u;
    long long v319 = 0u;
    long long v318 = 0u;
    long long v317 = 0u;
    id v67 = v66;
    uint64_t v68 = [v67 countByEnumeratingWithState:&v317 objects:v340 count:16];
    if (v68)
    {
      uint64_t v69 = *(void *)v318;
      do
      {
        for (uint64_t i = 0; i != v68; ++i)
        {
          if (*(void *)v318 != v69) {
            objc_enumerationMutation(v67);
          }
          OZXEnableObject(*(void **)self->_documentInfo, [*(id *)(*((void *)&v317 + 1) + 8 * i) unsignedIntValue], 0);
        }
        uint64_t v68 = [v67 countByEnumeratingWithState:&v317 objects:v340 count:16];
      }
      while (v68);
    }

    [*location removeObjectForKey:@"PVDisableObjects"];
  }
  v71 = [*location objectForKeyedSubscript:@"PVEnvironmentMap"];
  BOOL v72 = v71 == 0;

  if (!v72)
  {
    id v73 = [*location objectForKeyedSubscript:@"PVEnvironmentMap"];
    OZXSetEnvironmentMap(*(void **)self->_documentInfo, (CGImage *)[v73 CGImage]);
  }
  long long v316 = 0u;
  long long v315 = 0u;
  long long v314 = 0u;
  long long v313 = 0u;
  v74 = [*location allKeys];
  uint64_t v75 = [v74 countByEnumeratingWithState:&v313 objects:v339 count:16];
  if (v75)
  {
    uint64_t v76 = *(void *)v314;
    do
    {
      for (uint64_t j = 0; j != v75; ++j)
      {
        if (*(void *)v314 != v76) {
          objc_enumerationMutation(v74);
        }
        v78 = *(void **)(*((void *)&v313 + 1) + 8 * j);
        if ([v78 hasPrefix:@"PVSetEffectAnchor"])
        {
          v79 = [v78 stringByReplacingOccurrencesOfString:@"PVSetEffectAnchor" withString:&stru_1F119C770];
          v80 = [*location objectForKey:v78];
          OZXForceSetPlaneAnchorUUID(*(void **)self->_documentInfo, v79, v80);
        }
      }
      uint64_t v75 = [v74 countByEnumeratingWithState:&v313 objects:v339 count:16];
    }
    while (v75);
  }

  unsigned int groupIDToCache = self->_groupIDToCache;
  long long v311 = *(_OWORD *)&a3->var0;
  int64_t v312 = a3->var3;
  BOOL v82 = [(PVMotionEffect *)self isRenderCachingDisabled_NoLock:&v311];
  if (groupIDToCache) {
    char v83 = v82;
  }
  else {
    char v83 = 1;
  }
  if (self->_lastRenderWasHDR != v244) {
    self->_cachedRenderDirty = 1;
  }
  if (v83)
  {
    if (!groupIDToCache) {
      goto LABEL_113;
    }
    int v84 = 0;
  }
  else
  {
    BOOL v85 = [(PVMotionEffectTimelineComponent *)self->_timelineComponent isForceRenderAtPosterFrameEnabled:*location];
    id v86 = *location;
    if (v85)
    {
      v87 = [v86 objectForKeyedSubscript:@"kPVEnablePosterFrameCaching"];
      int v84 = [v87 BOOLValue];
    }
    else
    {
      v88 = [v86 objectForKeyedSubscript:@"kPVEnableLoopedRangeRenderCaching"];
      int v89 = [v88 BOOLValue];

      memset(&v300, 0, 24);
      v90 = self->_timelineComponent;
      if (v90) {
        [(PVMotionEffectTimelineComponent *)v90 introDuration_NoLock];
      }
      CMTime time1 = v327;
      CMTime time2 = v300.start;
      if (CMTimeCompare(&time1, &time2) >= 0) {
        int v84 = v89;
      }
      else {
        int v84 = 0;
      }
    }
  }
  v91 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v49, v51);
  [(PVMotionEffect *)self didSetCacheInvalidatingParameter_NoLock:v91 forKey:@"kPVCachedTextureOutputSize"];
  OZXSetUseRenderCache(*(void **)self->_documentInfo, groupIDToCache, v84);
  if (!v84 || self->_cachedRenderDirty) {
    OZXClearCachedRender(*(void **)self->_documentInfo, groupIDToCache);
  }
  self->_cachedRenderDirty = 0;

LABEL_113:
  if (![(PVMotionEffect *)self isTimeDurationIndefinite])
  {
    memset(&v300, 0, 24);
    v93 = self->_timelineComponent;
    if (v93) {
      [(PVMotionEffectTimelineComponent *)v93 timelineLastFrame_NoLock];
    }
    CMTime v308 = v327;
    CMTime v307 = v300.start;
    if (CMTimeCompare(&v308, &v307) >= 1) {
      CMTime v327 = v300.start;
    }
  }
  float v238 = fabsf(v16 + -1.0);
  double v94 = 1.0;
  if (v51 > 0.0)
  {
    LODWORD(v94) = *((_DWORD *)self->_documentInfo + 4);
    double v94 = v51 / (double)*(unint64_t *)&v94;
  }
  double v95 = v16;
  if (v238 < 0.00001) {
    double v95 = 1.0;
  }
  double v96 = v95 * v94;
  uint64_t v306 = 0x3FF0000000000000;
  uint64_t v303 = 0x3FF0000000000000;
  v300.duration.epoch = 0x3FF0000000000000;
  v300.start.value = 0x3FF0000000000000;
  memset(&v300.start.timescale, 0, 32);
  long long v301 = 0u;
  long long v302 = 0u;
  long long v304 = 0u;
  long long v305 = 0u;
  if (v95 * v94 != 1.0)
  {
    *(double *)&v300.start.value = v95 * v94;
    *(double *)&v300.start.timescale = v96 * 0.0;
    *(double *)&v300.start.epoch = v96 * 0.0;
    *(double *)&v300.duration.value = v96 * 0.0;
  }
  v92.f64[0] = v42 * 0.5;
  float64x2_t v240 = v92;
  double v239 = v43 * 0.5;
  if (v96 != -1.0)
  {
    *(double *)&v300.duration.timescale = v96 * -0.0;
    *(double *)&v300.duration.epoch = -(v95 * v94);
    *(double *)&long long v301 = v96 * -0.0;
    *((double *)&v301 + 1) = v96 * -0.0;
  }
  long long v299 = 0uLL;
  v97 = [(PVEffect *)self effectType];
  int v234 = [v97 isEqualToString:@"effect.video.transition"];

  v98 = [*location objectForKey:@"SelfieEffectUsesCameraFacing"];

  v241 = [*location objectForKey:@"kPVEffectPVARMetadata"];

  uint64_t v99 = [*location objectForKeyedSubscript:@"kPVTransformAnimationKey"];
  long long v294 = *(_OWORD *)&a3->var0;
  int64_t v295 = a3->var3;
  v229 = (void *)v99;
  BOOL v231 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v99, &v294, 14, 0, v296, v42, v43);
  v293[1] = 0;
  v293[0] = 0;
  v292 = (uint64_t *)v293;
  v291[1] = 0;
  v291[0] = 0;
  v290 = (uint64_t *)v291;
  v289[1] = 0;
  v289[0] = 0;
  v288 = (uint64_t *)v289;
  v287[1] = 0;
  v287[0] = 0;
  v286 = (uint64_t *)v287;
  PVInputHGNodeMap<unsigned int>::MapKeys(a4, (char **)&__p);
  v100 = (unsigned int *)__p;
  v101 = v98;
  if (__p != v285)
  {
    double v102 = v46 * v53;
    v103 = (char *)a4 + 32;
    double v104 = -v239;
    int64x2_t v226 = vdupq_n_s64(0x8000000000000000);
    while (1)
    {
      unsigned int v283 = 0;
      unsigned int v283 = *v100;
      *(void *)&v268.int var2 = 0;
      *(void *)&v268.int var0 = 0;
      v105 = *(HGRenderer **)a5;
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v283, v271);
      *(void *)&v268.int var0 = HGRenderer::GetDOD(v105, v271[0]);
      *(void *)&v268.int var2 = v106;
      if (v271[0]) {
        (*(void (**)(HGNode *))(*(void *)v271[0] + 24))(v271[0]);
      }
      v107 = *(char **)v103;
      if (!*(void *)v103) {
        goto LABEL_141;
      }
      v108 = (char *)a4 + 32;
      do
      {
        unsigned int v109 = *((_DWORD *)v107 + 8);
        BOOL v110 = v109 >= v283;
        if (v109 >= v283) {
          v111 = (char **)v107;
        }
        else {
          v111 = (char **)(v107 + 8);
        }
        if (v110) {
          v108 = v107;
        }
        v107 = *v111;
      }
      while (*v111);
      if (v108 != v103 && *((_DWORD *)v108 + 8) <= v283) {
        long long v282 = *(_OWORD *)(v108 + 40);
      }
      else {
LABEL_141:
      }
        long long v282 = 0uLL;
      if (v268.var2 == v268.var0) {
        goto LABEL_221;
      }
      if (v268.var3 == v268.var1) {
        goto LABEL_221;
      }
      v98 = v101;
      if (HGRect::IsNull(&v268)) {
        goto LABEL_221;
      }
      v98 = v101;
      if (HGRect::IsZero(&v268)) {
        goto LABEL_221;
      }
      int var2 = v268.var2;
      int var0 = v268.var0;
      float v114 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
      int v115 = v268.var3;
      int var1 = v268.var1;
      float v117 = (*(float (**)(void))(**(void **)a6.m_Obj + 48))();
      PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, v283, (HGNode **)&v270);
      v271[0] = (HGNode *)&v283;
      v118 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v292, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
      v119 = v118[5];
      v120 = (uint64_t *)v270;
      if (v119 == (uint64_t *)v270)
      {
        if (v119) {
          (*(void (**)(uint64_t *))(*v119 + 24))(v119);
        }
      }
      else
      {
        if (v119)
        {
          (*(void (**)(uint64_t *))(*v119 + 24))(v119);
          v120 = (uint64_t *)v270;
        }
        v118[5] = v120;
      }
      PVInputHGNodeMap<unsigned int>::GetPixelTransform((uint64_t)a4, v283, (uint64_t)v271);
      *(void *)&long long v270 = &v283;
      v121 = (HGNode **)(std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)&v270)+ 5);
      if (v271 != v121)
      {
        uint64_t v123 = 0;
        v124 = v271;
        do
        {
          for (uint64_t k = 0; k != 4; ++k)
            v121[k] = v124[k];
          ++v123;
          v121 += 4;
          v124 += 4;
        }
        while (v123 != 4);
      }
      v126 = (uint64_t **)*((void *)self->_documentInfo + 21);
      if (v126)
      {
        v271[0] = (HGNode *)&v283;
        int v127 = *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(v126, &v283, (uint64_t)&std::piecewise_construct, (unsigned int **)v271)+ 8);
        v271[0] = (HGNode *)&v283;
        *((_DWORD *)std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(&v286, &v283, (uint64_t)&std::piecewise_construct, (unsigned int **)v271)+ 8) = v127;
      }
      if (v101) {
        break;
      }
      BOOL v135 = [(PVEffect *)self conformToInputAspect];
      int v136 = v234;
      if (v283 <= 1) {
        int v136 = 0;
      }
      if ((v135 | v136) == 1)
      {
        v137 = *(char **)v103;
        if (!*(void *)v103) {
          goto LABEL_188;
        }
        v138 = (char *)a4 + 32;
        do
        {
          unsigned int v139 = *((_DWORD *)v137 + 8);
          BOOL v140 = v139 >= v283;
          if (v139 >= v283) {
            v141 = (char **)v137;
          }
          else {
            v141 = (char **)(v137 + 8);
          }
          if (v140) {
            v138 = v137;
          }
          v137 = *v141;
        }
        while (*v141);
        if (v138 != v103 && *((_DWORD *)v138 + 8) <= v283)
        {
          *(_OWORD *)v271 = *(_OWORD *)(v138 + 40);
          double v134 = *((double *)v138 + 7);
          double v133 = *((double *)v138 + 8);
        }
        else
        {
LABEL_188:
          v271[1] = 0;
          v271[0] = 0;
          double v133 = -1.0;
          double v134 = -1.0;
        }
LABEL_189:
        *(void *)&long long v270 = &v283;
        v142 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)&v270);
        long long v143 = *(_OWORD *)v271;
        goto LABEL_216;
      }
      v271[0] = (HGNode *)&v283;
      v152 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
      *(_OWORD *)(v152 + 5) = v299;
      *((double *)v152 + 7) = v228;
      *((double *)v152 + 8) = v236;
LABEL_217:
      if (v102 != 1.0)
      {
        v271[0] = (HGNode *)&v283;
        v162 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
        v163.f64[0] = -v240.f64[0];
        PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v162 + 5), v163, v104, 0.0);
        v271[0] = (HGNode *)&v283;
        v164 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
        PCMatrix44Tmpl<double>::leftScale((float64x2_t *)(v164 + 5), v102, v102, 1.0);
        v271[0] = (HGNode *)&v283;
        v165 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
        PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v165 + 5), v240, v239, 0.0);
      }
      v98 = v101;
      if (v231)
      {
        v271[0] = (HGNode *)&v283;
        v166 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
        v167.f64[0] = -v240.f64[0];
        PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v166 + 5), v167, v104, 0.0);
        v271[0] = (HGNode *)&v283;
        v168 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
        PCMatrix44Tmpl<double>::leftScale((float64x2_t *)(v168 + 5), v298, v298, 1.0);
        v271[0] = (HGNode *)&v283;
        v169 = std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)v271);
        v170.f64[0] = v240.f64[0] + v297.f64[0];
        PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)(v169 + 5), v170, v239 + v297.f64[1], 0.0);
        v98 = v101;
      }
LABEL_221:
      if (++v100 == v285) {
        goto LABEL_226;
      }
    }
    if (v283 <= 1)
    {
      v128 = *(char **)v103;
      if (!*(void *)v103) {
        goto LABEL_173;
      }
      v129 = (char *)a4 + 32;
      do
      {
        unsigned int v130 = *((_DWORD *)v128 + 8);
        BOOL v131 = v130 >= v283;
        if (v130 >= v283) {
          v132 = (char **)v128;
        }
        else {
          v132 = (char **)(v128 + 8);
        }
        if (v131) {
          v129 = v128;
        }
        v128 = *v132;
      }
      while (*v132);
      if (v129 != v103 && *((_DWORD *)v129 + 8) <= v283)
      {
        *(_OWORD *)v271 = *(_OWORD *)(v129 + 40);
        double v134 = *((double *)v129 + 7);
        double v133 = *((double *)v129 + 8);
      }
      else
      {
LABEL_173:
        v271[1] = 0;
        v271[0] = 0;
        double v133 = -1.0;
        double v134 = -1.0;
      }
      goto LABEL_189;
    }
    double v144 = (float)((float)(var2 - var0) / v114);
    double v145 = (float)((float)(v115 - var1) / v117);
    v122.f64[0] = v144 * 0.5;
    double v146 = v145 * 0.5;
    if (v283 == 2)
    {
      uint64_t v281 = 0x3FF0000000000000;
      uint64_t v278 = 0x3FF0000000000000;
      v271[0] = (HGNode *)0x3FF0000000000000;
      uint64_t v272 = 0;
      uint64_t v273 = 0;
      v271[1] = 0;
      uint64_t v276 = 0;
      uint64_t v277 = 0;
      long long v279 = 0u;
      long long v280 = 0u;
      long long v274 = xmmword_1B7E739F0;
      int64x2_t v275 = v226;
      PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v271, v122, v146, 0.0);
      *(void *)&long long v270 = &v283;
      v147 = (HGNode **)(std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)&v270)+ 5);
      if (v271 != v147)
      {
        uint64_t v148 = 0;
        v149 = v271;
        do
        {
          for (uint64_t m = 0; m != 4; ++m)
            v147[m] = v149[m];
          ++v148;
          v147 += 4;
          v149 += 4;
        }
        while (v148 != 4);
      }
      *(void *)&long long v270 = &v283;
      v151 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)&v270);
      *(_OWORD *)(v151 + 5) = v282;
      *((double *)v151 + 7) = v144;
      *((double *)v151 + 8) = v145;
      goto LABEL_217;
    }
    uint64_t v281 = 0x3FF0000000000000;
    uint64_t v278 = 0x3FF0000000000000;
    v271[0] = (HGNode *)0x3FF0000000000000;
    uint64_t v272 = 0;
    uint64_t v273 = 0;
    v271[1] = 0;
    uint64_t v276 = 0;
    uint64_t v277 = 0;
    long long v279 = 0u;
    long long v280 = 0u;
    long long v274 = xmmword_1B7E739F0;
    int64x2_t v275 = v226;
    PCMatrix44Tmpl<double>::leftTranslate((float64x2_t *)v271, v122, v146, 0.0);
    *(void *)&long long v270 = &v283;
    v153 = (HGNode **)(std::__tree<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCMatrix44Tmpl<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCMatrix44Tmpl<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v288, &v283, (uint64_t)&std::piecewise_construct, (_DWORD **)&v270)+ 5);
    if (v271 != v153)
    {
      uint64_t v154 = 0;
      v155 = v271;
      do
      {
        for (uint64_t n = 0; n != 4; ++n)
          v153[n] = v155[n];
        ++v154;
        v153 += 4;
        v155 += 4;
      }
      while (v154 != 4);
    }
    v157 = *(char **)v103;
    if (!*(void *)v103) {
      goto LABEL_214;
    }
    v158 = (char *)a4 + 32;
    do
    {
      unsigned int v159 = *((_DWORD *)v157 + 8);
      BOOL v160 = v159 >= v283;
      if (v159 >= v283) {
        v161 = (char **)v157;
      }
      else {
        v161 = (char **)(v157 + 8);
      }
      if (v160) {
        v158 = v157;
      }
      v157 = *v161;
    }
    while (*v161);
    if (v158 != v103 && *((_DWORD *)v158 + 8) <= v283)
    {
      long long v270 = *(_OWORD *)(v158 + 40);
      double v134 = *((double *)v158 + 7);
      double v133 = *((double *)v158 + 8);
    }
    else
    {
LABEL_214:
      long long v270 = 0uLL;
      double v133 = -1.0;
      double v134 = -1.0;
    }
    v338 = &v283;
    v142 = std::__tree<std::__value_type<unsigned int,PCRect<double>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,PCRect<double>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,PCRect<double>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>(&v290, &v283, (uint64_t)&std::piecewise_construct, &v338);
    long long v143 = v270;
LABEL_216:
    *(_OWORD *)(v142 + 5) = v143;
    *((double *)v142 + 7) = v134;
    *((double *)v142 + 8) = v133;
    goto LABEL_217;
  }
LABEL_226:
  if ((*(unsigned int (**)(void))(**(void **)a6.m_Obj + 64))()) {
    int v171 = 2;
  }
  else {
    int v171 = 0;
  }
  if ((*(unsigned int (**)(void))(**(void **)a6.m_Obj + 64))())
  {
    +[PVEnvironment PVExportPrefilterValue];
    if (v172 == 0.0) {
      int v171 = 1;
    }
  }
  if (((*(uint64_t (**)(void))(**(void **)a6.m_Obj + 64))() & 1) == 0
    && [(PVMotionEffect *)self isSketch])
  {
    int v171 = 1;
  }
  v173 = +[PVHostApplicationDelegateHandler sharedInstance];
  *(void *)&v268.int var2 = 0;
  *(void *)&v268.int var0 = 0;
  uint64_t v269 = 0;
  PVInstructionGraphContext::WorkingColorSpace(*(PVInstructionGraphContext **)a6.m_Obj);
  v174 = (PVColorSpace *)objc_claimAutoreleasedReturnValue();
  PVImagePropertiesForColorSpace(v174, 0, (uint64_t)&v268);

  uint64_t v175 = v269;
  int v176 = v268.var1;
  (*(void (**)(void))(**(void **)a6.m_Obj + 48))();
  float v178 = 1.0;
  if (v238 >= 0.00001) {
    float v178 = v16;
  }
  *(float *)v271 = v178 * v177;
  *((float *)v271 + 1) = v178 * v177;
  float v179 = v96;
  *(float *)&v271[1] = v179;
  v275.i32[0] = v171;
  *(uint64_t *)((char *)v275.i64 + 4) = v176 == 16;
  uint64_t v276 = v175;
  uint64_t v277 = v175;
  LOBYTE(v278) = v244;
  HIDWORD(v278) = [(PVMotionEffect *)self stillImageInverseToneMapOperator:*location];
  LOBYTE(v279) = 0;
  [(PVMotionEffect *)self outputROI_NoLock:self->_documentInfo scale:fabsf(*(float *)&v271[1])];
  uint64_t v272 = v180;
  uint64_t v273 = v181;
  *(void *)&long long v274 = v182;
  *((void *)&v274 + 1) = v183;
  v184 = [*location objectForKeyedSubscript:@"splitACropRect"];
  v185 = [*location objectForKeyedSubscript:@"splitBCropRect"];
  v235 = [*location objectForKeyedSubscript:@"pipCropRect"];
  v237 = [*location objectForKeyedSubscript:@"pipScaleFactor"];
  (*(void (**)(void))(**(void **)a6.m_Obj + 48))();
  uint64_t v186 = *((void *)a4 + 13);
  if (!v186) {
    goto LABEL_247;
  }
  v187 = (char *)a4 + 104;
  do
  {
    int v188 = *(_DWORD *)(v186 + 28);
    BOOL v189 = v188 == 0;
    if (v188) {
      v190 = (uint64_t *)v186;
    }
    else {
      v190 = (uint64_t *)(v186 + 8);
    }
    if (!v189) {
      v187 = (_DWORD *)v186;
    }
    uint64_t v186 = *v190;
  }
  while (*v190);
  if (v187 != (_DWORD *)((char *)a4 + 104) && v187[7] <= 1u) {
    int v191 = v187[8];
  }
  else {
LABEL_247:
  }
    int v191 = 0;
  LOBYTE(v225) = v244;
  -[PVMotionEffect adjustCutawayInputs:splitCropRectA:splitCropRectB:pipRect:pipScaleFactor:renderScale:pipNeedsCrop:isHDRRender:workingColorSpace:](self, "adjustCutawayInputs:splitCropRectA:splitCropRectB:pipRect:pipScaleFactor:renderScale:pipNeedsCrop:isHDRRender:workingColorSpace:", &v292, v184, v185, v235, v237, v191 == 0, v225, v175);
  v192 = [*location objectForKeyedSubscript:@"inputANeedsBackground"];
  uint64_t v193 = [v192 BOOLValue];

  v194 = [*location objectForKeyedSubscript:@"inputBNeedsBackground"];
  uint64_t v195 = [v194 BOOLValue];

  v250 = [*location objectForKeyedSubscript:@"slideACropRect"];
  v196 = [*location objectForKeyedSubscript:@"slideBCropRect"];
  (*(void (**)(void))(**(void **)a6.m_Obj + 48))();
  -[PVMotionEffect adjustTransitionInputs:renderScale:renderer:inputANeedsBackground:inputBNeedsBackground:slideCropRectA:slideCropRectB:](self, "adjustTransitionInputs:renderScale:renderer:inputANeedsBackground:inputBNeedsBackground:slideCropRectA:slideCropRectB:", &v292, a5, v193, v195, v250, v196);
  [(PVMotionEffect *)self adjustPosition:*location];
  id v197 = *location;
  long long v266 = *(_OWORD *)&a3->var0;
  int64_t v267 = a3->var3;
  [(PVMotionEffect *)self updateSketchAnimation:v197 defaultProperties:0 time:&v266];
  [(PVMotionEffect *)self adjustCamera:*location];
  id v198 = *location;
  CMTime v265 = v327;
  [(PVMotionEffect *)self applyARData:v198 time:&v265 renderParams:v271];
  [(PVMotionEffect *)self deleteTemporalInspectableProperties];
  motionComponents = self->_motionComponents;
  v262[0] = MEMORY[0x1E4F143A8];
  v262[1] = *(void *)"";
  v262[2] = __58__PVMotionEffect_hgNodeForTime_inputs_renderer_igContext___block_invoke;
  v262[3] = &unk_1E6169E20;
  v262[4] = self;
  long long v263 = *(_OWORD *)&a3->var0;
  int64_t v264 = a3->var3;
  [(NSMutableArray *)motionComponents enumerateObjectsUsingBlock:v262];
  if (v242) {
    objc_storeStrong(location, obj);
  }
  int v200 = [(PVMotionEffect *)self getOSFAOption:*location];
  {
    -[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName = 0;
    PCString::set((PCString *)&-[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName, @"IsHDR");
    __cxa_atexit((void (*)(void *))PCString::~PCString, &-[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName, &dword_1B73F3000);
    v98 = v101;
  }
  double v201 = 0.0;
  if (v244) {
    double v201 = 1.0;
  }
  OZXSetRigValueWithName(*(void **)self->_documentInfo, (PCString *)&-[PVMotionEffect hgNodeForTime:inputs:renderer:igContext:]::rigCheckboxName, v201);
  v202 = (PCColorSpaceCache *)[(NSLock *)self->super._inspectablePropertiesLock unlock];
  v203 = v241;
  if (v244)
  {
    v227 = v185;
    v204 = v292;
    if (v292 != (uint64_t *)v293)
    {
      do
      {
        if ((!v98 || *((_DWORD *)v204 + 8) != 1) && (!v203 || (*((_DWORD *)v204 + 8) - 1) >= 2))
        {
          v202 = (PCColorSpaceCache *)v204[5];
          if (v200)
          {
            if (v202)
            {
              *(void *)&long long v270 = v204[5];
              (*(void (**)(PCColorSpaceCache *))(*(void *)v202 + 16))(v202);
              FxApplySimpleToneCurve((uint64_t *)&v270, &v282, 0.7, 12.0);
              uint64_t v205 = v282;
              if ((void)v270 == (void)v282)
              {
                if ((void)v270) {
                  (*(void (**)(void))(*(void *)v270 + 24))();
                }
              }
              else
              {
                if ((void)v270)
                {
                  (*(void (**)(void))(*(void *)v270 + 24))();
                  uint64_t v205 = v282;
                }
                *(void *)&long long v270 = v205;
              }
              if (v200 == 2)
              {
                FxApplyColorConform((uint64_t *)&v270, (uint64_t)&kPCNCLC_Rec2020Linear, 1, (uint64_t)&kPCNCLC_Rec709, (char *)1, (uint64_t *)&v282);
                uint64_t v206 = v282;
                if ((void)v270 == (void)v282)
                {
                  if ((void)v270) {
                    (*(void (**)(void))(*(void *)v270 + 24))();
                  }
                }
                else
                {
                  if ((void)v270)
                  {
                    (*(void (**)(void))(*(void *)v270 + 24))();
                    uint64_t v206 = v282;
                  }
                  *(void *)&long long v270 = v206;
                }
              }
              goto LABEL_276;
            }
          }
          else
          {
            *(void *)&long long v270 = v204[5];
            if (v202)
            {
              (*(void (**)(PCColorSpaceCache *))(*(void *)v202 + 16))(v202);
LABEL_276:
              v202 = (PCColorSpaceCache *)v204[5];
              uint64_t v207 = v270;
              if (v202 == (PCColorSpaceCache *)v270)
              {
                v203 = v241;
                if (v202)
                {
                  v202 = (PCColorSpaceCache *)(*(uint64_t (**)(PCColorSpaceCache *))(*(void *)v202 + 24))(v202);
                  v203 = v241;
                }
              }
              else
              {
                if (v202)
                {
                  v202 = (PCColorSpaceCache *)(*(uint64_t (**)(PCColorSpaceCache *))(*(void *)v202 + 24))(v202);
                  uint64_t v207 = v270;
                }
                v203 = v241;
                v204[5] = v207;
              }
            }
          }
        }
        v208 = (uint64_t *)v204[1];
        if (v208)
        {
          do
          {
            v209 = v208;
            v208 = (uint64_t *)*v208;
          }
          while (v208);
        }
        else
        {
          do
          {
            v209 = (uint64_t *)v204[2];
            BOOL v189 = *v209 == (void)v204;
            v204 = v209;
          }
          while (!v189);
        }
        v204 = v209;
      }
      while (v209 != (uint64_t *)v293);
    }
    v185 = v227;
    if (v200 == 2)
    {
      uint64_t v276 = PCColorSpaceCache::cgRec709(v202);
      uint64_t v277 = v276;
      LOBYTE(v278) = 0;
      HIDWORD(v278) = 0;
    }
  }
  v210 = (void **)self->_documentInfo;
  *(void *)&long long v270 = 0;
  v211 = *v210;
  CMTime v261 = v327;
  std::map<unsigned int,HGRef<HGNode>>::map[abi:ne180100](v260, (uint64_t)&v292);
  std::map<unsigned int,unsigned int>::map[abi:ne180100](v259, (uint64_t)&v286);
  std::map<unsigned int,PCRect<double>>::map[abi:ne180100]((uint64_t)v257, (uint64_t)&v290);
  std::map<unsigned int,PCMatrix44Tmpl<double>>::map[abi:ne180100]((uint64_t)v255, (uint64_t)&v288);
  LODWORD(v211) = OZXGetFrameAsRenderGraph(v211, &v261, (uint64_t)v260, (uint64_t)v259, (uint64_t)v257, (uint64_t)v255, (uint64_t)v271, &v300, 0, *(HGRenderer **)a5, (METimeRemap **)&v270);
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)v255, v256);
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)v257, v258);
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)v259, (void *)v259[1]);
  std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::destroy((uint64_t)v260, (void *)v260[1]);
  v213 = (unsigned int *)v270;
  if (v211)
  {
    if (!(void)v270) {
      goto LABEL_348;
    }
  }
  else
  {
    CMTimeValue v214 = *v246;
    if (*v246 != (void)v270)
    {
      if (v214)
      {
        (*(void (**)(CMTimeValue))(*(void *)v214 + 24))(v214);
        v213 = (unsigned int *)v270;
      }
      CMTimeValue *v246 = (CMTimeValue)v213;
      if (v213) {
        (*(void (**)(unsigned int *))(*(void *)v213 + 16))(v213);
      }
    }
    if (v244)
    {
      if (v200)
      {
        if (v213)
        {
          v338 = v213;
          (*(void (**)(unsigned int *))(*(void *)v213 + 16))(v213);
          if (v200 == 2)
          {
            FxApplyColorConform((uint64_t *)&v338, (uint64_t)&kPCNCLC_Rec709, 1, (uint64_t)&kPCNCLC_Rec2020Linear, (char *)1, (uint64_t *)&v282);
            v215 = (unsigned int *)v282;
            if (v338 == (unsigned int *)v282)
            {
              if (v338) {
                (*(void (**)(void))(*(void *)v338 + 24))();
              }
            }
            else
            {
              if (v338)
              {
                (*(void (**)(void))(*(void *)v338 + 24))();
                v215 = (unsigned int *)v282;
              }
              v338 = v215;
            }
          }
          FxApplyInverseSimpleToneCurve((uint64_t *)&v338, &v282, 0.7, 12.0);
          v216 = (unsigned int *)v282;
          if (v338 == (unsigned int *)v282)
          {
            if (v338) {
              (*(void (**)(void))(*(void *)v338 + 24))();
            }
          }
          else
          {
            if (v338)
            {
              (*(void (**)(void))(*(void *)v338 + 24))();
              v216 = (unsigned int *)v282;
            }
            v338 = v216;
          }
        }
        else
        {
          v338 = 0;
        }
      }
      else
      {
        v338 = v213;
        if (v213) {
          (*(void (**)(unsigned int *))(*(void *)v213 + 16))(v213);
        }
      }
      v217 = v338;
      if (v213 == v338)
      {
        if (v213) {
          (*(void (**)(unsigned int *))(*(void *)v213 + 24))(v213);
        }
      }
      else
      {
        if (v213)
        {
          (*(void (**)(unsigned int *))(*(void *)v213 + 24))(v213);
          v217 = v338;
        }
        CMTimeValue *v246 = (CMTimeValue)v217;
      }
    }
    v212.n128_f32[0] = v238;
    if (v238 >= 0.00001)
    {
      CMTimeValue v218 = *v246;
      CMTimeValue v254 = v218;
      if (v218) {
        (*(void (**)(CMTimeValue, float))(*(void *)v218 + 16))(v218, v238);
      }
      v219.f64[0] = v240.f64[0];
      v219.f64[1] = v239;
      HGXFormForScaleAroundPoint(&v254, (HGXForm **)&v282, v219, 1.0 / v16, (float64x2_t)0);
      CMTimeValue v220 = v282;
      if (v218 == (void)v282)
      {
        if (v218) {
          (*(void (**)(CMTimeValue))(*(void *)v218 + 24))(v218);
        }
      }
      else
      {
        if (v218)
        {
          (*(void (**)(CMTimeValue))(*(void *)v218 + 24))(v218);
          CMTimeValue v220 = v282;
        }
        CMTimeValue *v246 = v220;
        *(void *)&long long v282 = 0;
      }
      if (v254) {
        (*(void (**)(CMTimeValue))(*(void *)v254 + 24))(v254);
      }
    }
    if (v231)
    {
      CMTimeValue v221 = *v246;
      CMTimeValue v253 = v221;
      if (v221) {
        (*(void (**)(CMTimeValue, __n128))(*(void *)v221 + 16))(v221, v212);
      }
      v222.f64[0] = v240.f64[0];
      v222.f64[1] = v239;
      HGXFormForScaleAroundPoint(&v253, (HGXForm **)&v282, v222, v298, v297);
      CMTimeValue v223 = v282;
      if (v221 == (void)v282)
      {
        if (v221) {
          (*(void (**)(CMTimeValue))(*(void *)v221 + 24))(v221);
        }
      }
      else
      {
        if (v221)
        {
          (*(void (**)(CMTimeValue))(*(void *)v221 + 24))(v221);
          CMTimeValue v223 = v282;
        }
        CMTimeValue *v246 = v223;
        *(void *)&long long v282 = 0;
      }
      if (v253) {
        (*(void (**)(CMTimeValue))(*(void *)v253 + 24))(v253);
      }
    }
    self->_lastRenderWasHDR = v244;
    v213 = (unsigned int *)v270;
    if (!(void)v270) {
      goto LABEL_348;
    }
  }
  (*(void (**)(unsigned int *))(*(void *)v213 + 24))(v213);
LABEL_348:

  if (__p)
  {
    v285 = (unsigned int *)__p;
    operator delete(__p);
  }
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v286, v287[0]);
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v288, v289[0]);
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v290, v291[0]);
  std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::destroy((uint64_t)&v292, v293[0]);

  [(NSLock *)self->_documentLock unlock];
LABEL_351:

  return v224;
}

uint64_t __58__PVMotionEffect_hgNodeForTime_inputs_renderer_igContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 144);
  uint64_t v4 = *(void *)(v2 + 80);
  long long v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 56);
  return [a2 motionEffect:v2 willRender:v3 properties:v4 time:&v6];
}

- (void)adjustCutawayBorder:(id)a3
{
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  id v5 = [v4 objectForKeyedSubscript:@"splitACropRect"];
  long long v6 = v5;
  if (v5)
  {
    [v5 CGRectValue];
    double v8 = v7;
    double v10 = v9;
    v21.int var0 = 0;
    PCString::set(&v21, @"Orientation");
    double v11 = 0.0;
    if (v8 > v10) {
      double v11 = 1.0;
    }
    OZXSetRigValueWithName(*(void **)self->_documentInfo, &v21, v11);
    PCString::~PCString(&v21);
    unsigned int v12 = 0;
  }
  else
  {
    BOOL v13 = [v4 objectForKeyedSubscript:@"pipRect"];
    unsigned int v12 = v13;
    if (v13)
    {
      [v13 CGRectValue];
      documentInfo = (void **)self->_documentInfo;
      LODWORD(v15) = *((_DWORD *)documentInfo + 3);
      LODWORD(v16) = *((_DWORD *)documentInfo + 4);
      OZXSetBorderScaleAndTranslation(*documentInfo, v19, v20, (v18 + v19 * 0.5 + -0.5) * (double)v15, (0.5 - (v17 + v20 * 0.5)) * (double)v16);
    }
  }
}

- (void)adjustCutawayFadeAnimation:(id)a3
{
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  id v5 = [v4 objectForKeyedSubscript:@"pipFadeIn"];
  if (v5)
  {
    long long v6 = [v4 objectForKeyedSubscript:@"pipFadeOut"];
    if (v6)
    {
      memset(&v21, 0, sizeof(v21));
      [v5 floatValue];
      CMTimeMakeWithSeconds(&v21, v7, 30);
      memset(&v20, 0, sizeof(v20));
      [v6 floatValue];
      CMTimeMakeWithSeconds(&v20, v8, 30);
      long long v18 = *MEMORY[0x1E4F1FA48];
      *(void *)double v19 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
      [(PVEffect *)self effectRange];
      *(_OWORD *)&v19[8] = v16;
      *(void *)&v19[24] = v17;
      memset(&v15, 0, sizeof(v15));
      timelineComponent = self->_timelineComponent;
      CMTime v14 = v21;
      _OWORD v13[2] = *(_OWORD *)&v19[16];
      v13[0] = v18;
      v13[1] = *(_OWORD *)v19;
      if (timelineComponent)
      {
        [(PVMotionEffectTimelineComponent *)timelineComponent timelineTimeFromComponentTime_NoLock:&v14 editRange:v13 documentInfo:self->_documentInfo];
        timelineComponent = self->_timelineComponent;
      }
      memset(&v12, 0, sizeof(v12));
      CMTime v11 = v20;
      v10[0] = v18;
      v10[1] = *(_OWORD *)v19;
      v10[2] = *(_OWORD *)&v19[16];
      if (timelineComponent) {
        [(PVMotionEffectTimelineComponent *)timelineComponent timelineTimeFromComponentTime_NoLock:&v11 editRange:v10 documentInfo:self->_documentInfo];
      }
      OZXSetCutawayFadeInOut(*(void **)self->_documentInfo, &v15, &v12);
    }
  }
}

- (void)adjustCutawayInputs:(void *)a3 splitCropRectA:(id)a4 splitCropRectB:(id)a5 pipRect:(id)a6 pipScaleFactor:(id)a7 renderScale:(float)a8 pipNeedsCrop:(BOOL)a9 isHDRRender:(BOOL)a10 workingColorSpace:(CGColorSpace *)a11
{
  BOOL v11 = a9;
  id v18 = a4;
  id v19 = a5;
  id v98 = a6;
  id v97 = a7;
  LODWORD(v99) = 0;
  v100 = &v99;
  CMTime v20 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v99, (uint64_t)&std::piecewise_construct, (_DWORD **)&v100);
  CMTime v21 = v20[5];
  if (v21) {
    (*(void (**)(uint64_t *))(*v21 + 16))(v20[5]);
  }
  LODWORD(v99) = 1;
  v100 = &v99;
  unsigned int v22 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v99, (uint64_t)&std::piecewise_construct, (_DWORD **)&v100);
  long long v23 = v22[5];
  if (v23) {
    (*(void (**)(uint64_t *))(*v23 + 16))(v22[5]);
  }
  id v24 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"pipNeedsBackground"];
  int v25 = [v24 BOOLValue];

  id v26 = v18;
  uint64_t v27 = v26;
  if (v26)
  {
    [v26 CGRectValue];
    CGFloat x = v102.origin.x;
    CGFloat y = v102.origin.y;
    CGFloat width = v102.size.width;
    CGFloat height = v102.size.height;
    double MinX = CGRectGetMinX(v102);
    v103.origin.CGFloat x = x;
    v103.origin.CGFloat y = y;
    v103.size.CGFloat width = width;
    v103.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v103);
    v104.origin.CGFloat x = x;
    v104.origin.CGFloat y = y;
    v104.size.CGFloat width = width;
    v104.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v104);
    v105.origin.CGFloat x = x;
    v105.origin.CGFloat y = y;
    v105.size.CGFloat width = width;
    v105.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v105);
    double v36 = (HGCrop *)HGObject::operator new(0x1A0uLL);
    HGCrop::HGCrop(v36);
    float v37 = MinX;
    float v38 = MaxX;
    float v39 = MaxY;
    float v40 = v39 * a8;
    float v41 = v38 * a8;
    float v42 = MinY;
    uint64_t v44 = HGRectMake4f(v43, v37 * a8, v42 * a8, v41, v40);
    (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v36 + 96))(v36, 0, (float)(int)v44, (float)SHIDWORD(v44), (float)v45, (float)v46);
    (*(void (**)(HGCrop *, void, uint64_t *))(*(void *)v36 + 120))(v36, 0, v21);
    LODWORD(v99) = 0;
    v100 = &v99;
    double v47 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v99, (uint64_t)&std::piecewise_construct, (_DWORD **)&v100);
    double v48 = (HGCrop *)v47[5];
    if (v48 != v36)
    {
      if (v48) {
        (*(void (**)(HGCrop *))(*(void *)v48 + 24))(v48);
      }
      v47[5] = (uint64_t *)v36;
      (*(void (**)(HGCrop *))(*(void *)v36 + 16))(v36);
    }
    id v49 = v19;

    if (v49)
    {
      [v49 CGRectValue];
      CGFloat v50 = v106.origin.x;
      CGFloat v51 = v106.origin.y;
      CGFloat v52 = v106.size.width;
      CGFloat v53 = v106.size.height;
      double v54 = CGRectGetMinX(v106);
      v107.origin.CGFloat x = v50;
      v107.origin.CGFloat y = v51;
      v107.size.CGFloat width = v52;
      v107.size.CGFloat height = v53;
      double v55 = CGRectGetMaxX(v107);
      v108.origin.CGFloat x = v50;
      v108.origin.CGFloat y = v51;
      v108.size.CGFloat width = v52;
      v108.size.CGFloat height = v53;
      double v56 = CGRectGetMinY(v108);
      v109.origin.CGFloat x = v50;
      v109.origin.CGFloat y = v51;
      v109.size.CGFloat width = v52;
      v109.size.CGFloat height = v53;
      double v57 = CGRectGetMaxY(v109);
      BOOL v58 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v58);
      float v59 = v54;
      float v60 = v55;
      float v61 = v57;
      float v62 = v61 * a8;
      float v63 = v60 * a8;
      float v64 = v56;
      uint64_t v66 = HGRectMake4f(v65, v59 * a8, v64 * a8, v63, v62);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v58 + 96))(v58, 0, (float)(int)v66, (float)SHIDWORD(v66), (float)v67, (float)v68);
      (*(void (**)(HGCrop *, void, uint64_t *))(*(void *)v58 + 120))(v58, 0, v23);
      LODWORD(v99) = 1;
      v100 = &v99;
      uint64_t v69 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v99, (uint64_t)&std::piecewise_construct, (_DWORD **)&v100);
      v70 = (HGCrop *)v69[5];
      if (v70 != v58)
      {
        if (v70) {
          (*(void (**)(HGCrop *))(*(void *)v70 + 24))(v70);
        }
        v69[5] = (uint64_t *)v58;
        (*(void (**)(HGCrop *))(*(void *)v58 + 16))(v58);
      }
      (*(void (**)(HGCrop *))(*(void *)v58 + 24))(v58);
    }
    (*(void (**)(HGCrop *))(*(void *)v36 + 24))(v36);
  }
  else
  {
    if (v98)
    {
      if ((v25 & 1) != 0 || ([v97 doubleValue], v88 > 1.0) || v11)
      {
        [v98 CGRectValue];
        float v72 = v71 * a8;
        float v74 = v73 * a8;
        float v76 = v75 * v72 / v71;
        float v78 = v77 * v74 / v73;
        float v79 = v72 + v76;
        float v80 = v74 + v78;
        if (v25)
        {
          LODWORD(v99) = 0;
          v100 = &v99;
          v81 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v99, (uint64_t)&std::piecewise_construct, (_DWORD **)&v100);
          char v83 = v81[5];
          if (v83) {
            (*(void (**)(uint64_t *))(*v83 + 16))(v81[5]);
          }
          uint64_t v84 = HGRectMake4f(v82, v76, v78, v79, v80);
          uint64_t v86 = v85;
          v87 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
          *(void *)&v101.int var0 = v84;
          *(void *)&v101.int var2 = v86;
          HGSolidColor::HGSolidColor(v87, v101);
        }
        [v97 doubleValue];
        if (v89 > 1.0 || v11)
        {
          v90 = (HGCrop *)HGObject::operator new(0x1A0uLL);
          HGCrop::HGCrop(v90);
          uint64_t v92 = HGRectMake4f(v91, v76, v78, v79, v80);
          (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v90 + 96))(v90, 0, (float)(int)v92, (float)SHIDWORD(v92), (float)v93, (float)v94);
          (*(void (**)(HGCrop *, void, uint64_t *))(*(void *)v90 + 120))(v90, 0, v23);
          LODWORD(v99) = 1;
          v100 = &v99;
          double v95 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v99, (uint64_t)&std::piecewise_construct, (_DWORD **)&v100);
          double v96 = (HGCrop *)v95[5];
          if (v96 != v90)
          {
            if (v96) {
              (*(void (**)(HGCrop *))(*(void *)v96 + 24))(v96);
            }
            v95[5] = (uint64_t *)v90;
            (*(void (**)(HGCrop *))(*(void *)v90 + 16))(v90);
          }
          (*(void (**)(HGCrop *))(*(void *)v90 + 24))(v90);
        }
      }
    }
    id v49 = 0;
  }

  if (v23) {
    (*(void (**)(uint64_t *))(*v23 + 24))(v23);
  }
  if (v21) {
    (*(void (**)(uint64_t *))(*v21 + 24))(v21);
  }
}

- (HGRect)makeCropRectForDOD:(HGRect)a3 renderRect:(CGRect)a4 renderScale:(float)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  int var2 = a3.var2;
  int var0 = a3.var0;
  int var1 = a3.var1;
  int var3 = a3.var3;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  float MinX = CGRectGetMinX(a4);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  float MaxX = CGRectGetMaxX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  float MinY = CGRectGetMinY(v31);
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  float MaxY = CGRectGetMaxY(v32);
  float v21 = MinY * a5;
  float v22 = MaxY * a5;
  if ((float)((float)var0 - (float)(MinX * a5)) > 2.0
    || (float)((float)var2 - (float)(MaxX * a5)) > 2.0
    || (float)((float)var1 - v21) > 2.0
    || (float)((float)var3 - v22) > 2.0)
  {
    uint64_t v14 = HGRectMake4f(v19, MinX * a5, v21, MaxX * a5, v22);
    uint64_t v15 = v26;
  }
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  result.int var2 = v28;
  result.int var3 = HIDWORD(v28);
  result.int var0 = v27;
  result.int var1 = HIDWORD(v27);
  return result;
}

- (void)adjustTransitionInputs:(void *)a3 renderScale:(float)a4 renderer:(const void *)a5 inputANeedsBackground:(BOOL)a6 inputBNeedsBackground:(BOOL)a7 slideCropRectA:(id)a8 slideCropRectB:(id)a9
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  id v16 = a8;
  id v17 = a9;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  if (v11)
  {
    LODWORD(v75) = 0;
    *(void *)&v74.int var0 = &v75;
    id v18 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v75, (uint64_t)&std::piecewise_construct, &v74);
    float v21 = v18[5];
    if (v21) {
      __n128 v19 = ((__n128 (*)(uint64_t *))*(void *)(*v21 + 16))(v18[5]);
    }
    documentInfo = self->_documentInfo;
    v19.n128_u32[0] = documentInfo[3];
    LODWORD(v20) = documentInfo[4];
    uint64_t v23 = HGRectMake4i(0, 0, (int)(a4 * (double)v19.n128_u64[0]), (int)(a4 * (double)v20));
    uint64_t v25 = v24;
    uint64_t v26 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(void *)&v76.int var0 = v23;
    *(void *)&v76.int var2 = v25;
    HGSolidColor::HGSolidColor(v26, v76);
  }
  if (v10)
  {
    LODWORD(v75) = 1;
    *(void *)&v74.int var0 = &v75;
    uint64_t v27 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v75, (uint64_t)&std::piecewise_construct, &v74);
    CGRect v30 = v27[5];
    if (v30) {
      __n128 v28 = ((__n128 (*)(uint64_t *))*(void *)(*v30 + 16))(v27[5]);
    }
    CGRect v31 = self->_documentInfo;
    v28.n128_u32[0] = v31[3];
    LODWORD(v29) = v31[4];
    uint64_t v32 = HGRectMake4i(0, 0, (int)(a4 * (double)v28.n128_u64[0]), (int)(a4 * (double)v29));
    uint64_t v34 = v33;
    long long v35 = (HGSolidColor *)HGObject::operator new(0x1A0uLL);
    *(void *)&v77.int var0 = v32;
    *(void *)&v77.int var2 = v34;
    HGSolidColor::HGSolidColor(v35, v77);
  }
  id v36 = v16;
  float v37 = v36;
  if (v36)
  {
    [v36 CGRectValue];
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
    LODWORD(v75) = 0;
    *(void *)&v74.int var0 = &v75;
    int v46 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v75, (uint64_t)&std::piecewise_construct, &v74);
    double v47 = (HGNode *)v46[5];
    if (v47) {
      (*(void (**)(uint64_t *))(*(void *)v47 + 16))(v46[5]);
    }
    uint64_t DOD = HGRenderer::GetDOD(*(HGRenderer **)a5, v47);
    *(void *)&v74.int var0 = 0;
    *(void *)&v74.int var2 = 0;
    *(float *)&double v49 = a4;
    *(void *)&v74.int var0 = -[PVMotionEffect makeCropRectForDOD:renderRect:renderScale:](self, "makeCropRectForDOD:renderRect:renderScale:", DOD, v50, v39, v41, v43, v45, v49);
    *(void *)&v74.int var2 = v51;
    if (!HGRect::IsZero(&v74))
    {
      CGFloat v52 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v52);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v52 + 96))(v52, 0, (float)v74.var0, (float)v74.var1, (float)v74.var2, (float)v74.var3);
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v52 + 120))(v52, 0, v47);
      unsigned int v73 = 0;
      double v75 = &v73;
      CGFloat v53 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, &v73, (uint64_t)&std::piecewise_construct, &v75);
      double v54 = (HGCrop *)v53[5];
      if (v54 != v52)
      {
        if (v54) {
          (*(void (**)(HGCrop *))(*(void *)v54 + 24))(v54);
        }
        v53[5] = (uint64_t *)v52;
        (*(void (**)(HGCrop *))(*(void *)v52 + 16))(v52);
      }
      (*(void (**)(HGCrop *))(*(void *)v52 + 24))(v52);
    }
    if (v47) {
      (*(void (**)(HGNode *))(*(void *)v47 + 24))(v47);
    }
  }
  id v55 = v17;

  if (v55)
  {
    [v55 CGRectValue];
    double v57 = v56;
    double v59 = v58;
    double v61 = v60;
    double v63 = v62;
    LODWORD(v75) = 1;
    *(void *)&v74.int var0 = &v75;
    float v64 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, (unsigned int *)&v75, (uint64_t)&std::piecewise_construct, &v74);
    uint64_t v65 = (HGNode *)v64[5];
    if (v65) {
      (*(void (**)(uint64_t *))(*(void *)v65 + 16))(v64[5]);
    }
    uint64_t v66 = HGRenderer::GetDOD(*(HGRenderer **)a5, v65);
    *(float *)&double v67 = a4;
    *(void *)&v74.int var0 = -[PVMotionEffect makeCropRectForDOD:renderRect:renderScale:](self, "makeCropRectForDOD:renderRect:renderScale:", v66, v68, v57, v59, v61, v63, v67);
    *(void *)&v74.int var2 = v69;
    if (!HGRect::IsZero(&v74))
    {
      v70 = (HGCrop *)HGObject::operator new(0x1A0uLL);
      HGCrop::HGCrop(v70);
      (*(void (**)(HGCrop *, void, float, float, float, float))(*(void *)v70 + 96))(v70, 0, (float)v74.var0, (float)v74.var1, (float)v74.var2, (float)v74.var3);
      (*(void (**)(HGCrop *, void, HGNode *))(*(void *)v70 + 120))(v70, 0, v65);
      unsigned int v73 = 1;
      double v75 = &v73;
      double v71 = std::__tree<std::__value_type<unsigned int,HGRef<HGNode>>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,HGRef<HGNode>>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,HGRef<HGNode>>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int const&>,std::tuple<>>((uint64_t **)a3, &v73, (uint64_t)&std::piecewise_construct, &v75);
      float v72 = (HGCrop *)v71[5];
      if (v72 != v70)
      {
        if (v72) {
          (*(void (**)(HGCrop *))(*(void *)v72 + 24))(v72);
        }
        v71[5] = (uint64_t *)v70;
        (*(void (**)(HGCrop *))(*(void *)v70 + 16))(v70);
      }
      (*(void (**)(HGCrop *))(*(void *)v70 + 24))(v70);
    }
    if (v65) {
      (*(void (**)(HGNode *))(*(void *)v65 + 24))(v65);
    }
  }
}

- (void)adjustKenBurnsAnimation:(id)a3
{
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kenBurnsStartXForm"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"kenBurnsEndXForm"];
  if (v5 | v6)
  {
    unsigned int v22 = 0;
    if (!OZXGetDropZone(*(void *)self->_documentInfo, 0, &v22) && v22 != 0)
    {
      if (v5)
      {
        CGAffineTransformFromString(&v21, (NSString *)v5);
      }
      else
      {
        long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v21.c = v8;
        *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      long long v9 = *(_OWORD *)&v21.a;
      long long v10 = *(_OWORD *)&v21.c;
      long long v11 = *(_OWORD *)&v21.tx;
      if (v6)
      {
        CGAffineTransformFromString(&v21, (NSString *)v6);
      }
      else
      {
        long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v21.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v21.c = v12;
        *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      long long v13 = *(_OWORD *)&v21.tx;
      float v14 = sqrt(*(double *)&v9 * *(double *)&v9 + *(double *)&v10 * *(double *)&v10);
      float v15 = sqrt(*((double *)&v9 + 1) * *((double *)&v9 + 1) + *((double *)&v10 + 1) * *((double *)&v10 + 1));
      float v16 = sqrt(v21.a * v21.a + v21.c * v21.c);
      float v17 = sqrt(v21.b * v21.b + v21.d * v21.d);
      OZXSetDropZoneScaleAnimation(*(void *)self->_documentInfo, v22, v14, v15, v16, v17);
      documentInfo = self->_documentInfo;
      LODWORD(v19) = documentInfo[3];
      LODWORD(v20) = documentInfo[4];
      OZXSetDropZoneTranslationAnimation(*(void *)documentInfo, v22, *(double *)&v11 * (double)v19, *((double *)&v11 + 1) * (double)v20, *(double *)&v13 * (double)v19, *((double *)&v13 + 1) * (double)v20);
    }
  }
}

- (void)setMaskPoints:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  id v4 = [v20 objectForKeyedSubscript:@"Mask Data"];
  uint64_t v5 = v4;
  if (v4 && (unint64_t)[v4 count] >= 3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v34 != v9) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * i) CGPointValue];
          documentInfo = self->_documentInfo;
          LODWORD(v12) = documentInfo[3];
          LODWORD(v13) = documentInfo[4];
          float v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", (v15 + -0.5) * (double)v12, (0.5 - v14) * (double)v13);
          [v6 addObject:v16];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v8);
    }

    PCColor::PCColor(&v32);
    LOWORD(v28) = 257;
    BYTE2(v28) = 0;
    int v29 = 0;
    uint64_t v17 = *(void *)self->_documentInfo;
    long long v26 = v18[2];
    long long v19 = *v18;
    long long v25 = v18[1];
    char v22 = v30;
    uint64_t v21 = v28;
    int v23 = v31;
    long long v24 = v19;
    id obj = v32.var1._obj;
    if (v32.var1._obj) {
      PCCFRefTraits<CGColorSpace *>::retain(v32.var1._obj);
    }
    OZXSetShapePoints(v17, v6, 1, (unsigned __int8 *)&v21);
    PCCFRef<CGColorSpace *>::~PCCFRef(&obj);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v32.var1._obj);
  }
}

- (void)setSketchStrokes:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  id v4 = [v29 objectForKeyedSubscript:@"SketchColor"];
  uint64_t v5 = v4;
  double v45 = 0.0;
  double v46 = 0.0;
  double v44 = 0.0;
  if (v4) {
    [v4 getRed:&v46 green:&v45 blue:&v44 alpha:0];
  }
  unsigned int v28 = [v29 objectForKeyedSubscript:@"SketchData"];
  if (v28 && [v28 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v28;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v41 != v9) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "CGPointValue", v28);
          documentInfo = self->_documentInfo;
          LODWORD(v12) = documentInfo[3];
          LODWORD(v13) = documentInfo[4];
          float v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", (v15 + -0.5) * (double)v12, (0.5 - v14) * (double)v13);
          [v6 addObject:v16];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
      }
      while (v8);
    }

    PCColor::PCColor(&v39);
    LOWORD(v36) = 0;
    BYTE2(v36) = 1;
    HIDWORD(v36) = 1;
    uint64_t v17 = [v29 objectForKeyedSubscript:@"Sketch Write On"];
    int v18 = [v17 BOOLValue];

    if (v18) {
      char v37 = 1;
    }
    if (v5)
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      float v21 = v46;
      float v22 = v45;
      float v23 = v44;
      PCColor::PCColor(&v35, v21, v22, v23, 1.0, DeviceRGB);
      CGColorSpaceRelease(DeviceRGB);
      *(_OWORD *)&v39.var0.int var0 = *(_OWORD *)&v35.var0.var0;
      *(_OWORD *)&v39.var0.var1[1] = *(_OWORD *)&v35.var0.var1[1];
      *(_OWORD *)&v39.var0.var1[3] = *(_OWORD *)&v35.var0.var1[3];
      PCCFRef<CGColorSpace *>::operator=(&v39.var1._obj, &v35.var1._obj);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v35.var1._obj);
    }
    else
    {
      long long v24 = PCColor::BLACK(v19);
      long long v25 = *(_OWORD *)v24;
      long long v26 = *((_OWORD *)v24 + 2);
      *(_OWORD *)&v39.var0.var1[1] = *((_OWORD *)v24 + 1);
      *(_OWORD *)&v39.var0.var1[3] = v26;
      *(_OWORD *)&v39.var0.int var0 = v25;
      PCCFRef<CGColorSpace *>::operator=(&v39.var1._obj, (CGColorSpace **)v24 + 6);
    }
    int v38 = 10;
    uint64_t v27 = *(void *)self->_documentInfo;
    PCColor v34 = v39;
    char v32 = v37;
    double v31 = v36;
    int v33 = 10;
    if (v39.var1._obj) {
      PCCFRefTraits<CGColorSpace *>::retain(v39.var1._obj);
    }
    OZXSetShapePoints(v27, v6, 0, (unsigned __int8 *)&v31);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v34.var1._obj);
    PCCFRef<CGColorSpace *>::~PCCFRef(&v39.var1._obj);
  }
  else if (v5)
  {
    double v36 = 0.0;
    *(void *)&v35.var0.int var0 = 0;
    double v30 = 0.0;
    [v5 getRed:&v36 green:&v35 blue:&v30 alpha:0];
    OZXSetShapeRGBColor(*(void *)self->_documentInfo, v36, *(double *)&v35.var0.var0, v30);
  }
}

- (void)updateSketchAnimation:(id)a3 defaultProperties:(id)a4 time:(id *)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v32 = a4;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] objectForKey:@"SketchData" inDictionary:v31 orInDefaultDictionary:v32];
  uint64_t v9 = v8;
  if (v8 && [v8 count])
  {
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] objectForKey:@"SketchTransformAnimation" inDictionary:v31 orInDefaultDictionary:v32];
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] objectForKey:@"ParentTransformAnimation" inDictionary:v31 orInDefaultDictionary:v32];
    if (v30 | v10)
    {
      id v28 = (id)v10;
      if (v30)
      {
        uint64_t v43 = 0;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
        long long v51 = *(_OWORD *)&a5->var0;
        int64_t var3 = a5->var3;
        [(id)v30 transformInfoAtTime:&v51];
        double v11 = 0.0;
        double v13 = 0.0;
        double v12 = 0.0;
      }
      else
      {
        double v12 = 0.0;
        double v13 = 1.0;
        double v11 = 0.0;
      }
      if (v28 && !kNoPanZoomEnabled)
      {
        uint64_t v43 = 0;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
        long long v49 = *(_OWORD *)&a5->var0;
        int64_t v50 = a5->var3;
        [v28 transformInfoAtTime:&v49];
        double v11 = 0.0 + 0.0;
        double v12 = 0.0 + 0.0;
        double v13 = v13 * 1.0;
      }
      double v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v28);
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v15 = v9;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v46;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v46 != v17) {
              objc_enumerationMutation(v15);
            }
            [*(id *)(*((void *)&v45 + 1) + 8 * i) CGPointValue];
            documentInfo = self->_documentInfo;
            LODWORD(v20) = documentInfo[3];
            LODWORD(v21) = documentInfo[4];
            long long v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v13 * ((v11 + v23 + -0.5) * (double)v20), v13 * ((0.5 - (v12 + v22)) * (double)v21));
            [v14 addObject:v24];
          }
          uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v16);
      }

      PCColor::PCColor((PCColor *)((char *)&v41 + 8));
      LOWORD(v40) = 0;
      BYTE2(v40) = 1;
      DWORD1(v40) = 1;
      uint64_t v25 = *(void *)self->_documentInfo;
      long long v38 = v26[2];
      long long v27 = *v26;
      long long v37 = v26[1];
      char v34 = BYTE8(v40);
      uint64_t v33 = v40;
      int v35 = v41;
      long long v36 = v27;
      CGColorSpaceRef v39 = space;
      if (space) {
        PCCFRefTraits<CGColorSpace *>::retain(space);
      }
      OZXSetShapePoints(v25, v14, 0, (unsigned __int8 *)&v33);
      PCCFRef<CGColorSpace *>::~PCCFRef(&v39);
      PCCFRef<CGColorSpace *>::~PCCFRef(&space);

      uint64_t v10 = (uint64_t)v29;
    }
  }
}

- (void)adjustPosition:(id)a3
{
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"Position"];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 CGPointValue];
    double v8 = v7;
    double v10 = v9;
    PCString::PCString(&v14, "Position");
    documentInfo = (void **)self->_documentInfo;
    LODWORD(v12) = *((_DWORD *)documentInfo + 3);
    LODWORD(v13) = *((_DWORD *)documentInfo + 4);
    OZXSetPublishedPosition(*documentInfo, &v14, v8 * (double)v12, v10 * (double)v13);
    PCString::~PCString(&v14);
  }
}

- (void)adjustCamera:(id)a3
{
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"SelfieEffectUsesCameraFacing"];

  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"SelfieEffectUsesCameraFacing"];
    uint64_t v7 = [v6 BOOLValue];

    [(PVMotionEffect *)self setIsFrontFacingCamera:v7];
  }
  double v8 = [v4 objectForKeyedSubscript:@"SelfieRollRadians"];
  [v8 doubleValue];
  -[PVMotionEffect setRollRadians:](self, "setRollRadians:");
  double v9 = [v4 objectForKeyedSubscript:@"kPVARSelfieEffectCameraOrientation"];
  double v10 = v9;
  if (v9)
  {
    double v11 = [v9 objectAtIndex:0];
    [v11 doubleValue];
    double v32 = v12;

    unint64_t v13 = [v10 objectAtIndex:1];
    [v13 doubleValue];
    double v31 = v14;

    id v15 = [v10 objectAtIndex:2];
    [v15 doubleValue];
    double v30 = v16;

    uint64_t v17 = [v10 objectAtIndex:3];
    [v17 doubleValue];
    double v29 = v18;

    *(double *)v19.i64 = v29;
    *(double *)&v19.i64[1] = v32;
    v20.f64[0] = v31;
    v20.f64[1] = v30;
    int8x16_t v21 = (int8x16_t)vnegq_f64(v20);
    float64x2_t v22 = (float64x2_t)vextq_s8(v19, (int8x16_t)vnegq_f64((float64x2_t)v19), 8uLL);
    float64x2_t v23 = (float64x2_t)vdupq_n_s64(0x8000000000000000);
    float64x2_t v24 = (float64x2_t)vdupq_n_s64(0xBFE6A09E667F3BCCLL);
    float64x2_t v25 = vmlaq_f64(vmulq_f64((float64x2_t)v21, v23), v24, (float64x2_t)vextq_s8((int8x16_t)v20, v21, 8uLL));
    float64x2_t v26 = (float64x2_t)vdupq_n_s64(0x3FE6A09E667F3BCDuLL);
    int8x16_t v27 = (int8x16_t)vaddq_f64(vmlaq_f64(vmulq_f64(v20, v26), v23, (float64x2_t)vextq_s8(v21, (int8x16_t)v20, 8uLL)), vmlaq_f64(vmulq_f64((float64x2_t)v19, v23), v24, v22));
    int8x16_t v28 = (int8x16_t)vaddq_f64(vmlaq_f64(vmulq_f64((float64x2_t)v19, v26), v23, v22), v25);
    v33[0] = vextq_s8(v28, v27, 8uLL);
    v33[1] = vextq_s8(v27, v28, 8uLL);
    OZXSetCameraQuaternion(*(uint64_t **)self->_documentInfo, MEMORY[0x1E4F1FA48], (double *)v33);
    [(PVMotionEffect *)self setQuaternion:v31 :v30 :v29 :v32];
  }
}

- (void)buildDropZoneIdMap_NoLock
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  v5[0] = 0;
  v5[1] = 0;
  id v4 = v5;
  if (!OZXGetDropZoneIDMap(*(void *)self->_documentInfo, (uint64_t)&v4))
  {
    uint64_t v3 = (uint64_t **)*((void *)self->_documentInfo + 21);
    if (v3)
    {
      if (v3 != &v4) {
        std::__tree<std::__value_type<unsigned int,unsigned int>,std::__map_value_compare<unsigned int,std::__value_type<unsigned int,unsigned int>,std::less<unsigned int>,true>,std::allocator<std::__value_type<unsigned int,unsigned int>>>::__assign_multi<std::__tree_const_iterator<std::__value_type<unsigned int,unsigned int>,std::__tree_node<std::__value_type<unsigned int,unsigned int>,void *> *,long>>(v3, v4, v5);
      }
    }
  }
  std::__tree<std::__value_type<int,__CVBuffer *>,std::__map_value_compare<int,std::__value_type<int,__CVBuffer *>,std::less<int>,true>,std::allocator<std::__value_type<int,__CVBuffer *>>>::destroy((uint64_t)&v4, v5[0]);
}

- (void)setupPublishedParameters:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v5 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend(v4, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [v5 objectForKeyedSubscript:v11];
        BOOL v13 = v12 == 0;

        [v4 objectForKeyedSubscript:v11];
        if (v13) {
          double v14 = {;
        }
          [v6 setObject:v14 forKeyedSubscript:v11];
        }
        else {
          double v14 = {;
        }
          id v15 = [v5 objectForKeyedSubscript:v11];
          [v6 setObject:v14 forKeyedSubscript:v15];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  OZXSetPublishedSettings(*(uint64_t **)self->_documentInfo, v6);
}

- (void)setupTransitionParameters:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v5 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"Direction"];

  if (v6)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:@"Direction"];
    v21.int var0 = 0;
    PCString::set(&v21, v7);

    uint64_t v8 = [v4 objectForKeyedSubscript:@"Direction"];
    uint64_t v9 = v8;
    if (v8) {
      OZXSetPublishedPopup(*(void **)self->_documentInfo, &v21, [v8 unsignedIntValue]);
    }

    PCString::~PCString(&v21);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v22[0] = @"Blur";
  v22[1] = @"Zoom";
  void v22[2] = @"Bar";
  v22[3] = @"Light";
  double v10 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v22, 4, 0);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v15 = [v4 objectForKeyedSubscript:v14];
        if (v15)
        {
          long long v16 = [v5 objectForKeyedSubscript:v14];
          v21.int var0 = 0;
          PCString::set(&v21, v16);

          OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v21, [v15 BOOLValue]);
          PCString::~PCString(&v21);
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v11);
  }
}

- (void)applyInspectableProperties
{
  v3.receiver = self;
  v3.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v3 applyInspectableProperties];
  [(NSLock *)self->_documentLock lock];
  [(NSLock *)self->super._inspectablePropertiesLock lock];
  [(PVMotionEffect *)self applyInspectableProperties_NoLock];
  [(NSLock *)self->super._inspectablePropertiesLock unlock];
  [(NSLock *)self->_documentLock unlock];
}

- (void)applyInspectableProperties_NoLock
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoaded];
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  objc_super v3 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  [(PVMotionEffect *)self setEffectOutputAspectWithProperties_NoLock:0 allProperties:self->super._inspectableProperties];
  id v4 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"crossDissolveRamp"];

  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"crossDissolveRamp"];
    uint64_t v6 = v5;
    if (v5)
    {
      CGPoint v7 = CGPointFromString(v5);
      LODWORD(v38.var0) = 0;
      int v8 = OZXGetDropZone(*(void *)self->_documentInfo, 0, &v38);
      if (LODWORD(v38.var0))
      {
        if (!v8)
        {
          float x = v7.x;
          float y = v7.y;
          OZXSetDropZoneOpacityAnimation(*(void *)self->_documentInfo, v38.var0, x, y);
        }
      }
    }
  }
  uint64_t v11 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"filterSeed"];

  if (v11)
  {
    uint64_t v12 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"filterSeed"];
    BOOL v13 = v12;
    if (v12) {
      OZXSetSeedValue(*(void **)self->_documentInfo, [v12 unsignedIntValue]);
    }
  }
  [(PVMotionEffect *)self adjustKenBurnsAnimation:self->super._inspectableProperties];
  [(PVMotionEffect *)self adjustCutawayBorder:self->super._inspectableProperties];
  [(PVMotionEffect *)self adjustCutawayFadeAnimation:self->super._inspectableProperties];
  [(PVMotionEffect *)self setMaskPoints:self->super._inspectableProperties];
  [(PVMotionEffect *)self setSketchStrokes:self->super._inspectableProperties];
  [(PVMotionEffect *)self adjustPosition:self->super._inspectableProperties];
  uint64_t v14 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"DropShadow"];

  if (v14)
  {
    id v15 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"DropShadow"];
    unsigned int v16 = [v15 BOOLValue];

    v38.int var0 = 0;
    PCString::set(&v38, @"DropShadow");
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v16);
    PCString::~PCString(&v38);
  }
  long long v17 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"AllCaps"];

  if (v17)
  {
    long long v18 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"AllCaps"];
    unsigned int v19 = [v18 BOOLValue];

    v38.int var0 = 0;
    PCString::set(&v38, @"AllCaps");
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v19);
    PCString::~PCString(&v38);
  }
  [(PVMotionEffect *)self setupPublishedParameters:self->super._inspectableProperties];
  long long v20 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"kPVTopLevelOpacityKey"];

  if (v20)
  {
    PCString v21 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"kPVTopLevelOpacityKey"];
    [v21 doubleValue];
    double v23 = v22;

    [(PVMotionEffect *)self setTopLevelOpacity:v23];
  }
  uint64_t v24 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"ForceDisableBackgroundShape"];

  if (v24)
  {
    float64x2_t v25 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"ForceDisableBackgroundShape"];
    unsigned int v26 = [v25 BOOLValue];

    int8x16_t v27 = [v3 objectForKeyedSubscript:@"ForceDisableBackgroundShape"];
    v38.int var0 = 0;
    PCString::set(&v38, v27);

    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v26);
    PCString::~PCString(&v38);
  }
  int8x16_t v28 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"DisableBackgroundMovieKey"];

  if (v28)
  {
    double v29 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"DisableBackgroundMovieKey"];
    uint64_t v30 = [v29 BOOLValue];

    [(PVMotionEffect *)self disableBackgroundMovie:v30];
  }
  double v31 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"Disable Chroma Key"];

  if (v31)
  {
    v38.int var0 = 0;
    PCString::set(&v38, @"Chroma Key SDR Color");
    double v32 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"Disable Chroma Key"];
    uint64_t v33 = [v32 BOOLValue];

    [(PVMotionEffect *)self disableElementWithPublishedParam:&v38 disable:v33];
    PCString::~PCString(&v38);
  }
  char v34 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"SketchData"];

  if (v34)
  {
    inspectableProperties = self->super._inspectableProperties;
    long long v36 = *MEMORY[0x1E4F1FA48];
    uint64_t v37 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [(PVMotionEffect *)self updateSketchAnimation:inspectableProperties defaultProperties:0 time:&v36];
  }
}

- (void)updateInspectableProperties
{
  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v7 updateInspectableProperties];
  [(NSLock *)self->_documentLock lock];
  unsigned int v3 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v3 == 3)
  {
    [(NSLock *)self->super._inspectablePropertiesLock lock];
    inspectableProperties = self->super._inspectableProperties;
    long long v5 = *MEMORY[0x1E4F1F9F8];
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(PVMotionEffect *)self updateInspectableProperties_NoLock:inspectableProperties componentTime:&v5];
    [(NSLock *)self->super._inspectablePropertiesLock unlock];
  }
  [(NSLock *)self->_documentLock unlock];
}

- (void)updateInspectableProperties:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v8 updateInspectableProperties:v4];
  [(NSLock *)self->_documentLock lock];
  unsigned int v5 = atomic_load((unsigned int *)&self->_docLoadStatus);
  if (v5 == 3)
  {
    [(NSLock *)self->super._inspectablePropertiesLock lock];
    long long v6 = *MEMORY[0x1E4F1F9F8];
    uint64_t v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(PVMotionEffect *)self updateInspectableProperties_NoLock:v4 componentTime:&v6];
    [(NSLock *)self->super._inspectablePropertiesLock unlock];
  }
  [(NSLock *)self->_documentLock unlock];
}

- (void)updateInspectableProperties_NoLock:(id)a3 componentTime:(id *)a4
{
  id v6 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsReady];
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  uint64_t v7 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  objc_super v8 = [v6 objectForKeyedSubscript:@"kPVOutputAspectKey"];
  if (v8
    || ([v6 objectForKeyedSubscript:@"kPVPlayableAspectRatioKey"],
        (objc_super v8 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    [(PVMotionEffect *)self setEffectOutputAspectWithProperties_NoLock:v6 allProperties:self->super._inspectableProperties];
    goto LABEL_5;
  }
  uint64_t v33 = [v6 objectForKeyedSubscript:@"kPVPlayableAspectRatioPreservationModeKey"];

  if (v33) {
    goto LABEL_4;
  }
LABEL_5:
  [(PVMotionEffect *)self adjustKenBurnsAnimation:v6];
  [(PVMotionEffect *)self adjustCutawayBorder:v6];
  [(PVMotionEffect *)self adjustCutawayFadeAnimation:v6];
  [(PVMotionEffect *)self setMaskPoints:v6];
  [(PVMotionEffect *)self setSketchStrokes:v6];
  [(PVMotionEffect *)self adjustPosition:v6];
  uint64_t v9 = [v6 objectForKeyedSubscript:@"DropShadow"];

  if (v9)
  {
    double v10 = [v6 objectForKeyedSubscript:@"DropShadow"];
    unsigned int v11 = [v10 BOOLValue];

    v38.int var0 = 0;
    PCString::set(&v38, @"DropShadow");
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v11);
    PCString::~PCString(&v38);
  }
  uint64_t v12 = [v6 objectForKeyedSubscript:@"AllCaps"];

  if (v12)
  {
    BOOL v13 = [v6 objectForKeyedSubscript:@"AllCaps"];
    unsigned int v14 = [v13 BOOLValue];

    v38.int var0 = 0;
    PCString::set(&v38, @"AllCaps");
    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v14);
    PCString::~PCString(&v38);
  }
  [(PVMotionEffect *)self setupPublishedParameters:v6];
  id v15 = [v6 objectForKeyedSubscript:@"kPVTopLevelOpacityKey"];

  if (v15)
  {
    unsigned int v16 = [v6 objectForKeyedSubscript:@"kPVTopLevelOpacityKey"];
    [v16 doubleValue];
    double v18 = v17;

    [(PVMotionEffect *)self setTopLevelOpacity:v18];
  }
  unsigned int v19 = [v6 objectForKeyedSubscript:@"ForceDisableBackgroundShape"];

  if (v19)
  {
    long long v20 = [v6 objectForKeyedSubscript:@"ForceDisableBackgroundShape"];
    unsigned int v21 = [v20 BOOLValue];

    double v22 = [v7 objectForKeyedSubscript:@"ForceDisableBackgroundShape"];
    v38.int var0 = 0;
    PCString::set(&v38, v22);

    OZXSetPublishedCheckBox(*(void **)self->_documentInfo, &v38, v21);
    PCString::~PCString(&v38);
  }
  double v23 = [v6 objectForKeyedSubscript:@"DisableBackgroundMovieKey"];

  if (v23)
  {
    uint64_t v24 = [v6 objectForKeyedSubscript:@"DisableBackgroundMovieKey"];
    uint64_t v25 = [v24 BOOLValue];

    [(PVMotionEffect *)self disableBackgroundMovie:v25];
  }
  unsigned int v26 = [v6 objectForKeyedSubscript:@"Disable Chroma Key"];

  if (v26)
  {
    v38.int var0 = 0;
    PCString::set(&v38, @"Chroma Key SDR Color");
    int8x16_t v27 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKeyedSubscript:@"Disable Chroma Key"];
    uint64_t v28 = [v27 BOOLValue];

    [(PVMotionEffect *)self disableElementWithPublishedParam:&v38 disable:v28];
    PCString::~PCString(&v38);
  }
  double v29 = [v6 objectForKeyedSubscript:@"SketchData"];

  if (v29)
  {
    if (a4->var2) {
      uint64_t v30 = a4;
    }
    else {
      uint64_t v30 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)MEMORY[0x1E4F1FA48];
    }
    long long v36 = *(_OWORD *)&v30->var0;
    int64_t var3 = v30->var3;
    [(PVMotionEffect *)self updateSketchAnimation:v6 defaultProperties:self->super._inspectableProperties time:&v36];
  }
  components = self->super._components;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = *(void *)"";
  v34[2] = __67__PVMotionEffect_updateInspectableProperties_NoLock_componentTime___block_invoke;
  v34[3] = &unk_1E6169E48;
  v34[4] = self;
  id v32 = v6;
  id v35 = v32;
  [(NSMutableArray *)components enumerateObjectsUsingBlock:v34];
}

uint64_t __67__PVMotionEffect_updateInspectableProperties_NoLock_componentTime___block_invoke(uint64_t a1, void *a2)
{
  return [a2 effect:*(void *)(a1 + 32) updateProperties:*(void *)(a1 + 40) allProperties:*(void *)(*(void *)(a1 + 32) + 80)];
}

- (void)setIsFrontFacingCamera:(BOOL)a3
{
  unsigned int v3 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v7 = 0;
  PCString::PCString(&v6, "PAEEquirectProjectFilter::Filter Name");
  if (OZXFindFilter(*(void *)self->_documentInfo, &v6, &v7)) {
    BOOL v5 = 1;
  }
  else {
    BOOL v5 = v7 == 0;
  }
  if (!v5) {
    OZXEquirectProjectFilterSetFrontFacing(*(void **)self->_documentInfo, (uint64_t)&v7, v3);
  }
  PCString::~PCString(&v6);
}

- (void)setQuaternion:(double)a3 :(double)a4 :(double)a5 :(double)a6
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v13 = 0;
  PCString::PCString(&v12, "PAEEquirectProjectFilter::Filter Name");
  if (OZXFindFilter(*(void *)self->_documentInfo, &v12, &v13)) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = v13 == 0;
  }
  if (!v11) {
    OZXEquirectProjectFilterSetQuaternion(*(void **)self->_documentInfo, a3, a4, a5, a6);
  }
  PCString::~PCString(&v12);
}

- (void)setRollRadians:(double)a3
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  BOOL v5 = *(void **)self->_documentInfo;

  OZXSetSelfieRollRadians(v5, a3);
}

- (CGSize)documentSize
{
  uint64_t v7 = 0;
  objc_super v8 = (double *)&v7;
  uint64_t v9 = 0x4012000000;
  double v10 = __Block_byref_object_copy__8;
  BOOL v11 = __Block_byref_object_dispose__8;
  PCString v12 = &unk_1B876C866;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __30__PVMotionEffect_documentSize__block_invoke;
  _OWORD v6[3] = &unk_1E6169E70;
  v6[4] = &v7;
  [(PVMotionEffect *)self runEnsuringDocumentReadyAndLockingDocument:v6];
  double v2 = v8[6];
  double v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

__n128 __30__PVMotionEffect_documentSize__block_invoke(uint64_t a1, __n128 *a2)
{
  __n128 result = a2[11];
  *(__n128 *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (CGSize)outputSize
{
  uint64_t v7 = 0;
  objc_super v8 = (double *)&v7;
  uint64_t v9 = 0x4012000000;
  double v10 = __Block_byref_object_copy__8;
  BOOL v11 = __Block_byref_object_dispose__8;
  PCString v12 = &unk_1B876C866;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __28__PVMotionEffect_outputSize__block_invoke;
  _OWORD v6[3] = &unk_1E6169E70;
  v6[4] = &v7;
  [(PVMotionEffect *)self runEnsuringDocumentReadyAndLockingDocument:v6];
  double v2 = v8[6];
  double v3 = v8[7];
  _Block_object_dispose(&v7, 8);
  double v4 = v2;
  double v5 = v3;
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

float64x2_t __28__PVMotionEffect_outputSize__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 12);
  v3.i64[0] = v2;
  v3.i64[1] = HIDWORD(v2);
  float64x2_t result = vcvtq_f64_u64(v3);
  *(float64x2_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = result;
  return result;
}

- (CGRect)outputROI
{
  uint64_t v11 = 0;
  PCString v12 = (double *)&v11;
  uint64_t v13 = 0x5012000000;
  unsigned int v14 = __Block_byref_object_copy__2145;
  id v15 = __Block_byref_object_dispose__2146;
  unsigned int v16 = &unk_1B876C866;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = *(void *)"";
  v10[2] = __27__PVMotionEffect_outputROI__block_invoke;
  _OWORD v10[3] = &unk_1E6169758;
  v10[4] = self;
  v10[5] = &v11;
  [(PVMotionEffect *)self runEnsuringDocumentReadyAndLockingDocument:v10];
  double v2 = v12[6];
  double v3 = v12[7];
  double v4 = v12[8];
  double v5 = v12[9];
  _Block_object_dispose(&v11, 8);
  double v6 = v2;
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.float y = v7;
  result.origin.float x = v6;
  return result;
}

uint64_t __27__PVMotionEffect_outputROI__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "outputROI_NoLock:scale:", a2, 1.0);
  double v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[6] = v5;
  v4[7] = v6;
  v4[8] = v7;
  v4[9] = v8;
  return result;
}

- (CGRect)outputROI_NoLock:(const void *)a3 scale:(double)a4
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  LODWORD(v7) = *((_DWORD *)a3 + 3);
  LODWORD(v8) = *((_DWORD *)a3 + 4);
  double v9 = (double)v7;
  double v10 = (double)v8;
  if (self->_hasPlayableAspectOverride)
  {
    double v11 = (v9 - self->_playableAspectRatio * v10) * 0.5 * a4;
    double v12 = (v10 - v10) * 0.5 * a4;
    double v9 = self->_playableAspectRatio * v10;
  }
  else
  {
    double v11 = 0.0;
    double v12 = 0.0;
  }
  double v13 = v10 * a4;
  double v14 = v9 * a4;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v14;
  result.origin.float y = v12;
  result.origin.float x = v11;
  return result;
}

- (void)setEffectOutputAspectWithProperties_NoLock:(id)a3 allProperties:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  unint64_t v7 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVOutputAspectKey" inDictionary:v13 orInDefaultDictionary:v6];
  if (v7)
  {
    unint64_t v8 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVPlayableAspectRatioKey" inDictionary:v13 orInDefaultDictionary:v6];
    double v9 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVPlayableAspectRatioPreservationModeKey" inDictionary:v13 orInDefaultDictionary:v6];
    [v7 doubleValue];
    double v11 = v10;
    [v8 doubleValue];
    -[PVMotionEffect setEffectOutputAspect_NoLock:playableAspect:playableContentMode:](self, "setEffectOutputAspect_NoLock:playableAspect:playableContentMode:", [v9 integerValue], v11, v12);
  }
}

- (void)setEffectOutputAspect_NoLock:(double)a3 playableAspect:(double)a4 playableContentMode:(int)a5
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  p_double effectOutputAspect = &self->_effectOutputAspect;
  self->_double effectOutputAspect = a3;
  if (a3 <= -0.0000001 || a3 >= 0.0000001)
  {
    self->_playableAspectRatio = a4;
    self->_playableContentMode = a5;
    BOOL v12 = (a4 >= 0.0000001 || a4 <= -0.0000001) && a5 != 0 && vabdd_f64(a4, *p_effectOutputAspect) >= 0.0001;
    self->_hasPlayableAspectOverride = v12;
    id v13 = [(NSMutableDictionary *)self->super._inspectableProperties objectForKey:@"kPVEffectPVARMetadata"];

    if (self->_hasPlayableAspectOverride) {
      p_playableAspectRatio = &self->_playableAspectRatio;
    }
    else {
      p_playableAspectRatio = &self->_effectOutputAspect;
    }
    double v15 = *p_playableAspectRatio;
    documentInfo = (double *)self->_documentInfo;
    double v17 = *(void **)documentInfo;
    if (v13)
    {
      OZXSetTargetDisplayAspectRatioWithNativeSize(v17, v15, documentInfo[22], documentInfo[23]);
      BOOL v18 = [(PVMotionEffect *)self isLandscape:self->super._inspectableProperties];
      unsigned int v19 = (double *)self->_documentInfo;
      if (v18)
      {
        unsigned int v20 = v19[22];
        double v21 = (double)v20 / *p_effectOutputAspect / v19[7] + 0.5 + 0.0000001;
        *((_DWORD *)v19 + 3) = v20;
        *((_DWORD *)v19 + 4) = vcvtmd_s64_f64(v21);
      }
      else
      {
        unsigned int v24 = v19[23];
        *((_DWORD *)v19 + 3) = vcvtmd_s64_f64(*p_effectOutputAspect * (double)v24 / v19[7] + 0.5 + 0.0000001);
        *((_DWORD *)v19 + 4) = v24;
      }
    }
    else
    {
      OZXSetTargetDisplayAspectRatio(v17, v15);
      double v22 = (double *)self->_documentInfo;
      LODWORD(v23) = *((_DWORD *)v22 + 4);
      *((_DWORD *)v22 + 3) = vcvtmd_s64_f64(*p_effectOutputAspect * (double)v23 / v22[7] + 0.5 + 0.0000001);
    }
    objc_msgSend(NSNumber, "numberWithDouble:");
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:");

    id v26 = [NSNumber numberWithDouble:self->_playableAspectRatio];
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:");

    id v27 = [NSNumber numberWithUnsignedInt:self->_playableContentMode];
    -[PVMotionEffect didSetCacheInvalidatingParameter_NoLock:forKey:](self, "didSetCacheInvalidatingParameter_NoLock:forKey:");
  }
}

- (BOOL)hasPlayableAspectOverride_NoLock
{
  return self->_hasPlayableAspectOverride;
}

- (double)playableAspectRatio_NoLock
{
  return self->_playableAspectRatio;
}

- (int)playableContentMode_NoLock
{
  return self->_playableContentMode;
}

- (void)setNodeIDToCache:(unsigned int)a3
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  if (a3)
  {
    unsigned int groupIDToCache = self->_groupIDToCache;
    if (groupIDToCache != a3)
    {
      self->_unsigned int previousGroupIDToCache = groupIDToCache;
      self->_unsigned int groupIDToCache = a3;
      self->_cachedRenderDirtfloat y = 1;
      unsigned int previousGroupIDToCache = self->_previousGroupIDToCache;
      if (previousGroupIDToCache)
      {
        OZXSetUseRenderCache(*(void **)self->_documentInfo, previousGroupIDToCache, 0);
        unint64_t v7 = *(void **)self->_documentInfo;
        unsigned int v8 = self->_previousGroupIDToCache;
        OZXClearCachedRender(v7, v8);
      }
    }
  }
}

- (int)stillImageInverseToneMapOperator:(id)a3
{
  id v4 = a3;
  stillImageInverseToneMapOperator = self->_stillImageInverseToneMapOperator;
  if (!stillImageInverseToneMapOperator)
  {
    id v6 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v7 = [(PVEffect *)self contentRegistryProperties];
    unsigned int v8 = [v6 objectForKey:@"stillImageInverseToneMapOperator" inDictionary:v4 orInDefaultDictionary:v7];

    if (v8)
    {
      uint64_t v9 = [v8 intValue];
      if (v9 < 3)
      {
        double v10 = (NSNumber *)qword_1E6169F48[(int)v9];
LABEL_7:
        double v11 = self->_stillImageInverseToneMapOperator;
        self->_stillImageInverseToneMapOperator = v10;

        stillImageInverseToneMapOperator = self->_stillImageInverseToneMapOperator;
        goto LABEL_8;
      }
      NSLog(&cfstr_UnsupportedSti.isa, v9);
    }
    double v10 = (NSNumber *)&unk_1F11EC1D8;
    goto LABEL_7;
  }
LABEL_8:
  int v12 = [(NSNumber *)stillImageInverseToneMapOperator intValue];

  return v12;
}

- (int)getOSFAOption:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  inspectableProperties = self->super._inspectableProperties;
  id v6 = [(PVEffect *)self contentRegistryProperties];
  unint64_t v7 = [v4 objectForKey:@"OSFAToneMappingOption" inDictionary:inspectableProperties orInDefaultDictionary:v6];

  if (v7)
  {
    uint64_t v8 = [v7 intValue];
    int v9 = v8;
    if (v8 >= 3)
    {
      NSLog(&cfstr_UnexpectedValu.isa, @"OSFAToneMappingOption", v8);
      int v9 = 1;
    }
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1C9E8];
    double v11 = self->super._inspectableProperties;
    int v12 = [(PVEffect *)self contentRegistryProperties];
    unint64_t v7 = [v10 objectForKey:@"wantsOSFAToneMapping" inDictionary:v11 orInDefaultDictionary:v12];

    if (v7) {
      int v9 = [v7 BOOLValue];
    }
    else {
      int v9 = 0;
    }
  }

  return v9;
}

- (id)debugDisplayName
{
  double v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(PVEffect *)self displayName];
  unint64_t v7 = [(PVEffect *)self effectID];
  uint64_t v8 = [(PVMotionEffect *)self projectPath];
  int v9 = [v8 lastPathComponent];
  double v10 = [v3 stringWithFormat:@"%@ %@ %@ %@", v5, v6, v7, v9];

  return v10;
}

- (BOOL)forceRenderAtPosterFrame
{
  return [(PVEffect *)self BOOLForKey:@"RenderAtPosterTime"];
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
}

- (BOOL)isBuildInAnimationEnabled
{
  return [(PVEffect *)self BOOLForKey:@"TitleBuildIn"];
}

- (void)setBuildInAnimationEnabled:(BOOL)a3
{
}

- (BOOL)isBuildOutAnimationEnabled
{
  return [(PVEffect *)self BOOLForKey:@"TitleBuildOut"];
}

- (void)setBuildOutAnimationEnabled:(BOOL)a3
{
}

- (BOOL)isLoopedRangeRenderCacheable
{
  return [(PVEffect *)self BOOLForKey:@"kPVEnableLoopedRangeRenderCaching"];
}

- (void)setLoopedRangeRenderIsCacheable:(BOOL)a3
{
}

- (id)ephemeralProperties
{
  if (-[PVMotionEffect ephemeralProperties]::onceToken != -1) {
    dispatch_once(&-[PVMotionEffect ephemeralProperties]::onceToken, &__block_literal_global_2166);
  }
  double v2 = (void *)-[PVMotionEffect ephemeralProperties]::s_ephemeralProperties;

  return v2;
}

void __37__PVMotionEffect_ephemeralProperties__block_invoke()
{
  v2[17] = *MEMORY[0x1E4F143B8];
  v2[0] = @"kPVOutputAspectKey";
  v2[1] = @"TitleBuildIn";
  v2[2] = @"ForceDisableLoop";
  v2[3] = @"RenderAtPosterTime";
  v2[4] = @"ImageSequencePathKey";
  v2[5] = @"kPVEnablePosterFrameCaching";
  v2[6] = @"kPVEnableLoopedRangeRenderCaching";
  v2[7] = @"kPVTextRenderingDisabled";
  v2[8] = @"kPVTopLevelAdditionalScaleKey";
  v2[9] = @"kPVTransformAnimationKey";
  v2[10] = @"kPVTopLevelOpacityKey";
  v2[11] = @"DisableAnimatedLayer";
  v2[12] = @"DisablePosterLayer";
  v2[13] = @"RenderStartOffset";
  v2[14] = @"DisableBackgroundMovieKey";
  v2[15] = @"RenderAtPosterTime";
  v2[16] = @"kPVEffectPVARMetadata";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:17];
  v1 = (void *)-[PVMotionEffect ephemeralProperties]::s_ephemeralProperties;
  -[PVMotionEffect ephemeralProperties]::s_ephemeralProperties = v0;
}

- (BOOL)isEphemeralProperty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PVMotionEffect *)self ephemeralProperties];
  BOOL v6 = ([v5 containsObject:v4] & 1) != 0
    || [(PVMotionEffect *)self isTemporalProperty:v4];

  return v6;
}

- (id)temporalProperties
{
  if (-[PVMotionEffect temporalProperties]::onceToken != -1) {
    dispatch_once(&-[PVMotionEffect temporalProperties]::onceToken, &__block_literal_global_2168);
  }
  double v2 = (void *)-[PVMotionEffect temporalProperties]::s_temporalProperties;

  return v2;
}

void __36__PVMotionEffect_temporalProperties__block_invoke()
{
  v2[11] = *MEMORY[0x1E4F143B8];
  v2[0] = @"PVARClearARAnchors";
  v2[1] = @"PVARUpdateARAnchors";
  v2[2] = @"PVRestartEffectTime";
  v2[3] = @"PVResetScene";
  v2[4] = @"PVARBodyGestures";
  v2[5] = @"PVARFaceGestures";
  v2[6] = @"PVARObjectToAttachToHipID";
  v2[7] = @"PVDisableObjects";
  v2[8] = @"kPVEffectPVARMetadata";
  v2[9] = @"kPVEffectEnableMeshShader";
  v2[10] = @"kPVEffectEnableMeshOcclusion";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:11];
  v1 = (void *)-[PVMotionEffect temporalProperties]::s_temporalProperties;
  -[PVMotionEffect temporalProperties]::s_temporalProperties = v0;
}

- (BOOL)isTemporalProperty:(id)a3
{
  id v4 = a3;
  if ([v4 hasPrefix:@"PVSetEffectAnchor"])
  {
    char v5 = 1;
  }
  else
  {
    BOOL v6 = [(PVMotionEffect *)self temporalProperties];
    char v5 = [v6 containsObject:v4];
  }
  return v5;
}

- (int)origin
{
  return 2;
}

- (BOOL)didSetCacheInvalidatingParameter_NoLock:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  if ([(PVMotionEffect *)self parameterInvalidatesCache_NoLock:v7]
    && !*((_DWORD *)self->_documentInfo + 41)
    && [(PVMotionEffect *)self didCacheInvalidatingParameterChange_NoLock:v6 key:v7])
  {
    BOOL v8 = 1;
    self->_cachedRenderDirtfloat y = 1;
    [(NSMutableDictionary *)self->_parametersThatInvalidateCache setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)didCacheInvalidatingParameterChange_NoLock:(id)a3 key:(id)a4
{
  unint64_t v6 = (unint64_t)a3;
  id v7 = a4;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  uint64_t v8 = [(NSMutableDictionary *)self->_parametersThatInvalidateCache objectForKeyedSubscript:v7];
  int v9 = (void *)v8;
  if (v6 | v8)
  {
    char v10 = 1;
    if (v6 && v8)
    {
      if ([@"kPVOutputAspectKey" isEqualToString:v7]
        || [@"kPVPlayableAspectRatioKey" isEqualToString:v7])
      {
        BOOL v11 = PVNumbersAreEqualAsDoubles(v9, (void *)v6);
      }
      else if ([@"kPVPlayableAspectRatioPreservationModeKey" isEqualToString:v7])
      {
        BOOL v11 = PVNumbersAreEqualAsIntegers(v9, (void *)v6);
      }
      else
      {
        if (![@"kPVCachedTextureOutputSize" isEqualToString:v7])
        {
          uint64_t v19 = 0;
          unsigned int v20 = &v19;
          uint64_t v21 = 0x2020000000;
          char v22 = 0;
          motionComponents = self->_motionComponents;
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = *(void *)"";
          v14[2] = __65__PVMotionEffect_didCacheInvalidatingParameterChange_NoLock_key___block_invoke;
          v14[3] = &unk_1E6169E98;
          v14[4] = self;
          id v15 = v7;
          id v16 = v9;
          id v17 = (id)v6;
          BOOL v18 = &v19;
          [(NSMutableArray *)motionComponents enumerateObjectsUsingBlock:v14];
          char v10 = *((unsigned char *)v20 + 24) != 0;

          _Block_object_dispose(&v19, 8);
          goto LABEL_13;
        }
        BOOL v11 = PVValuesAreEqualAsCGSizes(v9, (void *)v6);
      }
      char v10 = !v11;
    }
  }
  else
  {
    char v10 = 0;
  }
LABEL_13:

  return v10;
}

uint64_t __65__PVMotionEffect_didCacheInvalidatingParameterChange_NoLock_key___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 motionEffect:a1[4] shouldInvalidateCachedRenderForProperty:a1[5] oldValue:a1[6] newValue:a1[7]];
  if (result)
  {
    *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)parameterInvalidatesCache_NoLock:(id)a3
{
  id v4 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  LOBYTE(self) = [(NSMutableSet *)self->_parameterKeysThatInvalidateCache containsObject:v4];

  return (char)self;
}

- (BOOL)isRenderCachingDisabled_NoLock:(id *)a3
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsReady];
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  if ([(PVEffect *)self isInInteractiveMode]) {
    return 1;
  }
  char v5 = [(PVEffect *)self effectType];
  char v6 = [v5 isEqualToString:@"effect.video.title"];

  if ((v6 & 1) == 0) {
    return 1;
  }
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  timelineComponent = self->_timelineComponent;
  char v19 = 0;
  BOOL v8 = [(PVMotionEffectTimelineComponent *)timelineComponent isForceRenderAtPosterFrameEnabled:self->super._inspectableProperties];
  motionComponents = self->_motionComponents;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  _OWORD v12[2] = __49__PVMotionEffect_isRenderCachingDisabled_NoLock___block_invoke;
  v12[3] = &unk_1E6169EC0;
  long long v13 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  BOOL v15 = v8;
  v12[4] = self;
  v12[5] = &v16;
  [(NSMutableArray *)motionComponents enumerateObjectsUsingBlock:v12];
  BOOL v10 = *((unsigned char *)v17 + 24) != 0;
  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __49__PVMotionEffect_isRenderCachingDisabled_NoLock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 80);
  long long v9 = *(_OWORD *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 64);
  uint64_t result = [a2 motionEffect:v6 propertiesDisableCache:v7 time:&v9 forcePosterFrame:*(unsigned __int8 *)(a1 + 72)];
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (double)topLevelOpacity
{
  uint64_t v7 = 0;
  BOOL v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0x3FF0000000000000;
  v5[0] = 0;
  v5[1] = v5;
  _OWORD v5[2] = 0x2020000000;
  int v6 = 11;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __33__PVMotionEffect_topLevelOpacity__block_invoke;
  v4[3] = &unk_1E6168D20;
  v4[4] = self;
  v4[5] = v5;
  v4[6] = &v7;
  [(PVMotionEffect *)self runEnsuringDocumentReadyAndLockingDocument:v4];
  double v2 = v8[3];
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(&v7, 8);
  return v2;
}

uint64_t __33__PVMotionEffect_topLevelOpacity__block_invoke(uint64_t result, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 164))
  {
    uint64_t v2 = result;
    CMTime v3 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    uint64_t result = OZXGetObjectOpacity(**(void ***)(*(void *)(result + 32) + 144), &v3, *(_DWORD *)(a2 + 160), (double *)(*(void *)(*(void *)(result + 48) + 8) + 24));
    *(_DWORD *)(*(void *)(*(void *)(v2 + 40) + 8) + 24) = result;
  }
  return result;
}

- (void)setTopLevelOpacity:(double)a3
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  documentInfo = self->_documentInfo;
  if (!*((_DWORD *)documentInfo + 41))
  {
    CMTime v6 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
    OZXSetObjectOpacity(*(void **)documentInfo, &v6, *((_DWORD *)documentInfo + 40), a3);
  }
}

- (BOOL)isVisibleAtTime_NoLock:(id *)a3 timedProperties:(id)a4 defaultProperties:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  BOOL v8 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVHiddenKey" inDictionary:v6 orInDefaultDictionary:v7];
  if ([v8 BOOLValue])
  {
    BOOL v9 = 0;
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVTopLevelOpacityKey" inDictionary:v6 orInDefaultDictionary:v7];
    BOOL v11 = v10;
    BOOL v9 = 1;
    if (v10)
    {
      [v10 doubleValue];
      if (v12 > -0.0000001 && v12 < 0.0000001) {
        BOOL v9 = 0;
      }
    }
  }
  return v9;
}

- (id)publishedParams_NoLock:(const void *)a3
{
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  char v5 = *(void **)a3;

  return (id)OZXGetPublishedSettings(v5);
}

- (id)publishedParam_NoLock:(const void *)a3 forKey:(id)a4 atTime:(id *)a5 includeHidden:(BOOL)a6
{
  id v10 = a4;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  BOOL v11 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  double v12 = [v11 objectForKeyedSubscript:v10];
  v17.int var0 = 0;
  PCString::set(&v17, v12);

  long long v13 = *(void **)a3;
  CMTime v16 = *(CMTime *)a5;
  double v14 = OZXGetPublishedSetting(v13, &v17, &v16, a6);
  PCString::~PCString(&v17);

  return v14;
}

- (id)effectParameters
{
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffect;
  CMTime v3 = [(PVEffect *)&v10 effectParameters];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __34__PVMotionEffect_effectParameters__block_invoke;
  v8[3] = &unk_1E6169498;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(PVMotionEffect *)self runEnsuringDocumentReadyAndLockingDocument:v8];
  char v5 = v9;
  id v6 = v4;

  return v6;
}

void __34__PVMotionEffect_effectParameters__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "publishedParams_NoLock:", a2);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v7 = [v6 objectForKeyedSubscript:@"PVEffectParam_ValueKey"];
        BOOL v8 = [v6 objectForKeyedSubscript:@"PVEffectParam_NameKey"];
        id v9 = [(id)objc_opt_class() publishedParameterNameToMotionEffectPropertyKeyMap];
        objc_super v10 = [v9 objectForKeyedSubscript:v8];

        if (v10)
        {
          id v11 = v10;

          BOOL v8 = v11;
        }
        [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v3);
  }
}

- (void)setEffectParameters:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffect;
  [(PVEffect *)&v5 setEffectParameters:v4];
  [(PVEffect *)self addEntriesToInspectableProperties:v4];
}

- (void)disableBackgroundMovie:(BOOL)a3
{
  BOOL v3 = a3;
  [(PVMotionEffect *)self assertDocumentIsLocked];
  [(PVMotionEffect *)self assertDocumentStatusIsLoadedOrReady];
  unsigned int v5 = 0;
  if (!OZXGetDropZone(*(void *)self->_documentInfo, 0, &v5)) {
    OZXDisableRenderingObject(*(uint64_t **)self->_documentInfo, v5, v3);
  }
}

- (void)disableElementWithPublishedParam:(PCString *)a3 disable:(BOOL)a4
{
}

- (BOOL)supportsParam:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __32__PVMotionEffect_supportsParam___block_invoke;
  v7[3] = &unk_1E6168CF8;
  v7[4] = self;
  id v8 = v4;
  id v9 = &v10;
  id v5 = v4;
  [(PVMotionEffect *)self runEnsuringDocumentReadyAndLockingDocument:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __32__PVMotionEffect_supportsParam___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 256) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = v4;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v4 BOOLValue];
  }
  else
  {
    id v6 = objc_msgSend(*(id *)(a1 + 32), "publishedParams_NoLock:", a2);
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = *(void *)"";
    uint64_t v12 = __32__PVMotionEffect_supportsParam___block_invoke_2;
    char v13 = &unk_1E6169EE8;
    id v7 = *(id *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    id v14 = v7;
    uint64_t v15 = v8;
    [v6 enumerateObjectsUsingBlock:&v10];
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v10, v11, v12, v13);
    [*(id *)(*(void *)(a1 + 32) + 256) setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];

    id v5 = (void *)v9;
  }
}

void __32__PVMotionEffect_supportsParam___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = *(void **)(a1 + 32);
  id v7 = [a2 objectForKeyedSubscript:@"PVEffectParam_NameKey"];
  LODWORD(v6) = [v6 isEqualToString:v7];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)motionComponentClasses
{
  if (+[PVMotionEffect motionComponentClasses]::onceToken != -1) {
    dispatch_once(&+[PVMotionEffect motionComponentClasses]::onceToken, &__block_literal_global_2190);
  }
  uint64_t v2 = (void *)+[PVMotionEffect motionComponentClasses]::s_motionComponentClasses;

  return v2;
}

void __40__PVMotionEffect_motionComponentClasses__block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  id v7 = (void *)+[PVMotionEffect motionComponentClasses]::s_motionComponentClasses;
  +[PVMotionEffect motionComponentClasses]::s_motionComponentClasses = v6;
}

+ (id)motionEffectPropertyKeyToPublishedParameterNameMap
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = *(void *)"";
  block[2] = __68__PVMotionEffect_motionEffectPropertyKeyToPublishedParameterNameMap__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::onceToken != -1) {
    dispatch_once(&+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::onceToken, block);
  }
  uint64_t v2 = (void *)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap;

  return v2;
}

void __68__PVMotionEffect_motionEffectPropertyKeyToPublishedParameterNameMap__block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:31];
  uint64_t v3 = (void *)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap;
  +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap = v2;

  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"Direction" forKeyedSubscript:@"Direction"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"Blur" forKeyedSubscript:@"Blur"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"Zoom" forKeyedSubscript:@"Zoom"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"Bar" forKeyedSubscript:@"Bar"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"Light" forKeyedSubscript:@"Light"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"SelfieEffectVisibility" forKeyedSubscript:@"kPVARSelfieEffectVisibility"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"SelfieBackgroundVisibility" forKeyedSubscript:@"kPVARSelfieEffectBackgroundVisibility"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"SelfieZoom" forKeyedSubscript:@"kPVARSelfieEffectZoomLevel"];
  [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap setObject:@"SelfieEffectDistance" forKeyedSubscript:@"kPVARSelfieEffectDistance"];
  id v4 = [*(id *)(a1 + 32) motionComponentClasses];
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_2221];
}

void __68__PVMotionEffect_motionEffectPropertyKeyToPublishedParameterNameMap__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 motionEffectPropertyKeyToPublishedParameterNameMap];
  if (v2) {
    [(id)+[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap]::s_motionEffectPropertyKeyToPublishedParameterNameMap addEntriesFromDictionary:v2];
  }
}

+ (id)publishedParameterNameToMotionEffectPropertyKeyMap
{
  if (+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::onceToken != -1) {
    dispatch_once(&+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::onceToken, &__block_literal_global_2224);
  }
  id v2 = (void *)+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap;

  return v2;
}

void __68__PVMotionEffect_publishedParameterNameToMotionEffectPropertyKeyMap__block_invoke()
{
  id v2 = +[PVMotionEffect motionEffectPropertyKeyToPublishedParameterNameMap];
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  uint64_t v1 = (void *)+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap;
  +[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap = v0;

  [v2 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_2227];
}

uint64_t __68__PVMotionEffect_publishedParameterNameToMotionEffectPropertyKeyMap__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [(id)+[PVMotionEffect publishedParameterNameToMotionEffectPropertyKeyMap]::s_publishedParameterNameToMotionEffectPropertyKeyMap setObject:a2 forKeyedSubscript:a3];
}

- (BOOL)hasBuiltInEnvironment
{
  uint64_t v3 = [(PVEffect *)self effectType];
  id v4 = [(PVEffect *)self contentProperties];
  uint64_t v5 = [v4 objectForKey:@"FFEffectProperty_Category"];

  if ([v3 isEqualToString:@"effect.video.filter"]
    && [v5 isEqualToString:@"Selfie"])
  {
    uint64_t v6 = [(PVEffect *)self effectID];
    if ([v6 isEqualToString:@"7FFE36D8-396F-4011-90D9-99B6414D4DB1"])
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      uint64_t v8 = [(PVEffect *)self effectID];
      int v7 = [v8 isEqualToString:@"87530270-50A4-4483-82B5-D520897FF2CE"] ^ 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)isLandscape:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"PVVideoOrientation"];
  if (!v4)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:@"PVARApplyVerticalRotation"];
    uint64_t v6 = v5;
    id v4 = &unk_1F11EC208;
    if (v5 && ![v5 BOOLValue]) {
      id v4 = &unk_1F11EC220;
    }
  }
  BOOL v7 = [v4 unsignedIntValue] - 3 < 2;

  return v7;
}

- (void)applyARData:(id)a3 time:(id *)a4 renderParams:(_OZXRenderParams *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 objectForKeyedSubscript:@"PVMatteInputMode"];
  OZXSetMatteInputMode(*(void **)self->_documentInfo, v8);
  uint64_t v9 = [v7 objectForKeyedSubscript:@"kPVEffectPVARMetadata"];
  uint64_t v10 = v9;
  if (v9)
  {
    float v72 = v8;
    uint64_t v11 = [v9 depthData];
    uint64_t v12 = [v7 objectForKeyedSubscript:@"PVVideoOrientation"];
    if (!v12)
    {
      char v13 = [v7 objectForKeyedSubscript:@"PVARApplyVerticalRotation"];
      int v14 = [v13 BOOLValue];
      if (v13) {
        int v15 = v14;
      }
      else {
        int v15 = 1;
      }
      if (v15) {
        uint64_t v12 = &unk_1F11EC208;
      }
      else {
        uint64_t v12 = &unk_1F11EC220;
      }
    }
    int v16 = [v12 unsignedIntValue];
    if ((v16 - 2) >= 3) {
      int v17 = 0;
    }
    else {
      int v17 = v16 - 1;
    }
    unsigned int v73 = [v7 objectForKeyedSubscript:@"PVARFaceGestures"];
    uint64_t v69 = v12;
    double v71 = [v7 objectForKeyedSubscript:@"PVARBodyGestures"];
    v70 = [v7 objectForKeyedSubscript:@"PVAR3DSkeleton"];
    uint64_t v68 = [v7 objectForKeyedSubscript:@"kPVARFrameSetMetadataPlaneAnchorsKey"];
    double v67 = [v7 objectForKeyedSubscript:@"PVEffectSceneNode"];
    long long v91 = 0u;
    long long v92 = 0u;
    long long v89 = 0u;
    long long v90 = 0u;
    uint64_t v18 = [v7 objectForKeyedSubscript:@"WorldOrigin"];
    char v19 = v18;
    if (v18)
    {
      [v18 SCNMatrix4Value];
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
    }

    long long v76 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    id v62 = v11;
    id v78 = v62;
    long long v79 = v89;
    long long v80 = v90;
    long long v81 = v91;
    long long v82 = v92;
    id v66 = v71;
    id v83 = v66;
    id v65 = v70;
    id v84 = v65;
    id v20 = v68;
    id v85 = v20;
    int v86 = v17;
    uint64_t v87 = [v73 unsignedLongValue];
    id v21 = v67;
    id v88 = v21;
    char v22 = [v10 arFrame];
    documentInfo = self->_documentInfo;
    if (v22)
    {
      OZXApplyARFrame(*(uint64_t **)documentInfo, v22, 10.0, 45000.0, (const OZARFrameInfo *)&v76);
    }
    else
    {
      unsigned int v24 = *((_DWORD *)documentInfo + 3);
      unsigned int v25 = *((_DWORD *)documentInfo + 4);
      [v10 cameraImageResolution];
      double v27 = v26;
      double v29 = v28;
      [v10 cameraIntrinsics];
      v30.f32[0] = v27;
      float32_t v31 = v29;
      v30.f32[1] = v31;
      *(float *)&double v32 = (float)v24;
      *((float *)&v32 + 1) = (float)v25;
      pv_simd_matrix_make_perspective(3, v16, 1, 1, v33, v34, v35, v30, v32);
      v75.columns[0] = v36;
      v75.columns[1] = v37;
      v75.columns[2] = v38;
      v75.columns[3] = v39;
      if (v16 > 4) {
        uint64_t v40 = 0;
      }
      else {
        uint64_t v40 = qword_1B7E73AA0[v16];
      }
      double v41 = PVCardinalAnglesDouble[v40];
      [v10 cameraTransform];
      float32x4_t v63 = v43;
      float32x4_t v64 = v42;
      float32x4_t v60 = v45;
      float32x4_t v61 = v44;
      v42.f32[0] = v41;
      __float2 v46 = __sincosf_stret(v42.f32[0]);
      uint64_t v47 = 0;
      float32x2_t v48 = vrsqrte_f32((float32x2_t)1065353216);
      float32x2_t v49 = vmul_f32(v48, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v48, v48)));
      float32x4_t v50 = vmulq_n_f32((float32x4_t)xmmword_1B7E736D0, vmul_f32(v49, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v49, v49))).f32[0]);
      float v51 = (float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[0], *(float32x2_t *)v50.f32, 1);
      float v52 = vmuls_lane_f32(v46.__sinval, v50, 2);
      float v53 = (float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[0], v50, 2);
      float v54 = vmuls_lane_f32(v46.__sinval, *(float32x2_t *)v50.f32, 1);
      HIDWORD(v55) = 0;
      *(float *)&long long v55 = v46.__cosval + (float)((float)(1.0 - v46.__cosval) * vmulq_f32(v50, v50).f32[0]);
      *((float *)&v55 + 1) = v52 + v51;
      *((float *)&v55 + 2) = v53 - v54;
      float v56 = (float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[1], v50, 2);
      HIDWORD(v57) = 0;
      *(float *)&long long v57 = v51 - v52;
      *((float *)&v57 + 1) = v46.__cosval
                           + (float)((float)(1.0 - v46.__cosval) * vmuls_lane_f32(v50.f32[1], *(float32x2_t *)v50.f32, 1));
      *((float *)&v57 + 2) = (float)(v46.__sinval * v50.f32[0]) + v56;
      *(float *)&long long v58 = v54 + v53;
      *((float *)&v58 + 1) = v56 - (float)(v46.__sinval * v50.f32[0]);
      *((void *)&v58 + 1) = COERCE_UNSIGNED_INT(v46.__cosval + (float)((float)(1.0 - v46.__cosval)
                                                                       * vmuls_lane_f32(v50.f32[2], v50, 2)));
      v93[0] = v55;
      v93[1] = v57;
      v93[2] = v58;
      v93[3] = xmmword_1B7E734D0;
      do
      {
        v94.columns[v47] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v64, COERCE_FLOAT(v93[v47])), v63, *(float32x2_t *)&v93[v47], 1), v61, (float32x4_t)v93[v47], 2), v60, (float32x4_t)v93[v47], 3);
        ++v47;
      }
      while (v47 != 4);
      simd_float4x4 v74 = v94;
      OZXApplyARFrameInfo(*(uint64_t **)self->_documentInfo, &v75, &v74, 10.0, 45000.0, (const OZARFrameInfo *)&v76);
    }

    uint64_t v8 = v72;
  }
  double v59 = [v7 objectForKeyedSubscript:@"PVARClearARAnchors"];
  if (v59) {
    OZXClearARAnchors(*(void *)self->_documentInfo, v59);
  }
}

- (PVMotionEffectTransformComponent)transformComponent
{
  return self->_transformComponent;
}

- (PVMotionEffectTextComponent)textComponent
{
  return self->_textComponent;
}

- (PVMotionEffectTranscriptionComponent)transcriptionComponent
{
  return self->_transcriptionComponent;
}

- (PVMotionEffectHitAreaComponent)hitAreaComponent
{
  return self->_hitAreaComponent;
}

- (PVMotionEffectTimelineComponent)timelineComponent
{
  return self->_timelineComponent;
}

- (PVMotionEffectSceneManagerComponent)sceneManagerComponent
{
  return self->_sceneManagerComponent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneManagerComponent, 0);
  objc_storeStrong((id *)&self->_timelineComponent, 0);
  objc_storeStrong((id *)&self->_hitAreaComponent, 0);
  objc_storeStrong((id *)&self->_transcriptionComponent, 0);
  objc_storeStrong((id *)&self->_textComponent, 0);
  objc_storeStrong((id *)&self->_transformComponent, 0);
  objc_storeStrong((id *)&self->_documentLock, 0);
  objc_storeStrong((id *)&self->_cachedPublishedParams, 0);
  objc_storeStrong((id *)&self->_parametersThatInvalidateCache, 0);
  objc_storeStrong((id *)&self->_parameterKeysThatInvalidateCache, 0);
  objc_storeStrong((id *)&self->_stillImageInverseToneMapOperator, 0);
  objc_storeStrong((id *)&self->_supportsExtendedRangeInputs, 0);
  objc_storeStrong((id *)&self->_projectPathOverride, 0);
  objc_storeStrong((id *)&self->_projectPath, 0);
  objc_storeStrong((id *)&self->_projectURL, 0);

  objc_storeStrong((id *)&self->_motionComponents, 0);
}

@end