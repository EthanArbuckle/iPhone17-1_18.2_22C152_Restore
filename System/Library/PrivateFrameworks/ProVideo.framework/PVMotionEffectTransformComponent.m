@interface PVMotionEffectTransformComponent
- (BOOL)addCameraToDocumentOnce_NoLock:(const void *)a3;
- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7;
- (BOOL)disableCameraOverride_NoLock:(const void *)a3;
- (BOOL)enableCameraOverride_NoLock:(const void *)a3 transform:(id)a4 projection:(id)a5 transformUnitsAreInMeters:(BOOL)a6;
- (BOOL)encloseTopGroupIn3DGroupOnce_NoLock:(const void *)a3;
- (BOOL)isCameraOverrideEnabled;
- (BOOL)isForceRenderAtPosterFrameEnabledInDictionary:(id)a3 orInDefaultDictionary:(id)a4;
- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6;
- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6;
- (BOOL)setCameraProjection_NoLock:(const void *)a3 transform:(id)a4;
- (BOOL)setCameraTransform_NoLock:(const void *)a3 transform:(id)a4 transformUnitsAreInMeters:(BOOL)a5;
- (BOOL)setTransform_NoLock:(const void *)a3 transform:(id)a4 transformUnitsAreInMeters:(BOOL)a5;
- (BOOL)transformUnitsAreInMeters;
- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:;
- (CGPoint)convertPointToView_NoLock:(const void *)a3 effectPoint:(id *)a4 atTime:(BOOL)a5 forcePosterFrame:(BOOL)a6 includeTransformAnimation:(BOOL)a7 includePlayableAspectScale:(CGSize)a8 viewSize:(int)a9 viewOrigin:(id)a10 properties:;
- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8;
- (PVCGPointQuad)cornersAtTime_NoLock:(SEL)a3 time:(const void *)a4 forcePosterFrame:(id *)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9 properties:(int)a10;
- (PVCGPointQuad)objectCorners_NoLock:(SEL)a3 timelineTime:(unsigned int)a4 componentTime:(id *)a5 includeDropShadow:(id *)a6 includeMasks:(BOOL)a7 documentInfo:(BOOL)a8;
- (PVCGPointQuad)transformObjectCornersToImage_NoLock:(SEL)a3 objectID:(PVCGPointQuad *)a4 timelineTime:(unsigned int)a5 componentTime:(id *)a6 flatten:(id *)a7 documentInfo:(BOOL)a8 properties:(const void *)a9;
- (PVMotionEffectTransformComponent)initWithMotionEffect:(id)a3;
- (__n128)convertPointFromView_NoLock:(long long *)a3@<X3> viewPoint:(int)a4@<W4> atTime:(void *)a5@<X5> viewSize:(float64x2_t *)a6@<X8> viewOrigin:(double)a7@<D0> properties:(float64_t)a8@<D1>;
- (__n128)getScale;
- (double)convertPointToView:(double)a3 withEffectToViewTransform:(uint64_t)a4 viewSize:(long long *)a5;
- (float64_t)convertPointToView_NoLock:(uint64_t)a3 effectPoint:(float64x2_t *)a4 withEffectToViewTransform:(float64x2_t *)a5 viewSize:;
- (id)addToTopLevelTransform:(double)a3 atTime:(uint64_t)a4 forcePosterFrame:(long long *)a5 restrictToBounds:(long long *)a6 viewSize:(char)a7 viewOrigin:(char)a8;
- (id)addToTopLevelTransform_NoLock:(double)a3 transform:(uint64_t)a4 atTime:(uint64_t)a5 forcePosterFrame:(uint64_t)a6 restrictToBounds:(long long *)a7 viewSize:(uint64_t)a8 viewOrigin:(unsigned int)a9 properties:(uint64_t)a10;
- (id)additionalTopLevelScaleInDictionary:(id)a3 orInDefaultDictionary:(id)a4;
- (id)applyAdditionalTopLevelScale:(CGPoint)a3 aroundPoint:(CGPoint)a4 toTransform:(id)a5;
- (id)cameraProjection;
- (id)cameraTransform;
- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3;
- (id)objectToImageTransform_NoLock:(unsigned int)a3 timelineTime:(id *)a4 componentTime:(id *)a5 flatten:(BOOL)a6 includeTransformAnimation:(BOOL)a7 includePlayableAspectScale:(BOOL)a8 documentInfo:(const void *)a9 properties:(id)a10;
- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8;
- (id)scaleToFit_NoLock:(const void *)a3 rect:(CGRect)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8 restrictToBounds:(BOOL)a9 properties:(id)a10;
- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7;
- (id)setPositionInView_NoLock:(const void *)a3 viewPoint:(CGPoint)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8 restrictToBounds:(BOOL)a9 topLevelTransform:(id)a10 properties:(id)a11;
- (id)topLevelGroupTransform;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7;
- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6;
- (id)transformObjectPointsToImage_NoLock:(id)a3 objectID:(unsigned int)a4 timelineTime:(id *)a5 componentTime:(id *)a6 flatten:(BOOL)a7 documentInfo:(const void *)a8 properties:(id)a9;
- (int)objectBounds_NoLock:(void *)a3 objectID:(unsigned int)a4 timelineTime:(id *)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7 documentInfo:(const void *)a8;
- (void)applyTopLevelGroupTransform_NoLock:(const void *)a3 transform:(id)a4;
- (void)applyTransforms_NoLock:(const void *)a3 dirtyProperties:(id)a4 defaultProperties:(id)a5 componentTime:(id *)a6;
- (void)convertPointFromView:(int)a3@<W3> atTime:(_OWORD *)a4@<X8> viewSize:(double)a5@<D0> viewOrigin:(double)a6@<D1>;
- (void)disableCameraOverride;
- (void)enableCameraOverride:(id)a3 projection:(id)a4;
- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5;
- (void)motionEffect:(id)a3 willRender:(const void *)a4 properties:(id)a5 time:(id *)a6;
- (void)motionEffectDidUnload:(id)a3;
- (void)setTopLevelGroupTransform:(id)a3;
- (void)setTransform:(id)a3;
- (void)setTransformUnitsAreInMeters:(BOOL)a3;
- (void)updateIsFixedSourceDropShadow_NoLock:(const void *)a3 properties:(id)a4;
@end

@implementation PVMotionEffectTransformComponent

- (PVMotionEffectTransformComponent)initWithMotionEffect:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PVMotionEffectTransformComponent;
  result = [(PVMotionEffectComponent *)&v4 initWithMotionEffect:a3];
  if (result)
  {
    result->_top3DGroupID = 0;
    result->_top3DGroupIDStatus = 1;
    result->_cameraID = 0;
    result->_cameraIDStatus = 1;
    result->_metersToWorldUnitScale = 1.0;
    result->_isFixedSourceDropShadow = 0;
    result->_normalizedFixedShadowSize = (CGSize)*MEMORY[0x1E4F1DB30];
  }
  return result;
}

- (BOOL)encloseTopGroupIn3DGroupOnce_NoLock:(const void *)a3
{
  v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  int top3DGroupIDStatus = self->_top3DGroupIDStatus;
  if (top3DGroupIDStatus)
  {
    if (top3DGroupIDStatus != 1) {
      return 0;
    }
    if (*((_DWORD *)a3 + 41)) {
      return 0;
    }
    unsigned int v12 = 0;
    v8 = *(OZDocument ***)a3;
    v11.var0 = 0;
    PCString::set(&v11, @"PVEffect Top 3D Group");
    self->_int top3DGroupIDStatus = OZXCreateGroupWithGroup(v8, (int)&v11, *((_DWORD *)a3 + 40), 1u, &v12);
    PCString::~PCString(&v11);
    if (self->_top3DGroupIDStatus) {
      return 0;
    }
    self->_top3DGroupID = v12;
    v10 = [(PVMotionEffectComponent *)self motionEffect];
    [v10 setNodeIDToCache:self->_top3DGroupID];
  }
  return 1;
}

- (BOOL)addCameraToDocumentOnce_NoLock:(const void *)a3
{
  v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  int cameraIDStatus = self->_cameraIDStatus;
  if (!cameraIDStatus) {
    return 1;
  }
  if (cameraIDStatus != 1) {
    return 0;
  }
  unsigned int v13 = 0;
  v8 = *(OZChannelBase **)a3;
  v12.var0 = 0;
  PCString::set(&v12, @"PVEffect Camera");
  v9.var0 = (__CFString *)&v12;
  self->_int cameraIDStatus = OZXCreateCamera(v8, v9, &v13);
  PCString::~PCString(&v12);
  int v10 = self->_cameraIDStatus;
  BOOL result = v10 == 0;
  if (!v10) {
    self->_cameraID = v13;
  }
  return result;
}

- (void)applyTransforms_NoLock:(const void *)a3 dirtyProperties:(id)a4 defaultProperties:(id)a5 componentTime:(id *)a6
{
  id v10 = a4;
  id v11 = a5;
  PCString v12 = [(PVMotionEffectComponent *)self motionEffect];
  [v12 assertDocumentIsLocked];

  unsigned int v13 = [(PVMotionEffectComponent *)self motionEffect];
  [v13 assertDocumentStatusIsLoadedOrReady];

  v14 = [(PVMotionEffectComponent *)self motionEffect];
  [v14 assertInspectablePropertiesAreLocked];

  if (a6->var2)
  {
    v15 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVTopLevelTransformKey" inDictionary:v10 orInDefaultDictionary:v11];
    v45 = [(PVMotionEffectTransformComponent *)self additionalTopLevelScaleInDictionary:v10 orInDefaultDictionary:v11];
    if (v45)
    {
      v43 = v15;
      BOOL v16 = [(PVMotionEffectTransformComponent *)self isForceRenderAtPosterFrameEnabledInDictionary:v10 orInDefaultDictionary:v11];
      long long v51 = 0uLL;
      uint64_t v52 = 0;
      v17 = [(PVMotionEffectComponent *)self motionEffect];
      v18 = [v17 timelineComponent];
      v19 = v18;
      long long v49 = *(_OWORD *)&a6->var0;
      int64_t var3 = a6->var3;
      if (v18)
      {
        v20 = v45;
        objc_msgSend(v18, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v49, v16, a3);
      }
      else
      {
        long long v51 = 0uLL;
        uint64_t v52 = 0;
        v20 = v45;
      }

      v48.origin.CGFloat x = 0.0;
      v48.origin.CGFloat y = 0.0;
      __asm { FMOV            V0.2D, #-1.0 }
      v48.CGSize size = _Q0;
      uint64_t v26 = *((unsigned int *)a3 + 40);
      long long v46 = v51;
      uint64_t v47 = v52;
      v15 = v43;
      if (![(PVMotionEffectTransformComponent *)self objectBounds_NoLock:&v48 objectID:v26 timelineTime:&v46 includeDropShadow:1 includeMasks:1 documentInfo:a3])
      {
        [v20 CGPointValue];
        double v28 = v27;
        double v30 = v29;
        CGFloat x = v48.origin.x;
        CGFloat y = v48.origin.y;
        CGSize size = v48.size;
        double MidX = CGRectGetMidX(v48);
        v53.origin.CGFloat x = x;
        v53.origin.CGFloat y = y;
        v53.CGSize size = size;
        uint64_t v35 = -[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:](self, "applyAdditionalTopLevelScale:aroundPoint:toTransform:", v43, v28, v30, MidX, CGRectGetMidY(v53));

        v15 = (void *)v35;
      }
    }
    [(PVMotionEffectTransformComponent *)self applyTopLevelGroupTransform_NoLock:a3 transform:v15];
    v36 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVTransformKey" inDictionary:v10 orInDefaultDictionary:v11];
    v37 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVTransformUnitsAreInMeters" inDictionary:v10 orInDefaultDictionary:v11];
    uint64_t v38 = [v37 BOOLValue];
    v39 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVCameraEnabledKey" inDictionary:v10 orInDefaultDictionary:v11];
    if ([v39 BOOLValue])
    {
      v44 = v15;
      v40 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVCameraProjectionKey" inDictionary:v10 orInDefaultDictionary:v11];
      uint64_t v41 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVCameraTransformKey" inDictionary:v10 orInDefaultDictionary:v11];
      v42 = (void *)v41;
      if (v40 && v41) {
        [(PVMotionEffectTransformComponent *)self enableCameraOverride_NoLock:a3 transform:v41 projection:v40 transformUnitsAreInMeters:v38];
      }
      else {
        [(PVMotionEffectTransformComponent *)self disableCameraOverride_NoLock:a3];
      }

      v15 = v44;
    }
    else
    {
      [(PVMotionEffectTransformComponent *)self disableCameraOverride_NoLock:a3];
    }
    [(PVMotionEffectTransformComponent *)self setTransform_NoLock:a3 transform:v36 transformUnitsAreInMeters:v38];
  }
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a3;
  v6 = -[PVMotionEffectTransformComponent transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:](self, "transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &v8, a4, 1, *(void *)&a6, a5.width, a5.height);

  return v6;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  uint64_t v28 = 0;
  double v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  id v33 = 0;
  if (a4)
  {
    char v13 = 1;
  }
  else
  {
    v14 = [(PVMotionEffectComponent *)self motionEffect];
    v15 = [v14 timelineComponent];
    char v13 = [v15 isForceRenderAtPosterFrameEnabled];
  }
  BOOL v16 = +[PVHostApplicationDelegateHandler sharedInstance];
  char v17 = [v16 wantsToIncludeCoordinateSystemTranslationInEffectViewTransform];
  v18 = [(PVMotionEffectComponent *)self motionEffect];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = *(void *)"";
  v21[2] = __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke;
  v21[3] = &unk_1E6168A78;
  v21[4] = self;
  v21[5] = &v28;
  long long v22 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  char v25 = v13;
  BOOL v26 = a5;
  char v27 = v17;
  *(CGFloat *)&v21[6] = width;
  *(CGFloat *)&v21[7] = height;
  int v24 = a7;
  [v18 runEnsuringDocumentReadyAndLockingDocument:v21];

  id v19 = (id)v29[5];
  _Block_object_dispose(&v28, 8);

  return v19;
}

void __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 32) motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v10 = v5;
  long long v11 = v6;
  v7[2] = __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke_2;
  v7[3] = &unk_1E6168A50;
  uint64_t v9 = a2;
  uint64_t v12 = *(void *)(a1 + 80);
  char v14 = *(unsigned char *)(a1 + 92);
  __int16 v15 = *(_WORD *)(a1 + 93);
  int v13 = *(_DWORD *)(a1 + 88);
  [v4 runWithInspectableProperties:v7];
}

void __115__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 88);
  LODWORD(v9) = *(_DWORD *)(a1 + 96);
  uint64_t v6 = objc_msgSend(v4, "transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:", v5, &v10, *(unsigned __int8 *)(a1 + 100), *(unsigned __int8 *)(a1 + 101), 1, *(unsigned __int8 *)(a1 + 102), *(double *)(a1 + 56), *(double *)(a1 + 64), v9, v3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)transformAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8
{
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__0;
  uint64_t v35 = __Block_byref_object_dispose__0;
  id v36 = 0;
  if (a4)
  {
    char v15 = 1;
  }
  else
  {
    BOOL v16 = [(PVMotionEffectComponent *)self motionEffect];
    char v17 = [v16 timelineComponent];
    char v15 = [v17 isForceRenderAtPosterFrameEnabled];
  }
  v18 = +[PVHostApplicationDelegateHandler sharedInstance];
  char v19 = [v18 wantsToIncludeCoordinateSystemTranslationInEffectViewTransform];
  v20 = [(PVMotionEffectComponent *)self motionEffect];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = *(void *)"";
  v23[2] = __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke;
  v23[3] = &unk_1E6168AC8;
  v23[4] = self;
  v23[5] = &v31;
  long long v24 = *(_OWORD *)&a3->var0;
  int64_t var3 = a3->var3;
  char v27 = v15;
  BOOL v28 = a5;
  BOOL v29 = a6;
  char v30 = v19;
  *(CGFloat *)&v23[6] = width;
  *(CGFloat *)&v23[7] = height;
  int v26 = a8;
  [v20 runEnsuringDocumentReadyAndLockingDocument:v23];

  id v21 = (id)v32[5];
  _Block_object_dispose(&v31, 8);

  return v21;
}

void __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 32) motionEffect];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v9 = *(_OWORD *)(a1 + 32);
  long long v12 = *(_OWORD *)(a1 + 64);
  v8[2] = __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2;
  v8[3] = &unk_1E6168AA0;
  uint64_t v10 = a2;
  uint64_t v13 = *(void *)(a1 + 80);
  int v7 = *(_DWORD *)(a1 + 88);
  int v6 = *(_DWORD *)(a1 + 92);
  long long v11 = v5;
  int v14 = v7;
  int v15 = v6;
  [v4 runWithInspectableProperties:v8];
}

void __142__PVMotionEffectTransformComponent_transformAtTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 88);
  LODWORD(v9) = *(_DWORD *)(a1 + 96);
  uint64_t v6 = objc_msgSend(v4, "transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:", v5, &v10, *(unsigned __int8 *)(a1 + 100), *(unsigned __int8 *)(a1 + 101), *(unsigned __int8 *)(a1 + 102), *(unsigned __int8 *)(a1 + 103), *(double *)(a1 + 56), *(double *)(a1 + 64), v9, v3);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)addToTopLevelTransform:(double)a3 atTime:(uint64_t)a4 forcePosterFrame:(long long *)a5 restrictToBounds:(long long *)a6 viewSize:(char)a7 viewOrigin:(char)a8
{
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__0;
  long long v46 = __Block_byref_object_dispose__0;
  id v47 = 0;
  char v17 = [a1 motionEffect];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = *(void *)"";
  v24[2] = __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke;
  v24[3] = &unk_1E6168B18;
  uint64_t v33 = a1;
  v34 = &v42;
  long long v18 = a5[5];
  long long v29 = a5[4];
  long long v30 = v18;
  long long v19 = a5[7];
  long long v31 = a5[6];
  long long v32 = v19;
  long long v20 = a5[1];
  long long v25 = *a5;
  long long v26 = v20;
  long long v21 = a5[3];
  long long v27 = a5[2];
  long long v28 = v21;
  uint64_t v38 = *((void *)a6 + 2);
  long long v37 = *a6;
  char v40 = a7;
  char v41 = a8;
  double v35 = a2;
  double v36 = a3;
  int v39 = a9;
  [v17 runEnsuringDocumentReadyAndLockingDocument:v24];

  id v22 = (id)v43[5];
  _Block_object_dispose(&v42, 8);

  return v22;
}

void __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 160) motionEffect];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  long long v6 = *(_OWORD *)(a1 + 160);
  long long v5 = *(_OWORD *)(a1 + 176);
  long long v7 = *(_OWORD *)(a1 + 112);
  long long v17 = *(_OWORD *)(a1 + 96);
  long long v18 = v7;
  long long v8 = *(_OWORD *)(a1 + 144);
  long long v19 = *(_OWORD *)(a1 + 128);
  long long v20 = v8;
  long long v21 = v6;
  long long v9 = *(_OWORD *)(a1 + 48);
  long long v13 = *(_OWORD *)(a1 + 32);
  long long v14 = v9;
  long long v10 = *(_OWORD *)(a1 + 80);
  long long v15 = *(_OWORD *)(a1 + 64);
  long long v16 = v10;
  long long v24 = *(_OWORD *)(a1 + 192);
  v12[2] = __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke_2;
  v12[3] = &unk_1E6168AF0;
  uint64_t v11 = *(void *)(a1 + 208);
  uint64_t v22 = a2;
  uint64_t v25 = v11;
  __int16 v27 = *(_WORD *)(a1 + 220);
  long long v23 = v5;
  int v26 = *(_DWORD *)(a1 + 216);
  [v4 runWithInspectableProperties:v12];
}

void __120__PVMotionEffectTransformComponent_addToTopLevelTransform_atTime_forcePosterFrame_restrictToBounds_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 160);
  uint64_t v5 = *(void *)(a1 + 176);
  long long v6 = *(_OWORD *)(a1 + 112);
  v15[4] = *(_OWORD *)(a1 + 96);
  v15[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 144);
  v15[6] = *(_OWORD *)(a1 + 128);
  v15[7] = v7;
  long long v8 = *(_OWORD *)(a1 + 48);
  v15[0] = *(_OWORD *)(a1 + 32);
  v15[1] = v8;
  long long v9 = *(_OWORD *)(a1 + 80);
  v15[2] = *(_OWORD *)(a1 + 64);
  v15[3] = v9;
  uint64_t v14 = *(void *)(a1 + 216);
  long long v13 = *(_OWORD *)(a1 + 200);
  uint64_t v10 = objc_msgSend(v4, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", v5, v15, &v13, *(unsigned __int8 *)(a1 + 228), *(unsigned __int8 *)(a1 + 229), *(unsigned int *)(a1 + 224), *(double *)(a1 + 184), *(double *)(a1 + 192), v3);
  uint64_t v11 = *(void *)(*(void *)(a1 + 168) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)addToTopLevelTransform_NoLock:(double)a3 transform:(uint64_t)a4 atTime:(uint64_t)a5 forcePosterFrame:(uint64_t)a6 restrictToBounds:(long long *)a7 viewSize:(uint64_t)a8 viewOrigin:(unsigned int)a9 properties:(uint64_t)a10
{
  id v55 = a11;
  v56 = [a1 motionEffect];
  [v56 assertDocumentIsLocked];

  v57 = [a1 motionEffect];
  [v57 assertDocumentStatusIsLoadedOrReady];

  v58 = [a1 motionEffect];
  [v58 assertInspectablePropertiesAreLocked];
  unsigned int v95 = a9;

  v59 = [v55 objectForKeyedSubscript:@"kPVTopLevelTransformKey"];
  if (v59)
  {
    *(_OWORD *)&STACK[0x730] = 0u;
    *(_OWORD *)&STACK[0x740] = 0u;
    *(_OWORD *)&STACK[0x710] = 0u;
    *(_OWORD *)&STACK[0x720] = 0u;
    *(_OWORD *)&STACK[0x6F0] = 0u;
    *(_OWORD *)&STACK[0x700] = 0u;
    *(_OWORD *)&STACK[0x6D0] = 0u;
    *(_OWORD *)&STACK[0x6E0] = 0u;
LABEL_4:
    [v59 SIMDDouble4x4];
    goto LABEL_5;
  }
  v59 = +[PVMatrix44Double matrix];
  *(_OWORD *)&STACK[0x730] = 0u;
  *(_OWORD *)&STACK[0x740] = 0u;
  *(_OWORD *)&STACK[0x710] = 0u;
  *(_OWORD *)&STACK[0x720] = 0u;
  *(_OWORD *)&STACK[0x6F0] = 0u;
  *(_OWORD *)&STACK[0x700] = 0u;
  *(_OWORD *)&STACK[0x6D0] = 0u;
  *(_OWORD *)&STACK[0x6E0] = 0u;
  if (v59) {
    goto LABEL_4;
  }
LABEL_5:
  long long v60 = *a7;
  STACK[0x6C0] = *((void *)a7 + 2);
  STACK[0x698] = 0;
  STACK[0x690] = 0;
  *(_OWORD *)&STACK[0x6A0] = 0u;
  *(_OWORD *)&STACK[0x6B0] = v60;
  LODWORD(v92) = a10;
  objc_msgSend(a1, "convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:", a5, &STACK[0x690], &STACK[0x6B0], a8, 1, 1, a2, a3, v92);
  long long vars0 = v62;
  float64_t v98 = v61;
  *(_OWORD *)&STACK[0x670] = 0u;
  *(_OWORD *)&STACK[0x680] = 0u;
  a46 = 0u;
  *(_OWORD *)&STACK[0x660] = 0u;
  a43 = *a7;
  a44 = *((void *)a7 + 2);
  objc_msgSend(a1, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a5, &a43, a8, 1, a10, v55, 1.0, 1.0, a2, a3);
  long long v63 = *(_OWORD *)&STACK[0x660];
  a39 = a46;
  a40 = v63;
  long long v64 = *(_OWORD *)&STACK[0x680];
  a41 = *(_OWORD *)&STACK[0x670];
  a42 = v64;
  double quad_center = pv_CGPoint_get_quad_center((PVCGPointQuad *)&a39);
  float64_t v93 = v66;
  float64_t v94 = quad_center;
  uint64_t v67 = 0;
  v68.f64[0] = v98;
  *(void *)&v68.f64[1] = vars0;
  float64x2_t v99 = v68;
  long long v69 = *(_OWORD *)(a6 + 48);
  *(_OWORD *)&STACK[0x770] = *(_OWORD *)(a6 + 32);
  *(_OWORD *)&STACK[0x780] = v69;
  long long v70 = *(_OWORD *)(a6 + 80);
  *(_OWORD *)&STACK[0x790] = *(_OWORD *)(a6 + 64);
  *(_OWORD *)&STACK[0x7A0] = v70;
  long long v71 = *(_OWORD *)(a6 + 16);
  *(_OWORD *)&STACK[0x750] = *(_OWORD *)a6;
  *(_OWORD *)&STACK[0x760] = v71;
  *(void *)&long long v72 = 0;
  *((void *)&v72 + 1) = *(void *)(a6 + 120);
  a37 = 0u;
  a38 = 0u;
  a35 = 0u;
  a36 = 0u;
  a33 = 0u;
  a34 = 0u;
  a31 = 0u;
  a32 = 0u;
  float64x2_t v74 = *(float64x2_t *)&STACK[0x6D0];
  float64x2_t v73 = *(float64x2_t *)&STACK[0x6E0];
  float64x2_t v76 = *(float64x2_t *)&STACK[0x6F0];
  float64x2_t v75 = *(float64x2_t *)&STACK[0x700];
  float64x2_t v78 = *(float64x2_t *)&STACK[0x710];
  float64x2_t v77 = *(float64x2_t *)&STACK[0x720];
  float64x2_t v80 = *(float64x2_t *)&STACK[0x730];
  float64x2_t v79 = *(float64x2_t *)&STACK[0x740];
  STACK[0x7B8] = 0;
  STACK[0x7B0] = 0;
  *(_OWORD *)&STACK[0x7C0] = v72;
  do
  {
    float64x2_t v82 = *(float64x2_t *)((char *)&STACK[0x750] + v67);
    float64x2_t v81 = *(float64x2_t *)((char *)&STACK[0x750] + v67 + 16);
    v83 = (float64x2_t *)((char *)&a31 + v67);
    float64x2_t *v83 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v74, v82.f64[0]), v76, v82, 1), v78, v81.f64[0]), v80, v81, 1);
    v83[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v73, v82.f64[0]), v75, v82, 1), v77, v81.f64[0]), v79, v81, 1);
    v67 += 32;
  }
  while (v67 != 128);
  a27 = a35;
  a28 = a36;
  a29 = a37;
  a30 = a38;
  a23 = a31;
  a24 = a32;
  a25 = a33;
  a26 = a34;
  v84 = +[PVMatrix44Double matrixWithSIMDDouble4x4:&a23];

  objc_msgSend(a1, "applyTopLevelGroupTransform_NoLock:transform:", a5, v84);
  [v55 setObject:v84 forKeyedSubscript:@"kPVTopLevelTransformKey"];
  float64x2_t vars0a = *(float64x2_t *)(a6 + 96);
  *(_OWORD *)&STACK[0x770] = 0u;
  *(_OWORD *)&STACK[0x780] = 0u;
  *(_OWORD *)&STACK[0x750] = 0u;
  *(_OWORD *)&STACK[0x760] = 0u;
  a20 = *a7;
  a21 = *((void *)a7 + 2);
  objc_msgSend(a1, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a5, &a20, a8, 1, a10, v55, 1.0, 1.0, a2, a3);
  long long v85 = *(_OWORD *)&STACK[0x760];
  a16 = *(_OWORD *)&STACK[0x750];
  a17 = v85;
  long long v86 = *(_OWORD *)&STACK[0x780];
  a18 = *(_OWORD *)&STACK[0x770];
  a19 = v86;
  v87.f64[0] = pv_CGPoint_get_quad_center((PVCGPointQuad *)&a16);
  v88.f64[0] = v94;
  v88.f64[1] = v93;
  v87.f64[1] = v89;
  a13 = *a7;
  a14 = *((void *)a7 + 2);
  v90 = objc_msgSend(a1, "setPositionInView_NoLock:viewPoint:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:topLevelTransform:properties:", a5, &a13, a8, a10, v95, v84, vaddq_f64(vars0a, vsubq_f64(v99, vsubq_f64(v87, v88))), a2, a3);

  return v90;
}

- (CGPoint)convertPointToView:(id *)a3 atTime:(BOOL)a4 forcePosterFrame:(BOOL)a5 includeTransformAnimation:(BOOL)a6 includePlayableAspectScale:(CGSize)a7 viewSize:(int)a8 viewOrigin:
{
  int v9 = v8;
  char v10 = a8;
  uint64_t v13 = a4;
  CGFloat height = a7.height;
  CGFloat width = a7.width;
  long long v22 = *(_OWORD *)&a3->var0;
  long long v23 = *(_OWORD *)&a3->var3;
  uint64_t v37 = 0;
  uint64_t v38 = (double *)&v37;
  uint64_t v39 = 0x4012000000;
  char v40 = __Block_byref_object_copy__76;
  char v41 = __Block_byref_object_dispose__77;
  uint64_t v42 = &unk_1B876C866;
  long long v17 = [(PVMotionEffectComponent *)self motionEffect];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = *(void *)"";
  v24[2] = __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke;
  v24[3] = &unk_1E6168B68;
  __int16 v27 = self;
  long long v28 = &v37;
  long long v25 = v22;
  long long v26 = v23;
  long long v31 = *(_OWORD *)v13;
  uint64_t v32 = *(void *)(v13 + 16);
  BOOL v34 = a5;
  BOOL v35 = a6;
  char v36 = v10;
  CGFloat v29 = width;
  CGFloat v30 = height;
  int v33 = v9;
  [v17 runEnsuringDocumentReadyAndLockingDocument:v24];

  double v18 = v38[6];
  double v19 = v38[7];
  _Block_object_dispose(&v37, 8);
  double v20 = v18;
  double v21 = v19;
  result.CGFloat y = v21;
  result.CGFloat x = v20;
  return result;
}

void __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_super v4 = [*(id *)(a1 + 64) motionEffect];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2;
  v8[3] = &unk_1E6168B40;
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v5 = *(_OWORD *)(a1 + 80);
  uint64_t v12 = a2;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 48);
  long long v11 = v6;
  long long v9 = v7;
  long long v14 = *(_OWORD *)(a1 + 96);
  uint64_t v15 = *(void *)(a1 + 112);
  __int16 v17 = *(_WORD *)(a1 + 124);
  char v18 = *(unsigned char *)(a1 + 126);
  long long v13 = v5;
  int v16 = *(_DWORD *)(a1 + 120);
  [v4 runWithInspectableProperties:v8];
}

void __152__PVMotionEffectTransformComponent_convertPointToView_atTime_forcePosterFrame_includeTransformAnimation_includePlayableAspectScale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 80);
  long long v6 = *(_OWORD *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 104);
  v17[1] = *(_OWORD *)(a1 + 48);
  long long v18 = v7;
  uint64_t v19 = *(void *)(a1 + 120);
  uint64_t v8 = *(unsigned __int8 *)(a1 + 132);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 133);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 134);
  *(void *)&long long v7 = *(void *)(a1 + 88);
  double v11 = *(double *)(a1 + 96);
  int v12 = *(_DWORD *)(a1 + 128);
  v17[0] = v6;
  LODWORD(v16) = v12;
  objc_msgSend(v4, "convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:", v5, v17, &v18, v8, v9, v10, *(double *)&v7, v11, v16, v3);
  uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
  *(void *)(v13 + 48) = v14;
  *(void *)(v13 + 56) = v15;
}

- (CGPoint)convertPointToView_NoLock:(const void *)a3 effectPoint:(id *)a4 atTime:(BOOL)a5 forcePosterFrame:(BOOL)a6 includeTransformAnimation:(BOOL)a7 includePlayableAspectScale:(CGSize)a8 viewSize:(int)a9 viewOrigin:(id)a10 properties:
{
  double height = a8.height;
  double width = a8.width;
  uint64_t v12 = *(void *)&a9;
  BOOL v13 = a7;
  BOOL v14 = a6;
  uint64_t v15 = a5;
  long long v31 = *(_OWORD *)&a4->var3;
  long long v32 = *(_OWORD *)&a4->var0;
  id v18 = v45;
  uint64_t v19 = [(PVMotionEffectComponent *)self motionEffect];
  [v19 assertDocumentIsLocked];

  double v20 = [(PVMotionEffectComponent *)self motionEffect];
  [v20 assertDocumentStatusIsLoadedOrReady];

  double v21 = [(PVMotionEffectComponent *)self motionEffect];
  [v21 assertInspectablePropertiesAreLocked];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = *(_OWORD *)v15;
  uint64_t v36 = *(void *)(v15 + 16);
  LODWORD(v30) = a10;
  long long v22 = -[PVMotionEffectTransformComponent transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:](self, "transformAtTime_NoLock:time:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:includeCoordinateSystemTranslationInEffectViewTransform:viewSize:viewOrigin:properties:", a3, &v35, v14, v13, v12, 1, width, height, v30, v18);
  long long v23 = v22;
  if (v22)
  {
    [v22 SIMDDouble4x4];
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
  }

  v34[4] = v41;
  v34[5] = v42;
  v34[6] = v43;
  v34[7] = v44;
  v34[0] = v37;
  v34[1] = v38;
  v34[2] = v39;
  v34[3] = v40;
  v33[0] = v32;
  v33[1] = v31;
  -[PVMotionEffectTransformComponent convertPointToView_NoLock:effectPoint:withEffectToViewTransform:viewSize:](self, "convertPointToView_NoLock:effectPoint:withEffectToViewTransform:viewSize:", a3, v33, v34, width, height);
  double v25 = v24;
  double v27 = v26;

  double v28 = v25;
  double v29 = v27;
  result.CGFloat y = v29;
  result.CGFloat x = v28;
  return result;
}

- (double)convertPointToView:(double)a3 withEffectToViewTransform:(uint64_t)a4 viewSize:(long long *)a5
{
  long long v17 = *a5;
  long long v18 = a5[1];
  uint64_t v34 = 0;
  long long v35 = (double *)&v34;
  uint64_t v36 = 0x4012000000;
  long long v37 = __Block_byref_object_copy__76;
  long long v38 = __Block_byref_object_dispose__77;
  long long v39 = &unk_1B876C866;
  uint64_t v10 = [a1 motionEffect];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = *(void *)"";
  v19[2] = __90__PVMotionEffectTransformComponent_convertPointToView_withEffectToViewTransform_viewSize___block_invoke;
  v19[3] = &unk_1E6168B90;
  uint64_t v30 = a1;
  long long v31 = &v34;
  long long v20 = v17;
  long long v21 = v18;
  long long v11 = a6[5];
  long long v26 = a6[4];
  long long v27 = v11;
  long long v12 = a6[7];
  long long v28 = a6[6];
  long long v29 = v12;
  long long v13 = a6[1];
  long long v22 = *a6;
  long long v23 = v13;
  long long v14 = a6[3];
  long long v24 = a6[2];
  long long v25 = v14;
  double v32 = a2;
  double v33 = a3;
  [v10 runEnsuringDocumentReadyAndLockingDocument:v19];

  double v15 = v35[6];
  _Block_object_dispose(&v34, 8);
  return v15;
}

uint64_t __90__PVMotionEffectTransformComponent_convertPointToView_withEffectToViewTransform_viewSize___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 192);
  long long v5 = *(_OWORD *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 144);
  v16[4] = *(_OWORD *)(a1 + 128);
  v16[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 176);
  v16[6] = *(_OWORD *)(a1 + 160);
  v16[7] = v7;
  long long v8 = *(_OWORD *)(a1 + 80);
  v16[0] = *(_OWORD *)(a1 + 64);
  v16[1] = v8;
  long long v9 = *(_OWORD *)(a1 + 112);
  v16[2] = *(_OWORD *)(a1 + 96);
  v16[3] = v9;
  double v10 = *(double *)(a1 + 208);
  *(void *)&long long v9 = *(void *)(a1 + 216);
  v15[0] = v5;
  v15[1] = v4;
  uint64_t result = objc_msgSend(v3, "convertPointToView_NoLock:effectPoint:withEffectToViewTransform:viewSize:", a2, v15, v16, v10, *(double *)&v9);
  uint64_t v12 = *(void *)(*(void *)(a1 + 200) + 8);
  *(void *)(v12 + 48) = v13;
  *(void *)(v12 + 56) = v14;
  return result;
}

- (float64_t)convertPointToView_NoLock:(uint64_t)a3 effectPoint:(float64x2_t *)a4 withEffectToViewTransform:(float64x2_t *)a5 viewSize:
{
  float64x2_t v5 = *a4;
  float64x2_t v6 = a4[1];
  float64x2_t v7 = a5[5];
  v14[4] = a5[4];
  v14[5] = v7;
  float64x2_t v8 = a5[7];
  v14[6] = a5[6];
  v14[7] = v8;
  float64x2_t v9 = a5[1];
  v14[0] = *a5;
  v14[1] = v9;
  float64x2_t v10 = a5[3];
  v14[2] = a5[2];
  v14[3] = v10;
  v12[0] = v5;
  v12[1] = v6;
  pv_simd_matrix_transform_vector(v14, v12, &v13);
  return v13.f64[0];
}

- (void)convertPointFromView:(int)a3@<W3> atTime:(_OWORD *)a4@<X8> viewSize:(double)a5@<D0> viewOrigin:(double)a6@<D1>
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x4020000000;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v26 = 0;
  uint64_t v16 = [a1 motionEffect];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = *(void *)"";
  v19[2] = __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke;
  v19[3] = &unk_1E6168BE0;
  void v19[4] = a1;
  v19[5] = &v23;
  *(double *)&v19[6] = a5;
  *(double *)&v19[7] = a6;
  long long v20 = *a2;
  uint64_t v21 = *((void *)a2 + 2);
  *(double *)&v19[8] = a7;
  *(double *)&v19[9] = a8;
  int v22 = a3;
  [v16 runEnsuringDocumentReadyAndLockingDocument:v19];

  long long v17 = *((_OWORD *)v24 + 3);
  long long v18 = *((_OWORD *)v24 + 2);
  _Block_object_dispose(&v23, 8);
  *a4 = v18;
  a4[1] = v17;
}

void __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = [*(id *)(a1 + 32) motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 80);
  v7[2] = __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke_2;
  v7[3] = &unk_1E6168BB8;
  uint64_t v9 = a2;
  uint64_t v13 = *(void *)(a1 + 96);
  long long v10 = v5;
  long long v11 = v6;
  int v14 = *(_DWORD *)(a1 + 104);
  [v4 runWithInspectableProperties:v7];
}

__n128 __84__PVMotionEffectTransformComponent_convertPointFromView_atTime_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 88);
  long long v15 = v8;
  uint64_t v16 = *(void *)(a1 + 104);
  if (v4)
  {
    objc_msgSend(v4, "convertPointFromView_NoLock:viewPoint:atTime:viewSize:viewOrigin:properties:", v5, &v15, *(unsigned int *)(a1 + 112), v3, v6, v7, *(double *)(a1 + 72), *(double *)(a1 + 80));
    int8x16_t v9 = v13;
    unint64_t v10 = vextq_s8(v9, v9, 8uLL).u64[0];
    *(void *)&long long v8 = v14;
  }
  else
  {
    v9.i64[0] = 0;
    unint64_t v10 = 0;
    *(void *)&long long v8 = 0;
  }
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  v9.i64[1] = v10;
  *(int8x16_t *)(v11 + 32) = v9;
  *(_OWORD *)(v11 + 48) = v8;

  return result;
}

- (__n128)convertPointFromView_NoLock:(long long *)a3@<X3> viewPoint:(int)a4@<W4> atTime:(void *)a5@<X5> viewSize:(float64x2_t *)a6@<X8> viewOrigin:(double)a7@<D0> properties:(float64_t)a8@<D1>
{
  id v18 = a5;
  uint64_t v19 = [a1 motionEffect];
  [v19 assertDocumentIsLocked];

  long long v20 = [a1 motionEffect];
  [v20 assertDocumentStatusIsLoadedOrReady];

  uint64_t v21 = [a1 motionEffect];
  [v21 assertInspectablePropertiesAreLocked];

  int v22 = [a1 motionEffect];
  objc_msgSend(v22, "playableScaleInView_NoLock:properties:", v18, a9, a10);
  double v24 = v23;
  double v25 = a9 * 0.5;
  double v26 = a10 * 0.5;

  v27.f64[0] = a7;
  v27.f64[1] = a8;
  float64x2_t v82 = v27;
  if (fabs(v24 + -1.0) >= 0.0001)
  {
    memset(&v120, 0, sizeof(v120));
    CGAffineTransformMakeScale(&v120, 1.0 / v24, 1.0 / v24);
    memset(&v119, 0, sizeof(v119));
    CGAffineTransformMakeTranslation(&t1, -v25, -v26);
    CGAffineTransform t2 = v120;
    CGAffineTransformConcat(&v105, &t1, &t2);
    CGAffineTransformMakeTranslation(&v121, a9 * 0.5, a10 * 0.5);
    CGAffineTransformConcat(&v119, &v105, &v121);
    CGAffineTransform v120 = v119;
    float64x2_t v82 = vaddq_f64(*(float64x2_t *)&v119.tx, vaddq_f64(vmulq_n_f64(*(float64x2_t *)&v119.a, a7), vmulq_laneq_f64(*(float64x2_t *)&v119.c, v82, 1)));
  }
  double v117 = 0.0;
  memset(&t2, 0, sizeof(t2));
  uint64_t v28 = objc_msgSend(v18, "objectForKeyedSubscript:", @"kPVTransformAnimationKey", PVTransformAnimationInfoIdentity((uint64_t)&t2));
  long long v114 = *a3;
  uint64_t v115 = *((void *)a3 + 2);
  BOOL v29 = +[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v28, &v114, 14, 0, &t2, a9, a10);

  double v30 = v82.f64[1];
  if (v29)
  {
    memset(&v105, 0, sizeof(v105));
    *(_OWORD *)&v113.time.value = *(_OWORD *)&t2.a;
    *(_OWORD *)&v113.time.epoch = *(_OWORD *)&t2.c;
    *(_OWORD *)&v113.translation.CGFloat y = *(_OWORD *)&t2.tx;
    v113.rotation = v117;
    v122.CGFloat x = a9 * 0.5;
    v122.CGFloat y = a10 * 0.5;
    CGAffineTransformFromPointWithPVAnimInfo(&v113, v122, (uint64_t)&v105);
    CGAffineTransform v111 = v105;
    CGAffineTransformInvert(&v112, &v111);
    double v30 = v112.ty + v82.f64[0] * v112.b + v82.f64[1] * v112.d;
    v82.f64[0] = v112.tx + v82.f64[0] * v112.a + v82.f64[1] * v112.c;
  }
  LODWORD(v10) = *(_DWORD *)(a2 + 12);
  LODWORD(v24) = *(_DWORD *)(a2 + 16);
  long long v31 = [a1 motionEffect];
  int v32 = [v31 origin];
  double v79 = (double)v10;
  double v33 = (double)*(unint64_t *)&v24;

  uint64_t v34 = (double *)MEMORY[0x1E4F1DAD8];
  double v35 = *MEMORY[0x1E4F1DAD8];
  double v36 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (a4 == 2)
  {
    if (v32 != 1)
    {
      double v37 = v79;
      if (!v32)
      {
        double v35 = a9 * 0.5;
        double v36 = a10 * 0.5;
      }
      goto LABEL_17;
    }
    double v37 = v79;
  }
  else
  {
    if (a4 != 1)
    {
      double v37 = v79;
      if (!a4)
      {
        if (v32 != 1)
        {
          if (v32 == 2)
          {
            double v35 = a9 * -0.5;
            double v36 = a10 * -0.5;
          }
          goto LABEL_17;
        }
        goto LABEL_18;
      }
      goto LABEL_17;
    }
    double v37 = v79;
    if (!v32)
    {
LABEL_18:
      double v25 = *MEMORY[0x1E4F1DAD8];
      double v26 = a10;
      goto LABEL_20;
    }
    if (v32 != 2)
    {
LABEL_17:
      memset(&v120, 0, sizeof(v120));
      CGAffineTransformMakeScale(&v120, v37 / a9, v33 / a10);
      CGAffineTransform t1 = v120;
      CGAffineTransformTranslate(&v105, &t1, v35, v36);
      goto LABEL_21;
    }
    double v25 = a9 * -0.5;
  }
LABEL_20:
  memset(&v120, 0, sizeof(v120));
  CGAffineTransformMakeScale(&v120, v37 / a9, v33 / a10);
  CGAffineTransform t1 = v120;
  CGAffineTransformTranslate(&v105, &t1, v25, v26);
  CGAffineTransform v120 = v105;
  CGAffineTransform v121 = v105;
  CGAffineTransformScale(&v105, &v121, 1.0, -1.0);
LABEL_21:
  CGAffineTransform v120 = v105;
  long long v38 = *(_OWORD *)&v105.a;
  long long v39 = *(_OWORD *)&v105.c;
  long long v40 = *(_OWORD *)&v105.tx;
  long long v41 = [v18 objectForKeyedSubscript:@"kPVCameraEnabledKey"];
  int v42 = [v41 BOOLValue];
  v43.f64[0] = *(double *)&v40 + v82.f64[0] * *(double *)&v38 + v30 * *(double *)&v39;
  double v74 = *((double *)&v40 + 1) + v82.f64[0] * *((double *)&v38 + 1) + v30 * *((double *)&v39 + 1);
  double v75 = v43.f64[0];
  v43.f64[1] = v74;
  float64x2_t v83 = v43;
  float64x2_t v76 = 0u;

  if (v42)
  {
    long long v44 = [v18 objectForKeyedSubscript:@"kPVTransformKey"];
    v45 = [v18 objectForKeyedSubscript:@"kPVCameraTransformKey"];
    uint64_t v46 = [v18 objectForKeyedSubscript:@"kPVCameraProjectionKey"];
    id v47 = (void *)v46;
    if (!v44 || !v45 || !v46)
    {
LABEL_36:

      goto LABEL_37;
    }
    float64x2_t v73 = v44;
    CGRect v48 = a6;
    long long v49 = [v18 objectForKeyedSubscript:@"kPVTransformUnitsAreInMeters"];
    int v50 = [v49 BOOLValue];

    float64x2_t v109 = 0u;
    float64x2_t v110 = 0u;
    long long v107 = 0u;
    long long v108 = 0u;
    long long v106 = 0u;
    memset(&v105, 0, sizeof(v105));
    [v73 SIMDDouble4x4];
    float64x2_t v103 = 0u;
    float64x2_t v104 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v100 = 0u;
    memset(&t1, 0, sizeof(t1));
    [v45 SIMDDouble4x4];
    a6 = v48;
    if (v50)
    {
      v51.f64[0] = (float64_t)a1[5];
      *(void *)&v52.f64[0] = *(_OWORD *)&vmulq_f64(v110, v51);
      v52.f64[1] = v110.f64[1];
      float64x2_t v109 = vmulq_n_f64(v109, v51.f64[0]);
      float64x2_t v110 = v52;
      float64x2_t v53 = vmulq_n_f64(v103, v51.f64[0]);
      *(void *)&v54.f64[0] = *(_OWORD *)&vmulq_f64(v51, v104);
      v54.f64[1] = v104.f64[1];
      float64x2_t v103 = v53;
      float64x2_t v104 = v54;
    }
    long long v44 = v73;
    id v55 = [a1 motionEffect];
    objc_msgSend(v55, "outputROI_NoLock:scale:", a2, 1.0);
    float64_t v77 = v56;
    unint64_t v71 = v58;
    float64_t v72 = v57;
    unint64_t v84 = v59;

    double v60 = *v34;
    if (v32)
    {
      double v61 = v79;
      if (v32 != 2)
      {
        CGFloat v63 = v34[1];
        memset(&v118, 0, sizeof(v118));
        CGAffineTransformMakeScale(&v118, v79 / v79, v33 / v33);
        CGAffineTransform v120 = v118;
        CGAffineTransformTranslate(&v121, &v120, v60, v63);
        goto LABEL_33;
      }
      double v60 = v79 * 0.5;
      double v62 = v33 * 0.5;
    }
    else
    {
      double v62 = v33;
      double v61 = v79;
    }
    memset(&v118, 0, sizeof(v118));
    CGAffineTransformMakeScale(&v118, v61 / v61, v33 / v33);
    CGAffineTransform v120 = v118;
    CGAffineTransformTranslate(&v121, &v120, v60, v62);
    CGAffineTransform v118 = v121;
    CGAffineTransform v119 = v121;
    CGAffineTransformScale(&v121, &v119, 1.0, -1.0);
LABEL_33:
    CGAffineTransform v118 = v121;
    float64x2_t v69 = *(float64x2_t *)&v121.a;
    float64x2_t v70 = *(float64x2_t *)&v121.c;
    float64x2_t v80 = *(float64x2_t *)&v121.tx;
    memset(&v121, 0, 32);
    long long v95 = v107;
    long long v96 = v108;
    float64x2_t v97 = v109;
    float64x2_t v98 = v110;
    CGAffineTransform v93 = v105;
    long long v94 = v106;
    long long v89 = v101;
    long long v90 = v102;
    float64x2_t v91 = v103;
    float64x2_t v92 = v104;
    CGAffineTransform v87 = t1;
    long long v88 = v100;
    [v47 SIMDDouble4x4];
    v64.n128_u64[0] = v84;
    v64.n128_u64[1] = v71;
    v65.f64[0] = v77;
    v65.f64[1] = v72;
    v85[1] = 0u;
    float64x2_t v83 = vaddq_f64(v80, vaddq_f64(vmulq_n_f64(v69, v75), vmulq_n_f64(v70, v74)));
    v85[0] = vsubq_f64(v83, v65);
    int v66 = pv_simd_matrix_unproject_to_plane(v85, 2, &v93, &v87, v86, 1, 0, 1, v64, &v121);
    float64x2_t v67 = 0uLL;
    if (v66)
    {
      float64x2_t v67 = *(float64x2_t *)&v121.c;
      float64x2_t v83 = *(float64x2_t *)&v121.a;
    }
    float64x2_t v76 = v67;
    goto LABEL_36;
  }
LABEL_37:

  __n128 result = (__n128)v83;
  *a6 = v83;
  a6[1] = v76;
  return result;
}

- (id)setPositionInView:(CGPoint)a3 atTime:(id *)a4 viewSize:(CGSize)a5 viewOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  CGFloat height = a5.height;
  CGFloat width = a5.width;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v22 = 0;
  double v23 = &v22;
  uint64_t v24 = 0x3032000000;
  double v25 = __Block_byref_object_copy__0;
  double v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  long long v15 = [(PVMotionEffectComponent *)self motionEffect];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = *(void *)"";
  v18[2] = __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke;
  v18[3] = &unk_1E6168C30;
  v18[4] = self;
  v18[5] = &v22;
  *(CGFloat *)&v18[6] = x;
  *(CGFloat *)&v18[7] = y;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v19 = *a4;
  *(CGFloat *)&v18[8] = width;
  *(CGFloat *)&v18[9] = height;
  int v20 = a6;
  BOOL v21 = a7;
  [v15 runEnsuringDocumentReadyAndLockingDocument:v18];

  id v16 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = [*(id *)(a1 + 32) motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 80);
  v7[2] = __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke_2;
  v7[3] = &unk_1E6168C08;
  uint64_t v9 = a2;
  uint64_t v13 = *(void *)(a1 + 96);
  long long v10 = v5;
  long long v11 = v6;
  int v14 = *(_DWORD *)(a1 + 104);
  char v15 = *(unsigned char *)(a1 + 108);
  [v4 runWithInspectableProperties:v7];
}

void __98__PVMotionEffectTransformComponent_setPositionInView_atTime_viewSize_viewOrigin_restrictToBounds___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 objectForKeyedSubscript:@"kPVTopLevelTransformKey"];
  long long v5 = [*(id *)(a1 + 32) motionEffect];
  long long v6 = [v5 timelineComponent];
  uint64_t v7 = [v6 isForceRenderAtPosterFrameEnabled:v3];

  long long v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  double v10 = *(double *)(a1 + 56);
  double v11 = *(double *)(a1 + 64);
  long long v15 = *(_OWORD *)(a1 + 88);
  uint64_t v16 = *(void *)(a1 + 104);
  uint64_t v12 = objc_msgSend(v8, "setPositionInView_NoLock:viewPoint:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:topLevelTransform:properties:", v9, &v15, v7, *(unsigned int *)(a1 + 112), *(unsigned __int8 *)(a1 + 116), v4, v10, v11, *(double *)(a1 + 72), *(double *)(a1 + 80), v3);
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  int v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v12;
}

- (id)setPositionInView_NoLock:(const void *)a3 viewPoint:(CGPoint)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8 restrictToBounds:(BOOL)a9 topLevelTransform:(id)a10 properties:(id)a11
{
  BOOL v11 = a9;
  uint64_t v12 = *(void *)&a8;
  double height = a7.height;
  double width = a7.width;
  BOOL v15 = a6;
  long long vars0 = *(long long *)&a4.y;
  CGFloat x = a4.x;
  CGFloat v19 = a4.x;
  id v20 = a10;
  id v21 = *(id *)&v19;
  uint64_t v22 = [(PVMotionEffectComponent *)self motionEffect];
  [v22 assertDocumentIsLocked];

  double v23 = [(PVMotionEffectComponent *)self motionEffect];
  [v23 assertDocumentStatusIsLoadedOrReady];

  uint64_t v24 = [(PVMotionEffectComponent *)self motionEffect];
  [v24 assertInspectablePropertiesAreLocked];

  if (v11)
  {
    long long v25 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    uint64_t v88 = 0;
    uint64_t v87 = 0;
    long long v89 = 0u;
    long long v90 = v25;
    -[PVMotionEffectTransformComponent convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:](self, "convertPointToView_NoLock:effectPoint:atTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:viewSize:viewOrigin:properties:", a3, &v87, &v90, v15, 1, 1, width, height);
    float64_t v55 = v27;
    float64_t v56 = v26;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    long long v85 = *(_OWORD *)&a5->var0;
    int64_t v86 = a5->var3;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v85, v15, 1, v12, v21, 1.0, 1.0, width, height);
    long long v81 = v69;
    long long v82 = v70;
    long long v83 = v71;
    long long v84 = v72;
    double quad_center = pv_CGPoint_get_quad_center((PVCGPointQuad *)&v81);
    float64_t v53 = v29;
    float64_t v54 = quad_center;
    double v30 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v30, "playableRectInView_NoLock:properties:", v21, width, height);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    v92.origin.CGFloat x = v32;
    v92.origin.CGFloat y = v34;
    v92.size.double width = v36;
    v92.size.double height = v38;
    CGFloat MinX = CGRectGetMinX(v92);
    v93.origin.CGFloat x = v32;
    v93.origin.CGFloat y = v34;
    v93.size.double width = v36;
    v93.size.double height = v38;
    CGFloat MinY = CGRectGetMinY(v93);
    v94.origin.CGFloat x = v32;
    v94.origin.CGFloat y = v34;
    v94.size.double width = v36;
    v94.size.double height = v38;
    CGFloat MaxX = CGRectGetMaxX(v94);
    v95.origin.CGFloat x = v32;
    v95.origin.CGFloat y = v34;
    v95.size.double width = v36;
    v95.size.double height = v38;
    CGFloat MaxY = CGRectGetMaxY(v95);
    v40.f64[0] = v54;
    v40.f64[1] = v53;
    v41.f64[0] = v56;
    v41.f64[1] = v55;
    float64x2_t v42 = vsubq_f64(v40, v41);
    v43.f64[0] = x;
    *(void *)&v43.f64[1] = vars0;
    v40.f64[0] = MinX;
    v40.f64[1] = MinY;
    v44.f64[0] = MaxX;
    v44.f64[1] = MaxY;
    float64x2_t v45 = vsubq_f64(vminnmq_f64(vmaxnmq_f64(vaddq_f64(v43, v42), v40), v44), v42);
    double v46 = v45.f64[1];
  }
  else
  {
    double v46 = *(double *)&vars0;
    v45.f64[0] = x;
  }
  long long v79 = *(_OWORD *)&a5->var0;
  int64_t v80 = a5->var3;
  -[PVMotionEffectTransformComponent convertPointFromView_NoLock:viewPoint:atTime:viewSize:viewOrigin:properties:](self, "convertPointFromView_NoLock:viewPoint:atTime:viewSize:viewOrigin:properties:", a3, &v79, v12, v21, v45.f64[0], v46, width, height);
  long long vars0a = v77;
  id v60 = (id)v78;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  if (v20)
  {
    [v20 SIMDDouble4x4];
    uint64_t v47 = *((void *)&v76 + 1);
  }
  else
  {
    long long v73 = 0uLL;
    long long v74 = 0uLL;
    long long v71 = 0uLL;
    long long v72 = 0uLL;
    uint64_t v47 = 0;
    long long v69 = 0uLL;
    long long v70 = 0uLL;
  }
  *(void *)&long long v48 = v60;
  *((void *)&v48 + 1) = v47;
  long long v75 = vars0a;
  long long v76 = v48;
  long long v65 = v73;
  long long v66 = v74;
  long long v61 = v69;
  long long v62 = v70;
  long long v63 = v71;
  long long v64 = v72;
  long long v67 = vars0a;
  long long v68 = v48;
  [v20 setSIMDDouble4x4:&v61];
  [(PVMotionEffectTransformComponent *)self applyTopLevelGroupTransform_NoLock:a3 transform:v20];
  [v21 setObject:v20 forKeyedSubscript:@"kPVTopLevelTransformKey"];

  return v20;
}

- (id)scaleToFit:(CGRect)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 viewSize:(CGSize)a6 viewOrigin:(int)a7 restrictToBounds:(BOOL)a8
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  CGFloat v14 = a3.size.height;
  CGFloat v15 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = __Block_byref_object_copy__0;
  double v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  CGFloat v19 = [(PVMotionEffectComponent *)self motionEffect];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = *(void *)"";
  v22[2] = __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke;
  v22[3] = &unk_1E6168C80;
  v22[4] = self;
  v22[5] = &v27;
  *(CGFloat *)&v22[6] = x;
  *(CGFloat *)&v22[7] = y;
  *(CGFloat *)&v22[8] = v15;
  *(CGFloat *)&v22[9] = v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v23 = *a4;
  BOOL v25 = a5;
  *(CGFloat *)&v22[10] = width;
  *(CGFloat *)&v22[11] = height;
  int v24 = a7;
  BOOL v26 = a8;
  [v19 runEnsuringDocumentReadyAndLockingDocument:v22];

  id v20 = (id)v28[5];
  _Block_object_dispose(&v27, 8);

  return v20;
}

void __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v4 = [*(id *)(a1 + 32) motionEffect];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = *(void *)"";
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 80);
  long long v12 = v5;
  long long v13 = v6;
  long long v8 = *(_OWORD *)(a1 + 96);
  long long v14 = v7;
  long long v15 = v8;
  v9[2] = __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke_2;
  v9[3] = &unk_1E6168C58;
  uint64_t v11 = a2;
  uint64_t v16 = *(void *)(a1 + 112);
  char v18 = *(unsigned char *)(a1 + 124);
  int v17 = *(_DWORD *)(a1 + 120);
  char v19 = *(unsigned char *)(a1 + 125);
  [v4 runWithInspectableProperties:v9];
}

void __108__PVMotionEffectTransformComponent_scaleToFit_atTime_forcePosterFrame_viewSize_viewOrigin_restrictToBounds___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  double v9 = *(double *)(a1 + 80);
  long long v13 = *(_OWORD *)(a1 + 104);
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v10 = objc_msgSend(v4, "scaleToFit_NoLock:rect:atTime:forcePosterFrame:viewSize:viewOrigin:restrictToBounds:properties:", v5, &v13, *(unsigned __int8 *)(a1 + 132), *(unsigned int *)(a1 + 128), *(unsigned __int8 *)(a1 + 133), v3, v6, v7, v8, v9, *(double *)(a1 + 88), *(double *)(a1 + 96));
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (id)scaleToFit_NoLock:(const void *)a3 rect:(CGRect)a4 atTime:(id *)a5 forcePosterFrame:(BOOL)a6 viewSize:(CGSize)a7 viewOrigin:(int)a8 restrictToBounds:(BOOL)a9 properties:(id)a10
{
  BOOL v10 = a9;
  uint64_t v11 = *(void *)&a8;
  double height = a7.height;
  double width = a7.width;
  BOOL v14 = a6;
  double v16 = a4.size.height;
  double v17 = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v22 = a10;
  if (self->_isFixedSourceDropShadow)
  {
    long long v54 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v54, v14, 0, v11, v22, 1.0, 1.0, width, height);
    pv_bounding_CGRect(&v56);
    double v24 = v16 - height * self->_normalizedFixedShadowSize.height;
    double v25 = (v17 - width * self->_normalizedFixedShadowSize.width) / v23;
    double v27 = v26 * v25;
    double v28 = v24 / v26;
    BOOL v29 = v27 <= v24;
  }
  else
  {
    long long v51 = *(_OWORD *)&a5->var0;
    int64_t v52 = a5->var3;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v51, v14, 1, v11, v22, 1.0, 1.0, width, height);
    pv_bounding_CGRect(&v53);
    double v25 = v17 / v23;
    double v31 = v30 * (v17 / v23);
    double v28 = v16 / v30;
    BOOL v29 = v31 <= v16;
  }
  if (!v29) {
    double v25 = v28;
  }
  double v32 = v23 * v25 / v23;
  *(void *)&long long v33 = 0;
  *((double *)&v33 + 1) = v32;
  v50[0] = *(unint64_t *)&v32;
  v50[1] = 0u;
  v50[2] = v33;
  memset(&v50[3], 0, 32);
  v50[5] = xmmword_1B7E733D0;
  v50[6] = 0u;
  v50[7] = xmmword_1B7E733E0;
  long long v48 = *(_OWORD *)&a5->var0;
  int64_t v49 = a5->var3;
  id v34 = -[PVMotionEffectTransformComponent addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:](self, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", a3, v50, &v48, v14, 0, v11, width, height, v22);
  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = v17;
  v58.size.double height = v16;
  double MidX = CGRectGetMidX(v58);
  v59.origin.CGFloat x = x;
  v59.origin.CGFloat y = y;
  v59.size.double width = v17;
  v59.size.double height = v16;
  double MidY = CGRectGetMidY(v59);
  memset(&v47, 0, sizeof(v47));
  long long v45 = *(_OWORD *)&a5->var0;
  int64_t v46 = a5->var3;
  -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v45, v14, 1, v11, v22, 1.0, 1.0, width, height);
  PVCGPointQuad v44 = v47;
  *(double *)&long long v37 = MidX - pv_CGPoint_get_quad_center(&v44);
  *((double *)&v37 + 1) = MidY - v38;
  v43[0] = xmmword_1B7E733D0;
  v43[1] = 0u;
  v43[2] = xmmword_1B7E733E0;
  memset(&v43[3], 0, 32);
  v43[5] = xmmword_1B7E733D0;
  v43[6] = v37;
  v43[7] = xmmword_1B7E733E0;
  long long v41 = *(_OWORD *)&a5->var0;
  int64_t v42 = a5->var3;
  long long v39 = -[PVMotionEffectTransformComponent addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:](self, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", a3, v43, &v41, v14, v10, v11, width, height, v22);

  return v39;
}

- (id)topLevelGroupTransform
{
  v2 = [(PVMotionEffectComponent *)self motionEffect];
  id v3 = [v2 transformObjectForKey:@"kPVTopLevelTransformKey"];

  if (!v3)
  {
    id v3 = +[PVMatrix44Double matrix];
  }

  return v3;
}

- (void)setTopLevelGroupTransform:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
    [v5 setInspectableProperty:v4 forKey:@"kPVTopLevelTransformKey"];

    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__0;
    v16[4] = __Block_byref_object_dispose__0;
    id v17 = 0;
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    char v15 = 0;
    double v6 = [(PVMotionEffectComponent *)self motionEffect];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = *(void *)"";
    v13[2] = __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke;
    v13[3] = &unk_1E6168CA8;
    v13[4] = self;
    v13[5] = v16;
    v13[6] = v14;
    [v6 runWithInspectableProperties:v13];

    double v7 = [(PVMotionEffectComponent *)self motionEffect];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = *(void *)"";
    v8[2] = __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke_2;
    v8[3] = &unk_1E6168CD0;
    id v9 = v4;
    BOOL v10 = self;
    uint64_t v11 = v16;
    long long v12 = v14;
    [v7 runEnsuringDocumentReadyAndLockingDocument:v8];

    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

void __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "additionalTopLevelScaleInDictionary:orInDefaultDictionary:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) isForceRenderAtPosterFrameEnabledInDictionary:v6 orInDefaultDictionary:0];
}

void __62__PVMotionEffectTransformComponent_setTopLevelGroupTransform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    long long v30 = 0uLL;
    uint64_t v31 = 0;
    uint64_t v5 = [*(id *)(a1 + 40) motionEffect];
    id v6 = [v5 timelineComponent];
    double v7 = v6;
    long long v28 = *MEMORY[0x1E4F1FA48];
    uint64_t v29 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    if (v6)
    {
      objc_msgSend(v6, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v28, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24), a2);
    }
    else
    {
      long long v30 = 0uLL;
      uint64_t v31 = 0;
    }

    v27.origin.CGFloat x = 0.0;
    v27.origin.CGFloat y = 0.0;
    __asm { FMOV            V0.2D, #-1.0 }
    v27.CGSize size = _Q0;
    long long v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(unsigned int *)(a2 + 160);
    long long v25 = v30;
    uint64_t v26 = v31;
    if (!objc_msgSend(v13, "objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:", &v27, v14, &v25, 1, 1, a2))
    {
      char v15 = *(void **)(a1 + 40);
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) CGPointValue];
      double v17 = v16;
      double v19 = v18;
      CGFloat x = v27.origin.x;
      CGFloat y = v27.origin.y;
      CGSize size = v27.size;
      double MidX = CGRectGetMidX(v27);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.CGSize size = size;
      uint64_t v24 = objc_msgSend(v15, "applyAdditionalTopLevelScale:aroundPoint:toTransform:", v4, v17, v19, MidX, CGRectGetMidY(v32));

      id v4 = (id)v24;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "applyTopLevelGroupTransform_NoLock:transform:", a2, v4);
}

- (void)applyTopLevelGroupTransform_NoLock:(const void *)a3 transform:(id)a4
{
  id v6 = a4;
  double v7 = [(PVMotionEffectComponent *)self motionEffect];
  [v7 assertDocumentIsLocked];

  double v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentStatusIsLoadedOrReady];

  if (v6 && !*((_DWORD *)a3 + 41))
  {
    [v6 SIMDDouble4x4];
    uint64_t v9 = 0;
    v15[4] = v14[12];
    v15[5] = v14[13];
    v15[6] = v14[14];
    v15[7] = v14[15];
    v15[0] = v14[8];
    v15[1] = v14[9];
    BOOL v10 = v16;
    _OWORD v15[2] = v14[10];
    v15[3] = v14[11];
    do
    {
      for (uint64_t i = 0; i != 4; ++i)
        *((void *)v10 + i) = *((void *)&v15[2 * i] + (v9 & 3));
      ++v9;
      v10 += 2;
    }
    while (v9 != 4);
    OZXSetObjectTransform(*(void *)a3, MEMORY[0x1E4F1FA48], *((_DWORD *)a3 + 40), v16);
    long long v12 = [(PVMotionEffectComponent *)self motionEffect];
    [v6 SIMDDouble4x4];
    long long v13 = +[PVMatrix44Double matrixWithSIMDDouble4x4:v14];
    objc_msgSend(v12, "didSetCacheInvalidatingParameter_NoLock:forKey:", v13, @"kPVTopLevelTransformKey");
  }
}

- (void)setTransform:(id)a3
{
  id v4 = a3;
  v15[0] = 0;
  v15[1] = v15;
  _OWORD v15[2] = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  float64x2_t v12[2] = __49__PVMotionEffectTransformComponent_setTransform___block_invoke;
  v12[3] = &unk_1E6168960;
  uint64_t v14 = v15;
  id v6 = v4;
  id v13 = v6;
  [v5 runWithInspectableProperties:v12];

  double v7 = [(PVMotionEffectComponent *)self motionEffect];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = *(void *)"";
  v9[2] = __49__PVMotionEffectTransformComponent_setTransform___block_invoke_2;
  v9[3] = &unk_1E6168CF8;
  void v9[4] = self;
  id v8 = v6;
  id v10 = v8;
  uint64_t v11 = v15;
  [v7 runEnsuringDocumentReadyAndLockingDocument:v9];

  _Block_object_dispose(v15, 8);
}

void __49__PVMotionEffectTransformComponent_setTransform___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [v4 objectForKeyedSubscript:@"kPVTransformUnitsAreInMeters"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 BOOLValue];

  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"kPVTransformKey"];
}

uint64_t __49__PVMotionEffectTransformComponent_setTransform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransform_NoLock:transform:transformUnitsAreInMeters:", a2, *(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
}

- (__n128)getScale
{
  __asm { FMOV            V0.2D, #1.0 }
  *a1 = result;
  a1[1] = result;
  return result;
}

- (BOOL)setTransform_NoLock:(const void *)a3 transform:(id)a4 transformUnitsAreInMeters:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentIsLocked];

  id v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentStatusIsLoadedOrReady];

  if (v8
    && ![(PVMotionEffectTransformComponent *)self encloseTopGroupIn3DGroupOnce_NoLock:a3]|| self->_top3DGroupIDStatus)
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v43 = 0x3FF0000000000000;
    uint64_t v40 = 0x3FF0000000000000;
    uint64_t v37 = 0x3FF0000000000000;
    uint64_t v34 = 0x3FF0000000000000;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    if (v8)
    {
      float64x2_t v32 = 0uLL;
      float64x2_t v33 = 0uLL;
      long long v30 = 0uLL;
      long long v31 = 0uLL;
      long long v28 = 0uLL;
      long long v29 = 0uLL;
      long long v26 = 0uLL;
      long long v27 = 0uLL;
      [v8 SIMDDouble4x4];
      if (v5)
      {
        v13.f64[0] = self->_metersToWorldUnitScale;
        float64x2_t v14 = vmulq_n_f64(v32, v13.f64[0]);
        *(void *)&v15.f64[0] = *(_OWORD *)&vmulq_f64(v33, v13);
        v15.f64[1] = v33.f64[1];
        float64x2_t v32 = v14;
        float64x2_t v33 = v15;
      }
      uint64_t v16 = 0;
      var30[0] = v26;
      var30[1] = v27;
      double v17 = v25;
      var30[2] = v28;
      var30[3] = v29;
      do
      {
        for (uint64_t i = 0; i != 4; ++i)
          *(void *)&v17[8 * i] = *(void *)((unint64_t)&var30[2 * i] & 0xFFFFFFFFFFFFFFE7 | (8 * (v16 & 3)));
        ++v16;
        v17 += 32;
      }
      while (v16 != 4);
      for (uint64_t j = 0; j != 128; j += 32)
      {
        id v20 = (_OWORD *)((char *)&v34 + j);
        long long v21 = *(_OWORD *)&v25[j + 16];
        _OWORD *v20 = *(_OWORD *)&v25[j];
        v20[1] = v21;
      }
    }
    int v22 = OZXSetObjectTransform(*(void *)a3, MEMORY[0x1E4F1FA48], self->_top3DGroupID, (long long *)&v34);
    BOOL v11 = v22 == 0;
    if (!v22)
    {
      double v23 = [(PVMotionEffectComponent *)self motionEffect];
      objc_msgSend(v23, "didSetCacheInvalidatingParameter_NoLock:forKey:", v8, @"kPVTransformKey");
    }
  }

  return v11;
}

- (BOOL)setCameraTransform_NoLock:(const void *)a3 transform:(id)a4 transformUnitsAreInMeters:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentIsLocked];

  id v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentStatusIsLoadedOrReady];

  if (v8 && self->_cameraIDStatus == 1) {
    [(PVMotionEffectTransformComponent *)self addCameraToDocumentOnce_NoLock:a3];
  }
  if (!self->_cameraIDStatus)
  {
    uint64_t v42 = 0x3FF0000000000000;
    uint64_t v39 = 0x3FF0000000000000;
    uint64_t v36 = 0x3FF0000000000000;
    uint64_t v33 = 0x3FF0000000000000;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    if (v8)
    {
      float64x2_t v31 = 0uLL;
      float64x2_t v32 = 0uLL;
      long long v29 = 0uLL;
      long long v30 = 0uLL;
      long long v27 = 0uLL;
      long long v28 = 0uLL;
      long long v25 = 0uLL;
      long long v26 = 0uLL;
      [v8 SIMDDouble4x4];
      if (v5)
      {
        v12.f64[0] = self->_metersToWorldUnitScale;
        float64x2_t v13 = vmulq_n_f64(v31, v12.f64[0]);
        *(void *)&v14.f64[0] = *(_OWORD *)&vmulq_f64(v32, v12);
        v14.f64[1] = v32.f64[1];
        float64x2_t v31 = v13;
        float64x2_t v32 = v14;
      }
      uint64_t v15 = 0;
      var30[0] = v25;
      var30[1] = v26;
      uint64_t v16 = v24;
      var30[2] = v27;
      var30[3] = v28;
      do
      {
        for (uint64_t i = 0; i != 4; ++i)
          *(void *)&v16[8 * i] = *(void *)((unint64_t)&var30[2 * i] & 0xFFFFFFFFFFFFFFE7 | (8 * (v15 & 3)));
        ++v15;
        v16 += 32;
      }
      while (v15 != 4);
      for (uint64_t j = 0; j != 128; j += 32)
      {
        double v19 = (_OWORD *)((char *)&v33 + j);
        long long v20 = *(_OWORD *)&v24[j + 16];
        _OWORD *v19 = *(_OWORD *)&v24[j];
        v19[1] = v20;
      }
    }
    if (OZXSetCameraTransform(*(void *)a3, self->_cameraID, (long long *)&v33))
    {
      BOOL v11 = 0;
      goto LABEL_17;
    }
    int v22 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v22, "didSetCacheInvalidatingParameter_NoLock:forKey:", v8, @"kPVCameraTransformKey");
  }
  BOOL v11 = 1;
LABEL_17:

  return v11;
}

- (id)cameraTransform
{
  uint64_t v21 = 0;
  int v22 = &v21;
  uint64_t v23 = 0xB012000000;
  uint64_t v24 = __Block_byref_object_copy__86;
  long long v25 = __Block_byref_object_dispose__87;
  long long v26 = &unk_1B876C866;
  uint64_t v36 = 0x3FF0000000000000;
  uint64_t v33 = 0x3FF0000000000000;
  uint64_t v30 = 0x3FF0000000000000;
  uint64_t v27 = 0x3FF0000000000000;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v17 = 0;
  double v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 11;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = *(void *)"";
  v16[2] = __51__PVMotionEffectTransformComponent_cameraTransform__block_invoke;
  v16[3] = &unk_1E6168D20;
  v16[4] = self;
  void v16[5] = &v17;
  v16[6] = &v21;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v16];

  if (*((_DWORD *)v18 + 6))
  {
    uint64_t v4 = +[PVMatrix44Double matrix];
  }
  else
  {
    *(void *)&long long v5 = v22[6];
    *(void *)&long long v6 = v22[7];
    *((void *)&v5 + 1) = v22[10];
    *(void *)&long long v7 = v22[14];
    *(void *)&long long v8 = v22[15];
    *((void *)&v7 + 1) = v22[18];
    *((void *)&v6 + 1) = v22[11];
    *((void *)&v8 + 1) = v22[19];
    *(void *)&long long v9 = v22[8];
    *(void *)&long long v10 = v22[9];
    *((void *)&v9 + 1) = v22[12];
    *(void *)&long long v11 = v22[16];
    *(void *)&long long v12 = v22[17];
    *((void *)&v11 + 1) = v22[20];
    *((void *)&v10 + 1) = v22[13];
    *((void *)&v12 + 1) = v22[21];
    v15[0] = v5;
    v15[1] = v7;
    _OWORD v15[2] = v6;
    void v15[3] = v8;
    v15[4] = v9;
    v15[5] = v11;
    v15[6] = v10;
    v15[7] = v12;
    uint64_t v4 = +[PVMatrix44Double matrixWithSIMDDouble4x4:v15];
  }
  float64x2_t v13 = (void *)v4;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __51__PVMotionEffectTransformComponent_cameraTransform__block_invoke(uint64_t result, uint64_t *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 36);
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    v2 = (void *)result;
    __n128 result = OZXGetCameraTransform(*a2, *(_DWORD *)(v2[4] + 32), (void *)(*(void *)(v2[6] + 8) + 48));
    *(_DWORD *)(*(void *)(v2[5] + 8) + 24) = result;
  }
  return result;
}

- (BOOL)setCameraProjection_NoLock:(const void *)a3 transform:(id)a4
{
  id v6 = a4;
  long long v7 = [(PVMotionEffectComponent *)self motionEffect];
  [v7 assertDocumentIsLocked];

  long long v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentStatusIsLoadedOrReady];

  if (v6 && self->_cameraIDStatus == 1) {
    [(PVMotionEffectTransformComponent *)self addCameraToDocumentOnce_NoLock:a3];
  }
  if (!self->_cameraIDStatus)
  {
    uint64_t v37 = 0x3FF0000000000000;
    uint64_t v34 = 0x3FF0000000000000;
    uint64_t v31 = 0x3FF0000000000000;
    double v28 = 1.0;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    if (v6)
    {
      [v6 SIMDDouble4x4];
      uint64_t v10 = 0;
      v26[4] = v22;
      v26[5] = v23;
      v26[6] = v24;
      v26[7] = v25;
      v26[0] = v18;
      v26[1] = v19;
      long long v11 = v27;
      v26[2] = v20;
      v26[3] = v21;
      do
      {
        for (uint64_t i = 0; i != 4; ++i)
          *(void *)&v11[8 * i] = *((void *)&v26[2 * i] + (v10 & 3));
        ++v10;
        v11 += 32;
      }
      while (v10 != 4);
      for (uint64_t j = 0; j != 128; j += 32)
      {
        float64x2_t v14 = (_OWORD *)((char *)&v28 + j);
        long long v15 = *(_OWORD *)&v27[j + 16];
        _OWORD *v14 = *(_OWORD *)&v27[j];
        v14[1] = v15;
      }
    }
    if (OZXSetCameraProjection(*(void *)a3, self->_cameraID, &v28)
      || OZXGetCameraWorldUnitScaleIgnoringAspect(*(void **)a3, self->_cameraID, &self->_metersToWorldUnitScale))
    {
      BOOL v9 = 0;
      goto LABEL_16;
    }
    uint64_t v17 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v17, "didSetCacheInvalidatingParameter_NoLock:forKey:", v6, @"kPVCameraProjectionKey");
  }
  BOOL v9 = 1;
LABEL_16:

  return v9;
}

- (id)cameraProjection
{
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0xB012000000;
  long long v24 = __Block_byref_object_copy__86;
  long long v25 = __Block_byref_object_dispose__87;
  long long v26 = &unk_1B876C866;
  uint64_t v36 = 0x3FF0000000000000;
  uint64_t v33 = 0x3FF0000000000000;
  uint64_t v30 = 0x3FF0000000000000;
  uint64_t v27 = 0x3FF0000000000000;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  int v20 = 11;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = *(void *)"";
  v16[2] = __52__PVMotionEffectTransformComponent_cameraProjection__block_invoke;
  v16[3] = &unk_1E6168D20;
  v16[4] = self;
  void v16[5] = &v17;
  v16[6] = &v21;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v16];

  if (*((_DWORD *)v18 + 6))
  {
    uint64_t v4 = +[PVMatrix44Double matrix];
  }
  else
  {
    *(void *)&long long v5 = v22[6];
    *(void *)&long long v6 = v22[7];
    *((void *)&v5 + 1) = v22[10];
    *(void *)&long long v7 = v22[14];
    *(void *)&long long v8 = v22[15];
    *((void *)&v7 + 1) = v22[18];
    *((void *)&v6 + 1) = v22[11];
    *((void *)&v8 + 1) = v22[19];
    *(void *)&long long v9 = v22[8];
    *(void *)&long long v10 = v22[9];
    *((void *)&v9 + 1) = v22[12];
    *(void *)&long long v11 = v22[16];
    *(void *)&long long v12 = v22[17];
    *((void *)&v11 + 1) = v22[20];
    *((void *)&v10 + 1) = v22[13];
    *((void *)&v12 + 1) = v22[21];
    v15[0] = v5;
    v15[1] = v7;
    _OWORD v15[2] = v6;
    void v15[3] = v8;
    v15[4] = v9;
    v15[5] = v11;
    v15[6] = v10;
    v15[7] = v12;
    uint64_t v4 = +[PVMatrix44Double matrixWithSIMDDouble4x4:v15];
  }
  float64x2_t v13 = (void *)v4;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

uint64_t __52__PVMotionEffectTransformComponent_cameraProjection__block_invoke(uint64_t result, void *a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 36);
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    v2 = (void *)result;
    __n128 result = OZXGetCameraProjection(*a2, *(unsigned int *)(v2[4] + 32), *(void *)(v2[6] + 8) + 48);
    *(_DWORD *)(*(void *)(v2[5] + 8) + 24) = result;
  }
  return result;
}

- (void)disableCameraOverride
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 setInspectableProperty:MEMORY[0x1E4F1CC28] forKey:@"kPVCameraEnabledKey"];

  uint64_t v4 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __57__PVMotionEffectTransformComponent_disableCameraOverride__block_invoke;
  v5[3] = &unk_1E6168D48;
  v5[4] = self;
  [v4 runEnsuringDocumentReadyAndLockingDocument:v5];
}

uint64_t __57__PVMotionEffectTransformComponent_disableCameraOverride__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "disableCameraOverride_NoLock:", a2);
}

- (void)enableCameraOverride:(id)a3 projection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  long long v8 = [(PVMotionEffectComponent *)self motionEffect];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = *(void *)"";
  v18[2] = __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke;
  v18[3] = &unk_1E6168D70;
  id v9 = v6;
  id v19 = v9;
  id v10 = v7;
  id v20 = v10;
  uint64_t v21 = v22;
  [v8 runWithInspectableProperties:v18];

  long long v11 = [(PVMotionEffectComponent *)self motionEffect];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = *(void *)"";
  v14[2] = __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke_2;
  void v14[3] = &unk_1E6168D98;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  uint64_t v17 = v22;
  [v11 runEnsuringDocumentReadyAndLockingDocument:v14];

  _Block_object_dispose(v22, 8);
}

void __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke(void *a1, void *a2)
{
  id v4 = a2;
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"kPVCameraEnabledKey"];
  [v4 setObject:a1[4] forKeyedSubscript:@"kPVCameraTransformKey"];
  [v4 setObject:a1[5] forKeyedSubscript:@"kPVCameraProjectionKey"];
  uint64_t v3 = [v4 objectForKeyedSubscript:@"kPVTransformUnitsAreInMeters"];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v3 BOOLValue];
}

uint64_t __68__PVMotionEffectTransformComponent_enableCameraOverride_projection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "enableCameraOverride_NoLock:transform:projection:transformUnitsAreInMeters:", a2, *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
}

- (BOOL)disableCameraOverride_NoLock:(const void *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  id v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  if (self->_cameraIDStatus) {
    return 1;
  }
  int v8 = OZXEnableCamera(*(void **)a3, self->_cameraID, 0);
  BOOL result = 0;
  if (!v8)
  {
    id v9 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v9, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E4F1CC28], @"kPVCameraEnabledKey");

    return 1;
  }
  return result;
}

- (BOOL)enableCameraOverride_NoLock:(const void *)a3 transform:(id)a4 projection:(id)a5 transformUnitsAreInMeters:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(PVMotionEffectComponent *)self motionEffect];
  [v12 assertDocumentIsLocked];

  id v13 = [(PVMotionEffectComponent *)self motionEffect];
  [v13 assertDocumentStatusIsLoadedOrReady];

  int cameraIDStatus = self->_cameraIDStatus;
  if (cameraIDStatus == 1)
  {
    [(PVMotionEffectTransformComponent *)self addCameraToDocumentOnce_NoLock:a3];
    int cameraIDStatus = self->_cameraIDStatus;
  }
  if (!cameraIDStatus)
  {
    if (OZXEnableCamera(*(void **)a3, self->_cameraID, 1)) {
      goto LABEL_7;
    }
    uint64_t v17 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v17, "didSetCacheInvalidatingParameter_NoLock:forKey:", MEMORY[0x1E4F1CC38], @"kPVCameraEnabledKey");
  }
  if (![(PVMotionEffectTransformComponent *)self setCameraTransform_NoLock:a3 transform:v10 transformUnitsAreInMeters:v6])
  {
LABEL_7:
    BOOL v15 = 0;
    goto LABEL_8;
  }
  BOOL v15 = [(PVMotionEffectTransformComponent *)self setCameraProjection_NoLock:a3 transform:v11];
LABEL_8:

  return v15;
}

- (BOOL)isCameraOverrideEnabled
{
  v2 = self;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  int v7 = 11;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __59__PVMotionEffectTransformComponent_isCameraOverrideEnabled__block_invoke;
  v5[3] = &unk_1E6168D20;
  v5[4] = v2;
  void v5[5] = v6;
  v5[6] = &v8;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LOBYTE(v2) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v8, 8);
  return (char)v2;
}

uint64_t __59__PVMotionEffectTransformComponent_isCameraOverrideEnabled__block_invoke(uint64_t result, void **a2)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 36);
  if (!*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    v2 = (void *)result;
    BOOL result = OZXGetIsCameraEnabled(*a2, *(_DWORD *)(v2[4] + 32), (BOOL *)(*(void *)(v2[6] + 8) + 24));
    *(_DWORD *)(*(void *)(v2[5] + 8) + 24) = result;
  }
  return result;
}

- (BOOL)transformUnitsAreInMeters
{
  v2 = [(PVMotionEffectComponent *)self motionEffect];
  char v3 = [v2 BOOLForKey:@"kPVTransformUnitsAreInMeters"];

  return v3;
}

- (void)setTransformUnitsAreInMeters:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 setBool:v3 forKey:@"kPVTransformUnitsAreInMeters"];
}

- (BOOL)bounds:(CGRect *)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  if (!a3) {
    return 0;
  }
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x5012000000;
  long long v38 = __Block_byref_object_copy__90;
  uint64_t v39 = __Block_byref_object_dispose__91;
  long long v40 = &unk_1B876C866;
  uint64_t v41 = 0;
  uint64_t v42 = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v43 = _Q0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x2020000000;
  int v34 = 11;
  if (a5)
  {
    char v17 = 1;
  }
  else
  {
    id v19 = [(PVMotionEffectComponent *)self motionEffect];
    id v20 = [v19 timelineComponent];
    char v17 = [v20 isForceRenderAtPosterFrameEnabled];
  }
  uint64_t v21 = [(PVMotionEffectComponent *)self motionEffect];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = *(void *)"";
  v25[2] = __98__PVMotionEffectTransformComponent_bounds_atTime_forcePosterFrame_includeDropShadow_includeMasks___block_invoke;
  v25[3] = &unk_1E6168DC0;
  long long v26 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  char v28 = v17;
  v25[4] = self;
  v25[5] = &v31;
  v25[6] = &v35;
  BOOL v29 = a6;
  BOOL v30 = a7;
  [v21 runEnsuringDocumentReadyAndLockingDocument:v25];

  int v22 = *((_DWORD *)v32 + 6);
  BOOL v18 = v22 == 0;
  if (!v22)
  {
    CGSize v23 = (CGSize)*((_OWORD *)v36 + 4);
    a3->origin = (CGPoint)*((_OWORD *)v36 + 3);
    a3->CGSize size = v23;
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v18;
}

uint64_t __98__PVMotionEffectTransformComponent_bounds_atTime_forcePosterFrame_includeDropShadow_includeMasks___block_invoke(uint64_t result, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 164))
  {
    uint64_t v3 = result;
    long long v14 = 0uLL;
    uint64_t v15 = 0;
    id v4 = [*(id *)(result + 32) motionEffect];
    long long v5 = [v4 timelineComponent];
    BOOL v6 = v5;
    long long v12 = *(_OWORD *)(v3 + 56);
    uint64_t v13 = *(void *)(v3 + 72);
    if (v5)
    {
      objc_msgSend(v5, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v12, *(unsigned __int8 *)(v3 + 80), a2);
    }
    else
    {
      long long v14 = 0uLL;
      uint64_t v15 = 0;
    }

    int v7 = *(void **)(v3 + 32);
    uint64_t v8 = *(void *)(*(void *)(v3 + 48) + 8) + 48;
    uint64_t v9 = *(unsigned int *)(a2 + 160);
    long long v10 = v14;
    uint64_t v11 = v15;
    BOOL result = objc_msgSend(v7, "objectBounds_NoLock:objectID:timelineTime:includeDropShadow:includeMasks:documentInfo:", v8, v9, &v10, *(unsigned __int8 *)(v3 + 81), *(unsigned __int8 *)(v3 + 82), a2);
    *(_DWORD *)(*(void *)(*(void *)(v3 + 40) + 8) + 24) = result;
  }
  return result;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 viewSize:(CGPoint)a7 viewOrigin:(CGSize)a8
{
  CGFloat height = a8.height;
  CGFloat width = a8.width;
  CGFloat y = a7.y;
  CGFloat x = a7.x;
  uint64_t v32 = 0;
  uint64_t v33 = (CGPoint *)&v32;
  uint64_t v34 = 0x7012000000;
  uint64_t v35 = __Block_byref_object_copy__93;
  uint64_t v36 = __Block_byref_object_dispose__94;
  uint64_t v37 = &unk_1B876C866;
  long long v38 = *(_OWORD *)PVCGPointQuadZero;
  long long v39 = *(_OWORD *)&PVCGPointQuadZero[16];
  long long v40 = *(_OWORD *)&PVCGPointQuadZero[32];
  long long v41 = *(_OWORD *)&PVCGPointQuadZero[48];
  if (a5)
  {
    char v18 = 1;
  }
  else
  {
    id v19 = [(PVMotionEffectComponent *)self motionEffect];
    id v20 = [v19 timelineComponent];
    char v18 = [v20 isForceRenderAtPosterFrameEnabled];
  }
  uint64_t v21 = [(PVMotionEffectComponent *)self motionEffect];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = *(void *)"";
  v26[2] = __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke;
  v26[3] = &unk_1E6168E10;
  v26[4] = self;
  v26[5] = &v32;
  long long v27 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  char v30 = v18;
  BOOL v31 = a6;
  *(CGFloat *)&v26[6] = x;
  *(CGFloat *)&v26[7] = y;
  *(CGFloat *)&_OWORD v26[8] = width;
  *(CGFloat *)&v26[9] = height;
  int v29 = a9;
  [v21 runEnsuringDocumentReadyAndLockingDocument:v26];

  int v22 = v33;
  CGPoint v23 = v33[4];
  retstr->a = v33[3];
  retstr->b = v23;
  CGPoint v24 = v22[6];
  retstr->c = v22[5];
  retstr->d = v24;
  _Block_object_dispose(&v32, 8);
  return result;
}

void __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v8 = *(_OWORD *)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v12 = v6;
  long long v10 = v5;
  v7[2] = __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2;
  v7[3] = &unk_1E6168DE8;
  uint64_t v9 = a2;
  uint64_t v13 = *(void *)(a1 + 96);
  __int16 v15 = *(_WORD *)(a1 + 108);
  int v14 = *(_DWORD *)(a1 + 104);
  [v4 runWithInspectableProperties:v7];
}

void __111__PVMotionEffectTransformComponent_cornersAtTime_forcePosterFrame_includeDropShadow_scale_viewSize_viewOrigin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  long long v10 = *(_OWORD *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 104);
  if (v4)
  {
    objc_msgSend(v4, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", v5, &v10, *(unsigned __int8 *)(a1 + 116), *(unsigned __int8 *)(a1 + 117), *(unsigned int *)(a1 + 112), v3, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  }
  else
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  long long v6 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v7 = v13;
  long long v9 = v14;
  long long v8 = v15;
  void v6[3] = v12;
  v6[4] = v7;
  v6[5] = v9;
  v6[6] = v8;
}

- (PVCGPointQuad)cornersAtTime_NoLock:(SEL)a3 time:(const void *)a4 forcePosterFrame:(id *)a5 includeDropShadow:(BOOL)a6 scale:(BOOL)a7 viewSize:(CGPoint)a8 viewOrigin:(CGSize)a9 properties:(int)a10
{
  double height = a9.height;
  double width = a9.width;
  CGFloat y = a8.y;
  CGFloat x = a8.x;
  BOOL v18 = a7;
  BOOL v19 = a6;
  id v24 = a11;
  long long v25 = [(PVMotionEffectComponent *)self motionEffect];
  [v25 assertDocumentIsLocked];

  long long v26 = [(PVMotionEffectComponent *)self motionEffect];
  [v26 assertDocumentStatusIsLoadedOrReady];

  long long v27 = [(PVMotionEffectComponent *)self motionEffect];
  [v27 assertInspectablePropertiesAreLocked];

  LODWORD(v12) = *((_DWORD *)a4 + 3);
  LODWORD(v11) = *((_DWORD *)a4 + 4);
  char v28 = [(PVMotionEffectComponent *)self motionEffect];
  int v29 = [v28 origin];

  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  if (!*((_DWORD *)a4 + 41))
  {
    int v51 = a10;
    id v52 = v24;
    uint64_t v30 = *((unsigned int *)a4 + 40);
    long long v70 = 0uLL;
    uint64_t v71 = 0;
    BOOL v31 = [(PVMotionEffectComponent *)self motionEffect];
    uint64_t v32 = [v31 timelineComponent];
    uint64_t v33 = v32;
    long long v68 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    if (v32)
    {
      objc_msgSend(v32, "timelineTimeFromComponentTime_NoLock:forcePosterFrame:documentInfo:", &v68, v19, a4);
    }
    else
    {
      long long v70 = 0uLL;
      uint64_t v71 = 0;
    }

    long long v62 = v70;
    uint64_t v63 = v71;
    long long v60 = *(_OWORD *)&a5->var0;
    int64_t v61 = a5->var3;
    [(PVMotionEffectTransformComponent *)self objectCorners_NoLock:v30 timelineTime:&v62 componentTime:&v60 includeDropShadow:v18 includeMasks:1 documentInfo:a4];
    CGPoint v34 = v65;
    retstr->a = v64;
    retstr->CGPoint b = v34;
    CGPoint v35 = v67;
    retstr->c = v66;
    retstr->CGPoint d = v35;
    CGPoint b = retstr->b;
    v59.a = retstr->a;
    v59.CGPoint b = b;
    CGPoint d = retstr->d;
    v59.c = retstr->c;
    v59.CGPoint d = d;
    CGFloat v38 = x;
    d.CGFloat x = y;
    id v24 = v52;
    PVCGPointQuad_scale(&v59, *(CGPoint *)((char *)&d - 8), &v64);
    CGPoint v39 = v65;
    retstr->a = v64;
    retstr->CGPoint b = v39;
    CGPoint v40 = v67;
    retstr->c = v66;
    retstr->CGPoint d = v40;
    CGPoint v41 = retstr->b;
    v58[0] = retstr->a;
    v58[1] = v41;
    CGPoint v42 = retstr->d;
    v58[2] = retstr->c;
    v58[3] = v42;
    uint64_t v57 = v71;
    long long v56 = v70;
    long long v43 = *(_OWORD *)&a5->var0;
    int64_t v55 = a5->var3;
    long long v54 = v43;
    [(PVMotionEffectTransformComponent *)self transformObjectCornersToImage_NoLock:v58 objectID:v30 timelineTime:&v56 componentTime:&v54 flatten:0 documentInfo:a4 properties:v52];
    CGPoint v44 = v65;
    retstr->a = v64;
    retstr->CGPoint b = v44;
    CGPoint v45 = v67;
    retstr->c = v66;
    retstr->CGPoint d = v45;
    CGPoint v46 = retstr->b;
    v53[0] = (__n128)retstr->a;
    v53[1] = (__n128)v46;
    CGPoint v47 = retstr->d;
    v53[2] = (__n128)retstr->c;
    v53[3] = (__n128)v47;
    pv_transform_PVCGPointQuad_between_coordinate_systems(v53, v29, v51, &v64, (double)v12, (double)v11, width, height);
    CGPoint v48 = v65;
    retstr->a = v64;
    retstr->CGPoint b = v48;
    CGPoint v49 = v67;
    retstr->c = v66;
    retstr->CGPoint d = v49;
  }

  return result;
}

- (PVCGPointQuad)objectCorners_NoLock:(SEL)a3 timelineTime:(unsigned int)a4 componentTime:(id *)a5 includeDropShadow:(id *)a6 includeMasks:(BOOL)a7 documentInfo:(BOOL)a8
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  uint64_t v13 = *(void *)&a4;
  id v16 = [(PVMotionEffectComponent *)self motionEffect];
  [v16 assertDocumentIsLocked];

  char v17 = [(PVMotionEffectComponent *)self motionEffect];
  [v17 assertDocumentStatusIsLoadedOrReady];

  *retstr = *(PVCGPointQuad *)PVCGPointQuadZero;
  CGFloat v30 = 0.0;
  double v31 = 0.0;
  __asm { FMOV            V0.2D, #-1.0 }
  long long v32 = _Q0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = *a5;
  BOOL result = (PVCGPointQuad *)[(PVMotionEffectTransformComponent *)self objectBounds_NoLock:&v30 objectID:v13 timelineTime:&v29 includeDropShadow:v11 includeMasks:v10 documentInfo:a9];
  if (!result)
  {
    double v24 = v30;
    CGFloat v25 = v31;
    double v26 = *(double *)&v32;
    CGFloat v27 = v31 + *((double *)&v32 + 1);
    retstr->a.CGFloat x = v30;
    retstr->a.CGFloat y = v27;
    CGFloat v28 = v24 + v26;
    retstr->b.CGFloat x = v28;
    retstr->b.CGFloat y = v27;
    retstr->c.CGFloat x = v28;
    retstr->c.CGFloat y = v25;
    retstr->d.CGFloat x = v24;
    retstr->d.CGFloat y = v25;
  }
  return result;
}

- (PVCGPointQuad)transformObjectCornersToImage_NoLock:(SEL)a3 objectID:(PVCGPointQuad *)a4 timelineTime:(unsigned int)a5 componentTime:(id *)a6 flatten:(id *)a7 documentInfo:(BOOL)a8 properties:(const void *)a9
{
  BOOL v11 = a8;
  uint64_t v14 = *(void *)&a5;
  id v18 = a10;
  BOOL v19 = [(PVMotionEffectComponent *)self motionEffect];
  [v19 assertDocumentIsLocked];

  id v20 = [(PVMotionEffectComponent *)self motionEffect];
  [v20 assertDocumentStatusIsLoadedOrReady];

  uint64_t v21 = [(PVMotionEffectComponent *)self motionEffect];
  [v21 assertInspectablePropertiesAreLocked];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v63 = *a6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v62 = *a7;
  int v22 = [(PVMotionEffectTransformComponent *)self objectToImageTransform_NoLock:v14 timelineTime:&v63 componentTime:&v62 flatten:v11 includeTransformAnimation:1 includePlayableAspectScale:1 documentInfo:a9 properties:v18];
  CGPoint v23 = v22;
  if (v22)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    [v22 SIMDDouble4x4];
    uint64_t v48 = 0;
    CGPoint v49 = (CGPoint *)&v48;
    uint64_t v50 = 0x7012000000;
    int v51 = __Block_byref_object_copy__93;
    id v52 = __Block_byref_object_dispose__94;
    PVCGPointQuad v53 = &unk_1B876C866;
    CGPoint b = a4->b;
    v47.a = a4->a;
    v47.CGPoint b = b;
    CGPoint d = a4->d;
    v47.c = a4->c;
    v47.CGPoint d = d;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = *(void *)"";
    uint64_t v36 = __141__PVMotionEffectTransformComponent_transformObjectCornersToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke;
    uint64_t v37 = &unk_1E6168E38;
    long long v40 = v56;
    long long v41 = v57;
    long long v38 = v54;
    long long v39 = v55;
    long long v44 = v60;
    long long v45 = v61;
    long long v42 = v58;
    long long v43 = v59;
    CGPoint v46 = &v48;
    double v26 = v35;
    uint64_t v27 = 0;
    do
    {
      PVCGPointQuad v64 = v47;
      point_at_indeCGFloat x = PVCGPointQuad_get_point_at_index(&v64, v27);
      ((void (*)(void *, uint64_t, double))v36)(v26, v27, point_at_index);
      uint64_t v27 = (v27 + 1);
    }
    while (v27 != 4);

    $3CC8671D27C23BF42ADDB32F2B5E48AE v29 = v49;
    CGPoint v30 = v49[4];
    retstr->a = v49[3];
    retstr->CGPoint b = v30;
    CGPoint v31 = v29[6];
    retstr->c = v29[5];
    retstr->CGPoint d = v31;
    _Block_object_dispose(&v48, 8);
  }
  else
  {
    CGPoint v32 = a4->b;
    retstr->a = a4->a;
    retstr->CGPoint b = v32;
    CGPoint v33 = a4->d;
    retstr->c = a4->c;
    retstr->CGPoint d = v33;
  }

  return result;
}

CGFloat *__141__PVMotionEffectTransformComponent_transformObjectCornersToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  float64x2_t v4 = vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), a3), *(float64x2_t *)(a1 + 80), a4), (float64x2_t)0, *(float64x2_t *)(a1 + 112));
  float64x2_t v5 = vaddq_f64(*(float64x2_t *)(a1 + 128), vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), a3), *(float64x2_t *)(a1 + 64), a4), (float64x2_t)0, *(float64x2_t *)(a1 + 96)));
  int64x2_t v6 = (int64x2_t)vaddq_f64(*(float64x2_t *)(a1 + 144), v4);
  double v7 = *(double *)&v6.i64[1];
  v4.f64[0] = 0.0;
  float64x2_t v8 = (float64x2_t)vdupq_laneq_s64(v6, 1);
  CGPoint v9 = (CGPoint)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v4, v8).i64[0], 0), (int8x16_t)vnegq_f64(v5), (int8x16_t)v5);
  if (v7 != 0.0) {
    CGPoint v9 = (CGPoint)vdivq_f64((float64x2_t)v9, v8);
  }
  CGFloat y = v9.y;
  return PVCGPointQuad_set_point_at_index((CGFloat *)(*(void *)(*(void *)(a1 + 160) + 8) + 48), v9, a2);
}

- (id)transformObjectPointsToImage_NoLock:(id)a3 objectID:(unsigned int)a4 timelineTime:(id *)a5 componentTime:(id *)a6 flatten:(BOOL)a7 documentInfo:(const void *)a8 properties:(id)a9
{
  BOOL v10 = a7;
  uint64_t v13 = *(void *)&a4;
  id v15 = a3;
  id v16 = a9;
  char v17 = [(PVMotionEffectComponent *)self motionEffect];
  [v17 assertDocumentIsLocked];

  id v18 = [(PVMotionEffectComponent *)self motionEffect];
  [v18 assertDocumentStatusIsLoadedOrReady];

  BOOL v19 = [(PVMotionEffectComponent *)self motionEffect];
  [v19 assertInspectablePropertiesAreLocked];

  if ([v15 count])
  {
    long long v45 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    long long v43 = *(_OWORD *)&a6->var0;
    int64_t v44 = a6->var3;
    id v20 = [(PVMotionEffectTransformComponent *)self objectToImageTransform_NoLock:v13 timelineTime:&v45 componentTime:&v43 flatten:v10 includeTransformAnimation:1 includePlayableAspectScale:1 documentInfo:a8 properties:v16];
    uint64_t v21 = v20;
    if (v20)
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      [v20 SIMDDouble4x4];
      int v22 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = *(void *)"";
      v25[2] = __140__PVMotionEffectTransformComponent_transformObjectPointsToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke;
      v25[3] = &unk_1E6168E60;
      long long v30 = v39;
      long long v31 = v40;
      long long v32 = v41;
      long long v33 = v42;
      long long v26 = v35;
      long long v27 = v36;
      long long v28 = v37;
      long long v29 = v38;
      id v23 = v22;
      id v34 = v23;
      [v15 enumerateObjectsUsingBlock:v25];
    }
    else
    {
      id v23 = v15;
    }
  }
  else
  {
    id v23 = v15;
  }

  return v23;
}

void __140__PVMotionEffectTransformComponent_transformObjectPointsToImage_NoLock_objectID_timelineTime_componentTime_flatten_documentInfo_properties___block_invoke(uint64_t a1, void *a2)
{
  [a2 CGPointValue];
  float64x2_t v5 = vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 48), v3), *(float64x2_t *)(a1 + 80), v4), (float64x2_t)0, *(float64x2_t *)(a1 + 112));
  float64x2_t v6 = vaddq_f64(*(float64x2_t *)(a1 + 128), vmlaq_f64(vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)(a1 + 32), v3), *(float64x2_t *)(a1 + 64), v4), (float64x2_t)0, *(float64x2_t *)(a1 + 96)));
  int64x2_t v7 = (int64x2_t)vaddq_f64(*(float64x2_t *)(a1 + 144), v5);
  double v8 = *(double *)&v7.i64[1];
  float64x2_t v9 = (float64x2_t)vdupq_laneq_s64(v7, 1);
  v5.f64[0] = 0.0;
  float64x2_t v10 = (float64x2_t)vbslq_s8((int8x16_t)vdupq_lane_s64(vcgtq_f64(v5, v9).i64[0], 0), (int8x16_t)vnegq_f64(v6), (int8x16_t)v6);
  if (v8 != 0.0) {
    float64x2_t v10 = vdivq_f64(v10, v9);
  }
  BOOL v11 = *(void **)(a1 + 160);
  id v12 = [MEMORY[0x1E4F29238] valueWithCGPoint:*(_OWORD *)&v10];
  objc_msgSend(v11, "addObject:");
}

- (int)objectBounds_NoLock:(void *)a3 objectID:(unsigned int)a4 timelineTime:(id *)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7 documentInfo:(const void *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v15 = [(PVMotionEffectComponent *)self motionEffect];
  [v15 assertDocumentIsLocked];

  id v16 = [(PVMotionEffectComponent *)self motionEffect];
  [v16 assertDocumentStatusIsLoadedOrReady];

  char v17 = 2;
  if (!v10) {
    char v17 = 0;
  }
  if (v9) {
    char v18 = v17 | 4;
  }
  else {
    char v18 = v17;
  }
  uint64_t v19 = *(void *)a8;

  return OZXGetObjectBounds(v19, (uint64_t)a5, a4, v18, (uint64_t)a3);
}

- (id)objectToImageTransform_NoLock:(unsigned int)a3 timelineTime:(id *)a4 componentTime:(id *)a5 flatten:(BOOL)a6 includeTransformAnimation:(BOOL)a7 includePlayableAspectScale:(BOOL)a8 documentInfo:(const void *)a9 properties:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v17 = a10;
  char v18 = [(PVMotionEffectComponent *)self motionEffect];
  [v18 assertDocumentIsLocked];

  uint64_t v19 = [(PVMotionEffectComponent *)self motionEffect];
  [v19 assertDocumentStatusIsLoadedOrReady];

  id v20 = [(PVMotionEffectComponent *)self motionEffect];
  [v20 assertInspectablePropertiesAreLocked];

  $3CC8671D27C23BF42ADDB32F2B5E48AE v89 = *a5;
  [(PVMotionEffectTransformComponent *)self applyTransforms_NoLock:a9 dirtyProperties:v17 defaultProperties:0 componentTime:&v89];
  uint64_t v88 = 0x3FF0000000000000;
  uint64_t v85 = 0x3FF0000000000000;
  uint64_t v82 = 0x3FF0000000000000;
  uint64_t v79 = 0x3FF0000000000000;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  if (OZXGetObjectTransform(*(void *)a9, (uint64_t)a4, a6, a3, (uint64_t)&v79)) {
    goto LABEL_3;
  }
  uint64_t v78 = 0x3FF0000000000000;
  uint64_t v75 = 0x3FF0000000000000;
  uint64_t v72 = 0x3FF0000000000000;
  uint64_t v69 = 0x3FF0000000000000;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  if (OZXGetWorldToFilmTransform(*(uint64_t **)a9, (const CMTime *)a4, (METimeRemap **)&v69))
  {
LABEL_3:
    uint64_t v21 = 0;
  }
  else
  {
    double v23 = PCMatrix44Tmpl<double>::leftMult((uint64_t)&v79, (double *)&v69);
    LODWORD(v23) = *((_DWORD *)a9 + 3);
    LODWORD(v24) = *((_DWORD *)a9 + 4);
    double v25 = (double)*(unint64_t *)&v23;
    double v26 = (double)v24;
    if (v11)
    {
      long long v27 = [v17 objectForKeyedSubscript:@"kPVTransformAnimationKey"];
      long long v66 = *(_OWORD *)&a5->var0;
      int64_t var3 = a5->var3;
      if (+[PVTransformAnimation getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:](PVTransformAnimation, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v27, &v66, 14, 1, &v68, v25, v26))
      {
        long long v64 = 0u;
        long long v65 = 0u;
        long long v63 = 0u;
        PVTransformAnimationInfo v62 = v68;
        CGAffineTransformFromPointWithPVAnimInfo(&v62, *MEMORY[0x1E4F1DAD8], (uint64_t)&v63);
        uint64_t v28 = 0;
        long long v54 = v63;
        long long v55 = 0u;
        long long v56 = v64;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v59 = xmmword_1B7E733D0;
        long long v29 = &v69;
        long long v60 = v65;
        long long v61 = xmmword_1B7E733E0;
        do
        {
          for (uint64_t i = 0; i != 4; ++i)
            v29[i] = *((void *)&v54 + 4 * i + (v28 & 3));
          ++v28;
          v29 += 4;
        }
        while (v28 != 4);
        PCMatrix44Tmpl<double>::leftMult((uint64_t)&v79, (double *)&v69);
      }
    }
    if (v10)
    {
      long long v31 = [(PVMotionEffectComponent *)self motionEffect];
      int v32 = objc_msgSend(v31, "hasPlayableAspectOverride_NoLock");

      if (v32)
      {
        long long v33 = [(PVMotionEffectComponent *)self motionEffect];
        objc_msgSend(v33, "playableAspectRatio_NoLock");
        double v35 = v34;

        long long v36 = [(PVMotionEffectComponent *)self motionEffect];
        int v37 = objc_msgSend(v36, "playableContentMode_NoLock");

        double v38 = v35 * v26;
        switch(v37)
        {
          case 0:
            goto LABEL_27;
          case 1:
            if (v25 <= v26)
            {
              double v39 = v26;
              if (v38 < v25) {
                double v39 = v25 / v35;
              }
            }
            else
            {
              double v39 = v25 / v35;
              if (v25 / v35 < v26) {
                double v39 = v26;
              }
            }
            goto LABEL_24;
          case 2:
            double v39 = v25 / v35;
            if (v25 / v35 > v26) {
              double v39 = v26;
            }
LABEL_24:
            double v35 = v35 * v39;
            goto LABEL_26;
          case 3:
          case 13:
            double v35 = v25;
            goto LABEL_26;
          case 14:
            double v35 = v35 * v26;
            goto LABEL_26;
          default:
LABEL_26:
            double v25 = v35;
LABEL_27:
            double v40 = v25 / v38;
            if (fabs(v40 + -1.0) >= 0.0001)
            {
              uint64_t v41 = 0;
              *(void *)&long long v42 = 0;
              *((double *)&v42 + 1) = v40;
              long long v54 = *(unint64_t *)&v40;
              long long v55 = 0u;
              long long v56 = v42;
              long long v57 = 0u;
              long long v58 = 0u;
              long long v59 = xmmword_1B7E733D0;
              long long v60 = 0u;
              long long v61 = xmmword_1B7E733E0;
              long long v43 = &v69;
              do
              {
                for (uint64_t j = 0; j != 4; ++j)
                  v43[j] = *((void *)&v54 + 4 * j + (v41 & 3));
                ++v41;
                v43 += 4;
              }
              while (v41 != 4);
              PCMatrix44Tmpl<double>::leftMult((uint64_t)&v79, (double *)&v69);
            }
            break;
        }
      }
    }
    *(void *)&long long v45 = v79;
    *(void *)&long long v46 = v80;
    *((void *)&v45 + 1) = *((void *)&v81 + 1);
    *(void *)&long long v48 = *((void *)&v84 + 1);
    *(void *)&long long v47 = v84;
    *((void *)&v47 + 1) = *((void *)&v86 + 1);
    *((void *)&v46 + 1) = v82;
    *((void *)&v48 + 1) = v87;
    *(void *)&long long v49 = *((void *)&v80 + 1);
    *(void *)&long long v50 = v81;
    *((void *)&v49 + 1) = v83;
    *(void *)&long long v51 = v85;
    *(void *)&long long v52 = v86;
    *((void *)&v51 + 1) = *((void *)&v87 + 1);
    *((void *)&v50 + 1) = *((void *)&v83 + 1);
    *((void *)&v52 + 1) = v88;
    v53[0] = v45;
    v53[1] = v47;
    v53[2] = v46;
    v53[3] = v48;
    __n128 v53[4] = v49;
    v53[5] = v51;
    v53[6] = v50;
    v53[7] = v52;
    uint64_t v21 = +[PVMatrix44Double matrixWithSIMDDouble4x4:v53];
  }

  return v21;
}

- (id)additionalTopLevelScaleInDictionary:(id)a3 orInDefaultDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [MEMORY[0x1E4F1C9E8] objectForKey:@"kPVTopLevelAdditionalScaleKey" inDictionary:v6 orInDefaultDictionary:v7];
  if (v8
    && [(PVMotionEffectTransformComponent *)self isForceRenderAtPosterFrameEnabledInDictionary:v6 orInDefaultDictionary:v7])
  {
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)isForceRenderAtPosterFrameEnabledInDictionary:(id)a3 orInDefaultDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PVMotionEffectComponent *)self motionEffect];
  id v9 = [v8 timelineComponent];
  if ([v9 isForceRenderAtPosterFrameEnabled:v6])
  {
    char v10 = 1;
  }
  else
  {
    BOOL v11 = [(PVMotionEffectComponent *)self motionEffect];
    id v12 = [v11 timelineComponent];
    char v10 = [v12 isForceRenderAtPosterFrameEnabled:v7];
  }
  return v10;
}

- (id)applyAdditionalTopLevelScale:(CGPoint)a3 aroundPoint:(CGPoint)a4 toTransform:(id)a5
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  double v5 = a3.y;
  double v6 = a3.x;
  id v7 = a5;
  {
    __asm { FMOV            V0.2D, #1.0 }
    -[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:]::noScale = _Q0;
  }
  if (*(double *)&-[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:]::noScale == v6
    && *((double *)&-[PVMotionEffectTransformComponent applyAdditionalTopLevelScale:aroundPoint:toTransform:]::noScale
       + 1) == v5)
  {
    id v9 = v7;
  }
  else
  {
    float64x2_t v50 = 0u;
    float64x2_t v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    if (v7)
    {
      [v7 SIMDDouble4x4];
    }
    else
    {
      long long v10 = *(_OWORD *)(MEMORY[0x1E4F14990] + 80);
      long long v48 = *(_OWORD *)(MEMORY[0x1E4F14990] + 64);
      long long v49 = v10;
      float64x2_t v11 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 112);
      float64x2_t v50 = *(float64x2_t *)(MEMORY[0x1E4F14990] + 96);
      float64x2_t v51 = v11;
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F14990] + 16);
      long long v44 = *MEMORY[0x1E4F14990];
      long long v45 = v12;
      long long v13 = *(_OWORD *)(MEMORY[0x1E4F14990] + 48);
      long long v46 = *(_OWORD *)(MEMORY[0x1E4F14990] + 32);
      long long v47 = v13;
    }
    float64x2_t v24 = v51;
    float64x2_t v25 = v50;
    v14.f64[0] = 0.0;
    v14.f64[1] = v51.f64[1];
    float64x2_t v50 = 0uLL;
    float64x2_t v51 = v14;
    v15.f64[0] = x;
    v15.f64[1] = y;
    v43[4] = (float64x2_t)v48;
    v43[5] = (float64x2_t)v49;
    v43[0] = (float64x2_t)v44;
    v43[1] = (float64x2_t)v45;
    v43[2] = (float64x2_t)v46;
    v43[3] = (float64x2_t)v47;
    v43[6] = 0uLL;
    v43[7] = v14;
    v40[0] = v15;
    v40[1] = 0u;
    pv_simd_matrix_transform_vector(v43, v40, &v41);
    float64x2_t v27 = v42;
    float64x2_t v29 = v41;
    *(void *)&long long v16 = *(_OWORD *)&vnegq_f64(v42);
    *((void *)&v16 + 1) = *(void *)&v51.f64[1];
    float64x2_t v50 = vnegq_f64(v41);
    float64x2_t v51 = (float64x2_t)v16;
    v31[4] = v48;
    v31[5] = v49;
    v31[0] = v44;
    v31[1] = v45;
    v31[2] = v46;
    v31[3] = v47;
    v31[6] = (__int128)v50;
    v31[7] = v16;
    pv_simd_matrix_scale(v31, &v32, *(unint64_t *)&v6, v5, COERCE_UNSIGNED_INT64(1.0));
    long long v48 = v36;
    long long v49 = v37;
    long long v44 = v32;
    long long v45 = v33;
    long long v46 = v34;
    long long v47 = v35;
    *(void *)&v17.f64[0] = *(_OWORD *)&vaddq_f64(vaddq_f64(v24, v27), v39);
    v17.f64[1] = v39.f64[1];
    float64x2_t v50 = vaddq_f64(vaddq_f64(v25, v29), v38);
    float64x2_t v51 = v17;
    v30[2] = v34;
    v30[3] = v35;
    v30[0] = v32;
    v30[1] = v33;
    v30[6] = v50;
    v30[7] = v17;
    v30[4] = v36;
    v30[5] = v37;
    id v9 = +[PVMatrix44Double matrixWithSIMDDouble4x4:v30];
  }
  char v18 = v9;

  return v18;
}

- (void)updateIsFixedSourceDropShadow_NoLock:(const void *)a3 properties:(id)a4
{
  id v6 = a4;
  id v7 = [(PVMotionEffectComponent *)self motionEffect];
  [v7 assertDocumentIsLocked];

  double v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentStatusIsLoadedOrReady];

  id v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertInspectablePropertiesAreLocked];

  long long v10 = [v6 objectForKeyedSubscript:@"kPVTopLevelTransformKey"];
  if (!v10)
  {
    long long v10 = +[PVMatrix44Double matrix];
  }
  long long v44 = *MEMORY[0x1E4F1FA48];
  uint64_t v45 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  double v11 = *((double *)a3 + 22);
  double v12 = *((double *)a3 + 23);
  long long v41 = v44;
  uint64_t v42 = v45;
  -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v41, 1, 1, 1, v6, 1.0, 1.0, v11, v12);
  pv_bounding_CGRect(&v43);
  double width = v46.size.width;
  double height = v46.size.height;
  if (!CGRectIsEmpty(v46))
  {
    long long v38 = v44;
    uint64_t v39 = v45;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v38, 1, 0, 1, v6, 1.0, 1.0, v11, v12);
    pv_bounding_CGRect(&v40);
    double v16 = v15;
    double v18 = v17;
    v37[0] = xmmword_1B7E73450;
    v37[1] = 0u;
    v37[2] = xmmword_1B7E73460;
    memset(&v37[3], 0, 32);
    v37[5] = xmmword_1B7E733D0;
    v37[6] = 0u;
    v37[7] = xmmword_1B7E733E0;
    long long v35 = v44;
    uint64_t v36 = v45;
    id v19 = -[PVMotionEffectTransformComponent addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:](self, "addToTopLevelTransform_NoLock:transform:atTime:forcePosterFrame:restrictToBounds:viewSize:viewOrigin:properties:", a3, v37, &v35, 1, 0, 1, v11, v12, v6);
    long long v32 = v44;
    uint64_t v33 = v45;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v32, 1, 1, 1, v6, 1.0, 1.0, v11, v12);
    pv_bounding_CGRect(&v34);
    double v21 = v20;
    double v23 = v22;
    long long v29 = v44;
    uint64_t v30 = v45;
    -[PVMotionEffectTransformComponent cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:](self, "cornersAtTime_NoLock:time:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:properties:", a3, &v29, 1, 0, 1, v6, 1.0, 1.0, v11, v12);
    pv_bounding_CGRect(&v31);
    double v24 = vabdd_f64(width, v16);
    double v25 = vabdd_f64(height, v18);
    BOOL v28 = vabdd_f64(vabdd_f64(v21, v26) * 0.5, v24) > 1.0;
    if (vabdd_f64(vabdd_f64(v23, v27) * 0.5, v25) > 1.0) {
      BOOL v28 = 1;
    }
    self->_isFixedSourceDropShadow = v28;
    self->_normalizedFixedShadowSize.double width = v24 / v11;
    self->_normalizedFixedShadowSize.double height = v25 / v12;
    [(PVMotionEffectTransformComponent *)self applyTopLevelGroupTransform_NoLock:a3 transform:v10];
    [v6 setObject:v10 forKeyedSubscript:@"kPVTopLevelTransformKey"];
  }
}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v12.receiver = self;
  v12.super_class = (Class)PVMotionEffectTransformComponent;
  [(PVMotionEffectComponent *)&v12 motionEffect:v8 didBecomeReady:a4 properties:v9];
  long long v10 = *MEMORY[0x1E4F1FA48];
  uint64_t v11 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [(PVMotionEffectTransformComponent *)self applyTransforms_NoLock:a4 dirtyProperties:v9 defaultProperties:0 componentTime:&v10];
}

- (void)motionEffect:(id)a3 willRender:(const void *)a4 properties:(id)a5 time:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a6;
  v13.receiver = self;
  v13.super_class = (Class)PVMotionEffectTransformComponent;
  [(PVMotionEffectComponent *)&v13 motionEffect:v10 willRender:a4 properties:v11 time:&v14];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a6;
  [(PVMotionEffectTransformComponent *)self applyTransforms_NoLock:a4 dirtyProperties:v11 defaultProperties:0 componentTime:&v12];
}

- (void)motionEffectDidUnload:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PVMotionEffectTransformComponent;
  [(PVMotionEffectComponent *)&v4 motionEffectDidUnload:a3];
  self->_top3DGroupID = 0;
  self->_int top3DGroupIDStatus = 1;
  self->_cameraID = 0;
  self->_int cameraIDStatus = 1;
  self->_metersToWorldUnitScale = 1.0;
  self->_isFixedSourceDropShadow = 0;
  self->_normalizedFixedShadowSize = (CGSize)*MEMORY[0x1E4F1DB30];
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18 = *a5;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTransformComponent;
  if (-[PVMotionEffectComponent motionEffect:propertiesDisableCache:time:forcePosterFrame:](&v17, sel_motionEffect_propertiesDisableCache_time_forcePosterFrame_, a3, v10, &v18, v6)|| ([v10 objectForKeyedSubscript:@"kPVTopLevelAdditionalScaleKey"], id v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    BOOL v12 = 1;
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = [v10 objectForKeyedSubscript:@"kPVTransformAnimationKey"];
    long long v15 = *(_OWORD *)&a5->var0;
    int64_t var3 = a5->var3;
    BOOL v12 = +[PVTransformAnimation getTransformInfoFromAnimation:v14 atTime:&v15 outInfo:0];
  }
  return v12;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  v11[5] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTransformComponent;
  double v3 = [(PVMotionEffectComponent *)&v10 motionEffectPropertyKeysThatInvalidateCachedRender:a3];
  objc_super v4 = (void *)MEMORY[0x1E4F1CA80];
  v11[0] = @"kPVTopLevelTransformKey";
  v11[1] = @"kPVTransformKey";
  v11[2] = @"kPVCameraProjectionKey";
  v11[3] = @"kPVCameraTransformKey";
  v11[4] = @"kPVCameraEnabledKey";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:5];
  BOOL v6 = [v4 setWithArray:v5];

  id v7 = [v3 anyObject];
  LOBYTE(v5) = v7 == 0;

  if ((v5 & 1) == 0)
  {
    id v8 = [v3 allObjects];
    [v6 addObjectsFromArray:v8];
  }

  return v6;
}

- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTransformComponent;
  if (![(PVMotionEffectComponent *)&v17 motionEffect:v10 shouldInvalidateCachedRenderForProperty:v11 oldValue:v12 newValue:v13])
  {
    if (![v11 isEqualToString:@"kPVTopLevelTransformKey"])
    {
      if ([v11 isEqualToString:@"kPVCameraEnabledKey"])
      {
        char v15 = PVNumbersAreEqualAsBooleans(v12, v13);
LABEL_10:
        char v14 = v15 ^ 1;
        goto LABEL_11;
      }
      if (([v11 isEqualToString:@"kPVTransformKey"] & 1) == 0
        && ([v11 isEqualToString:@"kPVCameraProjectionKey"] & 1) == 0
        && ![v11 isEqualToString:@"kPVCameraTransformKey"])
      {
        char v14 = 0;
        goto LABEL_11;
      }
    }
    char v15 = [v12 isEqual:v13];
    goto LABEL_10;
  }
  char v14 = 1;
LABEL_11:

  return v14;
}

@end