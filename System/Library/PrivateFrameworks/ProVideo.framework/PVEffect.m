@interface PVEffect
+ (BOOL)effectIDIsNone:(id)a3;
+ (BOOL)effectIDIsRegistered:(id)a3;
+ (BOOL)isAllCapsFromAttributes:(id)a3;
+ (BOOL)isInteractiveMode;
+ (BOOL)isVideoForEffectID:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (Class)classForEffectID:(id)a3;
+ (double)baselineOffsetFromAttributedString:(id)a3;
+ (double)defaultPlayableAspectRatio;
+ (double)textHeightFromAttributedString:(id)a3 defaultAttributes:(id)a4;
+ (double)textHeightFromAttributedString:(id)a3 defaultAttributes:(id)a4 scale:(double)a5;
+ (double)xOffsetForTextTrackingFromAttributedString:(id)a3;
+ (id)_effectRegistry;
+ (id)_effectRegistryForLookup;
+ (id)_registeredEffectClasses;
+ (id)_registryEntryForEffectID:(id)a3;
+ (id)allRegisteredEffectIDs;
+ (id)attributeForName:(id)a3 fromAttributedString:(id)a4 defaultAttributes:(id)a5;
+ (id)categoryForEffectID:(id)a3;
+ (id)defaultVideoTransitionEffectID;
+ (id)descriptionForEffectID:(id)a3;
+ (id)displayNameForEffectID:(id)a3;
+ (id)displayNameForEffectType:(id)a3;
+ (id)effectTypeForEffectID:(id)a3;
+ (id)firstRegisteredEffectIDContainingSubstring:(id)a3;
+ (id)newEffectWithData:(id)a3;
+ (id)newEffectWithID:(id)a3;
+ (id)newEffectWithURL:(id)a3;
+ (id)propertiesForEffect:(id)a3;
+ (id)registeredEffectIDsForClass:(Class)a3;
+ (id)registeredEffectIDsForEffectType:(id)a3;
+ (id)registeredEffectIDsForEffectTypes:(id)a3;
+ (id)shadowFromAttributedString:(id)a3 defaultAttributes:(id)a4;
+ (id)themeForEffectID:(id)a3;
+ (id)userVisibleEffectIDs;
+ (int)defaultPlayableAspectRatioPreservationMode;
+ (int64_t)verticalAlignmentFromAttributedString:(id)a3 defaultAttributes:(id)a4;
+ (void)_registerEffectsInBundle:(id)a3 atPath:(id)a4;
+ (void)cleanupEffectsCache;
+ (void)clearPreviewStats;
+ (void)deferEffectRegistrationForClass:(Class)a3;
+ (void)ensureEffectsRegistered;
+ (void)initEffectRegistry;
+ (void)initEffectRegistryWithHostDelegate:(id)a3;
+ (void)modifyAttributedStringByAdjustingFont:(id)a3 toFitSize:(CGSize)a4;
+ (void)modifyAttributedStringByAdjustingFontSize:(id)a3 scale:(double)a4;
+ (void)modifyAttributedStringByAdjustingForNegativeLineSpacing:(id)a3;
+ (void)modifyAttributedStringByAdjustingForNegativeLineSpacing:(id)a3 scale:(double)a4;
+ (void)modifyAttributedStringByAdjustingKerning:(id)a3 attributes:(id)a4 range:(_NSRange)a5 scale:(double)a6;
+ (void)modifyAttributedStringByAdjustingOutline:(id)a3 attributes:(id)a4 range:(_NSRange)a5;
+ (void)modifyAttributedStringByAdjustingOutline:(id)a3 attributes:(id)a4 range:(_NSRange)a5 scale:(double)a6;
+ (void)modifyAttributedStringByAdjustingShadow:(id)a3 effectTransform:(id)a4;
+ (void)modifyAttributedStringByAdjustingShadow:(id)a3 scale:(double)a4 rotation:(double)a5;
+ (void)modifyAttributedStringByApplyingSubstituteFont:(id)a3 attributes:(id)a4 range:(_NSRange)a5;
+ (void)noteApplicationDidReceiveMemoryWarning;
+ (void)noteApplicationWillTerminate;
+ (void)registerEffectClass:(Class)a3 forEffectID:(id)a4 withProperties:(id)a5;
+ (void)setInteractiveMode:(BOOL)a3;
+ (void)willTerminate:(id)a3;
- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3;
- ($202A6A048D39AE170264FF71A65A9479)effectRange;
- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)applyTimedPropertiesForTime:(id *)a3;
- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (BOOL)conformToInputAspect;
- (BOOL)forceDisableBuildAnimation;
- (BOOL)forceDisableLoop;
- (BOOL)forceRenderAtPosterFrame;
- (BOOL)hasAllNecessaryResources;
- (BOOL)hasBuiltInEnvironment;
- (BOOL)hasTimedPropertiesDelegate:(id)a3;
- (BOOL)hasTimedPropertiesDelegates;
- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- (BOOL)isBuildInAnimationEnabled;
- (BOOL)isBuildOutAnimationEnabled;
- (BOOL)isCameraOverrideEnabled;
- (BOOL)isEphemeralProperty:(id)a3;
- (BOOL)isHidden;
- (BOOL)isInInteractiveMode;
- (BOOL)isLoopedRangeRenderCacheable;
- (BOOL)isPreview;
- (BOOL)isReady;
- (BOOL)isRecording;
- (BOOL)isTemporalProperty:(id)a3;
- (BOOL)isTextFlipped;
- (BOOL)isTitleCard;
- (BOOL)isTranscription;
- (BOOL)isVisible;
- (BOOL)loadEffect;
- (BOOL)loadResources;
- (BOOL)loopTimeOverrideEnabled;
- (BOOL)resourcesAreReady;
- (BOOL)shouldDisableFadeOut;
- (BOOL)supportsExtendedRangeInputs;
- (BOOL)supportsFlippingText;
- (BOOL)supportsOrientation;
- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4;
- (BOOL)transformUnitsAreInMeters;
- (BOOL)useLocalLoopTime;
- (BOOL)usesDefaultChannelDataEncoding;
- (BOOL)writeDefaultChannels;
- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11;
- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:;
- (CGPoint)pointForKey:(id)a3 defaultValue:(CGPoint)a4;
- (CGRect)outputROI;
- (CGRect)playableRectInView:(CGSize)a3;
- (CGRect)playableRectInView_NoLock:(CGSize)a3 properties:(id)a4;
- (CGRect)rectForKey:(id)a3 defaultValue:(CGRect)a4;
- (CGSize)outputSize;
- (CGSize)sizeForKey:(id)a3 defaultValue:(CGSize)a4;
- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6;
- (NSDictionary)contentProperties;
- (NSDictionary)inspectableProperties;
- (NSMutableDictionary)effectParameters;
- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8;
- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9;
- (PVEffect)initWithCoder:(id)a3;
- (PVEffect)initWithContentID:(id)a3 andDictionary:(id)a4;
- (PVEffect)initWithEffectID:(id)a3;
- (__n128)getScale;
- (__n128)matrixFloat4x4ForKey:(void *)a1;
- (double)convertPointFromView:(_OWORD *)a1@<X8> atTime:viewSize:viewOrigin:;
- (double)convertPointToView:withEffectToViewTransform:viewSize:;
- (double)doubleForKey:(id)a3 defaultValue:(double)a4;
- (double)outputAspectRatio;
- (double)playableAspectRatio;
- (double)playableAspectRatio_NoLock:(id)a3;
- (double)playableScaleInView:(CGSize)a3;
- (double)playableScaleInView_NoLock:(CGSize)a3 properties:(id)a4;
- (double)timelineDurationInSeconds;
- (double)timelineFrameRate;
- (double)topLevelOpacity;
- (float)proxyRenderScale;
- (id)addToTopLevelTransform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:;
- (id)attributedStringAtIndex:(unint64_t)a3;
- (id)attributedStringForKey:(id)a3 defaultValue:(id)a4;
- (id)cameraProjection;
- (id)cameraTransform;
- (id)categoryName;
- (id)contentBundle;
- (id)contentPropertyForKey:(id)a3;
- (id)contentRegistryProperties;
- (id)contentRegistryPropertyForKey:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDisplayName;
- (id)defaultAttributedString:(unint64_t)a3;
- (id)description;
- (id)descriptionOfInspectableProperties;
- (id)displayName;
- (id)effectDescription;
- (id)effectID;
- (id)effectType;
- (id)handleForOZID:(unsigned int)a3;
- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)inspectablePropertyForKey:(id)a3;
- (id)mainTitle;
- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11;
- (id)posterFrameMarker;
- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8;
- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7;
- (id)stringForKey:(id)a3 defaultValue:(id)a4;
- (id)subtitle;
- (id)textEditingBounds:(id *)a3;
- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7;
- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6;
- (id)timedPropertiesDelegates;
- (id)timelineMarkers;
- (id)timelineMarkersOfType:(int)a3;
- (id)topLevelGroupTransform;
- (id)transformAnimation;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6;
- (id)userContextForTimedPropertiesDelegate:(id)a3;
- (int)orientation;
- (int)origin;
- (int)playableAspectRatioPreservationMode;
- (int)playableAspectRatioPreservationMode_NoLock:(id)a3;
- (unsigned)timelineDurationInFrames;
- (void)_configureComponents;
- (void)_copyWithZone:(_NSZone *)a3 into:(id)a4;
- (void)_decodeFromCoder:(id)a3 into:(id)a4;
- (void)_postInit:(id)a3;
- (void)addEntriesToInspectableProperties:(id)a3;
- (void)addTimedPropertiesDelegate:(id)a3 userContext:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadEffectOnQueue:(id)a3 completion:(id)a4;
- (void)loadResourcesOnQueue:(id)a3 completion:(id)a4;
- (void)matrixDouble4x4ForKey:(void *)a1@<X0>;
- (void)releaseEffect;
- (void)removeAllTimedPropertiesDelegates;
- (void)removeTimedPropertiesDelegate:(id)a3;
- (void)runWithInspectableProperties:(id)a3;
- (void)runWithInspectableProperties_NoLock:(id)a3;
- (void)setBool:(BOOL)a3 forKey:(id)a4;
- (void)setConformToInputAspect:(BOOL)a3;
- (void)setContentProperties:(id)a3;
- (void)setDouble:(double)a3 forKey:(id)a4;
- (void)setEffectParameters:(id)a3;
- (void)setEffectRange:(id *)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInspectableProperties:(id)a3;
- (void)setInspectableProperty:(id)a3 forKey:(id)a4;
- (void)setIsInInteractiveMode:(BOOL)a3;
- (void)setIsPreview:(BOOL)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setMatrixDouble4x4:(long long *)a3 forKey:(void *)a4;
- (void)setMatrixFloat4x4:(double)a3 forKey:(double)a4;
- (void)setOutputAspectRatio:(double)a3;
- (void)setPlayableAspectRatio:(double)a3;
- (void)setPlayableAspectRatioPreservationMode:(int)a3;
- (void)setPoint:(CGPoint)a3 forKey:(id)a4;
- (void)setRect:(CGRect)a3 forKey:(id)a4;
- (void)setShouldDisableFadeOut:(BOOL)a3;
- (void)setSize:(CGSize)a3 forKey:(id)a4;
- (void)setTransformAnimation:(id)a3;
@end

@implementation PVEffect

+ (double)defaultPlayableAspectRatio
{
  return 1.0;
}

+ (int)defaultPlayableAspectRatioPreservationMode
{
  return 0;
}

- (double)playableAspectRatio
{
  uint64_t v5 = 0;
  v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __52__PVEffect_PlayableAspectRatio__playableAspectRatio__block_invoke;
  v4[3] = &unk_1E6168960;
  v4[4] = self;
  v4[5] = &v5;
  [(PVEffect *)self runWithInspectableProperties:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __52__PVEffect_PlayableAspectRatio__playableAspectRatio__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playableAspectRatio_NoLock:");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (void)setPlayableAspectRatio:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:");
}

- (int)playableAspectRatioPreservationMode
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = *(void *)"";
  v4[2] = __68__PVEffect_PlayableAspectRatio__playableAspectRatioPreservationMode__block_invoke;
  v4[3] = &unk_1E6168960;
  v4[4] = self;
  v4[5] = &v5;
  [(PVEffect *)self runWithInspectableProperties:v4];
  int v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __68__PVEffect_PlayableAspectRatio__playableAspectRatioPreservationMode__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "playableAspectRatioPreservationMode_NoLock:");
}

- (void)setPlayableAspectRatioPreservationMode:(int)a3
{
  id v4 = [NSNumber numberWithUnsignedInt:*(void *)&a3];
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:");
}

- (CGRect)playableRectInView:(CGSize)a3
{
  uint64_t v13 = 0;
  v14 = (double *)&v13;
  uint64_t v15 = 0x5012000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = &unk_1B876C866;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = *(void *)"";
  v11[2] = __52__PVEffect_PlayableAspectRatio__playableRectInView___block_invoke;
  v11[3] = &unk_1E6168988;
  v11[4] = self;
  v11[5] = &v13;
  CGSize v12 = a3;
  [(PVEffect *)self runWithInspectableProperties:v11];
  double v3 = v14[6];
  double v4 = v14[7];
  double v5 = v14[8];
  double v6 = v14[9];
  _Block_object_dispose(&v13, 8);
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

void __52__PVEffect_PlayableAspectRatio__playableRectInView___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playableRectInView_NoLock:properties:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  double v3 = *(void **)(*(void *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  v3[9] = v7;
}

- (double)playableScaleInView:(CGSize)a3
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __53__PVEffect_PlayableAspectRatio__playableScaleInView___block_invoke;
  v5[3] = &unk_1E6168988;
  v5[4] = self;
  v5[5] = &v7;
  CGSize v6 = a3;
  [(PVEffect *)self runWithInspectableProperties:v5];
  double v3 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __53__PVEffect_PlayableAspectRatio__playableScaleInView___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "playableScaleInView_NoLock:properties:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
}

- (double)playableAspectRatio_NoLock:(id)a3
{
  id v4 = a3;
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kPVPlayableAspectRatioKey"];
  CGSize v6 = v5;
  if (v5) {
    [v5 doubleValue];
  }
  else {
    [(id)objc_opt_class() defaultPlayableAspectRatio];
  }
  double v8 = v7;

  return v8;
}

- (int)playableAspectRatioPreservationMode_NoLock:(id)a3
{
  id v4 = a3;
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"kPVPlayableAspectRatioPreservationModeKey"];
  CGSize v6 = v5;
  if (v5) {
    int v7 = [v5 intValue];
  }
  else {
    int v7 = [(id)objc_opt_class() defaultPlayableAspectRatioPreservationMode];
  }
  int v8 = v7;

  return v8;
}

- (CGRect)playableRectInView_NoLock:(CGSize)a3 properties:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  [(PVEffect *)self playableAspectRatio_NoLock:v7];
  double v9 = v8;
  double v10 = 1.0;
  switch([(PVEffect *)self playableAspectRatioPreservationMode_NoLock:v7])
  {
    case 0:
    case 3:
      double v9 = width;
      goto LABEL_11;
    case 1:
      if (width <= height)
      {
        double v10 = height;
        if (height * v9 < width) {
          double v10 = width / v9;
        }
      }
      else
      {
        double v10 = width / v9;
        if (width / v9 < height) {
          double v10 = height;
        }
      }
      goto LABEL_14;
    case 2:
      if (width / v9 <= height) {
        double v10 = width / v9;
      }
      else {
        double v10 = height;
      }
LABEL_14:
      double v9 = v9 * v10;
      break;
    case 0xD:
      double v10 = width / v9;
      double v9 = width;
      break;
    case 0xE:
      double v9 = height * v9;
LABEL_11:
      double v10 = height;
      break;
    default:
      break;
  }

  double v11 = (width - v9) * 0.5 + 0.0;
  double v12 = (height - v10) * 0.5 + 0.0;
  double v13 = v9;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)playableScaleInView_NoLock:(CGSize)a3 properties:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  [(PVEffect *)self playableAspectRatio_NoLock:v7];
  double v9 = v8;
  int v10 = [(PVEffect *)self playableAspectRatioPreservationMode_NoLock:v7];
  double v11 = 1.0;
  if (!v10) {
    goto LABEL_16;
  }
  if (v9 > -0.0000001)
  {
    double v11 = 1.0;
    if (v9 < 0.0000001) {
      goto LABEL_16;
    }
  }
  double v12 = height * v9;
  if (v10 > 2)
  {
    if (v10 == 3 || v10 == 13)
    {
      double v9 = width;
    }
    else if (v10 == 14)
    {
      double v9 = height * v9;
    }
    goto LABEL_15;
  }
  if (v10 == 1)
  {
    if (width <= height)
    {
      double v13 = height;
      if (v12 < width) {
        double v13 = width / v9;
      }
    }
    else
    {
      double v13 = width / v9;
      if (width / v9 < height) {
        double v13 = height;
      }
    }
    goto LABEL_13;
  }
  if (v10 == 2)
  {
    double v13 = width / v9;
    if (width / v9 > height) {
      double v13 = height;
    }
LABEL_13:
    double v9 = v9 * v13;
  }
LABEL_15:
  double v11 = v9 / v12;
LABEL_16:
  if (v11 >= 0.0000001 || v11 <= -0.0000001) {
    double v15 = v11;
  }
  else {
    double v15 = 1.0;
  }

  return v15;
}

- (id)hitAreaPointsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 scale:(CGPoint)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  return 0;
}

- (BOOL)hitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  return 0;
}

- (CGPath)createPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 scale:(CGPoint)a5 adjustForMinimumSize:(BOOL)a6 minimumSize:(double)a7 sizeThreshold:(double)a8 viewSize:(CGSize)a9 viewOrigin:(int)a10 outExpandedPath:(const CGPath *)a11
{
  return 0;
}

- (id)objectHitTest:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 scale:(CGPoint)a6 adjustForMinimumSize:(BOOL)a7 minimumSize:(double)a8 sizeThreshold:(double)a9 viewSize:(CGSize)a10 viewOrigin:(int)a11
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (unsigned)timelineDurationInFrames
{
  return 0;
}

- (double)timelineDurationInSeconds
{
  return 0.0;
}

- (double)timelineFrameRate
{
  return 0.0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  return self;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3
{
  uint64_t v4 = MEMORY[0x1E4F1FA20];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v4 + 32);
  return self;
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3
{
  uint64_t v4 = MEMORY[0x1E4F1FA20];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&retstr->var0.var0 = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&retstr->var0.var3 = v5;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)(v4 + 32);
  return self;
}

- (id)timelineMarkers
{
  return 0;
}

- (id)timelineMarkersOfType:(int)a3
{
  return 0;
}

- (id)posterFrameMarker
{
  return 0;
}

- (BOOL)loopTimeOverrideEnabled
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

- (BOOL)forceDisableLoop
{
  return 0;
}

- (BOOL)forceDisableBuildAnimation
{
  return 0;
}

- (BOOL)useLocalLoopTime
{
  return 1;
}

- (id)handleForOZID:(unsigned int)a3
{
  return 0;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8
{
  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  return self;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  return +[PVMatrix44Double matrix];
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  return +[PVMatrix44Double matrix];
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  return +[PVMatrix44Double matrix];
}

- (id)addToTopLevelTransform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:
{
  return +[PVMatrix44Double matrix];
}

- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:
{
  double v8 = *MEMORY[0x1E4F1DAD8];
  double v9 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  result.y = v9;
  result.x = v8;
  return result;
}

- (double)convertPointToView:withEffectToViewTransform:viewSize:
{
  return *MEMORY[0x1E4F1DAD8];
}

- (double)convertPointFromView:(_OWORD *)a1@<X8> atTime:viewSize:viewOrigin:
{
  double result = 0.0;
  *a1 = 0u;
  a1[1] = 0u;
  return result;
}

- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  return +[PVMatrix44Double matrix];
}

- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8
{
  return +[PVMatrix44Double matrix];
}

- (id)topLevelGroupTransform
{
  return +[PVMatrix44Double matrix];
}

- (__n128)getScale
{
  __asm { FMOV            V0.2D, #1.0 }
  *a1 = result;
  a1[1] = result;
  return result;
}

- (id)cameraTransform
{
  return +[PVMatrix44Double matrix];
}

- (id)cameraProjection
{
  return +[PVMatrix44Double matrix];
}

- (BOOL)isCameraOverrideEnabled
{
  return 0;
}

- (BOOL)transformUnitsAreInMeters
{
  return 0;
}

- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  if (a3)
  {
    CGSize v7 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    a3->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    a3->size = v7;
  }
  return a3 != 0;
}

- (BOOL)BOOLForKey:(id)a3
{
  uint64_t v3 = [(PVEffect *)self inspectablePropertyForKey:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setBool:(BOOL)a3 forKey:(id)a4
{
  BOOL v4 = a3;
  CGSize v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithBool:v4];
  [(PVEffect *)self setInspectableProperty:v8 forKey:v7];
}

- (double)doubleForKey:(id)a3 defaultValue:(double)a4
{
  long long v5 = [(PVEffect *)self inspectablePropertyForKey:a3];
  CGSize v6 = v5;
  if (v5)
  {
    [v5 doubleValue];
    a4 = v7;
  }

  return a4;
}

- (void)setDouble:(double)a3 forKey:(id)a4
{
  CGSize v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithDouble:a3];
  [(PVEffect *)self setInspectableProperty:v8 forKey:v7];
}

- (CGPoint)pointForKey:(id)a3 defaultValue:(CGPoint)a4
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  CGSize v6 = [(PVEffect *)self inspectablePropertyForKey:a3];
  id v7 = v6;
  if (v6)
  {
    [v6 CGPointValue];
    CGFloat x = v8;
    CGFloat y = v9;
  }

  double v10 = x;
  double v11 = y;
  result.CGFloat y = v11;
  result.CGFloat x = v10;
  return result;
}

- (void)setPoint:(CGPoint)a3 forKey:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = (void *)MEMORY[0x1E4F29238];
  id v8 = a4;
  objc_msgSend(v7, "valueWithCGPoint:", x, y);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(PVEffect *)self setInspectableProperty:v9 forKey:v8];
}

- (CGSize)sizeForKey:(id)a3 defaultValue:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGSize v6 = [(PVEffect *)self inspectablePropertyForKey:a3];
  id v7 = v6;
  if (v6)
  {
    [v6 CGSizeValue];
    CGFloat width = v8;
    CGFloat height = v9;
  }

  double v10 = width;
  double v11 = height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (void)setSize:(CGSize)a3 forKey:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = (void *)MEMORY[0x1E4F29238];
  id v8 = a4;
  objc_msgSend(v7, "valueWithCGSize:", width, height);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [(PVEffect *)self setInspectableProperty:v9 forKey:v8];
}

- (CGRect)rectForKey:(id)a3 defaultValue:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v8 = [(PVEffect *)self inspectablePropertyForKey:a3];
  id v9 = v8;
  if (v8)
  {
    [v8 CGRectValue];
    CGFloat x = v10;
    CGFloat y = v11;
    CGFloat width = v12;
    CGFloat height = v13;
  }

  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)setRect:(CGRect)a3 forKey:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = (void *)MEMORY[0x1E4F29238];
  id v10 = a4;
  objc_msgSend(v9, "valueWithCGRect:", x, y, width, height);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [(PVEffect *)self setInspectableProperty:v11 forKey:v10];
}

- (void)matrixDouble4x4ForKey:(void *)a1@<X0>
{
  uint64_t v3 = objc_msgSend(a1, "transformObjectForKey:");
  if (v3)
  {
    id v9 = v3;
    [v3 SIMDDouble4x4];
    uint64_t v3 = v9;
  }
  else
  {
    BOOL v4 = (_OWORD *)MEMORY[0x1E4F14990];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
    a2[4] = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
    a2[5] = v5;
    long long v6 = v4[7];
    a2[6] = v4[6];
    a2[7] = v6;
    long long v7 = v4[1];
    *a2 = *v4;
    a2[1] = v7;
    long long v8 = v4[3];
    a2[2] = v4[2];
    a2[3] = v8;
  }
}

- (void)setMatrixDouble4x4:(long long *)a3 forKey:(void *)a4
{
  long long v5 = a3[5];
  long long v15 = a3[4];
  long long v16 = v5;
  long long v6 = a3[7];
  long long v17 = a3[6];
  long long v18 = v6;
  long long v7 = a3[1];
  long long v11 = *a3;
  long long v12 = v7;
  long long v8 = a3[3];
  long long v13 = a3[2];
  long long v14 = v8;
  id v9 = a4;
  id v10 = +[PVMatrix44Double matrixWithSIMDDouble4x4:&v11];
  objc_msgSend(a1, "setInspectableProperty:forKey:", v10, v9, v11, v12, v13, v14, v15, v16, v17, v18);
}

- (__n128)matrixFloat4x4ForKey:(void *)a1
{
  v1 = objc_msgSend(a1, "transformObjectForKey:");
  int v2 = v1;
  if (v1)
  {
    [v1 SIMDFloat4x4];
    long long v5 = v3;
  }
  else
  {
    long long v5 = *MEMORY[0x1E4F149A0];
  }

  return (__n128)v5;
}

- (void)setMatrixFloat4x4:(double)a3 forKey:(double)a4
{
  id v8 = a7;
  long long v13 = +[PVMatrix44Double matrixWithSIMDFloat4x4:](PVMatrix44Double, "matrixWithSIMDFloat4x4:", a2, a3, a4, a5);
  [a1 setInspectableProperty:v13 forKey:v8];
}

- (id)transformAnimation
{
  return [(PVEffect *)self inspectablePropertyForKey:@"kPVTransformAnimationKey"];
}

- (void)setTransformAnimation:(id)a3
{
}

- (double)outputAspectRatio
{
  [(PVEffect *)self outputSize];
  double v5 = v3 / v4;

  [(PVEffect *)self doubleForKey:@"kPVOutputAspectKey" defaultValue:v5];
  return result;
}

- (void)setOutputAspectRatio:(double)a3
{
}

- (id)stringForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PVEffect *)self inspectablePropertyForKey:a3];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (id)attributedStringForKey:(id)a3 defaultValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PVEffect *)self inspectablePropertyForKey:a3];
  id v8 = (void *)v7;
  if (v7) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = v6;
  }
  id v10 = v9;

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVEffect)initWithEffectID:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PVEffect;
  id v6 = [(PVEffect *)&v24 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_effectID, a3);
    id v8 = [(PVEffect *)v7 effectID];
    uint64_t v9 = +[PVEffect propertiesForEffect:v8];
    contentProperties = v7->_contentProperties;
    v7->_contentProperties = (NSDictionary *)v9;

    uint64_t v11 = [(NSDictionary *)v7->_contentProperties objectForKey:@"FFEffectProperty_EffectType"];
    effectType = v7->_effectType;
    v7->_effectType = (NSString *)v11;

    uint64_t v13 = [(NSDictionary *)v7->_contentProperties objectForKey:@"FFEffectProperty_DisplayName"];
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v13;

    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    *(_OWORD *)&v7->_effectRange.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&v7->_effectRange.start.epoch = v16;
    *(_OWORD *)&v7->_effectRange.duration.timescale = v15;
    v7->_conformToInputAspect = 0;
    *(_WORD *)&v7->_isInInteractiveMode = 0;
    long long v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inspectableProperties = v7->_inspectableProperties;
    v7->_inspectableProperties = v17;

    v19 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    inspectablePropertiesLock = v7->_inspectablePropertiesLock;
    v7->_inspectablePropertiesLock = v19;

    uint64_t v21 = objc_opt_new();
    effectParameters = v7->_effectParameters;
    v7->_effectParameters = (NSMutableDictionary *)v21;

    operator new();
  }

  return 0;
}

- (PVEffect)initWithContentID:(id)a3 andDictionary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PVEffect;
  uint64_t v9 = [(PVEffect *)&v26 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_effectID, a3);
    uint64_t v11 = [v8 valueForKey:@"contentProperties"];
    contentProperties = v10->_contentProperties;
    v10->_contentProperties = (NSDictionary *)v11;

    uint64_t v13 = [v8 valueForKey:@"contentType"];
    effectType = v10->_effectType;
    v10->_effectType = (NSString *)v13;

    uint64_t v15 = [(NSDictionary *)v10->_contentProperties objectForKey:@"displayName"];
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v15;

    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
    *(_OWORD *)&v10->_effectRange.start.value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&v10->_effectRange.start.epoch = v18;
    *(_OWORD *)&v10->_effectRange.duration.timescale = v17;
    v10->_conformToInputAspect = 0;
    *(_WORD *)&v10->_isInInteractiveMode = 0;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    inspectableProperties = v10->_inspectableProperties;
    v10->_inspectableProperties = v19;

    uint64_t v21 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    inspectablePropertiesLock = v10->_inspectablePropertiesLock;
    v10->_inspectablePropertiesLock = v21;

    uint64_t v23 = objc_opt_new();
    effectParameters = v10->_effectParameters;
    v10->_effectParameters = (NSMutableDictionary *)v23;

    operator new();
  }

  return 0;
}

- (void)dealloc
{
  [(PVEffect *)self releaseResources];
  loadCount = self->_loadCount;
  if (loadCount) {
    MEMORY[0x1BA9BFBA0](loadCount, 0x1000C4052888210);
  }
  v4.receiver = self;
  v4.super_class = (Class)PVEffect;
  [(PVEffect *)&v4 dealloc];
}

- (void)_configureComponents
{
  double v3 = [[PVEffectTimedPropertiesComponent alloc] initWithEffect:self];
  timedPropertiesComponent = self->_timedPropertiesComponent;
  self->_timedPropertiesComponent = v3;

  components = self->_components;
  id v6 = self->_timedPropertiesComponent;

  [(NSMutableArray *)components addObject:v6];
}

- (id)effectID
{
  return self->_effectID;
}

- (id)effectType
{
  return self->_effectType;
}

- (id)displayName
{
  return self->_displayName;
}

- (id)debugDisplayName
{
  double v3 = NSString;
  objc_super v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(PVEffect *)self displayName];
  id v7 = [(PVEffect *)self effectID];
  id v8 = [v3 stringWithFormat:@"%@ %@ %@", v5, v6, v7];

  return v8;
}

- (id)categoryName
{
  return [(NSDictionary *)self->_contentProperties objectForKey:@"FFEffectProperty_Category"];
}

- (BOOL)forceRenderAtPosterFrame
{
  return 0;
}

- (BOOL)isBuildInAnimationEnabled
{
  return 0;
}

- (BOOL)isBuildOutAnimationEnabled
{
  return 0;
}

- (BOOL)isLoopedRangeRenderCacheable
{
  return 0;
}

- (BOOL)isEphemeralProperty:(id)a3
{
  return 0;
}

- (BOOL)isTemporalProperty:(id)a3
{
  return 0;
}

- (CGSize)outputSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGRect)outputROI
{
  double v2 = *MEMORY[0x1E4F1DB28];
  double v3 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (int)origin
{
  return 0;
}

- (BOOL)isReady
{
  return 1;
}

- (BOOL)resourcesAreReady
{
  return 1;
}

- (BOOL)loadEffect
{
  loadCount = (atomic_uint *)self->_loadCount;
  if (loadCount) {
    atomic_fetch_add(loadCount, 1u);
  }
  BOOL v4 = [(PVEffect *)self loadResources];
  double v5 = (unsigned int *)self->_loadCount;
  if (v5)
  {
    unsigned int v6 = atomic_load(v5);
    if (v6 == 1)
    {
      components = self->_components;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = *(void *)"";
      v9[2] = __22__PVEffect_loadEffect__block_invoke;
      v9[3] = &unk_1E6169890;
      v9[4] = self;
      BOOL v10 = v4;
      [(NSMutableArray *)components enumerateObjectsUsingBlock:v9];
    }
  }
  return v4;
}

uint64_t __22__PVEffect_loadEffect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 effectDidLoad:*(void *)(a1 + 32) isReady:*(unsigned __int8 *)(a1 + 40)];
}

- (void)loadEffectOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __41__PVEffect_loadEffectOnQueue_completion___block_invoke;
  v8[3] = &unk_1E61698B8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);
}

uint64_t __41__PVEffect_loadEffectOnQueue_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadEffect];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)loadResources
{
  return 1;
}

- (void)loadResourcesOnQueue:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __44__PVEffect_loadResourcesOnQueue_completion___block_invoke;
  v8[3] = &unk_1E61698B8;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)a3, v8);
}

uint64_t __44__PVEffect_loadResourcesOnQueue_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) loadResources];
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (void)releaseEffect
{
  loadCount = (atomic_uint *)self->_loadCount;
  if (loadCount)
  {
    atomic_fetch_add(loadCount, 0xFFFFFFFF);
    if (!atomic_load((unsigned int *)self->_loadCount))
    {
      [(PVEffect *)self releaseResources];
      components = self->_components;
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = *(void *)"";
      v6[2] = __25__PVEffect_releaseEffect__block_invoke;
      v6[3] = &unk_1E61698E0;
      v6[4] = self;
      [(NSMutableArray *)components enumerateObjectsUsingBlock:v6];
    }
  }
}

uint64_t __25__PVEffect_releaseEffect__block_invoke(uint64_t a1, void *a2)
{
  return [a2 effectDidUnload:*(void *)(a1 + 32)];
}

- (id)inspectablePropertyForKey:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_inspectablePropertiesLock lock];
  double v5 = [(NSMutableDictionary *)self->_inspectableProperties objectForKeyedSubscript:v4];
  [(NSLock *)self->_inspectablePropertiesLock unlock];

  return v5;
}

- (void)setInspectableProperty:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSLock *)self->_inspectablePropertiesLock lock];
  inspectableProperties = self->_inspectableProperties;
  if (v8) {
    [(NSMutableDictionary *)inspectableProperties setObject:v8 forKeyedSubscript:v6];
  }
  else {
    [(NSMutableDictionary *)inspectableProperties removeObjectForKey:v6];
  }
  [(NSLock *)self->_inspectablePropertiesLock unlock];
}

- (NSDictionary)inspectableProperties
{
  [(NSLock *)self->_inspectablePropertiesLock lock];
  double v3 = (void *)[(NSMutableDictionary *)self->_inspectableProperties copy];
  [(NSLock *)self->_inspectablePropertiesLock unlock];

  return (NSDictionary *)v3;
}

- (void)setInspectableProperties:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_inspectablePropertiesLock lock];
  [(NSMutableDictionary *)self->_inspectableProperties setDictionary:v4];
  [(NSLock *)self->_inspectablePropertiesLock unlock];
}

- (void)addEntriesToInspectableProperties:(id)a3
{
  id v4 = a3;
  [(NSLock *)self->_inspectablePropertiesLock lock];
  [(NSMutableDictionary *)self->_inspectableProperties addEntriesFromDictionary:v4];
  [(NSLock *)self->_inspectablePropertiesLock unlock];
}

- (id)descriptionOfInspectableProperties
{
  [(NSLock *)self->_inspectablePropertiesLock lock];
  double v3 = [(NSMutableDictionary *)self->_inspectableProperties description];
  [(NSLock *)self->_inspectablePropertiesLock unlock];

  return v3;
}

- (BOOL)supportsExtendedRangeInputs
{
  return 1;
}

- (NSMutableDictionary)effectParameters
{
  return self->_effectParameters;
}

- (void)setEffectParameters:(id)a3
{
}

- (void)setIsInInteractiveMode:(BOOL)a3
{
  self->_isInInteractiveMode = a3;
}

- (float)proxyRenderScale
{
  v11[1] = *MEMORY[0x1E4F143B8];
  {
    id v8 = self;
    self = v8;
    if (v9)
    {
      BOOL v10 = @"197A9506-9198-4FBD-A7BF-955118A07AE2";
      v11[0] = &unk_1F11EC520;
      -[PVEffect proxyRenderScale]::sEffectProxyResMap = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      self = v8;
    }
  }
  double v2 = (void *)-[PVEffect proxyRenderScale]::sEffectProxyResMap;
  double v3 = [(PVEffect *)self effectID];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    [v4 floatValue];
    float v6 = v5;
  }
  else
  {
    float v6 = 1.0;
  }

  return v6;
}

- (void)setHidden:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  -[PVEffect setInspectableProperty:forKey:](self, "setInspectableProperty:forKey:");
}

- (BOOL)isHidden
{
  double v2 = [(PVEffect *)self inspectablePropertyForKey:@"kPVHiddenKey"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)topLevelOpacity
{
  return 1.0;
}

- (BOOL)isVisible
{
  if ([(PVEffect *)self isHidden]) {
    return 0;
  }
  [(PVEffect *)self topLevelOpacity];
  return v4 > 0.0;
}

- (id)contentRegistryProperties
{
  char v3 = +[PVContentRegistry sharedInstance];
  double v4 = [(PVEffect *)self effectID];
  float v5 = [v3 contentPropertiesForID:v4];

  return v5;
}

- (id)contentRegistryPropertyForKey:(id)a3
{
  id v4 = a3;
  float v5 = [(PVEffect *)self contentRegistryProperties];
  float v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (id)contentPropertyForKey:(id)a3
{
  id v4 = a3;
  contentProperties = self->_contentProperties;
  if (contentProperties)
  {
    float v6 = [(NSDictionary *)contentProperties valueForKey:v4];
  }
  else
  {
    float v6 = 0;
  }

  return v6;
}

- (id)contentBundle
{
  double v2 = [(PVEffect *)self contentPropertyForKey:@"_contentBundleID"];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:v2];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)hasBuiltInEnvironment
{
  return 0;
}

- (void)_postInit:(id)a3
{
  id v6 = a3;
  id v4 = [v6 objectForKey:@"effectType"];
  if (v4) {
    objc_storeStrong((id *)&self->_effectType, v4);
  }
  float v5 = [v6 objectForKey:@"displayName"];
  if (v5) {
    objc_storeStrong((id *)&self->_displayName, v5);
  }
}

- (void)_copyWithZone:(_NSZone *)a3 into:(id)a4
{
  id v5 = a4;
  [v5 setValue:self->_effectType forKey:@"effectType"];
  [v5 setValue:self->_displayName forKey:@"displayName"];
}

- (void)_decodeFromCoder:(id)a3 into:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"effectType"];
  if (v6) {
    [v5 setValue:v6 forKey:@"effectType"];
  }
  id v7 = [v8 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  if (v7) {
    [v5 setValue:v7 forKey:@"displayName"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [(PVEffect *)self _copyWithZone:a3 into:v5];
  id v6 = +[PVContentRegistry sharedInstance];
  id v7 = [(PVEffect *)self effectID];
  id v8 = [v6 createContentInstance:v7];

  int v9 = [(PVEffect *)self inspectableProperties];
  [v8 setInspectableProperties:v9];

  long long v10 = *(_OWORD *)&self->_effectRange.start.epoch;
  v12[0] = *(_OWORD *)&self->_effectRange.start.value;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&self->_effectRange.duration.timescale;
  [v8 setEffectRange:v12];
  [v8 setConformToInputAspect:self->_conformToInputAspect];
  [v8 _postInit:v5];

  return v8;
}

- (PVEffect)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"effectID"];
  id v6 = +[PVContentRegistry sharedInstance];
  id v7 = [v6 createContentInstance:v5];

  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PVEffect *)v7 _decodeFromCoder:v4 into:v8];
    [(PVEffect *)v7 _postInit:v8];
  }
  return v7;
}

- (BOOL)usesDefaultChannelDataEncoding
{
  return 1;
}

- (BOOL)writeDefaultChannels
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = [(PVEffect *)self effectID];
  [v5 encodeObject:v4 forKey:@"effectID"];

  [v5 encodeObject:self->_effectType forKey:@"effectType"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
}

- (HGRef<HGNode>)hgNodeForTime:(id *)a3 inputs:(const void *)a4 renderer:(const void *)a5 igContext:(HGRef<PVInstructionGraphContext>)a6
{
  return (HGRef<HGNode>)PVInputHGNodeMap<unsigned int>::GetNode((uint64_t)a4, 0, v6);
}

- (id)effectDescription
{
  v16[5] = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)&self->_effectRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_effectRange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_effectRange.duration.timescale;
  CFDictionaryRef v4 = CMTimeRangeCopyAsDictionary(&range, 0);
  id v5 = [MEMORY[0x1E4F1CA60] dictionary];
  [(NSLock *)self->_inspectablePropertiesLock lock];
  inspectableProperties = self->_inspectableProperties;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  v12[2] = __29__PVEffect_effectDescription__block_invoke;
  _OWORD v12[3] = &unk_1E6169910;
  id v7 = v5;
  id v13 = v7;
  [(NSMutableDictionary *)inspectableProperties enumerateKeysAndObjectsUsingBlock:v12];
  [(NSLock *)self->_inspectablePropertiesLock unlock];
  v15[0] = @"effectID";
  v15[1] = @"effectName";
  displayName = (__CFString *)self->_displayName;
  if (!displayName) {
    displayName = &stru_1F119C770;
  }
  v16[0] = self->_effectID;
  v16[1] = displayName;
  int v9 = @"NO";
  if (self->_conformToInputAspect) {
    int v9 = @"YES";
  }
  v15[2] = @"conformToInputAspect";
  v15[3] = @"inspectableProperties";
  v16[2] = v9;
  v16[3] = v7;
  v15[4] = @"effectRange";
  v16[4] = v4;
  long long v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:5];
  CFRelease(v4);

  return v10;
}

void __29__PVEffect_effectDescription__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = [a3 description];
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v6];
}

- (id)description
{
  double v2 = NSString;
  long long v3 = [(PVEffect *)self effectDescription];
  CFDictionaryRef v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- ($202A6A048D39AE170264FF71A65A9479)effectRange
{
  long long v3 = *(_OWORD *)&self[1].var0.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var0.var3;
  return self;
}

- (void)setEffectRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_effectRange.start.epoch = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_effectRange.duration.timescale = v4;
  *(_OWORD *)&self->_effectRange.start.value = v3;
}

- (BOOL)conformToInputAspect
{
  return self->_conformToInputAspect;
}

- (void)setConformToInputAspect:(BOOL)a3
{
  self->_conformToInputAspect = a3;
}

- (NSDictionary)contentProperties
{
  return self->_contentProperties;
}

- (void)setContentProperties:(id)a3
{
}

- (BOOL)isPreview
{
  return self->_isPreview;
}

- (void)setIsPreview:(BOOL)a3
{
  self->_isPreview = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)isInInteractiveMode
{
  return self->_isInInteractiveMode;
}

- (BOOL)shouldDisableFadeOut
{
  return self->_shouldDisableFadeOut;
}

- (void)setShouldDisableFadeOut:(BOOL)a3
{
  self->_shouldDisableFadeOut = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProperties, 0);
  objc_storeStrong((id *)&self->_timedPropertiesComponent, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_effectParameters, 0);
  objc_storeStrong((id *)&self->_inspectablePropertiesLock, 0);
  objc_storeStrong((id *)&self->_inspectableProperties, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_effectType, 0);

  objc_storeStrong((id *)&self->_effectID, 0);
}

- (BOOL)applyTimedPropertiesForTime:(id *)a3
{
  timedPropertiesComponent = self->_timedPropertiesComponent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  return [(PVEffectTimedPropertiesComponent *)timedPropertiesComponent applyTimedPropertiesForTime:&v5];
}

- (void)addTimedPropertiesDelegate:(id)a3 userContext:(id)a4
{
}

- (void)removeTimedPropertiesDelegate:(id)a3
{
}

- (void)removeAllTimedPropertiesDelegates
{
}

- (id)timedPropertiesDelegates
{
  return [(PVEffectTimedPropertiesComponent *)self->_timedPropertiesComponent timedPropertiesDelegates];
}

- (BOOL)hasTimedPropertiesDelegates
{
  return [(PVEffectTimedPropertiesComponent *)self->_timedPropertiesComponent hasTimedPropertiesDelegates];
}

- (BOOL)hasTimedPropertiesDelegate:(id)a3
{
  return [(PVEffectTimedPropertiesComponent *)self->_timedPropertiesComponent hasTimedPropertiesDelegate:a3];
}

- (id)userContextForTimedPropertiesDelegate:(id)a3
{
  long long v3 = [(PVEffectTimedPropertiesComponent *)self->_timedPropertiesComponent userContextForTimedPropertiesDelegate:a3];

  return v3;
}

- (void)runWithInspectableProperties:(id)a3
{
  long long v4 = (void (**)(id, NSMutableDictionary *))a3;
  [(NSLock *)self->_inspectablePropertiesLock lock];
  v4[2](v4, self->_inspectableProperties);
  [(NSLock *)self->_inspectablePropertiesLock unlock];
}

- (void)runWithInspectableProperties_NoLock:(id)a3
{
  long long v4 = (void (**)(id, NSMutableDictionary *))a3;
  [(PVEffect *)self assertInspectablePropertiesAreLocked];
  v4[2](v4, self->_inspectableProperties);
}

- (BOOL)hasAllNecessaryResources
{
  return 1;
}

- (id)textEditingBoundsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 useParagraphBounds:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  return 0;
}

- (id)textEditingBounds:(id *)a3
{
  return 0;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  return 0;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  return 0;
}

- (id)textTransformsAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  return 0;
}

- (PVCGPointQuad)textCornersAtTime:(SEL)a3 index:(id *)a4 forcePosterFrame:(unint64_t)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9
{
  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  return self;
}

- (id)attributedStringAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)defaultAttributedString:(unint64_t)a3
{
  return 0;
}

- (id)mainTitle
{
  return 0;
}

- (id)subtitle
{
  return 0;
}

- (BOOL)supportsFlippingText
{
  return 0;
}

- (BOOL)supportsOrientation
{
  return 0;
}

- (BOOL)isTextFlipped
{
  return 0;
}

- (BOOL)isTitleCard
{
  return 0;
}

- (int)orientation
{
  return 0;
}

+ (id)attributeForName:(id)a3 fromAttributedString:(id)a4 defaultAttributes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 length]) {
    [v8 attribute:v7 atIndex:0 effectiveRange:0];
  }
  else {
  long long v10 = [v9 objectForKeyedSubscript:v7];
  }

  return v10;
}

+ (int64_t)verticalAlignmentFromAttributedString:(id)a3 defaultAttributes:(id)a4
{
  long long v4 = [a1 attributeForName:@"TXTextVerticalAlignment" fromAttributedString:a3 defaultAttributes:a4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 integerValue];
    if (v6 >= 3) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = v6;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

+ (double)textHeightFromAttributedString:(id)a3 defaultAttributes:(id)a4
{
  [a1 textHeightFromAttributedString:a3 defaultAttributes:a4 scale:1.0];
  return result;
}

+ (double)textHeightFromAttributedString:(id)a3 defaultAttributes:(id)a4 scale:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  if ([v7 length]
    && ([v7 attribute:@"TXTextHeight" atIndex:0 effectiveRange:0],
        id v9 = objc_claimAutoreleasedReturnValue(),
        (long long v10 = v9) != 0))
  {
    [v9 doubleValue];
    double v12 = v11;
    id v13 = [v7 attribute:@"TXTextDynamicLineSpacing" atIndex:0 effectiveRange:0];
    [v13 doubleValue];
    double v15 = v12 * a5 + v14 * a5;
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F42508];
    long long v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
    if (!v10)
    {
      if ([v7 length])
      {
        long long v10 = [v7 attribute:v16 atIndex:0 effectiveRange:0];
      }
      else
      {
        long long v10 = 0;
      }
    }
    [v10 ascender];
    double v18 = v17;
    [v10 descender];
    double v20 = v19;
    [v10 leading];
    double v15 = v18 - v20 + v21;
  }

  return v15;
}

+ (id)shadowFromAttributedString:(id)a3 defaultAttributes:(id)a4
{
  long long v4 = [a1 attributeForName:*MEMORY[0x1E4F42560] fromAttributedString:a3 defaultAttributes:a4];

  return v4;
}

+ (double)xOffsetForTextTrackingFromAttributedString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    long long v4 = [v3 attribute:@"TXTrackingValue" atIndex:0 effectiveRange:0];
    [v4 doubleValue];
    double v6 = v5;

    double v7 = v6 * 0.5;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (BOOL)isAllCapsFromAttributes:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"MotionTextStyleAllCapsAttributeName"];
  BOOL v4 = [v3 integerValue] > 0;

  return v4;
}

+ (double)baselineOffsetFromAttributedString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = [v3 attribute:*MEMORY[0x1E4F424D8] atIndex:0 effectiveRange:0];
    [v4 doubleValue];
    double v6 = -v5;
  }
  else
  {
    double v6 = 0.0;
  }

  return v6;
}

+ (void)modifyAttributedStringByAdjustingFontSize:(id)a3 scale:(double)a4
{
  id v11 = a3;
  if ([v11 length])
  {
    uint64_t v5 = *MEMORY[0x1E4F42508];
    double v6 = [v11 attribute:*MEMORY[0x1E4F42508] atIndex:0 effectiveRange:0];
    double v7 = v6;
    if (v6)
    {
      [v6 pointSize];
      id v9 = [v7 fontWithSize:fabs(a4) * v8];

      uint64_t v10 = [v11 length];
      objc_msgSend(v11, "removeAttribute:range:", v5, 0, v10);
      objc_msgSend(v11, "addAttribute:value:range:", v5, v9, 0, v10);
    }
    else
    {
      id v9 = 0;
    }
  }
}

+ (void)modifyAttributedStringByAdjustingShadow:(id)a3 effectTransform:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    double v8 = [v6 string];
    char v9 = [v8 isEqualToString:@" "];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = [v6 attribute:*MEMORY[0x1E4F42560] atIndex:0 effectiveRange:0];
      if (v10)
      {
        long long v18 = xmmword_1B7E73520;
        long long v19 = xmmword_1B7E73530;
        long long v20 = xmmword_1B7E73540;
        long long v21 = *(_OWORD *)&qword_1B7E73550;
        memset(v15, 0, sizeof(v15));
        float64x2_t v16 = (float64x2_t)xmmword_1B7E73500;
        float64x2_t v17 = *(float64x2_t *)&qword_1B7E73510;
        if (v7) {
          [v7 SIMDDouble4x4];
        }
        else {
          memset(v14, 0, sizeof(v14));
        }
        pv_transform_info_make((uint64_t)v14, (uint64_t)v15);
        v12[1] = 0;
        double v13 = 0.0;
        v12[0] = 0;
        v11[0] = v16;
        v11[1] = v17;
        pv_simd_quaternion_get_euler_angles(v11, 4, (uint64_t)v12);
        [a1 modifyAttributedStringByAdjustingShadow:v6 scale:*(double *)&v18 rotation:v13 + 3.14159265];
      }
    }
  }
}

+ (void)modifyAttributedStringByAdjustingOutline:(id)a3 attributes:(id)a4 range:(_NSRange)a5
{
}

+ (void)modifyAttributedStringByAdjustingForNegativeLineSpacing:(id)a3
{
}

+ (void)modifyAttributedStringByAdjustingShadow:(id)a3 scale:(double)a4 rotation:(double)a5
{
  id v7 = a3;
  if ([v7 length])
  {
    double v8 = [v7 string];
    char v9 = [v8 isEqualToString:@" "];

    if ((v9 & 1) == 0)
    {
      uint64_t v10 = *MEMORY[0x1E4F42560];
      id v11 = [v7 attribute:*MEMORY[0x1E4F42560] atIndex:0 effectiveRange:0];
      double v12 = v11;
      if (!v11)
      {
LABEL_26:

        goto LABEL_27;
      }
      double v37 = 0.0;
      double v38 = 0.0;
      double v35 = 0.0;
      double v36 = 0.0;
      double v13 = [v11 shadowColor];
      [v13 getRed:&v38 green:&v37 blue:&v36 alpha:&v35];
      double v35 = v35 * v35;
      double v14 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", v38, v37, v36);
      [v12 setShadowColor:v14];

      [v12 shadowBlurRadius];
      [v12 setShadowBlurRadius:v15 * 0.5];
      [v12 shadowBlurRadius];
      double v32 = fabs(a4);
      [v12 setShadowBlurRadius:v32 * v16];
      [v12 shadowOffset];
      float64_t v30 = v18;
      float64_t v31 = v17;
      long long v19 = [v7 attribute:@"TXTextDropShadowIsFixedSource" atIndex:0 effectiveRange:0];
      int v20 = [v19 BOOLValue];
      v21.f64[0] = v31;
      v21.f64[1] = v30;
      float64x2_t v33 = vmulq_n_f64(v21, v32);

      if (!v20)
      {
        v24.f64[0] = v33.f64[0];
        v24.f64[1] = -v33.f64[1];
LABEL_25:
        [v12 setShadowOffset:*(_OWORD *)&v24];
        uint64_t v29 = [v7 length];
        objc_msgSend(v7, "removeAttribute:range:", v10, 0, v29);
        objc_msgSend(v7, "addAttribute:value:range:", v10, v12, 0, v29);

        goto LABEL_26;
      }
      double v22 = -v33.f64[1];
      if (v33.f64[0] == 0.0)
      {
        double v23 = 4.71238898;
        if (v33.f64[1] <= 0.0) {
          double v23 = 0.0;
        }
        if (v33.f64[1] < 0.0) {
          double v23 = 1.57079633;
        }
      }
      else
      {
        double v23 = atan(-v33.f64[1] / v33.f64[0]);
        double v22 = v33.f64[0];
        if ((v33.f64[0] >= 0.0 || v33.f64[1] >= 0.0) && (v33.f64[0] >= 0.0 || v33.f64[1] <= 0.0))
        {
          if (v33.f64[1] > 0.0 && v33.f64[0] > 0.0) {
            double v23 = v23 + 6.28318531;
          }
        }
        else
        {
          double v23 = v23 + 3.14159265;
        }
        if (v33.f64[1] != 0.0)
        {
          double v26 = sqrt(v33.f64[1] * v33.f64[1] + vmulq_f64(v33, v33).f64[0]);
          goto LABEL_24;
        }
      }
      double v26 = fabs(v22);
LABEL_24:
      double v34 = v26;
      __double2 v28 = __sincos_stret(v23 - a5);
      v27.f64[0] = v28.__cosval;
      v27.f64[1] = v28.__sinval;
      float64x2_t v24 = vmulq_n_f64(v27, v34);
      goto LABEL_25;
    }
  }
LABEL_27:
}

+ (void)modifyAttributedStringByAdjustingOutline:(id)a3 attributes:(id)a4 range:(_NSRange)a5 scale:(double)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v19 = a3;
  id v10 = a4;
  if ([v19 length])
  {
    uint64_t v11 = *MEMORY[0x1E4F42578];
    double v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F42578]];
    if (v12)
    {
      double v13 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
      [v13 pointSize];
      double v15 = v14;
      if (v14 == 0.0)
      {
        objc_msgSend(v19, "removeAttribute:range:", v11, location, length);
      }
      else
      {
        double v16 = NSNumber;
        [v12 doubleValue];
        double v18 = [v16 numberWithDouble:fabs(a6) * (100.0 / v15 * v17)];
        objc_msgSend(v19, "removeAttribute:range:", v11, location, length);
        objc_msgSend(v19, "addAttribute:value:range:", v11, v18, location, length);
      }
    }
  }
}

+ (void)modifyAttributedStringByAdjustingKerning:(id)a3 attributes:(id)a4 range:(_NSRange)a5 scale:(double)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v17 = a3;
  id v10 = a4;
  if ([v17 length])
  {
    uint64_t v11 = *MEMORY[0x1E4F42520];
    double v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F42520]];
    double v13 = v12;
    if (v12)
    {
      double v14 = NSNumber;
      [v12 doubleValue];
      double v16 = [v14 numberWithDouble:fabs(a6) * v15];
      objc_msgSend(v17, "removeAttribute:range:", v11, location, length);
      objc_msgSend(v17, "addAttribute:value:range:", v11, v16, location, length);
    }
  }
}

+ (void)modifyAttributedStringByAdjustingForNegativeLineSpacing:(id)a3 scale:(double)a4
{
  id v37 = a3;
  if ([v37 length])
  {
    uint64_t v5 = *MEMORY[0x1E4F42540];
    id v6 = [v37 attribute:*MEMORY[0x1E4F42540] atIndex:0 effectiveRange:0];
    id v7 = v6;
    if (v6)
    {
      [v6 lineSpacing];
      if (v8 != 0.0)
      {
        uint64_t v9 = [v37 length];
        id v10 = (void *)[v7 mutableCopy];
        [v7 lineSpacing];
        double v11 = fabs(a4);
        [v10 setLineSpacing:v11 * v12];
        objc_msgSend(v37, "removeAttribute:range:", v5, 0, v9);
        objc_msgSend(v37, "addAttribute:value:range:", v5, v10, 0, v9);
        [v7 lineSpacing];
        if (v13 <= 0.0)
        {
          double v14 = [v37 string];
          double v15 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          double v16 = [v14 componentsSeparatedByCharactersInSet:v15];

          if ([v16 count])
          {
            double v36 = v10;
            double v35 = [v37 attribute:*MEMORY[0x1E4F42508] atIndex:0 effectiveRange:0];
            [v35 ascender];
            double v18 = v17;
            [v35 descender];
            double v20 = v19;
            [v35 leading];
            double v22 = v21;
            double v23 = [v16 objectAtIndexedSubscript:0];
            uint64_t v24 = [v23 length];

            unint64_t v25 = [v16 count];
            unint64_t v26 = v25 - 2;
            if (v25 >= 2)
            {
              uint64_t v27 = 0;
              double v28 = v18 - v20 + v22;
              uint64_t v29 = v24 + 1;
              unint64_t v30 = v25 - 1;
              do
              {
                float64_t v31 = [v16 objectAtIndexedSubscript:v27 + 1];
                double v32 = (void *)[v7 mutableCopy];
                [v32 setLineSpacing:0.0];
                [v7 lineSpacing];
                [v32 setMaximumLineHeight:v28 + v11 * v33];
                if (v26 == v27) {
                  uint64_t v34 = [v31 length];
                }
                else {
                  uint64_t v34 = [v31 length] + 1;
                }
                objc_msgSend(v37, "addAttribute:value:range:", v5, v32, v29, v34);
                v29 += v34;

                ++v27;
              }
              while (v30 != v27);
            }

            id v10 = v36;
          }
        }
      }
    }
  }
}

+ (void)modifyAttributedStringByAdjustingFont:(id)a3 toFitSize:(CGSize)a4
{
  double width = a4.width;
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v6 = *MEMORY[0x1E4F42508];
    double v23 = [v5 attribute:*MEMORY[0x1E4F42508] atIndex:0 effectiveRange:0];
    uint64_t v7 = [v5 length];
    uint64_t v8 = [v23 pointSize];
    double v10 = v9;
    char v11 = 0;
    unsigned int v12 = 0;
    double v13 = v9;
    double v14 = v9;
    do
    {
      double v15 = (void *)MEMORY[0x1BA9C0A20](v8);
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = *(void *)"";
      v24[2] = __75__PVEffect_TextUtilities__modifyAttributedStringByAdjustingFont_toFitSize___block_invoke;
      v24[3] = &unk_1E616A0B8;
      double v26 = v10;
      id v16 = v5;
      id v25 = v16;
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v24);
      [v16 size];
      if (v17 <= width)
      {
        double v20 = width - v17;
        if (v20 >= 0.05) {
          double v19 = (v10 + v13) * 0.5;
        }
        else {
          double v19 = v10;
        }
        if (v20 < 0.05)
        {
          int v18 = 1;
        }
        else
        {
          double v14 = v10;
          int v18 = 0;
        }
        if (v20 >= 0.05) {
          char v11 = 1;
        }
      }
      else
      {
        int v18 = 0;
        if (v11)
        {
          double v19 = (v10 + v14) * 0.5;
          char v11 = 1;
        }
        else
        {
          char v11 = 0;
          double v19 = v10 + -0.2;
        }
        double v13 = v10;
      }

      if (v12++ > 0x1D) {
        int v22 = 1;
      }
      else {
        int v22 = v18;
      }
      double v10 = v19;
    }
    while (v22 != 1);
  }
}

void __75__PVEffect_TextUtilities__modifyAttributedStringByAdjustingFont_toFitSize___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7)
  {
    id v10 = v7;
    uint64_t v8 = [v7 fontWithSize:*(double *)(a1 + 40)];
    uint64_t v9 = *MEMORY[0x1E4F42508];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4F42508], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v9, v8, a3, a4);

    id v7 = v10;
  }
}

+ (void)modifyAttributedStringByApplyingSubstituteFont:(id)a3 attributes:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  id v13 = a3;
  id v8 = a4;
  if ([v13 length])
  {
    uint64_t v9 = *MEMORY[0x1E4F42508];
    id v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F42508]];
    if (v10)
    {
      char v11 = [v8 objectForKeyedSubscript:@"TXSubstituteFont"];
      if (v11)
      {
        [v10 pointSize];
        unsigned int v12 = objc_msgSend(v11, "fontWithSize:");
        if (v12)
        {
          objc_msgSend(v13, "removeAttribute:range:", v9, location, length);
          objc_msgSend(v13, "addAttribute:value:range:", v9, v12, location, length);
        }
      }
    }
  }
}

+ (id)_effectRegistry
{
  double v2 = (void *)gRegistry;
  if (!gRegistry)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    BOOL v4 = (void *)gRegistry;
    gRegistrdouble y = (uint64_t)v3;

    double v2 = (void *)gRegistry;
  }

  return v2;
}

+ (void)ensureEffectsRegistered
{
  if ((gCalledDeferredRegistrations & 1) == 0)
  {
    double v2 = objc_opt_class();
    objc_sync_enter(v2);
    if ((gCalledDeferredRegistrations & 1) == 0)
    {
      if (gDeferredRegistrationClients)
      {
        id v8 = 0;
        uint64_t v9 = 0;
        uint64_t v10 = 0;
        std::vector<objc_class * {__strong}>::__init_with_size[abi:ne180100]<objc_class * {__strong}*,objc_class * {__strong}*>((char *)&v8, *(void ***)gDeferredRegistrationClients, *(void ***)(gDeferredRegistrationClients + 8), (uint64_t)(*(void *)(gDeferredRegistrationClients + 8) - *(void *)gDeferredRegistrationClients) >> 3);
        uint64_t v3 = gDeferredRegistrationClients;
        uint64_t v4 = *(void *)gDeferredRegistrationClients;
        for (uint64_t i = *(void *)(gDeferredRegistrationClients + 8); i != v4; i -= 8)
        {
          uint64_t v6 = *(void **)(i - 8);
        }
        *(void *)(v3 + 8) = v4;
        for (j = v8; j != v9; ++j)
          [*j runDeferredRegistration];
        char v11 = &v8;
        std::vector<objc_class * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v11);
      }
      gCalledDeferredRegistrations = 1;
    }
    objc_sync_exit(v2);
  }
}

+ (id)_effectRegistryForLookup
{
  [a1 ensureEffectsRegistered];

  return (id)[a1 _effectRegistry];
}

+ (void)deferEffectRegistrationForClass:(Class)a3
{
  Class v6 = a3;
  uint64_t v4 = objc_opt_class();
  objc_sync_enter(v4);
  if (gCalledDeferredRegistrations)
  {
    objc_sync_exit(v4);

    [(objc_class *)a3 runDeferredRegistration];
  }
  else
  {
    id v5 = (char **)gDeferredRegistrationClients;
    if (!gDeferredRegistrationClients)
    {
      id v5 = (char **)operator new(0x18uLL, MEMORY[0x1E4FBA2D0]);
      if (v5)
      {
        *id v5 = 0;
        v5[1] = 0;
        v5[2] = 0;
      }
      gDeferredRegistrationClients = (uint64_t)v5;
    }
    std::vector<objc_class * {__strong}>::push_back[abi:ne180100](v5, (id *)&v6);
    objc_sync_exit(v4);
  }
}

+ (void)registerEffectClass:(Class)a3 forEffectID:(id)a4 withProperties:(id)a5
{
  id v16 = a4;
  id v8 = a5;
  if (a3 && v16)
  {
    uint64_t v9 = [a1 _effectRegistry];
    uint64_t v10 = [v9 objectForKey:v16];

    if (v10)
    {
      char v11 = [v9 objectForKey:v16];
      ClassName = object_getClassName((id)[v11 effectClass]);
      id v13 = object_getClassName(a3);
      NSLog(&cfstr_PveffectWarnin_0.isa, v16, ClassName, v13);
    }
    double v14 = [[PVEffectRegistryEntry alloc] initWithClass:a3 andProperties:v8];
    [v9 setObject:v14 forKey:v16];
  }
  else
  {
    double v15 = object_getClassName(a3);
    NSLog(&cfstr_PveffectWarnin.isa, v16, v15);
  }
}

+ (id)newEffectWithID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _effectRegistryForLookup];
  Class v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "effectClass")), "initWithEffectID:", v4);
    [v7 _postInit:0];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)newEffectWithURL:(id)a3
{
  id v3 = +[PVMotionEffect newEffectWithURL:a3];
  [v3 _postInit:0];
  return v3;
}

+ (id)newEffectWithData:(id)a3
{
  id v3 = +[PVMotionEffect newEffectWithData:a3];
  [v3 _postInit:0];
  return v3;
}

+ (BOOL)effectIDIsRegistered:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _effectRegistryForLookup];
  Class v6 = [v5 objectForKey:v4];

  return v6 != 0;
}

+ (BOOL)effectIDIsNone:(id)a3
{
  id v3 = a3;
  if (+[PVEffect(PVEffectRegistry) effectIDIsNone:]::onceToken != -1) {
    dispatch_once(&+[PVEffect(PVEffectRegistry) effectIDIsNone:]::onceToken, &__block_literal_global_16);
  }
  char v4 = [(id)+[PVEffect(PVEffectRegistry) effectIDIsNone:]::noneEffectIDs containsObject:v3];

  return v4;
}

void __45__PVEffect_PVEffectRegistry__effectIDIsNone___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"737C8717-70E0-4CCE-8F19-17A0532E836F", @"4390FE7A-3408-4EB5-A049-AA394C03A911", @"67EB7544-E4A1-4508-9733-E201AADFBC15", 0);
  v1 = (void *)+[PVEffect(PVEffectRegistry) effectIDIsNone:]::noneEffectIDs;
  +[PVEffect(PVEffectRegistry) effectIDIsNone:]::noneEffectIDs = v0;
}

+ (id)_registryEntryForEffectID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _effectRegistryForLookup];
  Class v6 = [v5 objectForKey:v4];

  if (!v6) {
    NSLog(&cfstr_PveffectWarnin_1.isa, v4);
  }

  return v6;
}

+ (id)propertiesForEffect:(id)a3
{
  id v3 = [a1 _registryEntryForEffectID:a3];
  id v4 = [v3 effectProperties];

  return v4;
}

+ (id)allRegisteredEffectIDs
{
  double v2 = [a1 _effectRegistryForLookup];
  id v3 = [v2 allKeys];

  return v3;
}

+ (id)userVisibleEffectIDs
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v12 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = +[PVEffect allRegisteredEffectIDs];
  uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v15 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        Class v6 = +[PVEffect propertiesForEffect:v5];
        id v7 = [v6 objectForKey:@"FFEffectProperty_HiddenInUI"];
        int v8 = [v7 BOOLValue];

        uint64_t v9 = [v6 objectForKey:@"FFEffectProperty_AvailableInSimpleMode"];
        int v10 = [v9 BOOLValue];

        if (((v8 | v10 ^ 1) & 1) == 0) {
          [v12 addObject:v5];
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v2);
  }

  return v12;
}

+ (id)effectTypeForEffectID:(id)a3
{
  uint64_t v3 = [a1 propertiesForEffect:a3];
  id v4 = [v3 objectForKey:@"FFEffectProperty_EffectType"];

  return v4;
}

+ (id)registeredEffectIDsForEffectType:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  Class v6 = objc_msgSend(a1, "allRegisteredEffectIDs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        char v11 = [a1 effectTypeForEffectID:v10];
        int v12 = [v11 isEqualToString:v4];

        if (v12) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)registeredEffectIDsForEffectTypes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = objc_msgSend(a1, "registeredEffectIDsForEffectType:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
        [v5 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)firstRegisteredEffectIDContainingSubstring:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = +[PVEffect allRegisteredEffectIDs];
  id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v8 rangeOfString:v3] != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v5 = v8;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

+ (Class)classForEffectID:(id)a3
{
  id v3 = [a1 _registryEntryForEffectID:a3];
  id v4 = [v3 effectClass];

  return (Class)v4;
}

+ (id)registeredEffectIDsForClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = objc_msgSend(a1, "allRegisteredEffectIDs", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if ((Class)[a1 classForEffectID:v10] == a3) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v5;
}

+ (id)displayNameForEffectType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"effect.video.filter"])
  {
    id v4 = @"Effects";
  }
  else if ([v3 isEqualToString:@"effect.video.generator"])
  {
    id v4 = @"Generators";
  }
  else if ([v3 isEqualToString:@"effect.video.transition"])
  {
    id v4 = @"Transitions";
  }
  else if ([v3 isEqualToString:@"effect.video.compositor"])
  {
    id v4 = @"Composite Operations";
  }
  else if ([v3 isEqualToString:@"effect.video.multiplexor"])
  {
    id v4 = @"Multiplexor Operations";
  }
  else if ([v3 isEqualToString:@"effect.video.title"])
  {
    id v4 = @"Titles";
  }
  else if (([v3 isEqualToString:@"effect.audio.effect"] & 1) != 0 {
         || ([v3 isEqualToString:@"effect.audio.generator"] & 1) != 0
  }
         || ([v3 isEqualToString:@"effect.audio.transition"] & 1) != 0)
  {
    id v4 = @"Audio Effects";
  }
  else if ([v3 isEqualToString:@"effect.audio.offline-effect"])
  {
    id v4 = @"Audio Offline Effect";
  }
  else if ([v3 isEqualToString:@"effect.audio.music-instrument"])
  {
    id v4 = @"Audio Instrument";
  }
  else
  {
    id v4 = @"All Types";
  }

  return v4;
}

+ (id)displayNameForEffectID:(id)a3
{
  id v3 = [a1 propertiesForEffect:a3];
  id v4 = [v3 objectForKey:@"FFEffectProperty_DisplayName"];

  return v4;
}

+ (id)categoryForEffectID:(id)a3
{
  id v3 = [a1 propertiesForEffect:a3];
  id v4 = [v3 objectForKey:@"FFEffectProperty_Category"];

  return v4;
}

+ (id)themeForEffectID:(id)a3
{
  id v3 = [a1 propertiesForEffect:a3];
  id v4 = [v3 objectForKey:@"kFFEffectProperty_Theme"];

  return v4;
}

+ (id)descriptionForEffectID:(id)a3
{
  id v3 = [a1 propertiesForEffect:a3];
  id v4 = [v3 objectForKey:@"FFEffectProperty_Description"];

  return v4;
}

+ (BOOL)isVideoForEffectID:(id)a3
{
  id v3 = +[PVEffect effectTypeForEffectID:a3];
  if (([v3 isEqualToString:@"effect.video.filter"] & 1) != 0
    || ([v3 isEqualToString:@"effect.video.generator"] & 1) != 0
    || ([v3 isEqualToString:@"effect.video.transition"] & 1) != 0
    || ([v3 isEqualToString:@"effect.video.title"] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:@"effect.video.compositor"];
  }

  return v4;
}

+ (id)defaultVideoTransitionEffectID
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 stringForKey:@"FFDefaultVideoTransition"];

  if (!v3)
  {
    char v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v4 setObject:@"FxPlug:4731E73A-8DAC-4113-9A30-AE85B1761265" forKey:@"FFDefaultVideoTransition"];

    id v3 = @"FxPlug:4731E73A-8DAC-4113-9A30-AE85B1761265";
  }

  return v3;
}

+ (id)_registeredEffectClasses
{
  uint64_t v2 = (void *)+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered;
  if (!+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered)
  {
    uint64_t v3 = objc_opt_new();
    char v4 = (void *)+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered;
    +[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered = v3;

    uint64_t v2 = (void *)+[PVEffect(RuntimeBundleLoading) _registeredEffectClasses]::sRegistered;
  }

  return v2;
}

+ (void)_registerEffectsInBundle:(id)a3 atPath:(id)a4
{
  id v9 = a3;
  id v5 = (void *)[v9 principalClass];
  if ([v5 isSubclassOfClass:objc_opt_class()])
  {
    uint64_t v6 = [a1 _registeredEffectClasses];
    char v7 = [v6 containsObject:v5];

    if ((v7 & 1) == 0)
    {
      [v5 registerEffects];
      uint64_t v8 = [a1 _registeredEffectClasses];
      [v8 addObject:v5];
    }
  }
}

+ (void)initEffectRegistry
{
}

+ (void)initEffectRegistryWithHostDelegate:(id)a3
{
  id v4 = a3;
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = *(void *)"";
    v7[2] = __69__PVEffect_RuntimeBundleLoading__initEffectRegistryWithHostDelegate___block_invoke;
    v7[3] = &unk_1E61689B0;
    id v8 = v4;
    uint64_t v6 = (void (**)(void))MEMORY[0x1BA9C0C60](v7);
    v6[2]();
  }
}

void __69__PVEffect_RuntimeBundleLoading__initEffectRegistryWithHostDelegate___block_invoke(uint64_t a1)
{
  id v4 = +[PVHostApplicationDelegateHandler sharedInstance];
  [v4 setHostApplicationDelegate:*(void *)(a1 + 32)];
  +[PVEffect _registerBuiltInEffects];
  +[PVHeliumEffect registerEffects];
  +[PVMotionEffect registerEffects];
  +[PVCompositeDelegateEffect registerEffects];
  uint64_t v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = self;
  [v2 addObserver:v3 selector:sel_willTerminate_ name:*MEMORY[0x1E4F43718] object:0];
}

+ (void)willTerminate:(id)a3
{
  self;
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == a1)
  {
    +[PVEffect handleApplicationWillTerminate];
    +[PVMotionEffect handleApplicationWillTerminate];
  }
}

+ (void)clearPreviewStats
{
  if ((id)objc_opt_class() == a1)
  {
    +[PVMotionEffect clearPreviewStats];
  }
}

+ (void)noteApplicationWillTerminate
{
}

+ (void)cleanupEffectsCache
{
}

+ (void)setInteractiveMode:(BOOL)a3
{
}

+ (BOOL)isInteractiveMode
{
  return +[PVEffectResources isInteractiveMode];
}

+ (void)noteApplicationDidReceiveMemoryWarning
{
}

- (BOOL)isTranscription
{
  return 0;
}

- (BOOL)transcriptionHitTest:(CGPoint)a3 time:(id *)a4
{
  return 0;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)transcriptionDuration
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1FA48];
  return self;
}

@end