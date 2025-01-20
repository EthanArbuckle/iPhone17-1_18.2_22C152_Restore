@interface PVMotionEffectTimelineComponent
- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3;
- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange_NoLock:(SEL)a3 documentInfo:(id *)a4;
- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5;
- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3;
- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange_NoLock:(SEL)a3 documentInfo:(id *)a4;
- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime_NoLock:(SEL)a3 documentInfo:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)introDuration_NoLock;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride_NoLock;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration_NoLock;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration_NoLock;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame_NoLock;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 documentInfo:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 editRange:(id *)a4 forcePosterFrame:(id *)a5 documentInfo:(BOOL)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 forcePosterFrame:(id *)a4 documentInfo:(BOOL)a5;
- (BOOL)forceDisableBuildAnimation;
- (BOOL)forceDisableBuildAnimation_NoLock;
- (BOOL)forceDisableLoop;
- (BOOL)forceDisableLoop_NoLock;
- (BOOL)isForceRenderAtPosterFrameEnabled;
- (BOOL)isForceRenderAtPosterFrameEnabled:(id)a3;
- (BOOL)loopTimeOverrideEnabled;
- (BOOL)loopTimeOverrideEnabled_NoLock;
- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6;
- (BOOL)motionEffect:(id)a3 shouldInvalidateCachedRenderForProperty:(id)a4 oldValue:(id)a5 newValue:(id)a6;
- (BOOL)useLocalLoopTime;
- (PVMotionEffectTimelineComponent)initWithMotionEffect:(id)a3;
- (double)timelineDurationInSeconds;
- (double)timelineDurationInSeconds_NoLock;
- (double)timelineFrameRate;
- (double)timelineFrameRate_NoLock;
- (id).cxx_construct;
- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3;
- (id)posterFrameMarker;
- (id)posterFrameMarker_NoLock:(const void *)a3;
- (id)timelineMarkers;
- (id)timelineMarkersOfType:(int)a3;
- (id)timelineMarkersOfType_NoLock:(int)a3 documentInfo:(const void *)a4;
- (id)timelineMarkers_NoLock:(const void *)a3;
- (unsigned)timelineDurationInFrames;
- (unsigned)timelineDurationInFrames_NoLock;
- (void)applyProperties_NoLock:(id)a3 defaultProperties:(id)a4 documentInfo:(const void *)a5;
- (void)computeIntroOutroPoints_NoLock:(const void *)a3;
- (void)dealloc;
- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5;
- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5;
- (void)motionEffectDidUnload:(id)a3;
- (void)setBuildInEnabled_NoLock:(BOOL)a3;
- (void)setBuildOutEnabled_NoLock:(BOOL)a3;
- (void)setForceDisableBuildAnimation:(BOOL)a3;
- (void)setForceDisableBuildAnimation_NoLock:(BOOL)a3;
- (void)setForceDisableLoop:(BOOL)a3;
- (void)setForceDisableLoop_NoLock:(BOOL)a3;
- (void)setLoopTimeOverride:(id *)a3;
- (void)setLoopTimeOverrideEnabled:(BOOL)a3;
- (void)setLoopTimeOverrideEnabled_NoLock:(BOOL)a3;
- (void)setLoopTimeOverride_NoLock:(id *)a3;
- (void)setNeedsToUpdateSceneDuration_NoLock;
- (void)setRenderStartOffset_NoLock:(id *)a3;
- (void)setUseLocalLoopTime:(BOOL)a3;
- (void)updateSceneDuration_NoLock:(const void *)a3;
@end

@implementation PVMotionEffectTimelineComponent

- (PVMotionEffectTimelineComponent)initWithMotionEffect:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PVMotionEffectTimelineComponent;
  v5 = [(PVMotionEffectComponent *)&v15 initWithMotionEffect:v4];
  v6 = v5;
  if (v5)
  {
    *((_DWORD *)v5 + 6) = 0;
    *((void *)v5 + 4) = 0;
    v7 = (long long *)MEMORY[0x1E4F1FA48];
    long long v8 = *MEMORY[0x1E4F1FA48];
    *((void *)v5 + 7) = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    *(_OWORD *)(v5 + 40) = v8;
    v9 = (void *)*((void *)v5 + 20);
    *((void *)v5 + 20) = 0;

    long long v10 = *v7;
    *((void *)v6 + 23) = *((void *)v7 + 2);
    *(_OWORD *)(v6 + 168) = v10;
    v11 = (long long *)MEMORY[0x1E4F1F9F8];
    long long v12 = *MEMORY[0x1E4F1F9F8];
    *((void *)v6 + 26) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *((_OWORD *)v6 + 12) = v12;
    v6[216] = 0;
    long long v13 = *v11;
    *(void *)(v6 + 236) = *((void *)v11 + 2);
    *(_OWORD *)(v6 + 220) = v13;
    operator new();
  }

  return 0;
}

- (void)dealloc
{
  buildInEnableChan = self->_buildInEnableChan;
  if (buildInEnableChan)
  {
    (*((void (**)(OZChannelBool *, SEL))buildInEnableChan->var0 + 1))(buildInEnableChan, a2);
    self->_buildInEnableChan = 0;
  }
  buildOutEnableChan = self->_buildOutEnableChan;
  if (buildOutEnableChan)
  {
    (*((void (**)(OZChannelBool *, SEL))buildOutEnableChan->var0 + 1))(buildOutEnableChan, a2);
    self->_buildOutEnableChan = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)PVMotionEffectTimelineComponent;
  [(PVMotionEffectTimelineComponent *)&v5 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration
{
  uint64_t v8 = 0;
  v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  uint64_t v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  long long v12 = __Block_byref_object_dispose__5;
  long long v13 = &unk_1B876C866;
  objc_super v5 = [(PVMotionEffectComponent *)self motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __51__PVMotionEffectTimelineComponent_timelineDuration__block_invoke;
  v7[3] = &unk_1E6169758;
  v7[4] = self;
  v7[5] = &v8;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v7];

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __51__PVMotionEffectTimelineComponent_timelineDuration__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timelineDuration_NoLock");
  }
  else
  {
    long long v5 = 0uLL;
    uint64_t v6 = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(void *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineDuration_NoLock
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  int64_t v7 = 120000
     * [(PVMotionEffectTimelineComponent *)self timelineDurationInFrames_NoLock];
  [(PVMotionEffectTimelineComponent *)self timelineFrameRate_NoLock];

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v7, (int)(v8 * 120000.0));
}

- (unsigned)timelineDurationInFrames
{
  uint64_t v6 = 0;
  int64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __59__PVMotionEffectTimelineComponent_timelineDurationInFrames__block_invoke;
  v5[3] = &unk_1E6169758;
  v5[4] = self;
  v5[5] = &v6;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __59__PVMotionEffectTimelineComponent_timelineDurationInFrames__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "timelineDurationInFrames_NoLock");
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unsigned)timelineDurationInFrames_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  id v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  return self->_numFrames;
}

- (double)timelineDurationInSeconds
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __60__PVMotionEffectTimelineComponent_timelineDurationInSeconds__block_invoke;
  v6[3] = &unk_1E6169758;
  v6[4] = self;
  v6[5] = &v7;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__PVMotionEffectTimelineComponent_timelineDurationInSeconds__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "timelineDurationInSeconds_NoLock");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)timelineDurationInSeconds_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  double v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  LODWORD(v5) = self->_numFrames;
  return (double)v5 / self->_frameRate;
}

- (double)timelineFrameRate
{
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __52__PVMotionEffectTimelineComponent_timelineFrameRate__block_invoke;
  v6[3] = &unk_1E6169758;
  v6[4] = self;
  v6[5] = &v7;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __52__PVMotionEffectTimelineComponent_timelineFrameRate__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "timelineFrameRate_NoLock");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)timelineFrameRate_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  double v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  return self->_frameRate;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration
{
  uint64_t v8 = 0;
  uint64_t v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  uint64_t v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  long long v12 = __Block_byref_object_dispose__5;
  long long v13 = &unk_1B876C866;
  unint64_t v5 = [(PVMotionEffectComponent *)self motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __56__PVMotionEffectTimelineComponent_timelineFrameDuration__block_invoke;
  v7[3] = &unk_1E6169758;
  v7[4] = self;
  v7[5] = &v8;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v7];

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __56__PVMotionEffectTimelineComponent_timelineFrameDuration__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timelineFrameDuration_NoLock");
  }
  else
  {
    long long v5 = 0uLL;
    uint64_t v6 = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(void *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineFrameDuration_NoLock
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_frameDuration;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame
{
  uint64_t v8 = 0;
  uint64_t v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  uint64_t v10 = 0x4812000000;
  v11 = __Block_byref_object_copy__5;
  long long v12 = __Block_byref_object_dispose__5;
  long long v13 = &unk_1B876C866;
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __52__PVMotionEffectTimelineComponent_timelineLastFrame__block_invoke;
  v7[3] = &unk_1E6169758;
  v7[4] = self;
  v7[5] = &v8;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v7];

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __52__PVMotionEffectTimelineComponent_timelineLastFrame__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "timelineLastFrame_NoLock");
  }
  else
  {
    long long v5 = 0uLL;
    uint64_t v6 = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(void *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineLastFrame_NoLock
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  int64_t v7 = 120000 * self->_numFrames - 120000;
  int32_t v8 = (int)(self->_frameRate * 120000.0);

  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, v7, v8);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime:(SEL)a3
{
  uint64_t v11 = 0;
  long long v12 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v11;
  uint64_t v13 = 0x4812000000;
  v14 = __Block_byref_object_copy__5;
  objc_super v15 = __Block_byref_object_dispose__5;
  v16 = &unk_1B876C866;
  int64_t v7 = [(PVMotionEffectComponent *)self motionEffect];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = *(void *)"";
  v9[2] = __65__PVMotionEffectTimelineComponent_componentTimeFromTimelineTime___block_invoke;
  v9[3] = &unk_1E6169780;
  v9[4] = self;
  v9[5] = &v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  [v7 runEnsuringDocumentReadyAndLockingDocument:v9];

  *retstr = v12[2];
  _Block_object_dispose(&v11, 8);
  return result;
}

double __65__PVMotionEffectTimelineComponent_componentTimeFromTimelineTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  if (v3)
  {
    objc_msgSend(v3, "componentTimeFromTimelineTime_NoLock:documentInfo:", &v6, a2);
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v8;
  *(_OWORD *)(v4 + 48) = v8;
  *(void *)(v4 + 64) = v9;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime:(SEL)a3
{
  uint64_t v11 = 0;
  long long v12 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v11;
  uint64_t v13 = 0x4812000000;
  v14 = __Block_byref_object_copy__5;
  objc_super v15 = __Block_byref_object_dispose__5;
  v16 = &unk_1B876C866;
  uint64_t v7 = [(PVMotionEffectComponent *)self motionEffect];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = *(void *)"";
  v9[2] = __65__PVMotionEffectTimelineComponent_timelineTimeFromComponentTime___block_invoke;
  v9[3] = &unk_1E6169780;
  v9[4] = self;
  v9[5] = &v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a4;
  [v7 runEnsuringDocumentReadyAndLockingDocument:v9];

  *retstr = v12[2];
  _Block_object_dispose(&v11, 8);
  return result;
}

double __65__PVMotionEffectTimelineComponent_timelineTimeFromComponentTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v6 = *(_OWORD *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 64);
  if (v3)
  {
    objc_msgSend(v3, "timelineTimeFromComponentTime_NoLock:documentInfo:", &v6, a2);
  }
  else
  {
    long long v8 = 0uLL;
    uint64_t v9 = 0;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v8;
  *(_OWORD *)(v4 + 48) = v8;
  *(void *)(v4 + 64) = v9;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange:(SEL)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x6012000000;
  v19 = __Block_byref_object_copy__73;
  v20 = __Block_byref_object_dispose__74;
  v21 = &unk_1B876C866;
  uint64_t v7 = [(PVMotionEffectComponent *)self motionEffect];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  v12[2] = __75__PVMotionEffectTimelineComponent_componentTimeRangeFromTimelineTimeRange___block_invoke;
  v12[3] = &unk_1E61697A8;
  v12[4] = self;
  v12[5] = &v16;
  long long v8 = *(_OWORD *)&a4->var0.var3;
  long long v13 = *(_OWORD *)&a4->var0.var0;
  long long v14 = v8;
  long long v15 = *(_OWORD *)&a4->var1.var1;
  [v7 runEnsuringDocumentReadyAndLockingDocument:v12];

  uint64_t v9 = v17;
  long long v10 = *((_OWORD *)v17 + 4);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->var0.var3 = v10;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v9 + 5);
  _Block_object_dispose(&v16, 8);
  return result;
}

double __75__PVMotionEffectTimelineComponent_componentTimeRangeFromTimelineTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 80);
  if (v3)
  {
    objc_msgSend(v3, "componentTimeRangeFromTimelineTimeRange_NoLock:documentInfo:", v8, a2);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  long long v5 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v6 = v10;
  v5[3] = v9;
  v5[4] = v6;
  double result = *(double *)&v11;
  v5[5] = v11;
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange:(SEL)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x6012000000;
  v19 = __Block_byref_object_copy__73;
  v20 = __Block_byref_object_dispose__74;
  v21 = &unk_1B876C866;
  uint64_t v7 = [(PVMotionEffectComponent *)self motionEffect];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = *(void *)"";
  v12[2] = __75__PVMotionEffectTimelineComponent_timelineTimeRangeFromComponentTimeRange___block_invoke;
  v12[3] = &unk_1E61697A8;
  v12[4] = self;
  v12[5] = &v16;
  long long v8 = *(_OWORD *)&a4->var0.var3;
  long long v13 = *(_OWORD *)&a4->var0.var0;
  long long v14 = v8;
  long long v15 = *(_OWORD *)&a4->var1.var1;
  [v7 runEnsuringDocumentReadyAndLockingDocument:v12];

  long long v9 = v17;
  long long v10 = *((_OWORD *)v17 + 4);
  *(_OWORD *)&retstr->var0.var0 = *((_OWORD *)v17 + 3);
  *(_OWORD *)&retstr->var0.var3 = v10;
  *(_OWORD *)&retstr->var1.var1 = *((_OWORD *)v9 + 5);
  _Block_object_dispose(&v16, 8);
  return result;
}

double __75__PVMotionEffectTimelineComponent_timelineTimeRangeFromComponentTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v4;
  v8[2] = *(_OWORD *)(a1 + 80);
  if (v3)
  {
    objc_msgSend(v3, "componentTimeRangeFromTimelineTimeRange_NoLock:documentInfo:", v8, a2);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v9 = 0u;
  }
  long long v5 = *(_OWORD **)(*(void *)(a1 + 40) + 8);
  long long v6 = v10;
  v5[3] = v9;
  v5[4] = v6;
  double result = *(double *)&v11;
  v5[5] = v11;
  return result;
}

- (id)timelineMarkers
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__77;
  long long v11 = __Block_byref_object_dispose__78;
  id v12 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __50__PVMotionEffectTimelineComponent_timelineMarkers__block_invoke;
  v6[3] = &unk_1E6169758;
  v6[4] = self;
  v6[5] = &v7;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __50__PVMotionEffectTimelineComponent_timelineMarkers__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "timelineMarkers_NoLock:", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)timelineMarkers_NoLock:(const void *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  long long v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  unsigned int v7 = OZXMarkerCount(*(void *)a3);
  if (v7)
  {
    unsigned int v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v7];
    for (unsigned int i = 0; i != v8; ++i)
    {
      if (!OZXGetMarkerFigTime(*(void *)a3, i, (uint64_t)v13))
      {
        long long v11 = +[PVTimelineMarker markerWithOZXTimeMarkerFigTime:v13];
        [v9 addObject:v11];
      }
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)timelineMarkersOfType:(int)a3
{
  uint64_t v10 = 0;
  long long v11 = &v10;
  uint64_t v12 = 0x3032000000;
  long long v13 = __Block_byref_object_copy__77;
  long long v14 = __Block_byref_object_dispose__78;
  id v15 = 0;
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = *(void *)"";
  v8[2] = __57__PVMotionEffectTimelineComponent_timelineMarkersOfType___block_invoke;
  _OWORD v8[3] = &unk_1E61697D0;
  v8[4] = self;
  v8[5] = &v10;
  int v9 = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v8];

  id v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v6;
}

void __57__PVMotionEffectTimelineComponent_timelineMarkersOfType___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "timelineMarkersOfType_NoLock:documentInfo:", *(unsigned int *)(a1 + 48), a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)timelineMarkersOfType_NoLock:(int)a3 documentInfo:(const void *)a4
{
  unsigned int v7 = [(PVMotionEffectComponent *)self motionEffect];
  [v7 assertDocumentIsLocked];

  unsigned int v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentStatusIsLoadedOrReady];

  unsigned int v9 = OZXMarkerCount(*(void *)a4);
  if (v9)
  {
    unsigned int v10 = v9;
    long long v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v9];
    for (unsigned int i = 0; i != v10; ++i)
    {
      if (!OZXGetMarkerFigTimeOfType(*(void *)a4, i, a3, (uint64_t)v15))
      {
        long long v13 = +[PVTimelineMarker markerWithOZXTimeMarkerFigTime:v15];
        [v11 addObject:v13];
      }
    }
  }
  else
  {
    long long v11 = 0;
  }

  return v11;
}

- (id)posterFrameMarker
{
  uint64_t v7 = 0;
  unsigned int v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unsigned int v10 = __Block_byref_object_copy__77;
  long long v11 = __Block_byref_object_dispose__78;
  id v12 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __52__PVMotionEffectTimelineComponent_posterFrameMarker__block_invoke;
  v6[3] = &unk_1E6169758;
  v6[4] = self;
  v6[5] = &v7;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __52__PVMotionEffectTimelineComponent_posterFrameMarker__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "posterFrameMarker_NoLock:", a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)posterFrameMarker_NoLock:(const void *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  id v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  posterFrameMarker = self->_posterFrameMarker;
  if (!posterFrameMarker)
  {
    unsigned int v8 = [(PVMotionEffectTimelineComponent *)self timelineMarkersOfType_NoLock:8 documentInfo:a3];
    uint64_t v9 = [v8 firstObject];
    unsigned int v10 = self->_posterFrameMarker;
    self->_posterFrameMarker = v9;

    long long v11 = self->_posterFrameMarker;
    if (!v11 || ([(PVTimelineMarker *)v11 timeRange], (v18 & 1) == 0))
    {
      long long v12 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
      v17[0] = *MEMORY[0x1E4F1FA30];
      v17[1] = v12;
      v17[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
      long long v13 = +[PVTimelineMarker markerWithType:8 timeRange:v17];
      long long v14 = self->_posterFrameMarker;
      self->_posterFrameMarker = v13;
    }
    posterFrameMarker = self->_posterFrameMarker;
  }
  id v15 = posterFrameMarker;

  return v15;
}

- (void)setLoopTimeOverrideEnabled:(BOOL)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __62__PVMotionEffectTimelineComponent_setLoopTimeOverrideEnabled___block_invoke;
  v6[3] = &unk_1E61697F8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
}

uint64_t __62__PVMotionEffectTimelineComponent_setLoopTimeOverrideEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setLoopTimeOverrideEnabled_NoLock:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setLoopTimeOverrideEnabled_NoLock:(BOOL)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  id v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  self->_loopTimeOverrideEnabled = a3;
}

- (BOOL)loopTimeOverrideEnabled
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __58__PVMotionEffectTimelineComponent_loopTimeOverrideEnabled__block_invoke;
  v5[3] = &unk_1E6169758;
  v5[4] = self;
  v5[5] = &v6;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LOBYTE(v3) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __58__PVMotionEffectTimelineComponent_loopTimeOverrideEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "loopTimeOverrideEnabled_NoLock");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)loopTimeOverrideEnabled_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  uint64_t v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  return self->_loopTimeOverrideEnabled;
}

- (void)setLoopTimeOverride:(id *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __55__PVMotionEffectTimelineComponent_setLoopTimeOverride___block_invoke;
  v6[3] = &unk_1E6169820;
  v6[4] = self;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
}

uint64_t __55__PVMotionEffectTimelineComponent_setLoopTimeOverride___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 56);
  return objc_msgSend(v1, "setLoopTimeOverride_NoLock:", &v3);
}

- (void)setLoopTimeOverride_NoLock:(id *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  int64_t var3 = a3->var3;
  *(_OWORD *)(&self->_loopTimeOverrideEnabled + 4) = *(_OWORD *)&a3->var0;
  *(void *)&self->_loopTimeOverride.flags = var3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride
{
  uint64_t v8 = 0;
  char v9 = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v8;
  uint64_t v10 = 0x4812000000;
  long long v11 = __Block_byref_object_copy__5;
  long long v12 = __Block_byref_object_dispose__5;
  long long v13 = &unk_1B876C866;
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = *(void *)"";
  v7[2] = __51__PVMotionEffectTimelineComponent_loopTimeOverride__block_invoke;
  v7[3] = &unk_1E6169758;
  v7[4] = self;
  v7[5] = &v8;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v7];

  *retstr = v9[2];
  _Block_object_dispose(&v8, 8);
  return result;
}

double __51__PVMotionEffectTimelineComponent_loopTimeOverride__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "loopTimeOverride_NoLock");
  }
  else
  {
    long long v5 = 0uLL;
    uint64_t v6 = 0;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double result = *(double *)&v5;
  *(_OWORD *)(v3 + 48) = v5;
  *(void *)(v3 + 64) = v6;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)loopTimeOverride_NoLock
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)(&self->_loopTimeOverrideEnabled + 4);
  return result;
}

- (void)setUseLocalLoopTime:(BOOL)a3
{
}

- (BOOL)useLocalLoopTime
{
  return ![(PVMotionEffectTimelineComponent *)self loopTimeOverrideEnabled];
}

- (void)setForceDisableLoop:(BOOL)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __55__PVMotionEffectTimelineComponent_setForceDisableLoop___block_invoke;
  v6[3] = &unk_1E61697F8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
}

uint64_t __55__PVMotionEffectTimelineComponent_setForceDisableLoop___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setForceDisableLoop_NoLock:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setForceDisableLoop_NoLock:(BOOL)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  METimeRemap::setForceDisableLoop(&self->_timeRemap, a3);
}

- (BOOL)forceDisableLoop
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __51__PVMotionEffectTimelineComponent_forceDisableLoop__block_invoke;
  v5[3] = &unk_1E6169758;
  v5[4] = self;
  v5[5] = &v6;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LOBYTE(v3) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __51__PVMotionEffectTimelineComponent_forceDisableLoop__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "forceDisableLoop_NoLock");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)forceDisableLoop_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  uint64_t v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  return METimeRemap::forceDisableLoop(&self->_timeRemap);
}

- (void)setForceDisableBuildAnimation:(BOOL)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = *(void *)"";
  v6[2] = __65__PVMotionEffectTimelineComponent_setForceDisableBuildAnimation___block_invoke;
  v6[3] = &unk_1E61697F8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 runEnsuringDocumentReadyAndLockingDocument:v6];
}

uint64_t __65__PVMotionEffectTimelineComponent_setForceDisableBuildAnimation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setForceDisableBuildAnimation_NoLock:", *(unsigned __int8 *)(a1 + 40));
}

- (void)setForceDisableBuildAnimation_NoLock:(BOOL)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  METimeRemap::setForceDisableBuildAnimation(&self->_timeRemap, a3);
}

- (BOOL)forceDisableBuildAnimation
{
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = *(void *)"";
  v5[2] = __61__PVMotionEffectTimelineComponent_forceDisableBuildAnimation__block_invoke;
  v5[3] = &unk_1E6169758;
  v5[4] = self;
  v5[5] = &v6;
  [v3 runEnsuringDocumentReadyAndLockingDocument:v5];

  LOBYTE(v3) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v3;
}

uint64_t __61__PVMotionEffectTimelineComponent_forceDisableBuildAnimation__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "forceDisableBuildAnimation_NoLock");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)forceDisableBuildAnimation_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  uint64_t v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  return METimeRemap::forceDisableBuildAnimation(&self->_timeRemap);
}

- (BOOL)isForceRenderAtPosterFrameEnabled
{
  v2 = [(PVMotionEffectComponent *)self motionEffect];
  uint64_t v3 = [v2 inspectablePropertyForKey:@"RenderAtPosterTime"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isForceRenderAtPosterFrameEnabled:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:@"RenderAtPosterTime"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  uint64_t v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentIsLocked];

  char v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentStatusIsLoadedOrReady];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  long long v11 = v10;
  if (v10)
  {
    [v10 effectRange];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
  }

  long long v12 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v14[0] = v17;
  v14[1] = v18;
  v14[2] = v19;
  long long v15 = v12;
  return [(PVMotionEffectTimelineComponent *)self componentTimeFromTimelineTime_NoLock:&v15 editRange:v14 documentInfo:a5];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)componentTimeFromTimelineTime_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentIsLocked];

  long long v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 assertDocumentStatusIsLoadedOrReady];

  long long v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range1.start.epoch = v12;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a5->var1.var1;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&range2.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&range2.start.epoch = v13;
  *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  if (CMTimeRangeEqual(&range1, &range2))
  {
    long long v14 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.epoch = v14;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    long long v15 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
    uint64_t v16 = [(PVMotionEffectComponent *)self motionEffect];
    long long v17 = [(PVMotionEffectComponent *)self motionEffect];
    long long v18 = [v17 debugDisplayName];
    NSLog(&cfstr_WarningInvalid.isa, v15, v16, v18);
  }
  memset(&v22, 0, sizeof(v22));
  METimeRemap::componentTimeFromMotionTime(&self->_timeRemap, (const CMTime *)a4, (const CMTimeRange *)a5, (uint64_t)&v22);
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  CMTime lhs = v22;
  CMTime rhs = (CMTime)self->_renderStartOffset;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeSubtract((CMTime *)retstr, &lhs, &rhs);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  uint64_t v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentIsLocked];

  char v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentStatusIsLoadedOrReady];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  long long v11 = v10;
  if (v10)
  {
    [v10 effectRange];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
  }

  long long v12 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v14[0] = v17;
  v14[1] = v18;
  v14[2] = v19;
  long long v15 = v12;
  return [(PVMotionEffectTimelineComponent *)self timelineTimeFromComponentTime_NoLock:&v15 editRange:v14 documentInfo:a5];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentIsLocked];

  long long v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 assertDocumentStatusIsLoadedOrReady];

  long long v12 = *(_OWORD *)&a5->var0.var3;
  *(_OWORD *)&range1.start.value = *(_OWORD *)&a5->var0.var0;
  *(_OWORD *)&range1.start.CMTimeEpoch epoch = v12;
  *(_OWORD *)&range1.duration.timescale = *(_OWORD *)&a5->var1.var1;
  long long v13 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
  *(_OWORD *)&range2.start.value = *MEMORY[0x1E4F1FA20];
  *(_OWORD *)&range2.start.CMTimeEpoch epoch = v13;
  *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  if (CMTimeRangeEqual(&range1, &range2))
  {
    long long v14 = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&range.start.CMTimeEpoch epoch = v14;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a5->var1.var1;
    long long v15 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
    uint64_t v16 = [(PVMotionEffectComponent *)self motionEffect];
    long long v17 = [(PVMotionEffectComponent *)self motionEffect];
    long long v18 = [v17 debugDisplayName];
    NSLog(&cfstr_WarningInvalid.isa, v15, v16, v18);
  }
  uint64_t v19 = MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&retstr->CMTime var0 = *MEMORY[0x1E4F1F9F8];
  retstr->int64_t var3 = *(void *)(v19 + 16);
  v20 = [(PVMotionEffectComponent *)self motionEffect];
  int v21 = [v20 isTranscription];

  if (!v21)
  {
    memset(&v55, 0, sizeof(v55));
    CMTime lhs = (CMTime)*a4;
    CMTime rhs = (CMTime)self->_renderStartOffset;
    CMTimeAdd(&v55, &lhs, &rhs);
    METimeRemap::motionTimeFromComponentTime(&self->_timeRemap, &v55, (const CMTimeRange *)a5, 0, (uint64_t)&v54);
    *(_OWORD *)&retstr->CMTime var0 = *(_OWORD *)&v54.value;
    CMTimeEpoch epoch = v54.epoch;
    goto LABEL_14;
  }
  CMTime v22 = [(PVMotionEffectComponent *)self motionEffect];
  int v23 = [v22 isPreview];

  if (!v23)
  {
    CMTime v39 = (CMTime)*a4;
    CMTime var0 = (CMTime)a5->var0;
    CMTimeSubtract(&v40, &v39, &var0);
    CMTime renderStartOffset = (CMTime)self->_renderStartOffset;
    v26 = &v40;
    p_CMTime renderStartOffset = &renderStartOffset;
    goto LABEL_9;
  }
  v24 = [(PVMotionEffectComponent *)self motionEffect];
  int v25 = [v24 isRecording];

  if (v25)
  {
    long long v46 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v44 = *(_OWORD *)&self->_renderStartOffset.value;
    int64_t v45 = self->_renderStartOffset.epoch;
    v26 = (CMTime *)&v46;
    p_CMTime renderStartOffset = (CMTime *)&v44;
LABEL_9:
    uint64_t result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&v55, v26, p_renderStartOffset);
    *(_OWORD *)&retstr->CMTime var0 = *(_OWORD *)&v55.value;
    CMTimeEpoch epoch = v55.epoch;
    goto LABEL_14;
  }
  if (!self->_loopTimeOverrideEnabled
    || (p_loopTime = ($95D729B680665BEAEFA1D6FCA8238556 *)(&self->_loopTimeOverrideEnabled + 4),
        (self->_loopTimeOverride.timescale & 1) == 0))
  {
    p_loopTime = &self->_loopTime;
  }
  long long v42 = *(_OWORD *)&p_loopTime->value;
  int64_t v43 = p_loopTime->epoch;
  memset(&v41, 0, sizeof(v41));
  operator/((long long *)&a4->var0, (uint64_t)&v42, (uint64_t)&v41);
  CMTimeMake(&v51, 1, 1);
  CMTime v55 = v41;
  CMTime v54 = v51;
  PC_CMTimeFloorToSampleDuration(&v55, &v54, (uint64_t)&v52);
  CMTime v55 = v41;
  CMTime v54 = v52;
  PC_CMTimeSaferSubtract(&v55, &v54, (uint64_t)&v53);
  operator*(&v53, (uint64_t)&v42, (uint64_t)&v55);
  CMTimeEpoch epoch = v55.epoch;
  CMTime v41 = v55;
  *(_OWORD *)&retstr->CMTime var0 = *(_OWORD *)&v55.value;
LABEL_14:
  retstr->int64_t var3 = epoch;
  if ((retstr->var2 & 1) == 0)
  {
    CMTime v33 = (CMTime)*a4;
    CMTime v32 = (CMTime)a5->var0;
    CMTimeSubtract(&v34, &v33, &v32);
    CMTime v31 = (CMTime)self->_renderStartOffset;
    uint64_t result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeAdd(&v55, &v34, &v31);
    *(CMTime *)retstr = v55;
  }
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 forcePosterFrame:(id *)a4 documentInfo:(BOOL)a5
{
  BOOL v7 = a5;
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentIsLocked];

  long long v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 assertDocumentStatusIsLoadedOrReady];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  long long v12 = [(PVMotionEffectComponent *)self motionEffect];
  long long v13 = v12;
  if (v12)
  {
    [v12 effectRange];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
  }

  long long v14 = *(_OWORD *)&a4->var0;
  int64_t var3 = a4->var3;
  v16[0] = v19;
  v16[1] = v20;
  v16[2] = v21;
  long long v17 = v14;
  return [(PVMotionEffectTimelineComponent *)self timelineTimeFromComponentTime_NoLock:&v17 editRange:v16 forcePosterFrame:v7 documentInfo:a6];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)timelineTimeFromComponentTime_NoLock:(SEL)a3 editRange:(id *)a4 forcePosterFrame:(id *)a5 documentInfo:(BOOL)a6
{
  BOOL v8 = a6;
  long long v13 = [(PVMotionEffectComponent *)self motionEffect];
  [v13 assertDocumentIsLocked];

  long long v14 = [(PVMotionEffectComponent *)self motionEffect];
  [v14 assertDocumentStatusIsLoadedOrReady];

  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (!v8) {
    goto LABEL_5;
  }
  long long v15 = [(PVMotionEffectTimelineComponent *)self posterFrameMarker_NoLock:a7];
  uint64_t v16 = v15;
  if (v15)
  {
    [v15 timeRange];
    *(_OWORD *)&retstr->CMTime var0 = v23;
    retstr->int64_t var3 = v24;
  }

  if ((retstr->var2 & 1) == 0)
  {
LABEL_5:
    long long v18 = *(_OWORD *)&a4->var0;
    int64_t var3 = a4->var3;
    long long v19 = *(_OWORD *)&a5->var0.var3;
    v20[0] = *(_OWORD *)&a5->var0.var0;
    v20[1] = v19;
    v20[2] = *(_OWORD *)&a5->var1.var1;
    long long v21 = v18;
    uint64_t result = [(PVMotionEffectTimelineComponent *)self timelineTimeFromComponentTime_NoLock:&v21 editRange:v20 documentInfo:a7];
    *(_OWORD *)&retstr->CMTime var0 = v23;
    retstr->int64_t var3 = v24;
  }
  return result;
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  BOOL v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentIsLocked];

  char v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentStatusIsLoadedOrReady];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  long long v11 = v10;
  if (v10)
  {
    [v10 effectRange];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }

  long long v12 = *(_OWORD *)&a4->var0.var3;
  v15[0] = *(_OWORD *)&a4->var0.var0;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a4->var1.var1;
  v14[0] = v16;
  v14[1] = v17;
  v14[2] = v18;
  return [(PVMotionEffectTimelineComponent *)self componentTimeRangeFromTimelineTimeRange_NoLock:v15 editRange:v14 documentInfo:a5];
}

- ($202A6A048D39AE170264FF71A65A9479)componentTimeRangeFromTimelineTimeRange_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  long long v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 assertDocumentIsLocked];

  long long v12 = [(PVMotionEffectComponent *)self motionEffect];
  [v12 assertDocumentStatusIsLoadedOrReady];

  memset(&v26, 0, sizeof(v26));
  long long v13 = *(_OWORD *)&a4->var0.var0;
  int64_t var3 = a4->var0.var3;
  long long v14 = *(_OWORD *)&a5->var0.var3;
  v23[0] = *(_OWORD *)&a5->var0.var0;
  v23[1] = v14;
  v23[2] = *(_OWORD *)&a5->var1.var1;
  long long v24 = v13;
  [(PVMotionEffectTimelineComponent *)self componentTimeFromTimelineTime_NoLock:&v24 editRange:v23 documentInfo:a6];
  memset(&v22[24], 0, 24);
  long long v15 = *(_OWORD *)&a4->var0.var3;
  v21[0] = *(_OWORD *)&a4->var0.var0;
  v21[1] = v15;
  v21[2] = *(_OWORD *)&a4->var1.var1;
  PC_CMTimeRangeEnd((uint64_t)v21, (uint64_t)v22);
  long long v16 = *(_OWORD *)&a5->var0.var3;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v16;
  v20[2] = *(_OWORD *)&a5->var1.var1;
  [(PVMotionEffectTimelineComponent *)self componentTimeFromTimelineTime_NoLock:v22 editRange:v20 documentInfo:a6];
  CMTime v19 = v26;
  CMTime v18 = *(CMTime *)&v22[24];
  return ($202A6A048D39AE170264FF71A65A9479 *)PC_CMTimeRangeMakeWithStartEnd(&v19, &v18, (uint64_t)retstr);
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange_NoLock:(SEL)a3 documentInfo:(id *)a4
{
  BOOL v8 = [(PVMotionEffectComponent *)self motionEffect];
  [v8 assertDocumentIsLocked];

  char v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentStatusIsLoadedOrReady];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  uint64_t v10 = [(PVMotionEffectComponent *)self motionEffect];
  long long v11 = v10;
  if (v10)
  {
    [v10 effectRange];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }

  long long v12 = *(_OWORD *)&a4->var0.var3;
  v15[0] = *(_OWORD *)&a4->var0.var0;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a4->var1.var1;
  v14[0] = v16;
  v14[1] = v17;
  v14[2] = v18;
  return [(PVMotionEffectTimelineComponent *)self timelineTimeRangeFromComponentTimeRange_NoLock:v15 editRange:v14 documentInfo:a5];
}

- ($202A6A048D39AE170264FF71A65A9479)timelineTimeRangeFromComponentTimeRange_NoLock:(SEL)a3 editRange:(id *)a4 documentInfo:(id *)a5
{
  long long v11 = [(PVMotionEffectComponent *)self motionEffect];
  [v11 assertDocumentIsLocked];

  long long v12 = [(PVMotionEffectComponent *)self motionEffect];
  [v12 assertDocumentStatusIsLoadedOrReady];

  memset(&v26, 0, sizeof(v26));
  long long v13 = *(_OWORD *)&a4->var0.var0;
  int64_t var3 = a4->var0.var3;
  long long v14 = *(_OWORD *)&a5->var0.var3;
  v23[0] = *(_OWORD *)&a5->var0.var0;
  v23[1] = v14;
  v23[2] = *(_OWORD *)&a5->var1.var1;
  long long v24 = v13;
  [(PVMotionEffectTimelineComponent *)self componentTimeFromTimelineTime_NoLock:&v24 editRange:v23 documentInfo:a6];
  memset(&v22[24], 0, 24);
  long long v15 = *(_OWORD *)&a4->var0.var3;
  v21[0] = *(_OWORD *)&a4->var0.var0;
  v21[1] = v15;
  v21[2] = *(_OWORD *)&a4->var1.var1;
  PC_CMTimeRangeEnd((uint64_t)v21, (uint64_t)v22);
  long long v16 = *(_OWORD *)&a5->var0.var3;
  v20[0] = *(_OWORD *)&a5->var0.var0;
  v20[1] = v16;
  v20[2] = *(_OWORD *)&a5->var1.var1;
  [(PVMotionEffectTimelineComponent *)self componentTimeFromTimelineTime_NoLock:v22 editRange:v20 documentInfo:a6];
  CMTime v19 = v26;
  CMTime v18 = *(CMTime *)&v22[24];
  return ($202A6A048D39AE170264FF71A65A9479 *)PC_CMTimeRangeMakeWithStartEnd(&v19, &v18, (uint64_t)retstr);
}

- (void)updateSceneDuration_NoLock:(const void *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  if (self->_needsToUpdateSceneDuration)
  {
    OZXGetSceneDuration(*(void *)a3, &self->_numFrames, &self->_frameRate, (__n128 *)&self->_frameDuration);
    self->_needsToUpdateSceneDuration = 0;
    [(PVMotionEffectTimelineComponent *)self computeIntroOutroPoints_NoLock:a3];
  }
}

- (void)computeIntroOutroPoints_NoLock:(const void *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  memset(&v20, 0, sizeof(v20));
  [(PVMotionEffectTimelineComponent *)self timelineDuration_NoLock];
  unsigned int v7 = OZXMarkerCount(*(void *)a3);
  if (!v7)
  {
    METimeRemap::setIntroDuration(&self->_timeRemap, MEMORY[0x1E4F1FA48]);
LABEL_18:
    METimeRemap::setOutroDuration(&self->_timeRemap, MEMORY[0x1E4F1FA48]);
    goto LABEL_19;
  }
  unsigned int v8 = v7;
  int v9 = 0;
  int v10 = 0;
  unsigned int v11 = 1;
  do
  {
    OZXGetMarkerFigTime(*(void *)a3, v11 - 1, (uint64_t)&v18);
    if ((v10 & 1) != 0 || (v19 - 3) > 1)
    {
      if ((v9 & 1) == 0)
      {
        if ((v19 - 5) > 2)
        {
          int v9 = 0;
          goto LABEL_11;
        }
        v22[0] = v20;
        CMTime v21 = v18;
        PC_CMTimeSaferSubtract(v22, &v21, (uint64_t)&v17);
        METimeRemap::setOutroDuration(&self->_timeRemap, &v17);
        METimeRemap::setIsLoop(&self->_timeRemap, v19 == 7);
        METimeRemap::setIsOutroOptional(&self->_timeRemap, v19 == 6);
        self->_loopTime = ($95D729B680665BEAEFA1D6FCA8238556)v18;
      }
      int v9 = 1;
    }
    else
    {
      METimeRemap::setIntroDuration(&self->_timeRemap, &v18);
      LiGrid::setGroundPlane((uint64_t)&self->_timeRemap, v19 == 4);
      int v10 = 1;
    }
LABEL_11:
    if (v11 >= v8) {
      break;
    }
    ++v11;
  }
  while ((v10 & v9 & 1) == 0);
  if ((v10 & 1) == 0) {
    METimeRemap::setIntroDuration(&self->_timeRemap, MEMORY[0x1E4F1FA48]);
  }
  if ((v9 & 1) == 0) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t Description = ProGL::Private::TextureImpl::getDescription((ProGL::Private::TextureImpl *)&self->_timeRemap);
  CMTime v18 = v20;
  CMTimeEpoch v13 = *(void *)(Description + 16);
  *(_OWORD *)&v22[0].value = *(_OWORD *)Description;
  v22[0].CMTimeEpoch epoch = v13;
  PC_CMTimeSaferSubtract(&v18, v22, (uint64_t)&v17);
  uint64_t v15 = OZChannelBase::setRangeName((OZChannelBase *)&self->_timeRemap, v14);
  CMTime v18 = v17;
  CMTimeEpoch v16 = *(void *)(v15 + 16);
  *(_OWORD *)&v22[0].value = *(_OWORD *)v15;
  v22[0].CMTimeEpoch epoch = v16;
  PC_CMTimeSaferSubtract(&v18, v22, (uint64_t)&v21);
  METimeRemap::setScaleableDuration(&self->_timeRemap, &v21);
  METimeRemap::setBuildEnableChannels(&self->_timeRemap, self->_buildInEnableChan, self->_buildOutEnableChan);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)introDuration_NoLock
{
  uint64_t result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)OZChannelBase::setRangeName((OZChannelBase *)&self->_timeRemap, (const PCString *)a3);
  *retstr = *result;
  return result;
}

- (void)setNeedsToUpdateSceneDuration_NoLock
{
  uint64_t v3 = [(PVMotionEffectComponent *)self motionEffect];
  [v3 assertDocumentIsLocked];

  char v4 = [(PVMotionEffectComponent *)self motionEffect];
  [v4 assertDocumentStatusIsLoadedOrReady];

  self->_needsToUpdateSceneDuration = 1;
}

- (void)setRenderStartOffset_NoLock:(id *)a3
{
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_renderStartOffset.value = *(_OWORD *)&a3->var0;
  self->_renderStartOffset.CMTimeEpoch epoch = var3;
}

- (void)setBuildInEnabled_NoLock:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  unsigned int v8 = (void (*)(__n128))*((void *)self->_buildInEnableChan->var0 + 89);

  v7.n128_f64[0] = (double)v3;
  v8(v7);
}

- (void)setBuildOutEnabled_NoLock:(BOOL)a3
{
  BOOL v3 = a3;
  long long v5 = [(PVMotionEffectComponent *)self motionEffect];
  [v5 assertDocumentIsLocked];

  uint64_t v6 = [(PVMotionEffectComponent *)self motionEffect];
  [v6 assertDocumentStatusIsLoadedOrReady];

  unsigned int v8 = (void (*)(__n128))*((void *)self->_buildOutEnableChan->var0 + 89);

  v7.n128_f64[0] = (double)v3;
  v8(v7);
}

- (void)applyProperties_NoLock:(id)a3 defaultProperties:(id)a4 documentInfo:(const void *)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(PVMotionEffectComponent *)self motionEffect];
  [v9 assertDocumentIsLocked];

  int v10 = [(PVMotionEffectComponent *)self motionEffect];
  [v10 assertDocumentStatusIsLoadedOrReady];

  unsigned int v11 = [MEMORY[0x1E4F1C9E8] objectForKey:@"RenderStartOffset" inDictionary:v7 orInDefaultDictionary:v8];
  long long v12 = v11;
  if (v11)
  {
    [v11 CMTimeValue];
    [(PVMotionEffectTimelineComponent *)self setRenderStartOffset_NoLock:v23];
  }
  CMTimeEpoch v13 = [MEMORY[0x1E4F1C9E8] objectForKey:@"RenderAtPosterTime" inDictionary:v7 orInDefaultDictionary:v8];
  if (v13)
  {
    long long v14 = [(PVMotionEffectComponent *)self motionEffect];
    objc_msgSend(v14, "didSetCacheInvalidatingParameter_NoLock:forKey:", v13, @"RenderAtPosterTime");
  }
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] objectForKey:@"TitleBuildIn" inDictionary:v7 orInDefaultDictionary:v8];
  CMTimeEpoch v16 = v15;
  if (v15) {
    -[PVMotionEffectTimelineComponent setBuildInEnabled_NoLock:](self, "setBuildInEnabled_NoLock:", [v15 BOOLValue]);
  }
  CMTime v17 = [MEMORY[0x1E4F1C9E8] objectForKey:@"TitleBuildOut" inDictionary:v7 orInDefaultDictionary:v8];
  CMTime v18 = v17;
  if (v17) {
    -[PVMotionEffectTimelineComponent setBuildOutEnabled_NoLock:](self, "setBuildOutEnabled_NoLock:", [v17 BOOLValue]);
  }
  int v19 = [MEMORY[0x1E4F1C9E8] objectForKey:@"ForceDisableLoop" inDictionary:v7 orInDefaultDictionary:v8];
  CMTime v20 = v19;
  if (v19) {
    -[PVMotionEffectTimelineComponent setForceDisableLoop_NoLock:](self, "setForceDisableLoop_NoLock:", [v19 BOOLValue]);
  }
  CMTime v21 = [MEMORY[0x1E4F1C9E8] objectForKey:@"ForceDisableBuildAnimation" inDictionary:v7 orInDefaultDictionary:v8];
  CMTime v22 = v21;
  if (v21) {
    -[PVMotionEffectTimelineComponent setForceDisableBuildAnimation_NoLock:](self, "setForceDisableBuildAnimation_NoLock:", [v21 BOOLValue]);
  }
}

- (void)motionEffect:(id)a3 didBecomeReady:(const void *)a4 properties:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTimelineComponent;
  [(PVMotionEffectComponent *)&v10 motionEffect:v8 didBecomeReady:a4 properties:v9];
  [(PVMotionEffectTimelineComponent *)self updateSceneDuration_NoLock:a4];
  [(PVMotionEffectTimelineComponent *)self applyProperties_NoLock:0 defaultProperties:v9 documentInfo:a4];
}

- (void)motionEffectDidUnload:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PVMotionEffectTimelineComponent;
  [(PVMotionEffectComponent *)&v12 motionEffectDidUnload:v4];
  self->_numFrames = 0;
  self->_frameRate = 0.0;
  long long v5 = (long long *)MEMORY[0x1E4F1FA48];
  long long v6 = *MEMORY[0x1E4F1FA48];
  self->_frameDuration.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  *(_OWORD *)&self->_frameDuration.value = v6;
  posterFrameMarker = self->_posterFrameMarker;
  self->_posterFrameMarker = 0;

  long long v8 = *v5;
  self->_renderStartOffset.CMTimeEpoch epoch = *((void *)v5 + 2);
  *(_OWORD *)&self->_renderStartOffset.value = v8;
  long long v9 = *MEMORY[0x1E4F1F9F8];
  self->_loopTime.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(_OWORD *)&self->_loopTime.value = v9;
  buildInEnableChan = self->_buildInEnableChan;
  if (buildInEnableChan) {
    (*((void (**)(OZChannelBool *, void, void, double))buildInEnableChan->var0 + 89))(buildInEnableChan, MEMORY[0x1E4F1FA48], 0, 0.0);
  }
  buildOutEnableChan = self->_buildOutEnableChan;
  if (buildOutEnableChan) {
    (*((void (**)(OZChannelBool *, void, void, double))buildOutEnableChan->var0 + 89))(buildOutEnableChan, MEMORY[0x1E4F1FA48], 0, 0.0);
  }
  self->_needsToUpdateSceneDuration = 1;
}

- (void)effect:(id)a3 updateProperties:(id)a4 allProperties:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PVMotionEffectTimelineComponent;
  [(PVMotionEffectComponent *)&v17 effect:v8 updateProperties:v9 allProperties:v10];
  unsigned int v11 = [(PVMotionEffectComponent *)self motionEffect];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = *(void *)"";
  v14[2] = __73__PVMotionEffectTimelineComponent_effect_updateProperties_allProperties___block_invoke;
  _OWORD v14[3] = &unk_1E6169040;
  v14[4] = self;
  id v12 = v9;
  id v15 = v12;
  id v13 = v10;
  id v16 = v13;
  objc_msgSend(v11, "runWithDocument_NoLock:", v14);
}

uint64_t __73__PVMotionEffectTimelineComponent_effect_updateProperties_allProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "applyProperties_NoLock:defaultProperties:documentInfo:", *(void *)(a1 + 40), *(void *)(a1 + 48), a2);
}

- (BOOL)motionEffect:(id)a3 propertiesDisableCache:(id)a4 time:(id *)a5 forcePosterFrame:(BOOL)a6
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a5;
  v7.receiver = self;
  v7.super_class = (Class)PVMotionEffectTimelineComponent;
  return -[PVMotionEffectComponent motionEffect:propertiesDisableCache:time:forcePosterFrame:](&v7, sel_motionEffect_propertiesDisableCache_time_forcePosterFrame_, a3, a4, &v8)|| !a6;
}

- (id)motionEffectPropertyKeysThatInvalidateCachedRender:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)PVMotionEffectTimelineComponent;
  BOOL v3 = [(PVMotionEffectComponent *)&v10 motionEffectPropertyKeysThatInvalidateCachedRender:a3];
  id v4 = (void *)MEMORY[0x1E4F1CA80];
  v11[0] = @"RenderAtPosterTime";
  uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  long long v6 = [v4 setWithArray:v5];

  objc_super v7 = [v3 anyObject];
  LOBYTE(v5) = v7 == 0;

  if ((v5 & 1) == 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = [v3 allObjects];
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
  v16.receiver = self;
  v16.super_class = (Class)PVMotionEffectTimelineComponent;
  if ([(PVMotionEffectComponent *)&v16 motionEffect:v10 shouldInvalidateCachedRenderForProperty:v11 oldValue:v12 newValue:v13])
  {
    LOBYTE(v14) = 1;
  }
  else if ([v11 isEqualToString:@"RenderAtPosterTime"])
  {
    int v14 = PVNumbersAreEqualAsBooleans(v12, v13) ^ 1;
  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end