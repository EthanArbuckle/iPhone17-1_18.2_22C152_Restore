@interface PXGAnimator
- (BOOL)hasCriticalAnimations;
- (BOOL)isAnimating;
- (PXGAnimator)init;
- (PXGLayoutSnapshot)previousLayoutSnapshot;
- (double)speed;
- (id)_animationByAnimationIndexForAnimations:(id)a3;
- (id)_dequeueSpriteDataStore;
- (int64_t)computeCount;
- (int64_t)preferredFramesPerSecond;
- (unsigned)highFrameRateReason;
- (void)_returnForReuseSpriteDataStore:(id)a3;
- (void)_stopAllAnimations;
- (void)computeAnimationStateForTime:(double)a3 inputSpriteDataStore:(id)a4 inputChangeDetails:(id)a5 inputLayout:(id)a6 viewportShift:(CGPoint)a7 animationPresentationSpriteDataStore:(id)a8 animationTargetSpriteDataStore:(id)a9 animationChangeDetails:(id *)a10 animationLayout:(id *)a11;
- (void)dealloc;
- (void)retargetAnimationsAfterStartTime:(double)a3 newStartTime:(double)a4;
- (void)setAnimating:(BOOL)a3;
- (void)setPreferredFramesPerSecond:(int64_t)a3;
- (void)setPreviousLayoutSnapshot:(id)a3;
- (void)setSpeed:(double)a3;
@end

@implementation PXGAnimator

- (BOOL)isAnimating
{
  return self->_animating;
}

- (unsigned)highFrameRateReason
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v3 = [(PXGAnimationDataStore *)self->_animationDataStore activeGroupIndexes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__PXGAnimator_highFrameRateReason__block_invoke;
  v5[3] = &unk_1E5DC5478;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateIndexesUsingBlock:v5];

  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)hasCriticalAnimations
{
  v2 = self;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(PXGAnimationDataStore *)self->_animationDataStore activeGroupIndexes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__PXGAnimator_hasCriticalAnimations__block_invoke;
  v5[3] = &unk_1E5DC5478;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 enumerateIndexesUsingBlock:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)retargetAnimationsAfterStartTime:(double)a3 newStartTime:(double)a4
{
  double v6 = a3 + -0.0001;
  v7 = [(PXGAnimationDataStore *)self->_animationDataStore activeGroupIndexes];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__PXGAnimator_retargetAnimationsAfterStartTime_newStartTime___block_invoke;
  v8[3] = &unk_1E5DB6070;
  v8[4] = self;
  *(double *)&v8[5] = v6;
  *(double *)&v8[6] = a4;
  [v7 enumerateIndexesUsingBlock:v8];
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (void)computeAnimationStateForTime:(double)a3 inputSpriteDataStore:(id)a4 inputChangeDetails:(id)a5 inputLayout:(id)a6 viewportShift:(CGPoint)a7 animationPresentationSpriteDataStore:(id)a8 animationTargetSpriteDataStore:(id)a9 animationChangeDetails:(id *)a10 animationLayout:(id *)a11
{
  double y = a7.y;
  double x = a7.x;
  uint64_t v340 = *MEMORY[0x1E4F143B8];
  id v234 = a4;
  id v226 = a5;
  id v17 = a6;
  id v236 = a8;
  id v233 = a9;
  v237 = self;
  ++self->_computeCount;
  id v250 = v17;
  id v251 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = [v17 animations];

  if (v18)
  {
    v19 = [v17 animations];
    [v251 addObjectsFromArray:v19];
  }
  long long v336 = 0u;
  long long v335 = 0u;
  long long v334 = 0u;
  long long v333 = 0u;
  v20 = [v17 transitions];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v333 objects:v339 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v334;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v334 != v22) {
          objc_enumerationMutation(v20);
        }
        v24 = [*(id *)(*((void *)&v333 + 1) + 8 * i) animations];
        v25 = [v24 allObjects];
        [v251 addObjectsFromArray:v25];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v333 objects:v339 count:16];
    }
    while (v21);
  }

  v249 = [(PXGAnimator *)v237 _animationByAnimationIndexForAnimations:v251];
  uint64_t v235 = [v249 count];
  v232 = [(PXGAnimator *)v237 _dequeueSpriteDataStore];
  if (v234)
  {
    [v234 sprites];
  }
  else
  {
    uint64_t v332 = 0;
    long long v331 = 0u;
    long long v330 = 0u;
  }
  v328[0] = v330;
  v328[1] = v331;
  uint64_t v329 = v332;
  [v232 setSprites:v328];
  v26 = v237->_previousLayoutSnapshot;
  -[PXGLayoutSnapshot applyViewportShift:](v26, "applyViewportShift:", x, y);
  v27 = [[PXGLayoutSnapshot alloc] initWithLayout:v250 spriteDataStore:v232];
  v325[0] = MEMORY[0x1E4F143A8];
  v325[1] = 3221225472;
  v325[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke;
  v325[3] = &unk_1E5DAF360;
  v222 = v26;
  v326 = v222;
  v225 = v27;
  v327 = v225;
  [v251 enumerateObjectsUsingBlock:v325];
  BOOL isSkippingAnimations = v237->_isSkippingAnimations;
  unsigned int v29 = (v235 == 0) & ~[(PXGAnimator *)v237 isAnimating];
  v237->_BOOL isSkippingAnimations = v29;
  if (v29 == 1)
  {
    kdebug_trace();
    if (v234)
    {
      [v234 sprites];
      long long v319 = v322;
      long long v320 = v323;
      uint64_t v321 = v324;
      [v236 setSprites:&v319];
      [v234 sprites];
    }
    else
    {
      uint64_t v324 = 0;
      long long v323 = 0u;
      long long v322 = 0u;
      long long v319 = 0u;
      long long v320 = 0u;
      uint64_t v321 = 0;
      [v236 setSprites:&v319];
      uint64_t v318 = 0;
      long long v317 = 0u;
      long long v316 = 0u;
    }
    v314[0] = v316;
    v314[1] = v317;
    uint64_t v315 = v318;
    [v233 setSprites:v314];
    kdebug_trace();
    *a10 = v226;
    *a11 = v250;
    goto LABEL_151;
  }
  if (isSkippingAnimations)
  {
    v30 = v237;
    kdebug_trace();

    uint64_t v31 = [v236 count];
    unsigned int v32 = [v30[1] spriteCount];
    id v33 = objc_alloc_init((Class)off_1E5DA66F0);
    if (v31 >= v32) {
      objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, v31 - v32);
    }
    else {
      objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, v32 - v31);
    }
    id v34 = (id)objc_claimAutoreleasedReturnValue();

    v338[0] = v34;
    v35 = [off_1E5DA5568 changeDetailsWithNoIncrementalChanges];
    v338[1] = v35;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v338 count:2];
    [v33 configureWithNumberOfSpritesAfterChange:v31 changeDetails:v36];

    [v30[1] applySpriteChangeDetails:v33];
    id v37 = v236;
    uint64_t v38 = [v37 geometries];
    uint64_t v39 = [v37 styles];
    for (uint64_t j = [v30[1] spriteInfos]; v31; LODWORD(v31) = v31 - 1)
    {
      double v41 = *(double *)v38;
      *(void *)uint64_t j = *(void *)v38;
      *(double *)(j + 8) = v41 - v41;
      *(_DWORD *)(j + 16) = 0;
      double v42 = *(double *)(v38 + 8);
      *(double *)(j + 20) = v42;
      *(double *)(j + 28) = v42 - v42;
      *(_DWORD *)(j + 36) = 0;
      *(float *)&double v42 = *(double *)(v38 + 16);
      *(_DWORD *)(j + 40) = LODWORD(v42);
      *(float *)(j + 44) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 48) = 0;
      *(int32x2_t *)(j + 52) = vzip1_s32(*(int32x2_t *)(v38 + 24), (int32x2_t)vsub_f32(*(float32x2_t *)(v38 + 24), *(float32x2_t *)(v38 + 24)));
      *(_DWORD *)(j + 60) = 0;
      LODWORD(v42) = *(_DWORD *)(v38 + 28);
      *(_DWORD *)(j + 64) = LODWORD(v42);
      *(float *)(j + 68) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 72) = 0;
      LODWORD(v42) = *(_DWORD *)v39;
      *(_DWORD *)(j + 76) = *(_DWORD *)v39;
      *(float *)(j + 80) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 84) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 56);
      *(_DWORD *)(j + 88) = LODWORD(v42);
      *(float *)(j + 92) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 96) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 60);
      *(_DWORD *)(j + 100) = LODWORD(v42);
      *(float *)(j + 104) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 108) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 64);
      *(_DWORD *)(j + 112) = LODWORD(v42);
      *(float *)(j + 116) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 120) = 0;
      *(int32x2_t *)(j + 124) = vzip1_s32(*(int32x2_t *)(v39 + 72), (int32x2_t)vsub_f32(*(float32x2_t *)(v39 + 72), *(float32x2_t *)(v39 + 72)));
      *(_DWORD *)(j + 132) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 76);
      *(_DWORD *)(j + 136) = LODWORD(v42);
      *(float *)(j + 140) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 144) = 0;
      *(int32x2_t *)(j + 148) = vzip1_s32(*(int32x2_t *)(v39 + 4), (int32x2_t)vsub_f32(*(float32x2_t *)(v39 + 4), *(float32x2_t *)(v39 + 4)));
      *(_DWORD *)(j + 156) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 8);
      *(_DWORD *)(j + 160) = LODWORD(v42);
      *(float *)(j + 164) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 168) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 12);
      *(_DWORD *)(j + 172) = LODWORD(v42);
      *(float *)(j + 176) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 180) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 16);
      *(_DWORD *)(j + 184) = LODWORD(v42);
      *(float *)(j + 188) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 192) = 0;
      *(int32x2_t *)(j + 196) = vzip1_s32(*(int32x2_t *)(v39 + 20), (int32x2_t)vsub_f32(*(float32x2_t *)(v39 + 20), *(float32x2_t *)(v39 + 20)));
      *(_DWORD *)(j + 204) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 24);
      *(_DWORD *)(j + 208) = LODWORD(v42);
      *(float *)(j + 212) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 216) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 28);
      *(_DWORD *)(j + 220) = LODWORD(v42);
      *(float *)(j + 224) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 228) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 32);
      *(_DWORD *)(j + 232) = LODWORD(v42);
      *(float *)(j + 236) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 240) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 36);
      *(_DWORD *)(j + 244) = LODWORD(v42);
      *(float *)(j + 248) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 252) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 40);
      *(_DWORD *)(j + 256) = LODWORD(v42);
      *(float *)(j + 260) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 264) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 44);
      *(_DWORD *)(j + 268) = LODWORD(v42);
      *(float *)(j + 272) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 276) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 48);
      *(_DWORD *)(j + 280) = LODWORD(v42);
      *(float *)(j + 284) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 288) = 0;
      LODWORD(v42) = *(_DWORD *)(v39 + 80);
      *(_DWORD *)(j + 292) = LODWORD(v42);
      *(float *)(j + 296) = *(float *)&v42 - *(float *)&v42;
      *(_DWORD *)(j + 300) = 0;
      v38 += 32;
      j += 307;
      v39 += 160;
    }
    v43 = v30;
    kdebug_trace();
  }
  double lastUpdateTime = v237->_lastUpdateTime;
  if (lastUpdateTime > a3)
  {
    if (lastUpdateTime + -0.1 <= a3)
    {
      if (lastUpdateTime >= a3) {
        a3 = v237->_lastUpdateTime;
      }
    }
    else
    {
      [(PXGAnimator *)v237 _stopAllAnimations];
    }
  }
  v238 = v237;
  kdebug_trace();

  [v250 removeAllAnimations];
  [v250 removeAllTransitions];
  if (v235)
  {
    [(PXGAnimationDataStore *)v238->_animationDataStore setMappedSpriteCount:0];
    -[PXGAnimationDataStore increaseMappedSpriteCountBy:usingAnimationIndex:](v238->_animationDataStore, "increaseMappedSpriteCountBy:usingAnimationIndex:", [v250 numberOfSprites], 0);
    uint64_t v45 = [(PXGAnimationDataStore *)v238->_animationDataStore animationIndexBySpriteIndex];
    v46 = [v249 allKeys];
    v47 = [v46 sortedArrayUsingComparator:&__block_literal_global_6371];

    long long v313 = 0u;
    long long v312 = 0u;
    long long v311 = 0u;
    long long v310 = 0u;
    id v48 = v47;
    uint64_t v49 = [v48 countByEnumeratingWithState:&v310 objects:v337 count:16];
    if (v49)
    {
      uint64_t v50 = *(void *)v311;
      while (2)
      {
        for (uint64_t k = 0; k != v49; ++k)
        {
          if (*(void *)v311 != v50) {
            objc_enumerationMutation(v48);
          }
          v52 = *(void **)(*((void *)&v310 + 1) + 8 * k);
          v53 = [v249 objectForKeyedSubscript:v52];
          v54 = [v53 layout];
          if (!v54)
          {

            goto LABEL_47;
          }
          __int16 v55 = [v52 integerValue];
          if ([v53 scope] == 2) {
            uint64_t v56 = [v54 localNumberOfSprites];
          }
          else {
            uint64_t v56 = [v54 numberOfSprites];
          }
          uint64_t v57 = [v250 convertSpriteIndexRange:v56 << 32 fromDescendantLayout:v54];
          uint64_t v58 = (HIDWORD(v57) + v57);
          if (v58 > v57)
          {
            uint64_t v59 = v58 - v57;
            v60 = (_WORD *)(v45 + 2 * v57);
            do
            {
              *v60++ = v55;
              --v59;
            }
            while (v59);
          }
        }
        uint64_t v49 = [v48 countByEnumeratingWithState:&v310 objects:v337 count:16];
        if (v49) {
          continue;
        }
        break;
      }
    }
LABEL_47:
  }
  uint64_t v304 = 0;
  v305 = &v304;
  uint64_t v306 = 0x3032000000;
  v307 = __Block_byref_object_copy__6372;
  v308 = __Block_byref_object_dispose__6373;
  id v309 = v226;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14;
  aBlock[3] = &unk_1E5DD0588;
  v303 = &v304;
  id v302 = v309;
  v221 = _Block_copy(aBlock);
  if (v235)
  {
    v246 = [(id)v305[5] removedSpriteIndexes];
    v243 = [(id)v305[5] insertedSpriteIndexes];
    if ([v246 count] && objc_msgSend(v243, "count"))
    {
      [v249 allValues];
      objc_claimAutoreleasedReturnValue();
      PXFilter();
    }
  }
  __b = 0;
  p_b = &__b;
  uint64_t v297 = 0x3032000000;
  v298 = __Block_byref_object_copy__6372;
  v299 = __Block_byref_object_dispose__6373;
  id v300 = (id)v305[5];
  v294[0] = MEMORY[0x1E4F143A8];
  v294[1] = 3221225472;
  v294[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_3;
  v294[3] = &unk_1E5DAF3A8;
  v294[4] = &__b;
  v294[5] = &v304;
  v242 = (void (**)(void))_Block_copy(v294);
  v61 = v238;
  if (v238->_numberOfProlongatedSprites)
  {
    v242[2]();
    [p_b[5] increaseNumberOfSpritesBy:v238->_numberOfProlongatedSprites];
    v62 = [(PXGAnimationDataStore *)v238->_animationDataStore spriteIndexesExpiringAtTime:a3];
    if ([v62 count])
    {
      [p_b[5] removeSpritesAtIndexes:v62];
      v238->_numberOfProlongatedSprites -= [v62 count];
    }

    v61 = v238;
    uint64_t numberOfProlongatedSprites = v238->_numberOfProlongatedSprites;
  }
  else
  {
    uint64_t numberOfProlongatedSprites = 0;
  }
  [(PXGAnimationDataStore *)v61->_animationDataStore increaseMappedSpriteCountBy:numberOfProlongatedSprites usingAnimationIndex:0];
  uint64_t v64 = [(PXGAnimationDataStore *)v61->_animationDataStore animationIndexBySpriteIndex];
  LODWORD(v65) = *(_DWORD *)off_1E5DAAF80;
  unint64_t v66 = *((unsigned int *)off_1E5DAAF80 + 1);
  if (v235)
  {
    v67 = [(id)v305[5] removedSpriteIndexes];
    if ([v67 count])
    {
      v242[2]();
      unint64_t v65 = [p_b[5] replaceRemovalsWithMovesToEndForIndexes:v67];
      unint64_t v66 = HIDWORD(v65);
      if ([v67 count] != HIDWORD(v65))
      {
        v215 = [MEMORY[0x1E4F28B00] currentHandler];
        [v215 handleFailureInMethod:a2 object:v238 file:@"PXGAnimator.m" lineNumber:325 description:@"unexpected number of prolongated sprites"];
      }
      v238->_numberOfProlongatedSprites += HIDWORD(v65);
    }
    [(PXGAnimationDataStore *)v238->_animationDataStore increaseMappedSpriteCountBy:v66 usingAnimationIndex:0];
    uint64_t v248 = [(PXGAnimationDataStore *)v238->_animationDataStore animationIndexBySpriteIndex];
    uint64_t v288 = 0;
    v289 = &v288;
    uint64_t v290 = 0x3032000000;
    v291 = __Block_byref_object_copy__6372;
    v292 = __Block_byref_object_dispose__6373;
    id v293 = 0;
    v68 = [(id)v305[5] modifiedSpriteIndexes];
    v280[0] = MEMORY[0x1E4F143A8];
    v280[1] = 3221225472;
    v280[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_4;
    v280[3] = &unk_1E5DAF3F0;
    id v69 = v68;
    uint64_t v287 = v248;
    id v281 = v69;
    v282 = v238;
    id v283 = v236;
    v285 = &__b;
    id v284 = v250;
    v286 = &v288;
    [v249 enumerateKeysAndObjectsUsingBlock:v280];
    [(PXGSpriteDataStore *)v238->_doubleSidedSpriteDataStore setCount:0];
    [(PXGSpriteDataStore *)v238->_oldAnimationPresentationSpriteDataStore setCount:0];
    if ([(id)v289[5] count])
    {
      v242[2]();
      unint64_t v70 = [p_b[5] splitIndexesIntoMovesToEndAndReinsertions:v289[5]];
      if ([(id)v289[5] count] != HIDWORD(v70))
      {
        v216 = [MEMORY[0x1E4F28B00] currentHandler];
        [v216 handleFailureInMethod:a2 object:v238 file:@"PXGAnimator.m" lineNumber:415 description:@"unexpected number of prolongated sprites"];
      }
      v238->_numberOfProlongatedSprites += HIDWORD(v70);
      if (v65 == -1)
      {
        LODWORD(v65) = v70;
        unint64_t v66 = HIDWORD(v70);
      }
      else
      {
        if (v66 + v65 != v70)
        {
          [MEMORY[0x1E4F28B00] currentHandler];
          objc_claimAutoreleasedReturnValue();
          NSStringFromPXGSpriteIndexRange();
        }
        LODWORD(v66) = v66 + HIDWORD(v70);
      }
      v278[0] = 0;
      v278[1] = v278;
      v278[2] = 0x2020000000;
      unsigned int v279 = 0;
      unsigned int v279 = [(PXGAnimationDataStore *)v238->_animationDataStore mappedSpriteCount];
      [(PXGAnimationDataStore *)v238->_animationDataStore setMappedSpriteCount:(v66 + v65)];
      uint64_t v71 = [(PXGAnimationDataStore *)v238->_animationDataStore animationIndexBySpriteIndex];
      v72 = (void *)v289[5];
      v277[0] = MEMORY[0x1E4F143A8];
      v277[1] = 3221225472;
      v277[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_6;
      v277[3] = &unk_1E5DB6098;
      v277[5] = v71;
      v277[4] = v278;
      [v72 enumerateIndexesUsingBlock:v277];
      unsigned int v240 = v66;
      uint64_t v248 = v71;
      _Block_object_dispose(v278, 8);
    }
    else
    {
      unsigned int v240 = v66;
    }

    _Block_object_dispose(&v288, 8);
  }
  else
  {
    unsigned int v240 = *((_DWORD *)off_1E5DAAF80 + 1);
    uint64_t v248 = v64;
  }
  *a10 = p_b[5];
  [(PXGAnimationDataStore *)v238->_animationDataStore applySpriteChangeDetails:p_b[5]];
  [v236 applyChangeDetails:p_b[5]];
  [v233 applyChangeDetails:p_b[5]];
  unsigned int v73 = [v236 count];
  if ([v233 count] != v73)
  {
    v210 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v210, "handleFailureInMethod:object:file:lineNumber:description:", a2, v238, @"PXGAnimator.m", 441, @"unexpected animation target sprite data store count %li (expected: %li)", objc_msgSend(v233, "count"), v73);
  }
  if ([(PXGAnimationDataStore *)v238->_animationDataStore spriteCount] != v73)
  {
    v211 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v211, "handleFailureInMethod:object:file:lineNumber:description:", a2, v238, @"PXGAnimator.m", 442, @"unexpected animation data store sprite count %li (expected: %li)", -[PXGAnimationDataStore spriteCount](v238->_animationDataStore, "spriteCount"), v73);
  }
  if (v235 && [(PXGAnimationDataStore *)v238->_animationDataStore mappedSpriteCount] != v73)
  {
    v212 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v212, "handleFailureInMethod:object:file:lineNumber:description:", a2, v238, @"PXGAnimator.m", 444, @"unexpected animation data store mapped sprite count %li (expected: %li)", -[PXGAnimationDataStore mappedSpriteCount](v238->_animationDataStore, "mappedSpriteCount"), v73);
  }
  v74 = v238;
  kdebug_trace();

  v276[0] = MEMORY[0x1E4F143A8];
  v276[1] = 3221225472;
  v276[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_7;
  v276[3] = &unk_1E5DAF418;
  *(double *)&v276[5] = a3;
  v276[4] = v74;
  v75 = _Block_copy(v276);
  id v76 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  v77 = [(PXGAnimationDataStore *)v238->_animationDataStore activeGroupIndexes];
  v273[0] = MEMORY[0x1E4F143A8];
  v273[1] = 3221225472;
  v273[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_8;
  v273[3] = &unk_1E5DB6970;
  v273[4] = v74;
  id v78 = v75;
  id v275 = v78;
  id v247 = v76;
  id v274 = v247;
  [v77 enumerateIndexesUsingBlock:v273];

  if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    v79 = v74;
    kdebug_trace();

    id v80 = v236;
    v81 = (float64x2_t *)[v80 geometries];
    uint64_t v82 = [v80 styles];
    uint64_t v83 = [(PXGAnimationDataStore *)v238->_animationDataStore spriteInfos];
    v84.f64[0] = x;
    v84.f64[1] = y;
    float32x2_t v85 = vcvt_f32_f64(v84);
    if (v73)
    {
      float64x2_t v86 = vcvtq_f64_f32(v85);
      v87 = (float32x2_t *)(v82 + 20);
      unsigned int v88 = v73;
      do
      {
        float64x2_t *v81 = vaddq_f64(*v81, v86);
        v81 += 2;
        *(float32x2_t *)&long long v89 = vadd_f32(*v87, v85);
        *((void *)&v89 + 1) = vextq_s8(*(int8x16_t *)v87->f32, *(int8x16_t *)v87->f32, 8uLL).u64[0];
        *(_OWORD *)v87->f32 = v89;
        v87 += 20;
        *(double *)uint64_t v83 = *(double *)v83 + v86.f64[0];
        *(double *)(v83 + 20) = *(double *)(v83 + 20) + v86.f64[1];
        *(float *)(v83 + 196) = *(float *)(v83 + 196) + v85.f32[0];
        *(float *)(v83 + 208) = *(float *)(v83 + 208) + v85.f32[1];
        v83 += 307;
        --v88;
      }
      while (v88);
    }
    float32x2_t v244 = v85;
    uint64_t v90 = v238->_numberOfProlongatedSprites;
    id v91 = v233;
    uint64_t v92 = [v91 geometries];
    uint64_t v93 = [v91 styles];
    if (v90)
    {
      uint64_t v94 = v73 - v90;
      v95 = (float64x2_t *)(v92 + 32 * v94);
      float64x2_t v96 = vcvtq_f64_f32(v244);
      v97 = (float32x2_t *)(v93 + 160 * v94 + 20);
      do
      {
        float64x2_t *v95 = vaddq_f64(*v95, v96);
        v95 += 2;
        *(float32x2_t *)&long long v98 = vadd_f32(*v97, v244);
        *((void *)&v98 + 1) = vextq_s8(*(int8x16_t *)v97->f32, *(int8x16_t *)v97->f32, 8uLL).u64[0];
        *(_OWORD *)v97->f32 = v98;
        v97 += 20;
        --v90;
      }
      while (v90);
    }
    v99 = v79;
    kdebug_trace();
  }
  v100 = v74;
  kdebug_trace();

  unsigned int v101 = [v234 count];
  id v102 = v233;
  v103 = (void *)[v102 entities];
  id v104 = v234;
  memcpy(v103, (const void *)[v104 entities], 4 * v101);
  id v105 = v102;
  v106 = (void *)[v105 geometries];
  id v107 = v104;
  uint64_t v108 = v101;
  memcpy(v106, (const void *)[v107 geometries], 32 * v101);
  id v109 = v105;
  v110 = (void *)[v109 styles];
  id v111 = v107;
  memcpy(v110, (const void *)[v111 styles], 160 * v108);
  id v245 = v109;
  memcpy((void *)[v245 infos], (const void *)objc_msgSend(v111, "infos"), 40 * v108);
  v112 = v100;
  kdebug_trace();

  v113 = v112;
  kdebug_trace();

  [(PXGAnimationDataStore *)v238->_animationDataStore setMappedAnimationCount:0];
  [(PXGAnimationDataStore *)v238->_animationDataStore setMappedAnimationCount:2 * (v235 & 0x7FFF)];
  uint64_t v114 = [(PXGAnimationDataStore *)v238->_animationDataStore groupIndexByAnimationIndex];
  [v113 speed];
  double v116 = v115;
  UIAnimationDragCoefficient();
  v264[0] = MEMORY[0x1E4F143A8];
  v264[1] = 3221225472;
  v264[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_9;
  v264[3] = &unk_1E5DAF440;
  double v268 = x;
  double v269 = y;
  double v270 = v116 * v117;
  double v271 = a3;
  obuint64_t j = v250;
  id v265 = obj;
  v266 = v113;
  id v231 = v78;
  id v267 = v231;
  uint64_t v272 = v114;
  [v249 enumerateKeysAndObjectsUsingBlock:v264];
  v118 = [(PXGAnimationDataStore *)v238->_animationDataStore activeGroupIndexes];
  if ([v118 count]) {
    objc_msgSend(v113[5], "setCount:", objc_msgSend(v118, "lastIndex") + 1);
  }
  v119 = v113;
  kdebug_trace();
  id v241 = v118;

  uint64_t v120 = [(PXGAnimationDataStore *)v238->_animationDataStore groupInfos];
  v121 = v119;
  kdebug_trace();

  if (v235)
  {
    [v121[5] removeAllIndexes];
    uint64_t v228 = [v121[5] indexSetReferences];
    id v122 = v245;
    uint64_t v123 = [v122 entities];
    id v124 = v122;
    uint64_t v224 = [v124 geometries];
    id v125 = v124;
    uint64_t v219 = [v125 styles];
    uint64_t v218 = [v125 infos];
    id v126 = v236;
    uint64_t v217 = [v126 entities];
    id v127 = v126;
    uint64_t v128 = [v127 geometries];
    id v129 = v127;
    uint64_t v130 = [v129 styles];
    uint64_t v131 = [v129 infos];
    v132 = [p_b[5] insertedSpriteIndexes];
    v259[0] = MEMORY[0x1E4F143A8];
    v259[1] = 3221225472;
    v259[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_11;
    v259[3] = &__block_descriptor_120_e24_v32__0__NSRange_QQ_8_B24l;
    v259[4] = v217;
    v259[5] = v123;
    v259[6] = v128;
    v259[7] = v224;
    v259[8] = v130;
    v259[9] = v219;
    v259[10] = v131;
    v259[11] = v218;
    v259[12] = v114;
    v259[13] = v248;
    v259[14] = v228;
    [v132 enumerateRangesUsingBlock:v259];

    v258[0] = MEMORY[0x1E4F143A8];
    v258[1] = 3221225472;
    v258[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_12;
    v258[3] = &unk_1E5DAF488;
    v258[6] = v228;
    v258[7] = v128;
    v258[8] = v130;
    v258[9] = v131;
    v258[10] = v224;
    v258[11] = v219;
    v258[12] = v218;
    v258[4] = v121;
    v258[5] = v120;
    [v241 enumerateIndexesUsingBlock:v258];
  }
  else
  {
    v133 = [p_b[5] insertedSpriteIndexes];
    v260[0] = MEMORY[0x1E4F143A8];
    v260[1] = 3221225472;
    v260[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_10;
    v260[3] = &unk_1E5DB06D8;
    id v261 = v245;
    id v262 = v236;
    v263 = v121;
    [v133 enumerateRangesUsingBlock:v260];
  }
  v134 = v121;
  kdebug_trace();

  if (v240)
  {
    v135 = v134;
    kdebug_trace();

    [v135[5] removeAllIndexes];
    uint64_t v136 = [v135[5] indexSetReferences];
    uint64_t v137 = [p_b[5] spriteIndexAfterChangeBySpriteIndexBeforeChange];
    id v138 = [p_b[5] inverse];
    uint64_t v139 = [v138 spriteIndexAfterChangeBySpriteIndexBeforeChange];

    if (!v137)
    {
      v213 = [MEMORY[0x1E4F28B00] currentHandler];
      [v213 handleFailureInMethod:a2 object:v135 file:@"PXGAnimator.m" lineNumber:823 description:@"missing forward sprite index map"];
    }
    if (!v139)
    {
      v214 = [MEMORY[0x1E4F28B00] currentHandler];
      [v214 handleFailureInMethod:a2 object:v135 file:@"PXGAnimator.m" lineNumber:824 description:@"missing reverse sprite index map"];
    }
    v229 = v134;
    uint64_t v140 = v137;
    uint64_t v141 = v240;
    v142 = [(PXGAnimationDataStore *)v238->_animationDataStore spriteInfos]
         + 307 * v65
         + 306;
    uint64_t v143 = v248;
    do
    {
      *v142 |= 1u;
      [*(id *)(v136 + 8 * *(unsigned __int16 *)(v114 + 2 * *(unsigned __int16 *)(v143 + 2 * v65))) addIndex:*(unsigned int *)(v139 + 4 * v65)];
      LODWORD(v65) = v65 + 1;
      v142 += 307;
      --v141;
      uint64_t v143 = v248;
    }
    while (v141);
    v253[0] = MEMORY[0x1E4F143A8];
    v253[1] = 3221225472;
    v253[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14;
    v253[3] = &unk_1E5DAF4D8;
    uint64_t v255 = v120;
    uint64_t v256 = v136;
    uint64_t v257 = v140;
    id v254 = v245;
    [v241 enumerateIndexesUsingBlock:v253];
    v144 = v135;
    kdebug_trace();

    v134 = v229;
  }
  if (v235)
  {
    v145 = v134;
    kdebug_trace();

    id v146 = v236;
    uint64_t v147 = [v146 geometries];
    uint64_t v148 = [v146 styles];
    id v149 = v245;
    uint64_t v150 = [v149 geometries];
    uint64_t v151 = [v149 styles];
    uint64_t v152 = [(PXGAnimationDataStore *)v238->_animationDataStore spriteInfos];
    uint64_t v153 = v248;
    if (v73)
    {
      uint64_t v154 = 0;
      do
      {
        if (*(double *)v150 == *(double *)v152)
        {
          double v155 = *(double *)(v152 + 20);
          if (*(double *)(v150 + 8) == v155 && *(double *)(v150 + 16) == *(float *)(v152 + 40))
          {
            uint64_t v156 = *(void *)(v150 + 24);
            if (*(float *)&v156 == *(float *)(v152 + 52)
              && *((float *)&v156 + 1) == *(float *)(v152 + 64)
              && *(float *)v151 == *(float *)(v152 + 76)
              && *(float *)(v151 + 56) == *(float *)(v152 + 88)
              && *(float *)(v151 + 60) == *(float *)(v152 + 100)
              && *(float *)(v151 + 64) == *(float *)(v152 + 112))
            {
              uint64_t v157 = *(void *)(v151 + 72);
              if (*(float *)&v157 == *(float *)(v152 + 124) && *((float *)&v157 + 1) == *(float *)(v152 + 136))
              {
                long long v158 = *(_OWORD *)(v151 + 4);
                if (*(float *)&v158 == *(float *)(v152 + 148))
                {
                  if (*((float *)&v158 + 1) == *(float *)(v152 + 160)
                    && *((float *)&v158 + 2) == *(float *)(v152 + 172)
                    && *((float *)&v158 + 3) == *(float *)(v152 + 184)
                    && (long long v159 = *(_OWORD *)(v151 + 20), *(float *)&v159 == *(float *)(v152 + 196))
                    && *((float *)&v159 + 1) == *(float *)(v152 + 208)
                    && *((float *)&v159 + 2) == *(float *)(v152 + 220)
                    && *((float *)&v159 + 3) == *(float *)(v152 + 232)
                    && *(float *)(v151 + 36) == *(float *)(v152 + 244)
                    && *(float *)(v151 + 40) == *(float *)(v152 + 256)
                    && *(float *)(v151 + 44) == *(float *)(v152 + 268)
                    && *(float *)(v151 + 48) == *(float *)(v152 + 280))
                  {
                    uint64_t v153 = v248;
                    if (*(float *)(v151 + 80) == *(float *)(v152 + 292)) {
                      goto LABEL_132;
                    }
                  }
                  else
                  {
                    uint64_t v153 = v248;
                  }
                }
              }
            }
          }
        }
        else
        {
          double v155 = *(double *)(v152 + 20);
        }
        v160 = (float *)(v120 + 76 * *(unsigned __int16 *)(v152 + 304));
        float v161 = v160[6];
        float v162 = v160[9];
        float v163 = v160[10];
        *(double *)uint64_t v147 = *(double *)v152
                        + v162 * *(double *)(v152 + 8)
                        + (float)(v163 * *(float *)(v152 + 16))
                        + v161 * *(double *)(v152 + 8);
        *(double *)(v147 + 8) = v155
                              + v162 * *(double *)(v152 + 28)
                              + (float)(v163 * *(float *)(v152 + 36))
                              + v161 * *(double *)(v152 + 28);
        *(double *)(v147 + 16) = (float)((float)((float)(*(float *)(v152 + 40) + (float)(v162 * *(float *)(v152 + 44)))
                                               + (float)(v163 * *(float *)(v152 + 48)))
                                       + (float)(v161 * *(float *)(v152 + 44)));
        *(float *)&uint64_t v164 = (float)((float)(*(float *)(v152 + 52) + (float)(v162 * *(float *)(v152 + 56)))
                                + (float)(v163 * *(float *)(v152 + 60)))
                        + (float)(v161 * *(float *)(v152 + 56));
        *(_DWORD *)(v147 + 24) = v164;
        *((float *)&v164 + 1) = (float)((float)(*(float *)(v152 + 64) + (float)(v160[9] * *(float *)(v152 + 68)))
                                      + (float)(v160[10] * *(float *)(v152 + 72)))
                              + (float)(v161 * *(float *)(v152 + 68));
        *(void *)(v147 + 24) = v164;
        float v165 = v160[9];
        float v166 = v160[10];
        *(float *)uint64_t v148 = (float)((float)(*(float *)(v152 + 76) + (float)(v165 * *(float *)(v152 + 80)))
                               + (float)(v166 * *(float *)(v152 + 84)))
                       + (float)(v161 * *(float *)(v152 + 80));
        *(float *)(v148 + 56) = (float)((float)(*(float *)(v152 + 88) + (float)(v165 * *(float *)(v152 + 92)))
                                      + (float)(v166 * *(float *)(v152 + 96)))
                              + (float)(v161 * *(float *)(v152 + 92));
        *(float *)(v148 + 60) = (float)((float)(*(float *)(v152 + 100) + (float)(v165 * *(float *)(v152 + 104)))
                                      + (float)(v166 * *(float *)(v152 + 108)))
                              + (float)(v161 * *(float *)(v152 + 104));
        *(float *)(v148 + 64) = (float)((float)(*(float *)(v152 + 112) + (float)(v165 * *(float *)(v152 + 116)))
                                      + (float)(v166 * *(float *)(v152 + 120)))
                              + (float)(v161 * *(float *)(v152 + 116));
        *(float *)&uint64_t v164 = (float)((float)(*(float *)(v152 + 124) + (float)(v165 * *(float *)(v152 + 128)))
                                + (float)(v166 * *(float *)(v152 + 132)))
                        + (float)(v161 * *(float *)(v152 + 128));
        *(_DWORD *)(v148 + 72) = v164;
        *((float *)&v164 + 1) = (float)((float)(*(float *)(v152 + 136) + (float)(v160[9] * *(float *)(v152 + 140)))
                                      + (float)(v160[10] * *(float *)(v152 + 144)))
                              + (float)(v161 * *(float *)(v152 + 140));
        *(void *)(v148 + 72) = v164;
        long long v167 = *(_OWORD *)(v148 + 4);
        *(float *)&long long v167 = (float)((float)(*(float *)(v152 + 148) + (float)(v160[9] * *(float *)(v152 + 152)))
                                + (float)(v160[10] * *(float *)(v152 + 156)))
                        + (float)(v161 * *(float *)(v152 + 152));
        *(_DWORD *)(v148 + 4) = v167;
        *((float *)&v167 + 1) = (float)((float)(*(float *)(v152 + 160) + (float)(v160[9] * *(float *)(v152 + 164)))
                                      + (float)(v160[10] * *(float *)(v152 + 168)))
                              + (float)(v161 * *(float *)(v152 + 164));
        *(_OWORD *)(v148 + 4) = v167;
        *((float *)&v167 + 2) = (float)((float)(*(float *)(v152 + 172) + (float)(v160[9] * *(float *)(v152 + 176)))
                                      + (float)(v160[10] * *(float *)(v152 + 180)))
                              + (float)(v161 * *(float *)(v152 + 176));
        *(_OWORD *)(v148 + 4) = v167;
        *((float *)&v167 + 3) = (float)((float)(*(float *)(v152 + 184) + (float)(v160[9] * *(float *)(v152 + 188)))
                                      + (float)(v160[10] * *(float *)(v152 + 192)))
                              + (float)(v161 * *(float *)(v152 + 188));
        *(_OWORD *)(v148 + 4) = v167;
        long long v168 = *(_OWORD *)(v148 + 20);
        *(float *)&long long v168 = (float)((float)(*(float *)(v152 + 196) + (float)(v160[9] * *(float *)(v152 + 200)))
                                + (float)(v160[10] * *(float *)(v152 + 204)))
                        + (float)(v161 * *(float *)(v152 + 200));
        *(_DWORD *)(v148 + 20) = v168;
        *((float *)&v168 + 1) = (float)((float)(*(float *)(v152 + 208) + (float)(v160[9] * *(float *)(v152 + 212)))
                                      + (float)(v160[10] * *(float *)(v152 + 216)))
                              + (float)(v161 * *(float *)(v152 + 212));
        *(_OWORD *)(v148 + 20) = v168;
        *((float *)&v168 + 2) = (float)((float)(*(float *)(v152 + 220) + (float)(v160[9] * *(float *)(v152 + 224)))
                                      + (float)(v160[10] * *(float *)(v152 + 228)))
                              + (float)(v161 * *(float *)(v152 + 224));
        *(_OWORD *)(v148 + 20) = v168;
        *((float *)&v168 + 3) = (float)((float)(*(float *)(v152 + 232) + (float)(v160[9] * *(float *)(v152 + 236)))
                                      + (float)(v160[10] * *(float *)(v152 + 240)))
                              + (float)(v161 * *(float *)(v152 + 236));
        *(_OWORD *)(v148 + 20) = v168;
        *(float *)(v148 + 36) = (float)((float)(*(float *)(v152 + 244) + (float)(v160[9] * *(float *)(v152 + 248)))
                                      + (float)(v160[10] * *(float *)(v152 + 252)))
                              + (float)(v161 * *(float *)(v152 + 248));
        *(float *)(v148 + 40) = (float)((float)(*(float *)(v152 + 256) + (float)(v160[9] * *(float *)(v152 + 260)))
                                      + (float)(v160[10] * *(float *)(v152 + 264)))
                              + (float)(v161 * *(float *)(v152 + 260));
        *(float *)(v148 + 44) = (float)((float)(*(float *)(v152 + 268) + (float)(v160[9] * *(float *)(v152 + 272)))
                                      + (float)(v160[10] * *(float *)(v152 + 276)))
                              + (float)(v161 * *(float *)(v152 + 272));
        *(float *)(v148 + 48) = (float)((float)(*(float *)(v152 + 280) + (float)(v160[9] * *(float *)(v152 + 284)))
                                      + (float)(v160[10] * *(float *)(v152 + 288)))
                              + (float)(v161 * *(float *)(v152 + 284));
        *(float *)(v148 + 80) = (float)((float)(*(float *)(v152 + 292) + (float)(v160[9] * *(float *)(v152 + 296)))
                                      + (float)(v160[10] * *(float *)(v152 + 300)))
                              + (float)(v161 * *(float *)(v152 + 296));
        double v169 = *(double *)v147 - *(double *)v150;
        *(void *)uint64_t v152 = *(void *)v150;
        *(double *)(v152 + 8) = v169;
        *(_DWORD *)(v152 + 16) = 0;
        double v170 = *(double *)(v147 + 8);
        double v171 = *(double *)(v150 + 8);
        *(double *)(v152 + 20) = v171;
        *(double *)(v152 + 28) = v170 - v171;
        *(_DWORD *)(v152 + 36) = 0;
        *(float *)&double v170 = *(double *)(v147 + 16);
        *(float *)&double v171 = *(double *)(v150 + 16);
        *(_DWORD *)(v152 + 40) = LODWORD(v171);
        *(float *)(v152 + 44) = *(float *)&v170 - *(float *)&v171;
        *(_DWORD *)(v152 + 48) = 0;
        uint64_t v172 = *(void *)(v150 + 24);
        *(float *)&double v170 = COERCE_FLOAT(*(void *)(v147 + 24)) - *(float *)&v172;
        *(_DWORD *)(v152 + 52) = v172;
        *(_DWORD *)(v152 + 56) = LODWORD(v170);
        *(_DWORD *)(v152 + 60) = 0;
        LODWORD(v172) = *(_DWORD *)(v150 + 28);
        *(float *)&double v170 = *(float *)(v147 + 28) - *(float *)&v172;
        *(_DWORD *)(v152 + 64) = v172;
        *(_DWORD *)(v152 + 68) = LODWORD(v170);
        *(_DWORD *)(v152 + 72) = 0;
        *(float *)&double v170 = *(float *)v148 - *(float *)v151;
        *(_DWORD *)(v152 + 76) = *(_DWORD *)v151;
        *(_DWORD *)(v152 + 80) = LODWORD(v170);
        *(_DWORD *)(v152 + 84) = 0;
        LODWORD(v172) = *(_DWORD *)(v151 + 56);
        *(float *)&double v170 = *(float *)(v148 + 56) - *(float *)&v172;
        *(_DWORD *)(v152 + 88) = v172;
        *(_DWORD *)(v152 + 92) = LODWORD(v170);
        *(_DWORD *)(v152 + 96) = 0;
        LODWORD(v172) = *(_DWORD *)(v151 + 60);
        *(float *)&double v170 = *(float *)(v148 + 60) - *(float *)&v172;
        *(_DWORD *)(v152 + 100) = v172;
        *(_DWORD *)(v152 + 104) = LODWORD(v170);
        *(_DWORD *)(v152 + 108) = 0;
        LODWORD(v172) = *(_DWORD *)(v151 + 64);
        *(float *)&double v170 = *(float *)(v148 + 64) - *(float *)&v172;
        *(_DWORD *)(v152 + 112) = v172;
        *(_DWORD *)(v152 + 116) = LODWORD(v170);
        *(_DWORD *)(v152 + 120) = 0;
        LODWORD(v170) = *(_DWORD *)(v151 + 4);
        *(float *)&uint64_t v172 = *(float *)(v148 + 4) - *(float *)&v170;
        *(_DWORD *)(v152 + 148) = LODWORD(v170);
        *(_DWORD *)(v152 + 152) = v172;
        *(_DWORD *)(v152 + 156) = 0;
        uint64_t v173 = *(void *)(v148 + 72);
        uint64_t v174 = *(void *)(v151 + 72);
        *(_DWORD *)(v152 + 124) = v174;
        *(float *)(v152 + 128) = *(float *)&v173 - *(float *)&v174;
        *(_DWORD *)(v152 + 132) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 76);
        *(float *)&uint64_t v173 = *(float *)(v148 + 76) - *(float *)&v174;
        *(_DWORD *)(v152 + 136) = v174;
        *(_DWORD *)(v152 + 140) = v173;
        *(_DWORD *)(v152 + 144) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 8);
        *(float *)&uint64_t v173 = *(float *)(v148 + 8) - *(float *)&v174;
        *(_DWORD *)(v152 + 160) = v174;
        *(_DWORD *)(v152 + 164) = v173;
        *(_DWORD *)(v152 + 168) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 12);
        *(float *)&uint64_t v173 = *(float *)(v148 + 12) - *(float *)&v174;
        *(_DWORD *)(v152 + 172) = v174;
        *(_DWORD *)(v152 + 176) = v173;
        *(_DWORD *)(v152 + 180) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 16);
        *(float *)&uint64_t v173 = *(float *)(v148 + 16) - *(float *)&v174;
        *(_DWORD *)(v152 + 184) = v174;
        *(_DWORD *)(v152 + 188) = v173;
        *(_DWORD *)(v152 + 192) = 0;
        LODWORD(v173) = *(_DWORD *)(v151 + 20);
        *(float *)&uint64_t v174 = *(float *)(v148 + 20) - *(float *)&v173;
        *(_DWORD *)(v152 + 196) = v173;
        *(_DWORD *)(v152 + 200) = v174;
        *(_DWORD *)(v152 + 204) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 24);
        *(float *)&uint64_t v173 = *(float *)(v148 + 24) - *(float *)&v174;
        *(_DWORD *)(v152 + 208) = v174;
        *(_DWORD *)(v152 + 212) = v173;
        *(_DWORD *)(v152 + 216) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 28);
        *(float *)&uint64_t v173 = *(float *)(v148 + 28) - *(float *)&v174;
        *(_DWORD *)(v152 + 220) = v174;
        *(_DWORD *)(v152 + 224) = v173;
        *(_DWORD *)(v152 + 228) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 32);
        *(float *)&uint64_t v173 = *(float *)(v148 + 32) - *(float *)&v174;
        *(_DWORD *)(v152 + 232) = v174;
        *(_DWORD *)(v152 + 236) = v173;
        *(_DWORD *)(v152 + 240) = 0;
        LODWORD(v174) = *(_DWORD *)(v151 + 36);
        *(float *)&uint64_t v173 = *(float *)(v148 + 36) - *(float *)&v174;
        *(_DWORD *)(v152 + 244) = v174;
        *(_DWORD *)(v152 + 248) = v173;
        *(_DWORD *)(v152 + 252) = 0;
        LODWORD(v173) = *(_DWORD *)(v148 + 40);
        LODWORD(v174) = *(_DWORD *)(v151 + 40);
        *(_DWORD *)(v152 + 256) = v174;
        *(float *)(v152 + 260) = *(float *)&v173 - *(float *)&v174;
        *(_DWORD *)(v152 + 264) = 0;
        LODWORD(v173) = *(_DWORD *)(v148 + 44);
        LODWORD(v174) = *(_DWORD *)(v151 + 44);
        *(_DWORD *)(v152 + 268) = v174;
        *(float *)(v152 + 272) = *(float *)&v173 - *(float *)&v174;
        *(_DWORD *)(v152 + 276) = 0;
        LODWORD(v173) = *(_DWORD *)(v148 + 48);
        LODWORD(v174) = *(_DWORD *)(v151 + 48);
        *(_DWORD *)(v152 + 280) = v174;
        *(float *)(v152 + 284) = *(float *)&v173 - *(float *)&v174;
        *(_DWORD *)(v152 + 288) = 0;
        LODWORD(v173) = *(_DWORD *)(v148 + 80);
        LODWORD(v174) = *(_DWORD *)(v151 + 80);
        *(_DWORD *)(v152 + 292) = v174;
        *(float *)(v152 + 296) = *(float *)&v173 - *(float *)&v174;
        *(_DWORD *)(v152 + 300) = 0;
        *(_WORD *)(v152 + 304) = *(_WORD *)(v114 + 2 * *(unsigned __int16 *)(v153 + 2 * v154));
LABEL_132:
        ++v154;
        v147 += 32;
        v148 += 160;
        v150 += 32;
        v151 += 160;
        v152 += 307;
      }
      while (v154 != v73);
    }
    v175 = v145;
    kdebug_trace();
  }
  v176 = v134;
  kdebug_trace();

  id v177 = v236;
  uint64_t v178 = [v177 geometries];
  id v179 = v177;
  uint64_t v180 = [v179 styles];
  id v181 = v245;
  uint64_t v182 = [v181 geometries];
  id v183 = v181;
  uint64_t v184 = [v183 styles];
  uint64_t v185 = [(PXGAnimationDataStore *)v238->_animationDataStore spriteInfos];
  if (v73)
  {
    unsigned int v186 = v73;
    do
    {
      double v187 = *(double *)v182;
      *(void *)uint64_t v185 = *(void *)v182;
      double v188 = *(double *)(v182 + 8);
      *(double *)(v185 + 20) = v188;
      float v189 = *(double *)(v182 + 16);
      *(float *)(v185 + 40) = v189;
      uint64_t v190 = *(void *)(v182 + 24);
      *(_DWORD *)(v185 + 52) = v190;
      *(_DWORD *)(v185 + 64) = *(_DWORD *)(v182 + 28);
      *(_DWORD *)(v185 + 76) = *(_DWORD *)v184;
      *(_DWORD *)(v185 + 88) = *(_DWORD *)(v184 + 56);
      *(_DWORD *)(v185 + 100) = *(_DWORD *)(v184 + 60);
      *(_DWORD *)(v185 + 112) = *(_DWORD *)(v184 + 64);
      *(_DWORD *)(v185 + 124) = *(void *)(v184 + 72);
      *(_DWORD *)(v185 + 136) = *(_DWORD *)(v184 + 76);
      *(_DWORD *)(v185 + 148) = *(_DWORD *)(v184 + 4);
      *(_DWORD *)(v185 + 160) = *(_DWORD *)(v184 + 8);
      *(_DWORD *)(v185 + 172) = *(_DWORD *)(v184 + 12);
      *(_DWORD *)(v185 + 184) = *(_DWORD *)(v184 + 16);
      *(_DWORD *)(v185 + 196) = *(_DWORD *)(v184 + 20);
      *(_DWORD *)(v185 + 208) = *(_DWORD *)(v184 + 24);
      *(_DWORD *)(v185 + 220) = *(_DWORD *)(v184 + 28);
      *(_DWORD *)(v185 + 232) = *(_DWORD *)(v184 + 32);
      *(_DWORD *)(v185 + 244) = *(_DWORD *)(v184 + 36);
      *(_DWORD *)(v185 + 256) = *(_DWORD *)(v184 + 40);
      *(_DWORD *)(v185 + 268) = *(_DWORD *)(v184 + 44);
      *(_DWORD *)(v185 + 280) = *(_DWORD *)(v184 + 48);
      *(_DWORD *)(v185 + 292) = *(_DWORD *)(v184 + 80);
      uint64_t v191 = v120 + 76 * *(unsigned __int16 *)(v185 + 304);
      float v192 = *(float *)(v191 + 36);
      float v193 = *(float *)(v191 + 40);
      double v194 = *(double *)(v185 + 8);
      double v195 = v187 + v192 * v194;
      LODWORD(v187) = *(_DWORD *)(v191 + 24);
      *(double *)uint64_t v178 = v195 + (float)(v193 * *(float *)(v185 + 16)) + *(float *)&v187 * v194;
      *(double *)(v178 + 8) = v188
                            + v192 * *(double *)(v185 + 28)
                            + (float)(v193 * *(float *)(v185 + 36))
                            + *(float *)&v187 * *(double *)(v185 + 28);
      *(double *)(v178 + 16) = (float)((float)((float)(v189 + (float)(v192 * *(float *)(v185 + 44)))
                                             + (float)(v193 * *(float *)(v185 + 48)))
                                     + (float)(*(float *)&v187 * *(float *)(v185 + 44)));
      *(float *)&uint64_t v190 = (float)((float)(*(float *)&v190 + (float)(v192 * *(float *)(v185 + 56)))
                              + (float)(v193 * *(float *)(v185 + 60)))
                      + (float)(*(float *)&v187 * *(float *)(v185 + 56));
      *(_DWORD *)(v178 + 24) = v190;
      *((float *)&v190 + 1) = (float)((float)(*(float *)(v185 + 64)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 68)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 72)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 68));
      *(void *)(v178 + 24) = v190;
      LODWORD(v188) = *(_DWORD *)(v191 + 36);
      float v196 = *(float *)(v191 + 40);
      *(float *)uint64_t v180 = (float)((float)(*(float *)(v185 + 76) + (float)(*(float *)&v188 * *(float *)(v185 + 80)))
                             + (float)(v196 * *(float *)(v185 + 84)))
                     + (float)(*(float *)&v187 * *(float *)(v185 + 80));
      *(float *)(v180 + 56) = (float)((float)(*(float *)(v185 + 88) + (float)(*(float *)&v188 * *(float *)(v185 + 92)))
                                    + (float)(v196 * *(float *)(v185 + 96)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 92));
      *(float *)(v180 + 60) = (float)((float)(*(float *)(v185 + 100) + (float)(*(float *)&v188 * *(float *)(v185 + 104)))
                                    + (float)(v196 * *(float *)(v185 + 108)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 104));
      *(float *)(v180 + 64) = (float)((float)(*(float *)(v185 + 112) + (float)(*(float *)&v188 * *(float *)(v185 + 116)))
                                    + (float)(v196 * *(float *)(v185 + 120)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 116));
      *(float *)&uint64_t v190 = (float)((float)(*(float *)(v185 + 124) + (float)(*(float *)&v188 * *(float *)(v185 + 128)))
                              + (float)(v196 * *(float *)(v185 + 132)))
                      + (float)(*(float *)&v187 * *(float *)(v185 + 128));
      *(_DWORD *)(v180 + 72) = v190;
      *((float *)&v190 + 1) = (float)((float)(*(float *)(v185 + 136)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 140)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 144)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 140));
      *(void *)(v180 + 72) = v190;
      long long v197 = *(_OWORD *)(v180 + 4);
      *(float *)&long long v197 = (float)((float)(*(float *)(v185 + 148) + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 152)))
                              + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 156)))
                      + (float)(*(float *)&v187 * *(float *)(v185 + 152));
      *(_DWORD *)(v180 + 4) = v197;
      *((float *)&v197 + 1) = (float)((float)(*(float *)(v185 + 160)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 164)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 168)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 164));
      *(_OWORD *)(v180 + 4) = v197;
      *((float *)&v197 + 2) = (float)((float)(*(float *)(v185 + 172)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 176)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 180)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 176));
      *(_OWORD *)(v180 + 4) = v197;
      *((float *)&v197 + 3) = (float)((float)(*(float *)(v185 + 184)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 188)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 192)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 188));
      *(_OWORD *)(v180 + 4) = v197;
      long long v198 = *(_OWORD *)(v180 + 20);
      *(float *)&long long v198 = (float)((float)(*(float *)(v185 + 196) + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 200)))
                              + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 204)))
                      + (float)(*(float *)&v187 * *(float *)(v185 + 200));
      *(_DWORD *)(v180 + 20) = v198;
      *((float *)&v198 + 1) = (float)((float)(*(float *)(v185 + 208)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 212)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 216)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 212));
      *(_OWORD *)(v180 + 20) = v198;
      *((float *)&v198 + 2) = (float)((float)(*(float *)(v185 + 220)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 224)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 228)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 224));
      *(_OWORD *)(v180 + 20) = v198;
      *((float *)&v198 + 3) = (float)((float)(*(float *)(v185 + 232)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 236)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 240)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 236));
      *(_OWORD *)(v180 + 20) = v198;
      *(float *)(v180 + 36) = (float)((float)(*(float *)(v185 + 244)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 248)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 252)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 248));
      *(float *)(v180 + 40) = (float)((float)(*(float *)(v185 + 256)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 260)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 264)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 260));
      *(float *)(v180 + 44) = (float)((float)(*(float *)(v185 + 268)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 272)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 276)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 272));
      *(float *)(v180 + 48) = (float)((float)(*(float *)(v185 + 280)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 284)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 288)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 284));
      *(float *)(v180 + 80) = (float)((float)(*(float *)(v185 + 292)
                                            + (float)(*(float *)(v191 + 36) * *(float *)(v185 + 296)))
                                    + (float)(*(float *)(v191 + 40) * *(float *)(v185 + 300)))
                            + (float)(*(float *)&v187 * *(float *)(v185 + 296));
      *(_DWORD *)(v180 + 52) = *(_DWORD *)(v184 + 52);
      long long v199 = *(_OWORD *)(v184 + 96);
      long long v200 = *(_OWORD *)(v184 + 112);
      long long v201 = *(_OWORD *)(v184 + 144);
      *(_OWORD *)(v180 + 128) = *(_OWORD *)(v184 + 128);
      *(_OWORD *)(v180 + 144) = v201;
      *(_OWORD *)(v180 + 96) = v199;
      *(_OWORD *)(v180 + 112) = v200;
      *(_WORD *)(v180 + 68) = *(_WORD *)(v184 + 68);
      v182 += 32;
      v185 += 307;
      *(unsigned char *)(v180 + 70) = *(unsigned char *)(v184 + 70);
      v184 += 160;
      v178 += 32;
      v180 += 160;
      --v186;
    }
    while (v186);
  }
  id v202 = v179;
  v203 = (void *)[v202 entities];
  id v204 = v183;
  memcpy(v203, (const void *)[v204 entities], 4 * v73);
  memcpy((void *)[v202 infos], (const void *)objc_msgSend(objc_retainAutorelease(v204), "infos"), 40 * v73);
  v205 = v176;
  kdebug_trace();

  if ([v247 count])
  {
    uint64_t v206 = [(PXGAnimationDataStore *)v238->_animationDataStore spriteInfos];
    v252[0] = MEMORY[0x1E4F143A8];
    v252[1] = 3221225472;
    v252[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_16;
    v252[3] = &unk_1E5DD3010;
    v252[4] = v205;
    [v247 enumerateIndexesUsingBlock:v252];
    if (v73)
    {
      v207 = (unsigned __int16 *)(v206 + 304);
      do
      {
        if ([v247 containsIndex:*v207]) {
          unsigned __int16 *v207 = 0;
        }
        v207 = (unsigned __int16 *)((char *)v207 + 307);
        --v73;
      }
      while (v73);
    }
    [(PXGAnimationDataStore *)v238->_animationDataStore checkInGroupAtIndexes:v247];
  }
  v208 = [(PXGAnimationDataStore *)v238->_animationDataStore activeGroupIndexes];
  if ([v208 count]) {
    BOOL v209 = 1;
  }
  else {
    BOOL v209 = v238->_numberOfProlongatedSprites != 0;
  }
  [v205 setAnimating:v209];

  [v205[2] setInputLayout:obj];
  *a11 = v205[2];

  _Block_object_dispose(&__b, 8);
  _Block_object_dispose(&v304, 8);

LABEL_151:
  [v251 enumerateObjectsUsingBlock:&__block_literal_global_52];
  [(PXGAnimator *)v237 setPreviousLayoutSnapshot:v225];
  v237->_double lastUpdateTime = a3;
}

- (void)setPreviousLayoutSnapshot:(id)a3
{
  v5 = (PXGLayoutSnapshot *)a3;
  previousLayoutSnapshot = self->_previousLayoutSnapshot;
  if (previousLayoutSnapshot != v5)
  {
    uint64_t v8 = v5;
    if (previousLayoutSnapshot)
    {
      v7 = [(PXGLayoutSnapshot *)previousLayoutSnapshot spriteDataStore];
      [(PXGAnimator *)self _returnForReuseSpriteDataStore:v7];

      [(PXGLayoutSnapshot *)self->_previousLayoutSnapshot releaseSpriteDataStore];
    }
    objc_storeStrong((id *)&self->_previousLayoutSnapshot, a3);
    v5 = v8;
  }
}

- (id)_dequeueSpriteDataStore
{
  v2 = [(NSMutableArray *)self->_reusableSnapshotSpriteDataStores px_popFirst];
  if (!v2) {
    v2 = (void *)[off_1E5DA6B40 newSpriteDataStore];
  }
  return v2;
}

- (id)_animationByAnimationIndexForAnimations:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 count];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __55__PXGAnimator__animationByAnimationIndexForAnimations___block_invoke;
  v12 = &unk_1E5DAF338;
  id v13 = v5;
  uint64_t v14 = v4;
  id v6 = v5;
  [v3 enumerateObjectsUsingBlock:&v9];

  v7 = objc_msgSend(v6, "copy", v9, v10, v11, v12);
  return v7;
}

- (void)_returnForReuseSpriteDataStore:(id)a3
{
  id v6 = a3;
  if (-[NSMutableArray containsObject:](self->_reusableSnapshotSpriteDataStores, "containsObject:"))
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2, self, @"PXGAnimator.m", 1068, @"Invalid parameter not satisfying: %@", @"![_reusableSnapshotSpriteDataStores containsObject:spriteDataStore]" object file lineNumber description];
  }
  [(NSMutableArray *)self->_reusableSnapshotSpriteDataStores addObject:v6];
}

- (PXGAnimator)init
{
  v12.receiver = self;
  v12.super_class = (Class)PXGAnimator;
  v2 = [(PXGAnimator *)&v12 init];
  if (v2)
  {
    id v3 = objc_alloc_init(PXGAnimationDataStore);
    animationDataStore = v2->_animationDataStore;
    v2->_animationDataStore = v3;

    id v5 = [[PXGAnimatorLayout alloc] initWithAnimator:v2];
    animatorLayout = v2->_animatorLayout;
    v2->_animatorLayout = v5;

    v7 = (PXGIndexSetArray *)objc_alloc_init((Class)off_1E5DA68D0);
    spriteIndexesByGroupIndedouble x = v2->_spriteIndexesByGroupIndex;
    v2->_spriteIndexesByGroupIndedouble x = v7;

    v2->_speed = 1.0;
    uint64_t v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    reusableSnapshotSpriteDataStores = v2->_reusableSnapshotSpriteDataStores;
    v2->_reusableSnapshotSpriteDataStores = v9;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayoutSnapshot, 0);
  objc_storeStrong((id *)&self->_reusableSnapshotSpriteDataStores, 0);
  objc_storeStrong((id *)&self->_oldAnimationPresentationSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_doubleSidedSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_spriteIndexesByGroupIndex, 0);
  objc_storeStrong((id *)&self->_animatorLayout, 0);
  objc_storeStrong((id *)&self->_animationDataStore, 0);
}

- (PXGLayoutSnapshot)previousLayoutSnapshot
{
  return self->_previousLayoutSnapshot;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (int64_t)computeCount
{
  return self->_computeCount;
}

- (double)speed
{
  return self->_speed;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void)setSpeed:(double)a3
{
  if (a3 <= 0.0)
  {
    id v3 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[PXGAnimator setSpeed:]"];
    [v3 handleFailureInFunction:v4, @"PXGAnimator.m", 1051, @"Invalid parameter not satisfying: %@", @"speed > 0" file lineNumber description];
  }
  PXFloatApproximatelyEqualToFloat();
}

- (void)_stopAllAnimations
{
  id v3 = [(PXGAnimationDataStore *)self->_animationDataStore activeGroupIndexes];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__PXGAnimator__stopAllAnimations__block_invoke;
  v4[3] = &unk_1E5DD3010;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];
}

uint64_t __33__PXGAnimator__stopAllAnimations__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) groupInfos];
  uint64_t v4 = result + 76 * a2;
  *(void *)(v4 + 8) = 0;
  *(void *)(v4 + 16) = 0;
  return result;
}

void __34__PXGAnimator_highFrameRateReason__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = *(id *)([*(id *)(*(void *)(a1 + 32) + 8) groupInfos] + 76 * a2 + 44);
  if ([v5 highFrameRateReason])
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 highFrameRateReason];
    *a3 = 1;
  }
}

void __36__PXGAnimator_hasCriticalAnimations__block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = objc_msgSend(*(id *)(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "groupInfos") + 76 * a2 + 44), "springAnimation");

  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
}

double __61__PXGAnimator_retargetAnimationsAfterStartTime_newStartTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) groupInfos] + 76 * a2;
  double v5 = *(double *)(v3 + 16);
  uint64_t v4 = (double *)(v3 + 16);
  double result = *(v4 - 1);
  if (v5 - result >= *(double *)(a1 + 40))
  {
    double result = result + *(double *)(a1 + 48);
    *uint64_t v4 = result;
  }
  return result;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setFromSnapshot:v3];
  [v4 setToSnapshot:*(void *)(a1 + 40)];
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3 == v2)
  {
    uint64_t v4 = [v3 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v3 == *(void **)(*(void *)(v2 + 8) + 40))
  {
    uint64_t v4 = [v3 copy];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isDoubleSided])
  {
    uint64_t v7 = [v5 integerValue];
    uint64_t v8 = *(void **)(a1 + 32);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_5;
    v49[3] = &__block_descriptor_48_e12_B24__0Q8_B16l;
    v49[4] = *(void *)(a1 + 80);
    v49[5] = v7;
    uint64_t v9 = [v8 indexesPassingTest:v49];
    uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 48);
    if (!v10)
    {
      uint64_t v11 = [off_1E5DA6B40 newSpriteDataStore];
      uint64_t v12 = *(void *)(a1 + 40);
      id v13 = *(void **)(v12 + 48);
      *(void *)(v12 + 48) = v11;

      uint64_t v10 = *(void **)(*(void *)(a1 + 40) + 48);
    }
    if (![v10 count])
    {
      uint64_t v14 = *(void **)(a1 + 48);
      if (v14)
      {
        [v14 sprites];
      }
      else
      {
        uint64_t v48 = 0;
        long long v46 = 0u;
        long long v47 = 0u;
      }
      v15 = *(void **)(*(void *)(a1 + 40) + 48);
      v44[0] = v46;
      v44[1] = v47;
      uint64_t v45 = v48;
      [v15 setSprites:v44];
      [*(id *)(*(void *)(a1 + 40) + 48) applyChangeDetails:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    }
    v16 = [v6 delegate];
    id v17 = objc_msgSend(v16, "animation:doubleSidedAnimatedSpriteIndexesForModifiedSpriteIndexes:rootLayout:presentedGeometries:styles:infos:", v6, v9, *(void *)(a1 + 56), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "geometries"), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "styles"), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 48), "infos"));

    v18 = objc_msgSend(v17, "px_intersectionWithIndexSet:", v9);

    if ([v18 count])
    {
      v19 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      if (!v19)
      {
        id v20 = objc_alloc_init(MEMORY[0x1E4F28E60]);
        uint64_t v21 = *(void *)(*(void *)(a1 + 72) + 8);
        uint64_t v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        v19 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      }
      [v19 addIndexes:v18];
    }
  }
  if ([v6 supportsPresentationAdjustment])
  {
    v23 = *(void **)(*(void *)(a1 + 40) + 56);
    if (!v23)
    {
      uint64_t v24 = [off_1E5DA6B40 newSpriteDataStore];
      uint64_t v25 = *(void *)(a1 + 40);
      v26 = *(void **)(v25 + 56);
      *(void *)(v25 + 56) = v24;

      v23 = *(void **)(*(void *)(a1 + 40) + 56);
    }
    if (![v23 count])
    {
      v27 = *(void **)(a1 + 48);
      if (v27)
      {
        [v27 sprites];
      }
      else
      {
        uint64_t v43 = 0;
        long long v41 = 0u;
        long long v42 = 0u;
      }
      v28 = *(void **)(*(void *)(a1 + 40) + 56);
      v39[0] = v41;
      v39[1] = v42;
      uint64_t v40 = v43;
      [v28 setSprites:v39];
    }
    uint64_t v29 = [*(id *)(a1 + 48) count];
    v30 = [v6 delegate];
    objc_msgSend(v30, "animation:adjustPresentedGeometries:styles:infos:count:", v6, objc_msgSend(*(id *)(a1 + 48), "geometries"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "styles"), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "infos"), v29);

    uint64_t v31 = [*(id *)(*(void *)(a1 + 40) + 56) geometries];
    uint64_t v32 = [*(id *)(*(void *)(a1 + 40) + 56) styles];
    uint64_t v33 = [*(id *)(a1 + 48) geometries];
    uint64_t v34 = [*(id *)(a1 + 48) styles];
    for (uint64_t i = [*(id *)(*(void *)(a1 + 40) + 8) spriteInfos]; v29; LODWORD(v29) = v29 - 1)
    {
      double v36 = *(double *)(v31 + 8);
      double v37 = *(double *)(v33 + 8);
      *(double *)uint64_t i = *(double *)v33 - *(double *)v31 + *(double *)i;
      *(double *)(i + 20) = v37 - v36 + *(double *)(i + 20);
      float v38 = *(double *)(v31 + 16);
      *(float *)&double v36 = *(double *)(v33 + 16);
      *(float *)(i + 40) = (float)(*(float *)&v36 - v38) + *(float *)(i + 40);
      *(float *)(i + 52) = (float)(COERCE_FLOAT(*(void *)(v33 + 24)) - COERCE_FLOAT(*(void *)(v31 + 24)))
                         + *(float *)(i + 52);
      *(float *)(i + 64) = (float)(*(float *)(v33 + 28) - *(float *)(v31 + 28)) + *(float *)(i + 64);
      *(float *)(i + 76) = (float)(*(float *)v34 - *(float *)v32) + *(float *)(i + 76);
      LODWORD(v36) = *(_DWORD *)(v32 + 60);
      LODWORD(v37) = *(_DWORD *)(v34 + 60);
      *(float *)(i + 88) = (float)(*(float *)(v34 + 56) - *(float *)(v32 + 56)) + *(float *)(i + 88);
      *(float *)(i + 100) = (float)(*(float *)&v37 - *(float *)&v36) + *(float *)(i + 100);
      *(float *)(i + 112) = (float)(*(float *)(v34 + 64) - *(float *)(v32 + 64)) + *(float *)(i + 112);
      *(float *)(i + 124) = (float)(COERCE_FLOAT(*(void *)(v34 + 72)) - COERCE_FLOAT(*(void *)(v32 + 72)))
                          + *(float *)(i + 124);
      LODWORD(v36) = *(_DWORD *)(v32 + 80);
      LODWORD(v37) = *(_DWORD *)(v34 + 80);
      *(float *)(i + 136) = (float)(*(float *)(v34 + 76) - *(float *)(v32 + 76)) + *(float *)(i + 136);
      *(float *)(i + 148) = (float)(*(float *)(v34 + 4) - *(float *)(v32 + 4)) + *(float *)(i + 148);
      *(float *)(i + 160) = (float)(*(float *)(v34 + 8) - *(float *)(v32 + 8)) + *(float *)(i + 160);
      *(float *)(i + 172) = (float)(*(float *)(v34 + 12) - *(float *)(v32 + 12)) + *(float *)(i + 172);
      *(float *)(i + 184) = (float)(*(float *)(v34 + 16) - *(float *)(v32 + 16)) + *(float *)(i + 184);
      *(float *)(i + 196) = (float)(*(float *)(v34 + 20) - *(float *)(v32 + 20)) + *(float *)(i + 196);
      *(float *)(i + 208) = (float)(*(float *)(v34 + 24) - *(float *)(v32 + 24)) + *(float *)(i + 208);
      *(float *)(i + 220) = (float)(*(float *)(v34 + 28) - *(float *)(v32 + 28)) + *(float *)(i + 220);
      *(float *)(i + 232) = (float)(*(float *)(v34 + 32) - *(float *)(v32 + 32)) + *(float *)(i + 232);
      *(float *)(i + 244) = (float)(*(float *)(v34 + 36) - *(float *)(v32 + 36)) + *(float *)(i + 244);
      *(float *)(i + 256) = (float)(*(float *)(v34 + 40) - *(float *)(v32 + 40)) + *(float *)(i + 256);
      *(float *)(i + 268) = (float)(*(float *)(v34 + 44) - *(float *)(v32 + 44)) + *(float *)(i + 268);
      *(float *)(i + 280) = (float)(*(float *)(v34 + 48) - *(float *)(v32 + 48)) + *(float *)(i + 280);
      v31 += 32;
      v33 += 32;
      *(float *)(i + 292) = (float)(*(float *)&v37 - *(float *)&v36) + *(float *)(i + 292);
      i += 307;
      v32 += 160;
      v34 += 160;
    }
  }
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_6(uint64_t result, uint64_t a2)
{
  *(_WORD *)(*(void *)(result + 40)
           + 2 * (*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24))++) = *(_WORD *)(*(void *)(result + 40) + 2 * a2);
  return result;
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_7(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 36) = 0;
  *(_DWORD *)(a2 + 40) = 0;
  id v4 = *(id *)(a2 + 52);
  id v5 = v4;
  if (!v4)
  {
    double v11 = *(double *)(a1 + 40) - *(double *)(a2 + 16);
    goto LABEL_18;
  }
  int v6 = [v4 isIntercative];
  int v7 = [v5 animatingTowardsFinalState];
  if (!v6)
  {
    if (v7)
    {
      double v11 = *(double *)(a1 + 40) - *(double *)(a2 + 16);
      if (v11 < 0.0) {
        goto LABEL_16;
      }
    }
    else
    {
      int v15 = [v5 animatingTowardsInitialState];
      double v10 = *(double *)(a2 + 16);
      if (!v15) {
        goto LABEL_14;
      }
      double v16 = *(double *)(a2 + 8);
      double v17 = v16 - (v10 - *(double *)(a1 + 40));
      double v11 = -v17;
      if (v17 < v16) {
        goto LABEL_16;
      }
    }
    [v5 invalidate];
    goto LABEL_16;
  }
  if (v7)
  {
    [v5 setIsIntercative:0];
    double v8 = *(double *)(a2 + 8);
    [v5 fractionCompleted];
    double v10 = *(double *)(a1 + 40) + v8 * (1.0 - v9);
    *(double *)(a2 + 16) = v10;
LABEL_14:
    double v11 = *(double *)(a1 + 40) - v10;
    goto LABEL_16;
  }
  if ([v5 animatingTowardsInitialState])
  {
    [v5 setIsIntercative:0];
    double v12 = *(double *)(a2 + 8);
    [v5 fractionCompleted];
    double v14 = *(double *)(a1 + 40) + v12 * v13;
    *(double *)(a2 + 16) = v14;
    double v11 = -(*(double *)(a2 + 8) - (v14 - *(double *)(a1 + 40)));
  }
  else
  {
    double v18 = *(double *)(a2 + 8);
    [v5 fractionCompleted];
    double v11 = -(v18 * (1.0 - v19));
  }
LABEL_16:
  if ([v5 invalid])
  {

    *(void *)(a2 + 52) = 0;
    *(void *)(a2 + 60) = [v5 completionBlock];
  }
LABEL_18:
  if (v11 < 0.0)
  {
    double v20 = *(double *)(a2 + 8);
    if (v20 > 0.0)
    {
      switch(*(void *)a2)
      {
        case 0:
          float v21 = -v11 / v20;
          goto LABEL_29;
        case 1:
          float v24 = v11 / v20 + 1.0;
          if (v24 >= 0.5) {
            double v25 = (v24 * -2.0 + 4.0) * v24 + -1.0;
          }
          else {
            double v25 = (v24 + v24) * v24;
          }
          float v26 = v25;
          float v21 = 1.0 - v26;
LABEL_29:
          *(float *)(a2 + 24) = v21;
          goto LABEL_30;
        case 2:
          float v23 = v11 + v20;
          PXGDampedSpringGroupParametersPrepareForTime((float *)(a2 + 28), v23);
          goto LABEL_30;
        case 3:
          id v28 = *(id *)(a2 + 44);
          uint64_t v29 = [v28 springAnimation];
          [v28 springAnimationInitialProgress];
          float v31 = v30;
          [v29 beginTime];
          if (v32 > 0.0)
          {
            [v29 beginTime];
            double v34 = v33;
            [v29 duration];
            double v36 = *(double *)(a1 + 40) - (v34 + v35);
            uint64_t v37 = [*(id *)(a1 + 32) preferredFramesPerSecond];
            double v38 = 0.0;
            if (v37 >= 2) {
              double v38 = 1.0 / (double)v37;
            }
            float v39 = (v36 + v38) / *(double *)(a2 + 8) + 1.0;
            [v28 springAnimationProgressMultiplier];
            float v31 = v40 * v39;
          }
          if (v31 > 0.0 && ([v28 springAnimationProgressMultiplier], v31 <= *(float *)&v41))
          {
            *(float *)&double v41 = v31;
            [v29 _solveForInput:v41];
            *(float *)(a2 + 24) = 1.0 - v42;
            uint64_t v22 = 1;
          }
          else
          {
            uint64_t v22 = 0;
          }

          if (v5) {
            goto LABEL_31;
          }
          goto LABEL_32;
        default:
LABEL_30:
          uint64_t v22 = 1;
          if (v5) {
            goto LABEL_31;
          }
          goto LABEL_32;
      }
    }
  }
  uint64_t v22 = 0;
  if (v5) {
LABEL_31:
  }
    uint64_t v22 = v22 | [v5 invalid] ^ 1;
LABEL_32:

  return v22;
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_8(void *a1, uint64_t a2)
{
  [*(id *)(a1[4] + 8) groupInfos];
  uint64_t result = (*(uint64_t (**)(void))(a1[6] + 16))();
  if ((result & 1) == 0)
  {
    id v5 = (void *)a1[5];
    return [v5 addIndex:a2];
  }
  return result;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  int v7 = [v5 delegate];
  objc_msgSend(v7, "animation:prepareWithRootLayout:viewportShift:", v5, *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));

  [v5 effectiveDuration];
  double v9 = v8 / *(double *)(a1 + 72);
  *(void *)&long long v19 = [v5 curve];
  *((double *)&v19 + 1) = v9;
  long long v21 = COERCE_UNSIGNED_INT64(v9 + *(double *)(a1 + 80));
  *(void *)uint64_t v22 = 0;
  *(_DWORD *)&v22[8] = 0;
  id v10 = v5;
  *(void *)&v22[12] = v10;
  *(void *)&v22[20] = [v10 transition];
  *(_OWORD *)&v22[28] = 0uLL;
  if ([v10 curve] == 2)
  {
    [v10 dampingRatio];
    float v12 = v11;
    [v10 duration];
    PXGDampedSpringGroupParametersConfigure((float *)&v21 + 3, [v10 numberOfOscillations], v12, v13 / *(double *)(a1 + 72));
  }
  unsigned int v14 = objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "checkOutGroup", v19, v21, *(_OWORD *)v22);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  int v15 = (_OWORD *)([*(id *)(*(void *)(a1 + 40) + 8) groupInfos] + 76 * v14);
  _OWORD *v15 = v20;
  long long v16 = v21;
  long long v17 = *(_OWORD *)v22;
  long long v18 = *(_OWORD *)&v22[16];
  *(_OWORD *)((char *)v15 + 60) = *(_OWORD *)&v22[28];
  v15[2] = v17;
  v15[3] = v18;
  v15[1] = v16;
  *(_WORD *)(*(void *)(a1 + 88) + 2 * v6) = v14;
}

float __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) entities];
  uint64_t v7 = [*(id *)(a1 + 32) geometries];
  uint64_t v8 = [*(id *)(a1 + 32) styles];
  uint64_t v9 = [*(id *)(a1 + 40) entities];
  uint64_t v10 = [*(id *)(a1 + 40) geometries];
  uint64_t v11 = [*(id *)(a1 + 40) styles];
  uint64_t v12 = [*(id *)(*(void *)(a1 + 48) + 8) spriteInfos];
  if (a3)
  {
    uint64_t v14 = 0;
    uint64_t v15 = v12 + 307 * a2;
    uint64_t v16 = v11 + 160 * a2;
    uint64_t v17 = v8 + 160 * a2;
    do
    {
      uint64_t v18 = v7 + 32 * a2 + 8 * v14;
      *(_DWORD *)(v9 + 4 * a2 + v14) = *(_DWORD *)(v6 + 4 * a2 + v14);
      long long v19 = *(_OWORD *)(v18 + 16);
      uint64_t v20 = v10 + 32 * a2 + 8 * v14;
      *(_OWORD *)uint64_t v20 = *(_OWORD *)v18;
      *(_OWORD *)(v20 + 16) = v19;
      long long v21 = *(_OWORD *)(v17 + 80);
      long long v23 = *(_OWORD *)(v17 + 32);
      long long v22 = *(_OWORD *)(v17 + 48);
      *(_OWORD *)(v16 + 64) = *(_OWORD *)(v17 + 64);
      *(_OWORD *)(v16 + 80) = v21;
      *(_OWORD *)(v16 + 32) = v23;
      *(_OWORD *)(v16 + 48) = v22;
      long long v24 = *(_OWORD *)(v17 + 144);
      long long v26 = *(_OWORD *)(v17 + 96);
      long long v25 = *(_OWORD *)(v17 + 112);
      *(_OWORD *)(v16 + 128) = *(_OWORD *)(v17 + 128);
      *(_OWORD *)(v16 + 144) = v24;
      *(_OWORD *)(v16 + 96) = v26;
      *(_OWORD *)(v16 + 112) = v25;
      long long v27 = *(_OWORD *)(v17 + 16);
      *(_OWORD *)uint64_t v16 = *(_OWORD *)v17;
      *(_OWORD *)(v16 + 16) = v27;
      *(void *)&long long v27 = *(void *)(v20 + 8);
      *(void *)&long long v25 = *(void *)v18;
      *(void *)&long long v26 = *(void *)(v18 + 8);
      double v28 = *(double *)v20 - *(double *)v18;
      *(_DWORD *)(v15 + 16) = 0;
      *(void *)uint64_t v15 = v25;
      *(double *)(v15 + 8) = v28;
      *(void *)(v15 + 20) = v26;
      double v29 = *(double *)&v27 - *(double *)&v26;
      *(_DWORD *)(v15 + 36) = 0;
      *(float *)&long long v27 = *(double *)(v20 + 16);
      *(double *)(v15 + 28) = v29;
      *(float *)&double v29 = *(double *)(v18 + 16);
      *(_DWORD *)(v15 + 48) = 0;
      *(_DWORD *)(v15 + 40) = LODWORD(v29);
      *(float *)(v15 + 44) = *(float *)&v27 - *(float *)&v29;
      *(void *)&long long v27 = *(void *)(v18 + 24);
      *(float *)&double v29 = COERCE_FLOAT(*(void *)(v20 + 24)) - *(float *)&v27;
      *(_DWORD *)(v15 + 60) = 0;
      *(_DWORD *)(v15 + 52) = v27;
      *(_DWORD *)(v15 + 56) = LODWORD(v29);
      LODWORD(v29) = *(_DWORD *)(v20 + 28);
      *(float *)&long long v27 = *(float *)v16 - *(float *)v17;
      float v30 = *(float *)(v16 + 60);
      float v31 = *(float *)(v18 + 28);
      float v32 = *(float *)(v17 + 56);
      float v33 = *(float *)(v17 + 60);
      *(float *)&long long v26 = *(float *)(v16 + 56) - v32;
      *(_DWORD *)(v15 + 76) = *(_DWORD *)v17;
      *(_DWORD *)(v15 + 80) = v27;
      *(float *)(v15 + 88) = v32;
      *(_DWORD *)(v15 + 92) = v26;
      *(_DWORD *)(v15 + 72) = 0;
      *(_DWORD *)(v15 + 84) = 0;
      *(_DWORD *)(v15 + 96) = 0;
      *(float *)(v15 + 100) = v33;
      *(float *)(v15 + 104) = v30 - v33;
      *(_DWORD *)(v15 + 108) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 64);
      *(float *)&long long v27 = *(float *)(v16 + 64) - *(float *)&v25;
      *(_DWORD *)(v15 + 112) = v25;
      *(_DWORD *)(v15 + 116) = v27;
      *(_DWORD *)(v15 + 120) = 0;
      *(float *)(v15 + 64) = v31;
      *(float *)(v15 + 68) = *(float *)&v29 - v31;
      LODWORD(v29) = *(_DWORD *)(v17 + 4);
      *(float *)&long long v27 = *(float *)(v16 + 4) - *(float *)&v29;
      *(_DWORD *)(v15 + 156) = 0;
      *(_DWORD *)(v15 + 148) = LODWORD(v29);
      *(_DWORD *)(v15 + 152) = v27;
      uint64_t v34 = *(void *)(v16 + 72);
      *(void *)&long long v27 = *(void *)(v17 + 72);
      *(_DWORD *)(v15 + 132) = 0;
      *(_DWORD *)(v15 + 124) = v27;
      *(float *)(v15 + 128) = *(float *)&v34 - *(float *)&v27;
      LODWORD(v27) = *(_DWORD *)(v16 + 80);
      LODWORD(v25) = *(_DWORD *)(v17 + 76);
      LODWORD(v26) = *(_DWORD *)(v17 + 80);
      *(float *)&uint64_t v34 = *(float *)(v16 + 76) - *(float *)&v25;
      *(_DWORD *)(v15 + 136) = v25;
      *(_DWORD *)(v15 + 140) = v34;
      *(_DWORD *)(v15 + 144) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 8);
      *(float *)&uint64_t v34 = *(float *)(v16 + 8) - *(float *)&v25;
      *(_DWORD *)(v15 + 160) = v25;
      *(_DWORD *)(v15 + 164) = v34;
      *(_DWORD *)(v15 + 168) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 12);
      *(float *)&uint64_t v34 = *(float *)(v16 + 12) - *(float *)&v25;
      *(_DWORD *)(v15 + 172) = v25;
      *(_DWORD *)(v15 + 176) = v34;
      *(_DWORD *)(v15 + 180) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 16);
      *(float *)&uint64_t v34 = *(float *)(v16 + 16) - *(float *)&v25;
      *(_DWORD *)(v15 + 184) = v25;
      *(_DWORD *)(v15 + 188) = v34;
      *(_DWORD *)(v15 + 192) = 0;
      LODWORD(v34) = *(_DWORD *)(v17 + 20);
      *(float *)&long long v25 = *(float *)(v16 + 20) - *(float *)&v34;
      *(_DWORD *)(v15 + 196) = v34;
      *(_DWORD *)(v15 + 200) = v25;
      *(_DWORD *)(v15 + 204) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 24);
      *(float *)&uint64_t v34 = *(float *)(v16 + 24) - *(float *)&v25;
      *(_DWORD *)(v15 + 208) = v25;
      *(_DWORD *)(v15 + 212) = v34;
      *(_DWORD *)(v15 + 216) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 28);
      *(float *)&uint64_t v34 = *(float *)(v16 + 28) - *(float *)&v25;
      *(_DWORD *)(v15 + 220) = v25;
      *(_DWORD *)(v15 + 224) = v34;
      *(_DWORD *)(v15 + 228) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 32);
      *(float *)&uint64_t v34 = *(float *)(v16 + 32) - *(float *)&v25;
      *(_DWORD *)(v15 + 232) = v25;
      *(_DWORD *)(v15 + 236) = v34;
      *(_DWORD *)(v15 + 240) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 36);
      *(float *)&uint64_t v34 = *(float *)(v16 + 36) - *(float *)&v25;
      *(_DWORD *)(v15 + 244) = v25;
      *(_DWORD *)(v15 + 248) = v34;
      *(_DWORD *)(v15 + 252) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 40);
      *(float *)&uint64_t v34 = *(float *)(v16 + 40) - *(float *)&v25;
      *(_DWORD *)(v15 + 256) = v25;
      *(_DWORD *)(v15 + 260) = v34;
      *(_DWORD *)(v15 + 264) = 0;
      LODWORD(v25) = *(_DWORD *)(v17 + 44);
      *(float *)&uint64_t v34 = *(float *)(v16 + 44) - *(float *)&v25;
      *(_DWORD *)(v15 + 268) = v25;
      *(_DWORD *)(v15 + 272) = v34;
      *(_DWORD *)(v15 + 276) = 0;
      LODWORD(v34) = *(_DWORD *)(v16 + 48);
      LODWORD(v25) = *(_DWORD *)(v17 + 48);
      *(_DWORD *)(v15 + 280) = v25;
      float result = *(float *)&v34 - *(float *)&v25;
      *(_DWORD *)(v15 + 288) = 0;
      *(_DWORD *)(v15 + 292) = v26;
      *(float *)(v15 + 296) = *(float *)&v27 - *(float *)&v26;
      v14 += 4;
      *(float *)(v15 + 284) = result;
      *(_DWORD *)(v15 + 300) = 0;
      *(_WORD *)(v15 + 304) = 0;
      v16 += 160;
      v17 += 160;
      v15 += 307;
      --a3;
    }
    while (a3);
  }
  return result;
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_11(uint64_t result, unsigned int a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    id v4 = (void *)result;
    do
    {
      *(_DWORD *)(v4[4] + 4 * a2) = *(_DWORD *)(v4[5] + 4 * a2);
      uint64_t v6 = (_OWORD *)(v4[6] + 32 * a2);
      uint64_t v7 = (_OWORD *)(v4[7] + 32 * a2);
      long long v8 = v7[1];
      *uint64_t v6 = *v7;
      v6[1] = v8;
      uint64_t v9 = (_OWORD *)(v4[8] + 160 * a2);
      uint64_t v10 = (_OWORD *)(v4[9] + 160 * a2);
      long long v11 = v10[5];
      long long v13 = v10[2];
      long long v12 = v10[3];
      v9[4] = v10[4];
      v9[5] = v11;
      v9[2] = v13;
      v9[3] = v12;
      long long v14 = v10[9];
      long long v16 = v10[6];
      long long v15 = v10[7];
      v9[8] = v10[8];
      v9[9] = v14;
      v9[6] = v16;
      v9[7] = v15;
      long long v17 = v10[1];
      *uint64_t v9 = *v10;
      v9[1] = v17;
      uint64_t v18 = v4[10] + 40 * a2;
      uint64_t v19 = v4[11] + 40 * a2;
      long long v20 = *(_OWORD *)v19;
      long long v21 = *(_OWORD *)(v19 + 16);
      *(void *)(v18 + 32) = *(void *)(v19 + 32);
      *(_OWORD *)uint64_t v18 = v20;
      *(_OWORD *)(v18 + 16) = v21;
      float result = objc_msgSend(*(id *)(v4[14] + 8 * *(unsigned __int16 *)(v4[12] + 2 * *(unsigned __int16 *)(v4[13] + 2 * a2++))), "addIndex:");
      --v3;
    }
    while (v3);
  }
  return result;
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_12(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(*(void *)(a1 + 40) + 76 * a2 + 44);
  id v5 = [v4 delegate];
  uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 8 * a2);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_13;
  v9[3] = &unk_1E5DC80B0;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v10 = v5;
  id v11 = v4;
  long long v14 = *(_OWORD *)(a1 + 72);
  long long v15 = *(_OWORD *)(a1 + 88);
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v16 = a2;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateRangesUsingBlock:v9];
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_14(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(*(void *)(a1 + 40) + 76 * a2 + 44);
  id v5 = [v4 delegate];
  uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 8 * a2);
  *(id *)(a1 + 32);
  id v7 = v4;
  id v8 = v5;
  id v9 = v6;
  PXGSpriteIndexesEnumerateRangesForPositions();
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_16(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) groupInfos] + 76 * a2;
  id v6 = *(id *)(v2 + 44);
  [v6 noteDidComplete];

  *(void *)(v2 + 52) = 0;
  *(void *)(v2 + 44) = 0;
  [v6 setDelegate:0];
  id v5 = *(void (***)(void))(v2 + 60);
  id v4 = (void *)(v2 + 60);
  uint64_t v3 = v5;
  if (v5)
  {
    v3[2](v3);
    *id v4 = 0;
  }
}

void __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_17(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setFromSnapshot:0];
  [v2 setToSnapshot:0];
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_15(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unint64_t v4 = a2 & 0xFFFFFFFF00000000 | a3;
  unsigned int v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) geometries] + 32 * a2;
  uint64_t v7 = [*(id *)(a1 + 32) styles] + 160 * v5;
  uint64_t v8 = [*(id *)(a1 + 32) infos] + 40 * v5;
  id v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);
  return [v9 animation:v10 adjustGeometries:v6 styles:v7 infos:v8 forSpriteDisappearingFromRootIndexRange:v4];
}

float __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_13(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v6 = *(void *)(a1 + 56) + 32 * a2;
  uint64_t v7 = *(void *)(a1 + 64) + 160 * a2;
  [*(id *)(a1 + 32) animation:*(void *)(a1 + 40) adjustGeometries:v6 styles:v7 infos:*(void *)(a1 + 72) + 40 * a2 forSpriteAppearingIntoRootIndexRange:a2 | ((unint64_t)a3 << 32)];
  uint64_t v8 = *(void *)(a1 + 80);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v10 = [*(id *)(*(void *)(a1 + 48) + 8) spriteInfos];
  if (v3)
  {
    uint64_t v12 = v10 + 307 * a2;
    uint64_t v13 = v9 + 160 * a2;
    uint64_t v14 = v8 + 32 * a2;
    do
    {
      double v15 = *(double *)(v6 + 8);
      double v16 = *(double *)(v14 + 8);
      double v17 = *(double *)v6 - *(double *)v14;
      *(void *)uint64_t v12 = *(void *)v14;
      *(double *)(v12 + 8) = v17;
      *(_DWORD *)(v12 + 16) = 0;
      *(double *)(v12 + 20) = v16;
      *(double *)(v12 + 28) = v15 - v16;
      *(_DWORD *)(v12 + 36) = 0;
      *(float *)&double v17 = *(double *)(v6 + 16);
      *(float *)&double v15 = *(double *)(v14 + 16);
      *(_DWORD *)(v12 + 40) = LODWORD(v15);
      *(float *)(v12 + 44) = *(float *)&v17 - *(float *)&v15;
      *(_DWORD *)(v12 + 48) = 0;
      uint64_t v18 = *(void *)(v14 + 24);
      *(float *)&double v17 = COERCE_FLOAT(*(void *)(v6 + 24)) - *(float *)&v18;
      *(_DWORD *)(v12 + 52) = v18;
      *(_DWORD *)(v12 + 56) = LODWORD(v17);
      *(_DWORD *)(v12 + 60) = 0;
      LODWORD(v18) = *(_DWORD *)(v14 + 28);
      *(float *)&double v17 = *(float *)(v6 + 28) - *(float *)&v18;
      *(_DWORD *)(v12 + 64) = v18;
      *(_DWORD *)(v12 + 68) = LODWORD(v17);
      *(_DWORD *)(v12 + 72) = 0;
      *(float *)&double v17 = *(float *)v7 - *(float *)v13;
      *(_DWORD *)(v12 + 76) = *(_DWORD *)v13;
      *(_DWORD *)(v12 + 80) = LODWORD(v17);
      *(_DWORD *)(v12 + 84) = 0;
      LODWORD(v18) = *(_DWORD *)(v7 + 60);
      float v19 = *(float *)(v13 + 56);
      LODWORD(v16) = *(_DWORD *)(v13 + 60);
      *(float *)&double v17 = *(float *)(v7 + 56) - v19;
      *(float *)(v12 + 88) = v19;
      *(_DWORD *)(v12 + 92) = LODWORD(v17);
      *(_DWORD *)(v12 + 96) = 0;
      *(_DWORD *)(v12 + 100) = LODWORD(v16);
      *(float *)(v12 + 104) = *(float *)&v18 - *(float *)&v16;
      *(_DWORD *)(v12 + 108) = 0;
      LODWORD(v18) = *(_DWORD *)(v13 + 64);
      *(float *)&double v17 = *(float *)(v7 + 64) - *(float *)&v18;
      *(_DWORD *)(v12 + 112) = v18;
      *(_DWORD *)(v12 + 116) = LODWORD(v17);
      *(_DWORD *)(v12 + 120) = 0;
      LODWORD(v17) = *(_DWORD *)(v13 + 4);
      *(float *)&uint64_t v18 = *(float *)(v7 + 4) - *(float *)&v17;
      *(_DWORD *)(v12 + 148) = LODWORD(v17);
      *(_DWORD *)(v12 + 152) = v18;
      *(_DWORD *)(v12 + 156) = 0;
      uint64_t v20 = *(void *)(v7 + 72);
      uint64_t v21 = *(void *)(v13 + 72);
      *(_DWORD *)(v12 + 124) = v21;
      *(float *)(v12 + 128) = *(float *)&v20 - *(float *)&v21;
      *(_DWORD *)(v12 + 132) = 0;
      LODWORD(v21) = *(_DWORD *)(v7 + 80);
      float v22 = *(float *)(v13 + 76);
      LODWORD(v16) = *(_DWORD *)(v13 + 80);
      *(float *)&uint64_t v20 = *(float *)(v7 + 76) - v22;
      *(float *)(v12 + 136) = v22;
      *(_DWORD *)(v12 + 140) = v20;
      *(_DWORD *)(v12 + 144) = 0;
      float v23 = *(float *)(v13 + 8);
      *(float *)&uint64_t v20 = *(float *)(v7 + 8) - v23;
      *(float *)(v12 + 160) = v23;
      *(_DWORD *)(v12 + 164) = v20;
      *(_DWORD *)(v12 + 168) = 0;
      float v24 = *(float *)(v13 + 12);
      *(float *)&uint64_t v20 = *(float *)(v7 + 12) - v24;
      *(float *)(v12 + 172) = v24;
      *(_DWORD *)(v12 + 176) = v20;
      *(_DWORD *)(v12 + 180) = 0;
      float v25 = *(float *)(v13 + 16);
      *(float *)&uint64_t v20 = *(float *)(v7 + 16) - v25;
      *(float *)(v12 + 184) = v25;
      *(_DWORD *)(v12 + 188) = v20;
      *(_DWORD *)(v12 + 192) = 0;
      LODWORD(v20) = *(_DWORD *)(v13 + 20);
      float v26 = *(float *)(v7 + 20) - *(float *)&v20;
      *(_DWORD *)(v12 + 196) = v20;
      *(float *)(v12 + 200) = v26;
      *(_DWORD *)(v12 + 204) = 0;
      float v27 = *(float *)(v13 + 24);
      *(float *)&uint64_t v20 = *(float *)(v7 + 24) - v27;
      *(float *)(v12 + 208) = v27;
      *(_DWORD *)(v12 + 212) = v20;
      *(_DWORD *)(v12 + 216) = 0;
      float v28 = *(float *)(v13 + 28);
      *(float *)&uint64_t v20 = *(float *)(v7 + 28) - v28;
      *(float *)(v12 + 220) = v28;
      *(_DWORD *)(v12 + 224) = v20;
      *(_DWORD *)(v12 + 228) = 0;
      float v29 = *(float *)(v13 + 32);
      *(float *)&uint64_t v20 = *(float *)(v7 + 32) - v29;
      *(float *)(v12 + 232) = v29;
      *(_DWORD *)(v12 + 236) = v20;
      *(_DWORD *)(v12 + 240) = 0;
      float v30 = *(float *)(v13 + 36);
      *(float *)&uint64_t v20 = *(float *)(v7 + 36) - v30;
      *(float *)(v12 + 244) = v30;
      *(_DWORD *)(v12 + 248) = v20;
      *(_DWORD *)(v12 + 252) = 0;
      LODWORD(v20) = *(_DWORD *)(v7 + 40);
      float v31 = *(float *)(v13 + 40);
      *(float *)(v12 + 256) = v31;
      *(float *)(v12 + 260) = *(float *)&v20 - v31;
      *(_DWORD *)(v12 + 264) = 0;
      LODWORD(v20) = *(_DWORD *)(v7 + 44);
      float v32 = *(float *)(v13 + 44);
      *(float *)(v12 + 268) = v32;
      *(float *)(v12 + 272) = *(float *)&v20 - v32;
      *(_DWORD *)(v12 + 276) = 0;
      LODWORD(v20) = *(_DWORD *)(v7 + 48);
      float v33 = *(float *)(v13 + 48);
      *(float *)(v12 + 280) = v33;
      *(float *)(v12 + 284) = *(float *)&v20 - v33;
      *(_DWORD *)(v12 + 288) = 0;
      *(_DWORD *)(v12 + 292) = LODWORD(v16);
      float result = *(float *)&v21 - *(float *)&v16;
      *(float *)(v12 + 296) = *(float *)&v21 - *(float *)&v16;
      *(_DWORD *)(v12 + 300) = 0;
      v6 += 32;
      v14 += 32;
      *(_WORD *)(v12 + 304) = *(void *)(a1 + 104);
      v12 += 307;
      v7 += 160;
      v13 += 160;
      --v3;
    }
    while (v3);
  }
  return result;
}

BOOL __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 40) == *(unsigned __int16 *)(*(void *)(a1 + 32) + 2 * a2);
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_2_16(uint64_t a1, void *a2)
{
  return [a2 supportsSpriteTransfer];
}

uint64_t __217__PXGAnimator_computeAnimationStateForTime_inputSpriteDataStore_inputChangeDetails_inputLayout_viewportShift_animationPresentationSpriteDataStore_animationTargetSpriteDataStore_animationChangeDetails_animationLayout___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __55__PXGAnimator__animationByAnimationIndexForAnimations___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 scope]) {
    a3 += *(void *)(a1 + 40);
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [NSNumber numberWithInteger:a3];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

- (void)dealloc
{
  uint64_t v3 = [(PXGAnimationDataStore *)self->_animationDataStore activeGroupIndexes];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __22__PXGAnimator_dealloc__block_invoke;
  v5[3] = &unk_1E5DD3010;
  v5[4] = self;
  [v3 enumerateIndexesUsingBlock:v5];

  [(PXGSpriteDataStore *)self->_doubleSidedSpriteDataStore recycle];
  [(PXGSpriteDataStore *)self->_oldAnimationPresentationSpriteDataStore recycle];
  v4.receiver = self;
  v4.super_class = (Class)PXGAnimator;
  [(PXGAnimator *)&v4 dealloc];
}

void __22__PXGAnimator_dealloc__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) groupInfos] + 76 * a2;

  *(void *)(v2 + 52) = 0;
  *(void *)(v2 + 44) = 0;
}

@end