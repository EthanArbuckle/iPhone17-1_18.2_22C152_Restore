@interface PXGEngine
- ($6AF0136504CCF97645EE7C74F8AB9C3B)stats;
- ($EDEBC7EA21717A15148E9A8A98906629)interactionState;
- (BOOL)_isInBackground;
- (BOOL)_shouldDeferContentOffsetUpdates;
- (BOOL)_shouldDeferRenderUntilNextFrame;
- (BOOL)_shouldWaitForScrollEvent;
- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode;
- (BOOL)canBlockMainThreadIfNeeded;
- (BOOL)copyPresentedSpriteFor:(id)a3 geometry:(id *)a4 style:(id *)a5 info:(id *)a6;
- (BOOL)debugEngineUpdates;
- (BOOL)didChangeWindow;
- (BOOL)didDisappear;
- (BOOL)didRenderThisFrame;
- (BOOL)disableMetalViewDisplayCompositing;
- (BOOL)expectingScrollEvents;
- (BOOL)gotScrollEventThisFrame;
- (BOOL)isExporting;
- (BOOL)isInitialLoad;
- (BOOL)isInvisibleForSomeTime;
- (BOOL)isSuspended;
- (BOOL)isVisible;
- (BOOL)lowMemoryMode;
- (BOOL)missedScrollEventThisFrame;
- (BOOL)recursiveUpdateRescheduled;
- (BOOL)scrollStateIncludesScrollEvent;
- (BOOL)shouldReleaseResourcesWhenInvisible;
- (BOOL)slowAnimationsEnabled;
- (BOOL)statsTrackingEnabled;
- (BOOL)wantsImmediateUpdates;
- (NSArray)renderers;
- (NSMutableArray)pendingContentLoadedNotificationBlocks;
- (NSMutableSet)activeInteractions;
- (NSMutableSet)interactions;
- (OS_dispatch_queue)layoutQueue;
- (PXDisplayLinkProtocol)displayLink;
- (PXGAXCoalescingResponder)coalescingAXResponder;
- (PXGAnimator)ppt_animator;
- (PXGEngine)init;
- (PXGEngine)initWithAnimator:(id)a3 renderers:(id)a4 displayLinkClass:(Class)a5 layoutQueue:(id)a6;
- (PXGEngine)initWithPixelBufferDestination:(id)a3 layoutQueue:(id)a4 displayLinkClass:(Class)a5;
- (PXGEngineDelegate)delegate;
- (PXGEntityManager)entityManager;
- (PXGHitTestEnvironment)interactionView;
- (PXGLayout)layout;
- (PXGOverlayTextureManager)overlayTextureManager;
- (PXGRenderer)drivingRenderer;
- (PXGTextureManager)textureManager;
- (PXGTungstenEngineRecordingSession)recordingSession;
- (PXGViewEnvironment)viewEnvironment;
- (PXMediaProvider)mediaProvider;
- (PXScrollController)scrollController;
- (PXScrollViewController)scrollViewController;
- (PXScrollViewSpeedometer)scrollViewSpeedometer;
- (UIScreen)screen;
- (_PXGEngineScrollState)scrollState;
- (double)lastScrollEventTime;
- (id)_createDisplayLinkWithScreen:(id)a3;
- (id)_mergeTexturesByPresentationType:(id)a3 withOverlayTexturesByPresentationType:(id)a4;
- (id)_rendererForPresentationType:(unsigned __int8)a3;
- (id)animationRenderingCompletionHandler;
- (id)renderingCompletionHandler;
- (id)startRecordingToDirectoryURL:(id)a3;
- (id)textureManager:(id)a3 requestRenderSnapshot:(id *)a4 offscreenEffect:(id)a5;
- (int64_t)currentFrameTime;
- (void)__setNeedsUpdate;
- (void)_deferredInvalidate:(unint64_t)a3;
- (void)_enumerateRenderers:(id)a3;
- (void)_extensionHostDidEnterBackground:(id)a3;
- (void)_extensionHostWillEnterForeground:(id)a3;
- (void)_forceInvalidate:(unint64_t)a3;
- (void)_handleRescheduledRecursiveUpdate;
- (void)_handleTimeoutForNotificationBlock:(id)a3;
- (void)_hasBeenInvisibleForSomeTime;
- (void)_invalidateOrDefer:(unint64_t)a3;
- (void)_notifyContentLoadedObserversIfNeeded;
- (void)_performOnLayoutQueue:(id)a3;
- (void)_performRender;
- (void)_propagateTextureConverters;
- (void)_recursiveUpdateDetected;
- (void)_releaseResources;
- (void)_resetChangeDetails;
- (void)_retargetAnimations;
- (void)_setNeedsRender;
- (void)_updateAnimatorWithTargetTimestamp:(double)a3;
- (void)_updateDisplayLink;
- (void)_updateIfNeededWithReason:(id)a3;
- (void)_updateInteractionState;
- (void)_updateInvisibleTextureManager;
- (void)_updateLayout;
- (void)_updateLayoutInteractions;
- (void)_updateScrollStateWithReason:(unint64_t)a3;
- (void)_updateTextureManager;
- (void)_windowSceneDidBeginLiveResize:(id)a3;
- (void)_windowSceneDidEndLiveResize:(id)a3;
- (void)allowSecondRenderThisFrame;
- (void)dealloc;
- (void)ensureUpdatedLayout;
- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4;
- (void)handleDisplayLink:(id)a3;
- (void)handleScreensDidWakeNotification:(id)a3;
- (void)layoutNeedsRenderUpdate:(id)a3;
- (void)layoutNeedsUpdate:(id)a3;
- (void)notifyContentFullyLoadedWithTimeout:(double)a3 block:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)px_scrollControllerDidScroll:(id)a3;
- (void)px_scrollControllerDidUpdate:(id)a3;
- (void)registerAllTextureProvidersWithMediaProvider:(id)a3;
- (void)registerAllTextureProvidersWithMediaProvider:(id)a3 namedImagesBundle:(id)a4;
- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4;
- (void)renderer:(id)a3 viewportSizeWillChange:(CGSize)a4;
- (void)rendererNeedsUpdate:(id)a3;
- (void)rendererPerformRender:(id)a3;
- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3;
- (void)setAnimationRenderingCompletionHandler:(id)a3;
- (void)setCanBlockMainThreadIfNeeded:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDidChangeWindow:(BOOL)a3;
- (void)setDidDisappear:(BOOL)a3;
- (void)setDidRenderThisFrame:(BOOL)a3;
- (void)setDisableMetalViewDisplayCompositing:(BOOL)a3;
- (void)setExpectingScrollEvents:(BOOL)a3;
- (void)setGotScrollEventThisFrame:(BOOL)a3;
- (void)setInteractionState:(id *)a3;
- (void)setInteractionView:(id)a3;
- (void)setIsExporting:(BOOL)a3;
- (void)setIsInitialLoad:(BOOL)a3;
- (void)setIsInvisibleForSomeTime:(BOOL)a3;
- (void)setIsSuspended:(BOOL)a3;
- (void)setLastScrollEventTime:(double)a3;
- (void)setLayout:(id)a3;
- (void)setLowMemoryMode:(BOOL)a3;
- (void)setMediaProvider:(id)a3;
- (void)setMissedScrollEventThisFrame:(BOOL)a3;
- (void)setRecordingSession:(id)a3;
- (void)setRecursiveUpdateRescheduled:(BOOL)a3;
- (void)setRenderingCompletionHandler:(id)a3;
- (void)setScreen:(id)a3;
- (void)setScrollController:(id)a3;
- (void)setScrollStateIncludesScrollEvent:(BOOL)a3;
- (void)setScrollViewController:(id)a3;
- (void)setScrollViewSpeedometer:(id)a3;
- (void)setShouldReleaseResourcesWhenInvisible:(BOOL)a3;
- (void)setSlowAnimationsEnabled:(BOOL)a3;
- (void)setStatsTrackingEnabled:(BOOL)a3;
- (void)setViewEnvironment:(id)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWantsImmediateUpdates:(BOOL)a3;
- (void)test_installRenderSnapshotHandler:(id)a3;
- (void)textureManagerNeedsUpdate:(id)a3;
- (void)updateIfNeeded;
@end

@implementation PXGEngine

- (void)setCanBlockMainThreadIfNeeded:(BOOL)a3
{
  self->_canBlockMainThreadIfNeeded = a3;
}

- (void)_updateIfNeededWithReason:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_isSuspended)
  {
    if (self->_updateFlags.needsUpdate)
    {
      if (self->_updateFlags.isPerformingUpdate) {
        PXGTungstenGetLog();
      }
      *(_WORD *)&self->_updateFlags.isPerformingUpdate = 1;
      self->_updateFlags.updated = 0;
      if ([(PXGEngine *)self statsTrackingEnabled])
      {
        stats = self->_stats;
        *(_OWORD *)&stats->var0[2] = 0u;
        *(_OWORD *)&stats->var0[4] = 0u;
        *(_OWORD *)stats->var0 = 0u;
      }
      v6 = [(PXGEngine *)self displayLink];
      [v6 targetTimestamp];
      double v8 = v7;

      v9 = [(PXGEngine *)self displayLink];
      [v9 currentMediaTime];
      double v11 = v10;

      if (v8 < v11) {
        double v8 = v11;
      }
      self->_animatorWasAnimatingAtBeginningOfFrame = [(PXGAnimator *)self->_animator isAnimating];
      kdebug_trace();
      recordingSession = self->_recordingSession;
      if (recordingSession)
      {
        [(PXGTungstenRecordingSession *)recordingSession startNextFrame];
        v13 = self->_recordingSession;
        v14 = +[PXGEngineRecordingUpdateStartEvent eventWithTargetTimestamp:self->_updateFlags.needsUpdate needsUpdate:self->_pendingUpdateEntities pendingUpdateEntities:v8];
        [(PXGTungstenRecordingSession *)v13 recordEvent:v14];
      }
      unint64_t pendingUpdateEntities = self->_pendingUpdateEntities;
      if (pendingUpdateEntities)
      {
        self->_updateFlags.needsUpdate |= pendingUpdateEntities;
        self->_unint64_t pendingUpdateEntities = 0;
      }
      BOOL v16 = [(PXGEngine *)self _shouldDeferRenderUntilNextFrame];
      [(PXGEngine *)self _updateScrollStateWithReason:3];
      if (!self->_updateFlags.isPerformingUpdate)
      {
        v39 = [MEMORY[0x1E4F28B00] currentHandler];
        v40 = [NSString stringWithUTF8String:"-[PXGEngine _updateIfNeededWithReason:]"];
        [v39 handleFailureInFunction:v40, @"PXGEngine.m", 995, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
      unint64_t needsUpdate = self->_updateFlags.needsUpdate;
      self->_updateFlags.updated |= 1uLL;
      if (needsUpdate)
      {
        self->_updateFlags.unint64_t needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
        [(PXGEngine *)self _updateLayout];
        unint64_t v18 = 1;
      }
      else
      {
        unint64_t v18 = 0;
      }
      if (!self->_updateFlags.isPerformingUpdate)
      {
        v41 = [MEMORY[0x1E4F28B00] currentHandler];
        v42 = [NSString stringWithUTF8String:"-[PXGEngine _updateIfNeededWithReason:]"];
        [v41 handleFailureInFunction:v42, @"PXGEngine.m", 1000, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
      unint64_t v19 = self->_updateFlags.needsUpdate;
      self->_updateFlags.updated |= 2uLL;
      if ((v19 & 2) != 0)
      {
        self->_updateFlags.unint64_t needsUpdate = v19 & 0xFFFFFFFFFFFFFFFDLL;
        v18 |= 2uLL;
        [(PXGEngine *)self _updateAnimatorWithTargetTimestamp:v8];
        unint64_t v19 = self->_updateFlags.needsUpdate;
      }
      if ((v19 & 0xC) != 0) {
        [(PXGEngine *)self _updateInteractionState];
      }
      if (!self->_updateFlags.isPerformingUpdate)
      {
        v43 = [MEMORY[0x1E4F28B00] currentHandler];
        v44 = [NSString stringWithUTF8String:"-[PXGEngine _updateIfNeededWithReason:]"];
        [v43 handleFailureInFunction:v44, @"PXGEngine.m", 1009, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
      unint64_t v20 = self->_updateFlags.needsUpdate;
      self->_updateFlags.updated |= 4uLL;
      if ((v20 & 4) != 0)
      {
        self->_updateFlags.unint64_t needsUpdate = v20 & 0xFFFFFFFFFFFFFFFBLL;
        v18 |= 4uLL;
        BOOL isUpdatingTextureManager = self->_isUpdatingTextureManager;
        self->_BOOL isUpdatingTextureManager = 1;
        [(PXGEngine *)self _updateTextureManager];
        self->_BOOL isUpdatingTextureManager = isUpdatingTextureManager;
      }
      if (!self->_updateFlags.isPerformingUpdate)
      {
        v45 = [MEMORY[0x1E4F28B00] currentHandler];
        v46 = [NSString stringWithUTF8String:"-[PXGEngine _updateIfNeededWithReason:]"];
        [v45 handleFailureInFunction:v46, @"PXGEngine.m", 1017, @"Invalid parameter not satisfying: %@", @"_updateFlags.isPerformingUpdate" file lineNumber description];
      }
      unint64_t v22 = self->_updateFlags.needsUpdate;
      self->_updateFlags.updated |= 8uLL;
      if ((v22 & 8) != 0)
      {
        self->_updateFlags.unint64_t needsUpdate = v22 & 0xFFFFFFFFFFFFFFF7;
        BOOL isUpdatingRenderer = self->_isUpdatingRenderer;
        self->_BOOL isUpdatingRenderer = 1;
        v49[0] = MEMORY[0x1E4F143A8];
        v49[1] = 3221225472;
        v49[2] = __39__PXGEngine__updateIfNeededWithReason___block_invoke;
        v49[3] = &unk_1E5DC6030;
        v49[4] = self;
        [(PXGEngine *)self _enumerateRenderers:v49];
        v24 = self->_recordingSession;
        if (v24)
        {
          v25 = +[PXGEngineRecordingChangeDetailsEvent eventWithChangeDetails:self->_animationChangeDetails];
          [(PXGTungstenRecordingSession *)v24 recordEvent:v25];
        }
        v26 = [(PXGEngine *)self delegate];
        if (v26)
        {
          v27 = [(PXGEngine *)self delegate];
          uint64_t v28 = [v27 engine:self shouldRenderLayout:self->_layout sprites:self->_animationPresentationSpriteDataStore];
        }
        else
        {
          uint64_t v28 = 1;
        }
        v18 |= 8uLL;

        if (v16 | v28 ^ 1)
        {
          self->_pendingUpdateEntities |= 8uLL;
          v29 = self->_recordingSession;
          if (v29)
          {
            v30 = +[PXGEngineDeferRenderEvent eventWithShouldDeferRenderUntilNextFrame:v16 delegateAllowsRender:v28];
            [(PXGTungstenRecordingSession *)v29 recordEvent:v30];
          }
        }
        else
        {
          [(PXGEngine *)self _setNeedsRender];
        }
        self->_BOOL isUpdatingRenderer = isUpdatingRenderer;
      }
      [(PXGEngine *)self _resetChangeDetails];
      if (self->_viewSizeDidChange) {
        [(PXGEngine *)self _deferredInvalidate:13];
      }
      [(PXGEngine *)self _updateDisplayLink];
      self->_previousUpdateEntities = v18;
      [(PXGEngine *)self interactionState];
      long long v31 = v51;
      *(_OWORD *)&self->_previousInteractionState.scrollRegime = *(_OWORD *)buf;
      *(_OWORD *)&self->_previousInteractionState.contentChangeTrend = v31;
      CGSize v32 = v53;
      self->_previousInteractionState.targetRect.origin = v52;
      self->_previousInteractionState.targetRect.size = v32;
      kdebug_trace();
      v33 = self->_recordingSession;
      if (v33)
      {
        v34 = +[PXGEngineRecordingUpdateEndEvent eventWithUpdated:v18 != 0];
        [(PXGTungstenRecordingSession *)v33 recordEvent:v34];
      }
      if (self->_delegateRespondsTo.updateDebugHUDWithStats)
      {
        v35 = [(PXGEngine *)self delegate];
        [v35 engine:self updateDebugHUDWithStats:self->_stats];
      }
      v36 = [(PXGEngine *)self entityManager];
      [v36 cleanupUnusedObjects];

      self->_updateFlags.isPerformingUpdate = 0;
      if (self->_updateFlags.needsUpdate)
      {
        v47 = [MEMORY[0x1E4F28B00] currentHandler];
        v48 = [NSString stringWithUTF8String:"-[PXGEngine _updateIfNeededWithReason:]"];
        objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, @"PXGEngine.m", 1071, @"still needing to update %lu after update pass", self->_updateFlags.needsUpdate);
      }
    }
    else
    {
      self->_updateFlags.willPerformUpdate = 0;
    }
    pendingViewEnvironment = self->_pendingViewEnvironment;
    if (pendingViewEnvironment)
    {
      self->_pendingViewEnvironment = 0;
      v38 = pendingViewEnvironment;

      [(PXGEngine *)self setViewEnvironment:v38];
    }
  }
}

- (void)_updateDisplayLink
{
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  id pendingUpdateEntities = self->_pendingUpdateEntities;
  BOOL v4 = [(PXGEngine *)self didRenderThisFrame];
  BOOL keepDisplayLinkAlive = self->_keepDisplayLinkAlive;
  BOOL v6 = [(PXGEngine *)self gotScrollEventThisFrame];
  BOOL v7 = [(PXGEngine *)self expectingScrollEvents];
  BOOL v8 = [(PXGAnimator *)self->_animator isAnimating];
  BOOL v9 = [(PXGAnimator *)self->_animator hasCriticalAnimations];
  double v10 = [(PXGEngine *)self scrollViewController];
  char v11 = [v10 deferContentOffsetUpdates];

  BOOL v12 = 1;
  if (!needsUpdate
    && !pendingUpdateEntities
    && !v4
    && !keepDisplayLinkAlive
    && !v6
    && !v7
    && !v8
    && !v9
    && (v11 & 1) == 0)
  {
    BOOL v12 = [(PXGEngine *)self isExporting];
  }
  uint64_t v13 = [(PXGEngine *)self isVisible] & v12 ^ 1;
  v14 = [(PXGEngine *)self displayLink];
  [v14 setPaused:v13];

  unsigned int v15 = [(PXGAnimator *)self->_animator highFrameRateReason];
  if (v6 || v7) {
    unsigned int v16 = 2228225;
  }
  else {
    unsigned int v16 = 2228224;
  }
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = v16;
  }
  if (v15) {
    uint64_t v18 = 3;
  }
  else {
    uint64_t v18 = 2;
  }
  unint64_t v19 = [(PXGEngine *)self displayLink];
  [v19 setHighFrameRateReason:v17];

  id v21 = [(PXGEngine *)self displayLink];
  [v21 setFrameRateRangeType:v18];
}

- (PXDisplayLinkProtocol)displayLink
{
  return self->_displayLink;
}

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (BOOL)expectingScrollEvents
{
  return self->_expectingScrollEvents;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (BOOL)gotScrollEventThisFrame
{
  return self->_gotScrollEventThisFrame;
}

- (BOOL)_shouldDeferRenderUntilNextFrame
{
  BOOL v3 = [(PXGEngine *)self didRenderThisFrame];
  if (v3) {
    LOBYTE(v3) = ![(PXGEngine *)self _isInBackground];
  }
  return v3;
}

- (BOOL)didRenderThisFrame
{
  return self->_didRenderThisFrame;
}

- (PXGEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXGEngineDelegate *)WeakRetained;
}

- (BOOL)wantsImmediateUpdates
{
  return self->_wantsImmediateUpdates;
}

- (BOOL)_isInBackground
{
  BOOL v3 = [(PXGEngine *)self layoutQueue];
  BOOL v4 = (void *)MEMORY[0x1E4F14428];

  if (v3 == v4)
  {
    if (_UIApplicationIsExtension())
    {
      if (!self->_extensionHostIsInBackground) {
        goto LABEL_2;
      }
    }
    else
    {
      BOOL v6 = [MEMORY[0x1E4FB1438] sharedApplication];
      uint64_t v7 = [v6 applicationState];

      if (v7 != 2) {
        goto LABEL_2;
      }
    }
    return 1;
  }
LABEL_2:
  return [(PXGEngine *)self wantsImmediateUpdates];
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)layoutNeedsUpdate:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_updateFlags.isPerformingUpdate)
  {
    [(PXGEngine *)self _invalidateOrDefer:1];
    goto LABEL_6;
  }
  if (self->_isUpdatingScrollView || self->_isUpdatingTextureManager)
  {
    [(PXGEngine *)self _deferredInvalidate:1];
LABEL_6:
    id v4 = v5;
  }
}

- (void)_invalidateOrDefer:(unint64_t)a3
{
  if (!self->_updateFlags.isPerformingUpdate
    && ([(PXGEngine *)self _shouldDeferRenderUntilNextFrame]
     || [(PXGEngine *)self _shouldWaitForScrollEvent]))
  {
    [(PXGEngine *)self _deferredInvalidate:a3];
  }
  else
  {
    [(PXGEngine *)self _forceInvalidate:a3];
  }
}

- (void)_deferredInvalidate:(unint64_t)a3
{
  kdebug_trace();
  unint64_t pendingUpdateEntities = self->_pendingUpdateEntities;
  if ((pendingUpdateEntities | a3) != pendingUpdateEntities)
  {
    self->_unint64_t pendingUpdateEntities = pendingUpdateEntities | a3;
    [(PXGEngine *)self _updateDisplayLink];
  }
}

- (BOOL)_shouldWaitForScrollEvent
{
  BOOL v3 = [(PXGEngine *)self expectingScrollEvents];
  if (v3)
  {
    if ([(PXGEngine *)self _isInBackground]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(PXGAnimator *)self->_animator hasCriticalAnimations];
    }
  }
  return v3;
}

- (void)px_scrollControllerDidUpdate:(id)a3
{
  [(PXGEngine *)self _updateScrollStateWithReason:2];
  [(PXGEngine *)self _updateIfNeededWithReason:@"px_scrollControllerDidUpdate"];
}

- (BOOL)statsTrackingEnabled
{
  return self->_statsTrackingEnabled;
}

- (void)rendererNeedsUpdate:(id)a3
{
}

- (void)_updateInteractionState
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  BOOL v3 = [(PXGEngine *)self scrollViewSpeedometer];
  uint64_t v4 = [v3 regime];

  uint64_t v37 = v4;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  id v5 = [(PXGEngine *)self layout];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __36__PXGEngine__updateInteractionState__block_invoke;
  v29[3] = &unk_1E5DC6080;
  v29[4] = &v38;
  v29[5] = &v34;
  v29[6] = &v30;
  [v5 enumerateDescendantsLayoutsUsingBlock:v29];

  BOOL v6 = self->_animatorWasAnimatingAtBeginningOfFrame && [(PXGAnimator *)self->_animator isAnimating];
  BOOL v7 = [(PXGEngine *)self isExporting];
  uint64_t v17 = v35[3];
  BOOL v8 = [(PXGEngine *)self scrollViewController];
  char v9 = [v8 isAnimatingScrollTowardsEdge];
  double v10 = [(PXGEngine *)self scrollViewController];
  char v11 = [v10 isScrubbing];
  BOOL v12 = v6 || *((unsigned char *)v39 + 24) != 0;
  uint64_t v13 = v31[3];
  BOOL v14 = self->_viewSizeDidChange && !v7;
  BOOL v15 = self->_isInitialLoad && !v7;
  BOOL v16 = [(PXGEngine *)self isVisible];
  [(PXGEngine *)self scrollState];
  *(_OWORD *)&v42[5] = *(_OWORD *)&v27[101];
  *(_OWORD *)&v42[21] = v28;
  long long v26 = *(_OWORD *)v42;
  uint64_t v18 = v17;
  char v19 = v9;
  char v20 = v11;
  BOOL v21 = v12;
  uint64_t v22 = v13;
  BOOL v23 = v14;
  BOOL v24 = v15;
  BOOL v25 = v16;
  *(_OWORD *)v27 = *(_OWORD *)&v42[16];
  *(void *)&v27[13] = *((void *)&v28 + 1);
  [(PXGEngine *)self setInteractionState:&v18];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
}

void __36__PXGEngine__updateInteractionState__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1[4] + 8);
  id v11 = v3;
  if (*(unsigned char *)(v5 + 24))
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v3 isAnimating];
    uint64_t v4 = v11;
    uint64_t v5 = *(void *)(a1[4] + 8);
  }
  *(unsigned char *)(v5 + 24) = v6;
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 24);
  uint64_t v8 = [v4 intrinsicScrollRegime];
  if (v7 <= v8) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = v7;
  }
  *(void *)(*(void *)(a1[5] + 8) + 24) = v9;
  uint64_t v10 = [v11 contentChangeTrend];
  if (v10) {
    *(void *)(*(void *)(a1[6] + 8) + 24) = v10;
  }
}

void __38__PXGEngine__updateLayoutInteractions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend(a2, "interactions", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v8 setScrollViewController:*(void *)(a1 + 32)];
        [v8 setView:*(void *)(a1 + 40)];
        [*(id *)(a1 + 48) removeObject:v8];
        [*(id *)(a1 + 56) addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_updateScrollStateWithReason:(unint64_t)a3
{
  v50 = [(PXGEngine *)self scrollController];
  if (![(PXGEngine *)self isExporting])
  {
    [v50 referenceSize];
    double v6 = v5;
    double v49 = v7;
    [v50 contentInset];
    CGFloat v47 = v9;
    CGFloat v48 = v8;
    CGFloat v45 = v11;
    CGFloat v46 = v10;
    [v50 visibleRect];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v50 targetRect];
    CGFloat v43 = v21;
    CGFloat v44 = v20;
    CGFloat v41 = v23;
    CGFloat v42 = v22;
    [v50 constrainedVisibleRect];
    CGFloat v39 = v25;
    CGFloat v40 = v24;
    CGFloat v37 = v27;
    CGFloat v38 = v26;
    long long v28 = [(PXGEngine *)self scrollViewSpeedometer];
    [v28 lastScrollDirection];
    CGFloat v35 = v30;
    CGFloat v36 = v29;
    long long v31 = [(PXGEngine *)self scrollViewSpeedometer];
    int64_t v32 = [v31 regime];

    if (self->_scrollState.referenceSize.width == v6 && self->_scrollState.referenceSize.height == v49) {
      PXEdgeInsetsEqualToEdgeInsets();
    }
    if (a3 == 4
      && (v52.origin.x = v13,
          v52.origin.y = v15,
          v52.size.width = v17,
          v52.size.height = v19,
          !CGRectEqualToRect(self->_scrollState.visibleRect, v52)))
    {
      int v33 = 1;
      [(PXGEngine *)self setGotScrollEventThisFrame:1];
      [(PXGEngine *)self setExpectingScrollEvents:1];
      uint64_t v34 = [(PXGEngine *)self displayLink];
      [v34 currentMediaTime];
      -[PXGEngine setLastScrollEventTime:](self, "setLastScrollEventTime:");

      [(PXGEngine *)self setScrollStateIncludesScrollEvent:1];
      [(PXGEngine *)self _updateDisplayLink];
    }
    else
    {
      int v33 = 0;
    }
    self->_scrollState.referenceSize.width = v6;
    self->_scrollState.referenceSize.height = v49;
    self->_scrollState.contentInsets.top = v48;
    self->_scrollState.contentInsets.left = v47;
    self->_scrollState.contentInsets.bottom = v46;
    self->_scrollState.contentInsets.right = v45;
    self->_scrollState.visibleRect.origin.x = v13;
    self->_scrollState.visibleRect.origin.y = v15;
    self->_scrollState.visibleRect.size.width = v17;
    self->_scrollState.visibleRect.size.height = v19;
    self->_scrollState.targetRect.origin.x = v44;
    self->_scrollState.targetRect.origin.y = v43;
    self->_scrollState.targetRect.size.width = v42;
    self->_scrollState.targetRect.size.height = v41;
    self->_scrollState.constrainedVisibleRect.origin.x = v40;
    self->_scrollState.constrainedVisibleRect.origin.y = v39;
    self->_scrollState.constrainedVisibleRect.size.width = v38;
    self->_scrollState.constrainedVisibleRect.size.height = v37;
    self->_scrollState.lastScrollDirection.x = v36;
    self->_scrollState.lastScrollDirection.y = v35;
    self->_scrollState.scrollSpeedRegime = v32;
    if (!self->_isUpdatingScrollView)
    {
      kdebug_trace();
      if (!v33)
      {
LABEL_13:
        [(PXGEngine *)self _invalidateOrDefer:15];
        goto LABEL_15;
      }
      if ([(PXGEngine *)self _shouldDeferRenderUntilNextFrame])
      {
        [(PXGEngine *)self setMissedScrollEventThisFrame:1];
        goto LABEL_13;
      }
      [(PXGEngine *)self _forceInvalidate:15];
    }
  }
LABEL_15:
}

- (PXScrollViewSpeedometer)scrollViewSpeedometer
{
  return self->_scrollViewSpeedometer;
}

- (PXScrollController)scrollController
{
  return self->_scrollController;
}

- (BOOL)isExporting
{
  return self->_isExporting;
}

- (_PXGEngineScrollState)scrollState
{
  retstr->scrollSpeedRegime = *(void *)&self[4].visibleRect.origin.y;
  CGPoint v3 = *(CGPoint *)&self[4].contentInsets.right;
  retstr->constrainedVisibleRect.size = *(CGSize *)&self[4].contentInsets.left;
  retstr->CGPoint lastScrollDirection = v3;
  CGPoint lastScrollDirection = self[3].lastScrollDirection;
  retstr->visibleRect.size = self[3].constrainedVisibleRect.size;
  retstr->targetRect.CGPoint origin = lastScrollDirection;
  CGPoint v5 = *(CGPoint *)&self[4].referenceSize.height;
  retstr->targetRect.size = *(CGSize *)&self[3].scrollSpeedRegime;
  retstr->constrainedVisibleRect.CGPoint origin = v5;
  CGPoint origin = self[3].targetRect.origin;
  retstr->referenceSize = self[3].visibleRect.size;
  *(CGPoint *)&retstr->contentInsets.top = origin;
  CGPoint v7 = self[3].constrainedVisibleRect.origin;
  *(CGSize *)&retstr->contentInsets.bottom = self[3].targetRect.size;
  retstr->visibleRect.CGPoint origin = v7;
  return self;
}

- (void)setInteractionState:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  CGSize size = a3->var8.size;
  self->_interactionState.targetRect.CGPoint origin = a3->var8.origin;
  self->_interactionState.targetRect.CGSize size = size;
  *(_OWORD *)&self->_interactionState.scrollRegime = v3;
  *(_OWORD *)&self->_interactionState.contentChangeTrend = v4;
}

- (void)setViewEnvironment:(id)a3
{
  double v11 = (PXGViewEnvironment *)a3;
  CGPoint v5 = self->_viewEnvironment;
  pendingViewEnvironment = v11;
  if (v5 == v11) {
    goto LABEL_7;
  }
  CGPoint v7 = v5;
  BOOL v8 = -[PXGViewEnvironment isEqual:](v5, "isEqual:");

  if (!v8 && ![(PXGViewEnvironment *)self->_viewEnvironment hasEqualAppearanceTo:v11])
  {
    if (self->_isUpdatingRenderer)
    {
      double v9 = v11;
      pendingViewEnvironment = self->_pendingViewEnvironment;
      self->_pendingViewEnvironment = v9;
    }
    else
    {
      objc_storeStrong((id *)&self->_viewEnvironment, a3);
      double v10 = [(PXGEngine *)self layout];
      [v10 setViewEnvironment:v11];

      pendingViewEnvironment = [(PXGEngine *)self textureManager];
      [pendingViewEnvironment setViewEnvironment:v11];
    }
LABEL_7:
  }
}

- (void)textureManagerNeedsUpdate:(id)a3
{
}

- (BOOL)canBlockMainThreadIfNeeded
{
  return self->_canBlockMainThreadIfNeeded;
}

uint64_t __26__PXGEngine__updateLayout__block_invoke_4()
{
  return kdebug_trace();
}

- (void)_updateLayout
{
  long long v3 = [(PXGEngine *)self layout];
  long long v4 = self;
  [(PXGEngine *)v4 stats];
  [(PXGEngine *)v4 scrollState];
  kdebug_trace();
  CFAbsoluteTimeGetCurrent();
  CGPoint v5 = [(PXGEngine *)v4 coalescingAXResponder];
  [v5 pauseEventDelivery];
  [v5 setPauseEventDelivery:1];
  [v3 visibleRect];
  PXSizeApproximatelyEqualToSize();
}

- (void)_resetChangeDetails
{
  layoutChangeDetails = self->_layoutChangeDetails;
  uint64_t v4 = [(PXGSpriteDataStore *)self->_layoutSpriteDataStore count];
  uint64_t v5 = MEMORY[0x1E4F1CBF0];
  [(PXGChangeDetails *)layoutChangeDetails configureWithNumberOfSpritesAfterChange:v4 changeDetails:MEMORY[0x1E4F1CBF0]];
  [(PXGChangeDetails *)self->_animationChangeDetails configureWithNumberOfSpritesAfterChange:[(PXGSpriteDataStore *)self->_animationTargetSpriteDataStore count] changeDetails:v5];
  id v7 = [(PXGEngine *)self layout];
  uint64_t v6 = [v7 version];
  [(PXGChangeDetails *)self->_layoutChangeDetails setLayoutVersionAfterChange:v6];
  [(PXGChangeDetails *)self->_layoutChangeDetails setLayoutVersionBeforeChange:v6];
}

- (void)handleDisplayLink:(id)a3
{
  uint64_t v4 = (PXDisplayLinkProtocol *)a3;
  if (self->_displayLink == v4)
  {
    CGFloat v15 = v4;
    [(PXDisplayLinkProtocol *)v4 timestamp];
    [(PXDisplayLinkProtocol *)v15 currentMediaTime];
    [(PXDisplayLinkProtocol *)v15 targetTimestamp];
    kdebug_trace();
    BOOL v5 = [(PXGEngine *)self gotScrollEventThisFrame];
    BOOL v6 = [(PXGEngine *)self missedScrollEventThisFrame];
    [(PXGEngine *)self lastScrollEventTime];
    double v8 = v7;
    [(PXDisplayLinkProtocol *)v15 timestamp];
    uint64_t v10 = v8 >= v9 || v6;
    [(PXGEngine *)self setExpectingScrollEvents:v5 | v10];
    [(PXGEngine *)self setGotScrollEventThisFrame:v10];
    if (v6)
    {
      [(PXGEngine *)self setMissedScrollEventThisFrame:0];
      [(PXGEngine *)self _forceInvalidate:15];
    }
    double v11 = [(PXGEngine *)self textureManager];
    self->_BOOL keepDisplayLinkAlive = [v11 streamUpdatedTexturesForDisplayLinkIfNeeded:v15];

    double lastRenderCompletionTimestamp = self->_lastRenderCompletionTimestamp;
    [(PXDisplayLinkProtocol *)v15 timestamp];
    [(PXGEngine *)self setDidRenderThisFrame:lastRenderCompletionTimestamp > v13];
    if (self->_pendingUpdateEntities)
    {
      self->_unint64_t pendingUpdateEntities = 0;
      -[PXGEngine _invalidateOrDefer:](self, "_invalidateOrDefer:");
    }
    if ([(PXGAnimator *)self->_animator isAnimating]) {
      [(PXGEngine *)self _invalidateOrDefer:2];
    }
    double v14 = [(PXGEngine *)self scrollViewController];
    [v14 setDeferContentOffsetUpdates:0];

    [(PXGEngine *)self _updateDisplayLink];
    uint64_t v4 = v15;
  }
}

- (void)_updateTextureManager
{
  animationPresentationSpriteDataStore = self->_animationPresentationSpriteDataStore;
  if (animationPresentationSpriteDataStore)
  {
    int v5 = [(PXGSpriteDataStore *)animationPresentationSpriteDataStore count];
    if (v5 != [(PXGSpriteDataStore *)self->_animationTargetSpriteDataStore count])
    {
      double v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, self, @"PXGEngine.m", 1307, @"Invalid parameter not satisfying: %@", @"_animationPresentationSpriteDataStore.count == _animationTargetSpriteDataStore.count" object file lineNumber description];
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  animationLayout = self->_animationLayout;
  if (!animationLayout) {
    PXAssertGetLog();
  }
  textureManager = self->_textureManager;
  uint64_t v10 = self->_animationPresentationSpriteDataStore;
  animationTargetSpriteDataStore = self->_animationTargetSpriteDataStore;
  animationChangeDetails = self->_animationChangeDetails;
  [(PXGEngine *)self interactionState];
  [(PXGTextureManager *)textureManager streamTexturesForSpritesInDataStore:animationTargetSpriteDataStore presentationDataStore:v10 changeDetails:animationChangeDetails layout:animationLayout interactionState:v17];
  double v12 = self;
  uint64_t v13 = [(PXGEngine *)v12 stats];
  double v14 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)(v13 + 24) = v14;
  *(double *)(v13 + 72) = v14 + *(double *)(v13 + 72);
  ++*(void *)(v13 + 120);
  double v15 = *(double *)(v13 + 168);
  if (v15 > v14 || v15 == 0.0) {
    *(double *)(v13 + 168) = v14;
  }
  if (*(double *)(v13 + 216) < v14) {
    *(double *)(v13 + 216) = v14;
  }
  [(PXGEngine *)v12 _notifyContentLoadedObserversIfNeeded];
  [(PXGEngine *)v12 _forceInvalidate:8];
}

- (void)_forceInvalidate:(unint64_t)a3
{
  if (self->_updateFlags.isPerformingUpdate)
  {
    if ((self->_updateFlags.updated & a3) != 0) {
      PXGTungstenGetLog();
    }
    unint64_t needsUpdate = self->_updateFlags.needsUpdate;
    goto LABEL_4;
  }
  unint64_t needsUpdate = self->_updateFlags.needsUpdate;
  if (!a3 || needsUpdate)
  {
LABEL_4:
    self->_updateFlags.unint64_t needsUpdate = needsUpdate | a3;
    return;
  }
  BOOL willPerformUpdate = self->_updateFlags.willPerformUpdate;
  self->_updateFlags.unint64_t needsUpdate = a3;
  if (!willPerformUpdate)
  {
    kdebug_trace();
    [(PXGEngine *)self __setNeedsUpdate];
    [(PXGEngine *)self _updateDisplayLink];
  }
}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  long long v3 = *(_OWORD *)&self[8].var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[7].var8.size.height;
  *(_OWORD *)&retstr->var4 = v3;
  CGSize v4 = *(CGSize *)&self[8].var8.origin.y;
  retstr->var8.CGPoint origin = *(CGPoint *)&self[8].var5;
  retstr->var8.CGSize size = v4;
  return self;
}

- (void)_setNeedsRender
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v3 = [(PXGEngine *)self displayLink];
  [v3 timestamp];
  CGSize v4 = [(PXGEngine *)self displayLink];
  [v4 targetTimestamp];
  CACurrentMediaTime();
  kdebug_trace();

  [(PXGEngine *)self setDidRenderThisFrame:1];
  BOOL v5 = [(PXGEngine *)self _shouldDeferContentOffsetUpdates];
  BOOL v6 = [(PXGEngine *)self scrollViewController];
  [v6 setDeferContentOffsetUpdates:v5];

  [(PXGEngine *)self _updateDisplayLink];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  double v7 = [(PXGEngine *)self renderers];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v11++) setNeedsRender];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  double v12 = [(PXGEngine *)self drivingRenderer];

  if (!v12) {
    [(PXGEngine *)self _performRender];
  }
}

- (void)_enumerateRenderers:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CGSize v4 = (void (**)(id, void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  BOOL v5 = [(PXGEngine *)self renderers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSArray)renderers
{
  return self->_renderers;
}

uint64_t __39__PXGEngine__updateIfNeededWithReason___block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateWithChangeDetails:*(void *)(*(void *)(a1 + 32) + 104)];
}

void __27__PXGEngine__performRender__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 presentationType];
  objc_msgSend(v3, "setVisibleRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  long long v5 = *(_OWORD *)(a1 + 120);
  v28[0] = *(_OWORD *)(a1 + 104);
  v28[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 152);
  v28[2] = *(_OWORD *)(a1 + 136);
  v28[3] = v6;
  [v3 setInteractionState:v28];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 96);
  if (v7)
  {
    [v7 cameraConfiguration];
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
  }
  v14[10] = v25;
  v14[11] = v26;
  v14[12] = v27;
  v14[6] = v21;
  v14[7] = v22;
  v14[8] = v23;
  v14[9] = v24;
  v14[2] = v17;
  v14[3] = v18;
  v14[4] = v19;
  v14[5] = v20;
  v14[0] = v15;
  v14[1] = v16;
  [v3 setCameraConfiguration:v14];
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = [NSNumber numberWithUnsignedChar:v4];
  uint64_t v10 = [v8 objectForKeyedSubscript:v9];
  long long v11 = (void *)v10;
  long long v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    long long v12 = (void *)v10;
  }
  id v13 = v12;

  if (!v4)
  {
    if ([*(id *)(a1 + 48) enableMetalRenderer]) {
      goto LABEL_12;
    }
LABEL_11:

    id v13 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_12;
  }
  if (v4 == 1 && ([*(id *)(a1 + 48) enableViewRenderer] & 1) == 0) {
    goto LABEL_11;
  }
LABEL_12:
  [v3 renderSpritesWithTextures:v13 dataStore:*(void *)(*(void *)(a1 + 32) + 88) presentationDataStore:*(void *)(a1 + 56) presentationMetadataStore:*(void *)(a1 + 64) layout:*(void *)(*(void *)(a1 + 32) + 96)];
}

- (void)setDidRenderThisFrame:(BOOL)a3
{
  if (self->_didRenderThisFrame != a3)
  {
    self->_didRenderThisFrame = a3;
    kdebug_trace();
  }
}

- (PXGRenderer)drivingRenderer
{
  return self->_drivingRenderer;
}

- (void)_performRender
{
  v2 = self;
  uint64_t v3 = [(PXGEngine *)v2 stats];
  [(PXGLayout *)v2->_layout visibleRect];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  kdebug_trace();
  double Current = CFAbsoluteTimeGetCurrent();
  id v13 = v2->_animationPresentationSpriteDataStore;
  [(PXGSpriteDataStore *)v13 count];
  long long v14 = v2->_presentationSpriteMetadaStore;
  long long v60 = 0u;
  long long v59 = 0u;
  long long v58 = 0u;
  long long v57 = 0u;
  [(PXGEngine *)v2 interactionState];
  long long v15 = [(PXGEngine *)v2 textureManager];
  long long v16 = [v15 texturesByPresentationType];

  long long v17 = [(PXGEngine *)v2 overlayTextureManager];
  long long v18 = [v17 overlayTexturesByPresentationTypeForTextures:v16 spriteDataStore:v13];

  long long v19 = [(PXGEngine *)v2 _mergeTexturesByPresentationType:v16 withOverlayTexturesByPresentationType:v18];

  double v20 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)(v3 + 32) = v20;
  *(double *)(v3 + 80) = v20 + *(double *)(v3 + 80);
  ++*(void *)(v3 + 128);
  double v21 = *(double *)(v3 + 176);
  if (v21 > v20 || v21 == 0.0) {
    *(double *)(v3 + 176) = v20;
  }
  if (*(double *)(v3 + 224) < v20) {
    *(double *)(v3 + 224) = v20;
  }
  double v22 = CFAbsoluteTimeGetCurrent();
  long long v23 = [off_1E5DA9658 sharedInstance];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __27__PXGEngine__performRender__block_invoke;
  v44[3] = &unk_1E5DC60A8;
  uint64_t v49 = v5;
  uint64_t v50 = v7;
  uint64_t v51 = v9;
  uint64_t v52 = v11;
  long long v53 = v57;
  long long v54 = v58;
  long long v55 = v59;
  long long v56 = v60;
  v44[4] = v2;
  id v24 = v19;
  id v45 = v24;
  id v25 = v23;
  id v46 = v25;
  long long v26 = v13;
  CGFloat v47 = v26;
  long long v27 = v14;
  CGFloat v48 = v27;
  [(PXGEngine *)v2 _enumerateRenderers:v44];
  recordingSession = v2->_recordingSession;
  if (recordingSession)
  {
    CGFloat v42 = v18;
    [(PXGTungstenRecordingSession *)recordingSession frameState];
    v29 = id v43 = v25;
    double v30 = [v29 recordedSpriteIndexes];
    long long v31 = [(PXGEngine *)v2 layout];
    [v31 displayScale];
    int64_t v32 = +[PXGEngineRecordingDataStoreEvent eventWithTextures:dataStore:spriteIndexes:screenScale:](PXGEngineRecordingDataStoreEvent, "eventWithTextures:dataStore:spriteIndexes:screenScale:", v24, v26, v30);
    [(PXGTungstenRecordingSession *)recordingSession recordEvent:v32];

    long long v18 = v42;
    id v25 = v43;
  }
  [(PXGEngine *)v2 setIsInitialLoad:0];
  [(PXGEngine *)v2 setDidDisappear:0];
  int v33 = [(PXGEngine *)v2 layout];
  [v33 setAppearState:1];

  uint64_t v34 = [(PXGEngine *)v2 layout];
  [v34 didRender];

  CGFloat v35 = [(PXGEngine *)v2 displayLink];
  [v35 currentMediaTime];
  v2->_double lastRenderCompletionTimestamp = v36;

  double v37 = CFAbsoluteTimeGetCurrent() - v22;
  *(double *)(v3 + 40) = v37;
  *(double *)(v3 + 88) = v37 + *(double *)(v3 + 88);
  ++*(void *)(v3 + 136);
  double v38 = *(double *)(v3 + 184);
  if (v38 > v37 || v38 == 0.0) {
    *(double *)(v3 + 184) = v37;
  }
  if (*(double *)(v3 + 232) < v37) {
    *(double *)(v3 + 232) = v37;
  }
  CGFloat v39 = [(PXGEngine *)v2 displayLink];
  [v39 targetTimestamp];
  kdebug_trace();

  CGFloat v40 = [(PXGEngine *)v2 renderingCompletionHandler];
  if (v40)
  {
    [(PXGEngine *)v2 setRenderingCompletionHandler:0];
    v40[2](v40);
  }
  if (v2->_delegateRespondsTo.didRender)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v2->_delegate);
    [WeakRetained engineDidRender:v2];
  }
  [(PXGEngine *)v2 _retargetAnimations];
}

- ($6AF0136504CCF97645EE7C74F8AB9C3B)stats
{
  return self->_stats;
}

- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(PXGEngine *)self textureManager];
  [v7 registerTextureProvider:v6 forMediaKind:v4];
}

- (PXGTextureManager)textureManager
{
  return self->_textureManager;
}

- (PXGLayout)layout
{
  return self->_layout;
}

- (PXGOverlayTextureManager)overlayTextureManager
{
  return self->_overlayTextureManager;
}

- (void)_notifyContentLoadedObserversIfNeeded
{
  uint64_t v3 = [(PXGEngine *)self pendingContentLoadedNotificationBlocks];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    uint64_t v17 = 0;
    long long v18 = &v17;
    uint64_t v19 = 0x2020000000;
    char v20 = 0;
    uint64_t v5 = [(PXGEngine *)self entityManager];
    id v6 = [v5 loadingStatus];
    uint64_t v7 = [v6 states];

    animationPresentationSpriteDataStore = self->_animationPresentationSpriteDataStore;
    [(PXGLayout *)self->_layout visibleRect];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke;
    v16[3] = &unk_1E5DD0F80;
    v16[4] = &v17;
    v16[5] = v7;
    -[PXGSpriteDataStore enumerateSpritesInRect:usingBlock:](animationPresentationSpriteDataStore, "enumerateSpritesInRect:usingBlock:", v16);
    if (!*((unsigned char *)v18 + 24))
    {
      uint64_t v9 = [(PXGEngine *)self pendingContentLoadedNotificationBlocks];
      uint64_t v10 = (void *)[v9 copy];

      uint64_t v11 = [(PXGEngine *)self pendingContentLoadedNotificationBlocks];
      [v11 removeAllObjects];

      long long v12 = [(PXGEngine *)self layoutQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke_2;
      block[3] = &unk_1E5DD36F8;
      id v15 = v10;
      id v13 = v10;
      dispatch_async(v12, block);
    }
    _Block_object_dispose(&v17, 8);
  }
}

- (NSMutableArray)pendingContentLoadedNotificationBlocks
{
  return self->_pendingContentLoadedNotificationBlocks;
}

- (id)_mergeTexturesByPresentationType:(id)a3 withOverlayTexturesByPresentationType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = v7;
  if ([v6 count])
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    unsigned __int8 v9 = 0;
    do
    {
      unsigned int v10 = v9;
      uint64_t v11 = [NSNumber numberWithUnsignedChar:v9];
      uint64_t v12 = [v7 objectForKeyedSubscript:v11];

      id v13 = [NSNumber numberWithUnsignedChar:v9];
      uint64_t v14 = [v6 objectForKeyedSubscript:v13];

      if (v12 | v14)
      {
        id v15 = (id)v12;
        id v16 = v15;
        if (v14)
        {
          if (v12)
          {
            uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v14];

            id v16 = (id)v17;
          }
          else
          {
            id v16 = (id)v14;
          }
        }
        long long v18 = [NSNumber numberWithUnsignedChar:v9];
        [v8 setObject:v16 forKey:v18];
      }
      ++v9;
    }
    while (v10 < 2);
  }
  return v8;
}

- (void)__setNeedsUpdate
{
  kdebug_trace();
  id v3 = [(PXGEngine *)self delegate];
  [v3 engineSetNeedsUpdate:self];
}

- (void)setGotScrollEventThisFrame:(BOOL)a3
{
  if (self->_gotScrollEventThisFrame != a3)
  {
    self->_gotScrollEventThisFrame = a3;
    kdebug_trace();
  }
}

- (void)setExpectingScrollEvents:(BOOL)a3
{
  if (self->_expectingScrollEvents != a3)
  {
    self->_expectingScrollEvents = a3;
    kdebug_trace();
  }
}

- (BOOL)missedScrollEventThisFrame
{
  return self->_missedScrollEventThisFrame;
}

- (double)lastScrollEventTime
{
  return self->_lastScrollEventTime;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  if (self->_isInitialLoad != a3)
  {
    self->_isInitialLoad = a3;
    [(PXGEngine *)self _deferredInvalidate:12];
  }
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (id)renderingCompletionHandler
{
  return self->_renderingCompletionHandler;
}

- (void)_retargetAnimations
{
  double renderForTargetTimestamp = self->_renderForTargetTimestamp;
  if (renderForTargetTimestamp != 0.0)
  {
    [(PXDisplayLinkProtocol *)self->_displayLink currentMediaTime];
    if (v4 - renderForTargetTimestamp > 0.0) {
      [(PXGAnimator *)self->_animator retargetAnimationsAfterStartTime:renderForTargetTimestamp newStartTime:v4];
    }
    self->_double renderForTargetTimestamp = 0.0;
  }
  if (![(PXGAnimator *)self->_animator isAnimating])
  {
    id v5 = [(PXGEngine *)self animationRenderingCompletionHandler];
    if (v5)
    {
      [(PXGEngine *)self setAnimationRenderingCompletionHandler:0];
      v5[2]();
    }
  }
}

- (id)animationRenderingCompletionHandler
{
  return self->_animationRenderingCompletionHandler;
}

- (PXGAXCoalescingResponder)coalescingAXResponder
{
  return self->_coalescingAXResponder;
}

- (void)setDidChangeWindow:(BOOL)a3
{
  self->_didChangeWindow = a3;
}

- (void)_updateLayoutInteractions
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = [(PXGEngine *)self interactions];
  double v4 = [(PXGEngine *)self activeInteractions];
  [v4 removeAllObjects];
  id v5 = [(PXGEngine *)self interactionView];
  id v6 = [(PXGEngine *)self scrollViewController];
  id v7 = [(PXGEngine *)self layout];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __38__PXGEngine__updateLayoutInteractions__block_invoke;
  v23[3] = &unk_1E5DC6058;
  id v8 = v6;
  id v24 = v8;
  id v9 = v5;
  id v25 = v9;
  id v10 = v3;
  id v26 = v10;
  id v11 = v4;
  id v27 = v11;
  [v7 enumerateDescendantsLayoutsUsingBlock:v23];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v17, "setScrollViewController:", 0, (void)v19);
        [v17 setView:0];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
    }
    while (v14);
  }

  long long v18 = [(PXGEngine *)self interactions];
  [v18 setSet:v11];
}

- (NSMutableSet)interactions
{
  return self->_interactions;
}

- (PXGHitTestEnvironment)interactionView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactionView);
  return (PXGHitTestEnvironment *)WeakRetained;
}

- (NSMutableSet)activeInteractions
{
  return self->_activeInteractions;
}

- (void)setScrollStateIncludesScrollEvent:(BOOL)a3
{
  self->_scrollStateIncludesScrollEvent = a3;
}

- (BOOL)scrollStateIncludesScrollEvent
{
  return self->_scrollStateIncludesScrollEvent;
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (BOOL)_shouldDeferContentOffsetUpdates
{
  id v3 = [(PXGEngine *)self scrollViewController];
  char v4 = [v3 isTracking];

  if (v4) {
    return 1;
  }
  id v5 = [(PXGEngine *)self scrollViewController];
  char v6 = [v5 isDragging];

  if (v6) {
    return 1;
  }
  id v8 = [(PXGEngine *)self scrollViewController];
  char v9 = [v8 isDecelerating];

  return v9;
}

void __40__PXGEngine__propagateTextureConverters__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 textureConverter];
  if (v3)
  {
    char v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

void __37__PXGEngine_setScrollViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 setScrollViewController:*(void *)(a1 + 32)];
  }
}

- (void)setLayout:(id)a3
{
  id v5 = (PXGLayout *)a3;
  layout = self->_layout;
  long long v18 = v5;
  if (layout != v5)
  {
    [(PXGLayout *)layout setUpdateDelegate:0];
    [(PXGLayout *)self->_layout setEntityManager:0];
    id v7 = [(PXGLayout *)self->_layout changeDetails];
    [v7 removeAllObjects];

    objc_storeStrong((id *)&self->_layout, a3);
    [(PXGLayout *)self->_layout setUpdateDelegate:self];
    id v8 = [(PXGEngine *)self entityManager];
    [(PXGLayout *)self->_layout setEntityManager:v8];

    char v9 = [(PXGEngine *)self coalescingAXResponder];
    [(PXGLayout *)self->_layout setAxNextResponder:v9];

    id v10 = [(PXGLayout *)self->_layout changeDetails];
    [v10 removeAllObjects];

    id v11 = [(PXGLayout *)self->_layout changeDetails];
    id v12 = objc_msgSend(off_1E5DA5568, "changeDetailsWithRemovedIndexRange:", 0, -[PXGSpriteDataStore count](self->_layoutSpriteDataStore, "count"));
    [v11 addObject:v12];

    uint64_t v13 = [(PXGLayout *)self->_layout changeDetails];
    uint64_t v14 = objc_msgSend(off_1E5DA5568, "changeDetailsWithInsertedIndexRange:", 0, -[PXGLayout numberOfSprites](self->_layout, "numberOfSprites"));
    [v13 addObject:v14];

    [(PXGEngine *)self setIsInitialLoad:1];
    uint64_t v15 = [(PXGEngine *)self layoutQueue];
    [(PXGLayout *)v18 setLayoutQueue:v15];

    id v16 = [(PXGEngine *)self viewEnvironment];
    [(PXGLayout *)v18 setViewEnvironment:v16];

    uint64_t v17 = [(PXGEngine *)self mediaProvider];
    [(PXGLayout *)v18 setMediaProvider:v17];

    [(PXGEngine *)self _updateLayoutInteractions];
    [(PXGEngine *)self _invalidateOrDefer:15];
  }
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (PXMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

uint64_t __26__PXGEngine__updateLayout__block_invoke_2()
{
  return kdebug_trace();
}

uint64_t __26__PXGEngine__updateLayout__block_invoke()
{
  return kdebug_trace();
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3 namedImagesBundle:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if (v24)
  {
    id v7 = [PXGDisplayAssetTextureProvider alloc];
    id v8 = [(PXGEngine *)self layoutQueue];
    char v9 = [(PXGDisplayAssetTextureProvider *)v7 initWithDefaultMediaProvider:v24 layoutQueue:v8];

    [(PXGEngine *)self registerTextureProvider:v9 forMediaKind:2];
    [(PXGEngine *)self setMediaProvider:v24];
  }
  id v10 = objc_alloc_init(PXGStringTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v10 forMediaKind:3];

  id v11 = objc_alloc_init(PXGTitleSubtitleTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v11 forMediaKind:4];

  id v12 = objc_alloc_init(PXGSolidColorTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v12 forMediaKind:5];

  uint64_t v13 = objc_alloc_init(PXGDecorationTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v13 forMediaKind:8];

  uint64_t v14 = objc_alloc_init(PXGGradientTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v14 forMediaKind:6];

  uint64_t v15 = objc_alloc_init(PXGShadowTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v15 forMediaKind:7];

  id v16 = objc_alloc_init(PXGViewTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v16 forMediaKind:10];

  uint64_t v17 = objc_alloc_init(PXGCaptureSpriteTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v17 forMediaKind:9];

  long long v18 = objc_alloc_init(PXGPathTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v18 forMediaKind:11];

  long long v19 = objc_alloc_init(PXGPersonTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v19 forMediaKind:12];

  long long v20 = objc_alloc_init(PXGHostedContentTextureProvider);
  [(PXGEngine *)self registerTextureProvider:v20 forMediaKind:13];

  long long v21 = objc_alloc_init(PXGNamedImageTextureProvider);
  long long v22 = v21;
  if (v6)
  {
    [(PXGNamedImageTextureProvider *)v21 setBundle:v6];
  }
  else
  {
    long long v23 = objc_msgSend(MEMORY[0x1E4F28B50], "px_bundle");
    [(PXGNamedImageTextureProvider *)v22 setBundle:v23];
  }
  [(PXGEngine *)self registerTextureProvider:v22 forMediaKind:1];
}

- (void)rendererPerformRender:(id)a3
{
  if (self->_drivingRenderer == a3) {
    [(PXGEngine *)self _performRender];
  }
}

- (void)setScrollViewSpeedometer:(id)a3
{
  id v5 = (PXScrollViewSpeedometer *)a3;
  scrollViewSpeedometer = self->_scrollViewSpeedometer;
  if (scrollViewSpeedometer != v5)
  {
    id v7 = v5;
    [(PXScrollViewSpeedometer *)scrollViewSpeedometer unregisterChangeObserver:self context:speedometerObservationContext];
    objc_storeStrong((id *)&self->_scrollViewSpeedometer, a3);
    [(PXScrollViewSpeedometer *)self->_scrollViewSpeedometer registerChangeObserver:self context:speedometerObservationContext];
    id v5 = v7;
  }
}

- (void)setScrollController:(id)a3
{
  id v5 = (PXScrollController *)a3;
  id v6 = v5;
  if (self->_scrollController != v5)
  {
    uint64_t v7 = [(PXScrollController *)v5 updateDelegate];
    if (v7)
    {
      id v8 = (void *)v7;
      char v9 = [(PXScrollController *)self->_scrollController updateDelegate];

      if (v9 != self) {
        PXAssertGetLog();
      }
    }
    [(PXScrollController *)self->_scrollController setUpdateDelegate:0];
    objc_storeStrong((id *)&self->_scrollController, a3);
    [(PXScrollController *)self->_scrollController setUpdateDelegate:self];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(PXGEngine *)self setScrollViewController:v6];
    }
    [(PXGEngine *)self _updateScrollStateWithReason:0];
  }
}

- (void)setScrollViewController:(id)a3
{
  id v5 = (PXScrollViewController *)a3;
  if (self->_scrollViewController != v5)
  {
    objc_storeStrong((id *)&self->_scrollViewController, a3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __37__PXGEngine_setScrollViewController___block_invoke;
    v6[3] = &unk_1E5DC6030;
    uint64_t v7 = v5;
    [(PXGEngine *)self _enumerateRenderers:v6];
  }
}

- (void)setMediaProvider:(id)a3
{
  id v6 = (PXMediaProvider *)a3;
  if (self->_mediaProvider != v6)
  {
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    id v5 = [(PXGEngine *)self layout];
    [v5 setMediaProvider:v6];
  }
}

- (void)setInteractionView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateRespondsTo.updateDebugHUDWithStats = objc_opt_respondsToSelector() & 1;
    char v6 = objc_opt_respondsToSelector();
    id v5 = obj;
    self->_delegateRespondsTo.didRender = v6 & 1;
    if (self->_updateFlags.needsUpdate)
    {
      [(PXGEngine *)self __setNeedsUpdate];
      id v5 = obj;
    }
  }
}

- (void)renderer:(id)a3 viewportSizeWillChange:(CGSize)a4
{
}

- (void)px_scrollControllerDidScroll:(id)a3
{
  id v4 = a3;
  if (!self->_isUpdatingScrollView)
  {
    id v5 = v4;
    if (self->_isInitialLoad || self->_didDisappear || self->_didChangeWindow)
    {
      [(PXGEngine *)self _updateScrollStateWithReason:5];
    }
    else
    {
      [(PXGEngine *)self _updateScrollStateWithReason:4];
      [(PXGEngine *)self _updateIfNeededWithReason:@"px_scrollControllerDidScroll"];
    }
    id v4 = v5;
  }
}

- (PXGEngine)initWithAnimator:(id)a3 renderers:(id)a4 displayLinkClass:(Class)a5 layoutQueue:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v62.receiver = self;
  v62.super_class = (Class)PXGEngine;
  uint64_t v14 = [(PXGEngine *)&v62 init];
  if (v14)
  {
    id v52 = a3;
    id v55 = v11;
    id v53 = v13;
    uint64_t v15 = (void *)[objc_alloc((Class)off_1E5DA6818) initWithQueue:v13];
    objc_storeStrong((id *)&v14->_entityManager, v15);
    v14->_displayLinkClass = a5;
    objc_storeStrong((id *)&v14->_layoutQueue, a6);
    uint64_t v16 = [(PXGEngine *)v14 _createDisplayLinkWithScreen:0];
    displayLink = v14->_displayLink;
    v14->_displayLink = (PXDisplayLinkProtocol *)v16;

    long long v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    interactions = v14->_interactions;
    v14->_interactions = v18;

    long long v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    activeInteractions = v14->_activeInteractions;
    v14->_activeInteractions = v20;

    long long v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingContentLoadedNotificationBlocks = v14->_pendingContentLoadedNotificationBlocks;
    v14->_pendingContentLoadedNotificationBlocks = v22;

    v14->_canBlockMainThreadIfNeeded = 1;
    v14->_shouldReleaseResourcesWhenInvisible = 1;
    id v54 = v12;
    uint64_t v24 = [v12 copy];
    renderers = v14->_renderers;
    v14->_renderers = (NSArray *)v24;

    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = v14->_renderers;
    uint64_t v26 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (!v26)
    {
      int64_t v32 = v14;
      uint64_t v28 = 0;
      uint64_t v30 = 0;
      uint64_t v57 = 12;
      goto LABEL_23;
    }
    uint64_t v27 = v26;
    LOBYTE(v28) = 0;
    BOOL v29 = 0;
    LOBYTE(v30) = 0;
    uint64_t v31 = *(void *)v59;
    int64_t v32 = v14;
    p_drivingRenderer = (id *)&v14->_drivingRenderer;
    uint64_t v57 = 12;
    while (1)
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v59 != v31) {
          objc_enumerationMutation(obj);
        }
        CGFloat v35 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        objc_msgSend(v35, "setDelegate:", v32, v52);
        [v35 setEntityManager:v15];
        if ([v35 wantsToDriveRender] && !*p_drivingRenderer)
        {
          objc_storeStrong(p_drivingRenderer, v35);
          if (v30)
          {
LABEL_10:
            uint64_t v30 = 1;
            if ((v28 & 1) == 0) {
              goto LABEL_11;
            }
            goto LABEL_15;
          }
        }
        else if (v30)
        {
          goto LABEL_10;
        }
        uint64_t v30 = [v35 wantsBGRATextures];
        if ((v28 & 1) == 0)
        {
LABEL_11:
          uint64_t v28 = [v35 wantsMipmaps];
          if (!v29) {
            goto LABEL_12;
          }
          goto LABEL_16;
        }
LABEL_15:
        uint64_t v28 = 1;
        if (!v29)
        {
LABEL_12:
          BOOL v29 = [v35 presentationType] == 0;
          goto LABEL_17;
        }
LABEL_16:
        BOOL v29 = 1;
LABEL_17:
        if ([v35 destinationColorSpaceName]) {
          uint64_t v57 = [v35 destinationColorSpaceName];
        }
      }
      uint64_t v27 = [(NSArray *)obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (!v27)
      {
LABEL_23:

        double v36 = [off_1E5DA9658 sharedInstance];
        uint64_t v14 = v32;
        -[PXGEngine setLowMemoryMode:](v32, "setLowMemoryMode:", [v36 lowMemoryMode]);
        id v13 = v53;
        double v37 = [[PXGTextureManager alloc] initWithEntityManager:v15 layoutQueue:v53];
        textureManager = v32->_textureManager;
        v32->_textureManager = v37;

        [(PXGTextureManager *)v32->_textureManager setDelegate:v32];
        [(PXGTextureManager *)v32->_textureManager setPreferBGRA:v30];
        [(PXGTextureManager *)v32->_textureManager setPreferMipmaps:v28];
        [(PXGTextureManager *)v32->_textureManager setPreferredColorSpaceName:v57];
        uint64_t v39 = [off_1E5DA6B40 newSpriteDataStore];
        layoutSpriteDataStore = v32->_layoutSpriteDataStore;
        v32->_layoutSpriteDataStore = (PXGSpriteDataStore *)v39;

        CGFloat v41 = (PXGChangeDetails *)objc_alloc_init((Class)off_1E5DA66F0);
        layoutChangeDetails = v32->_layoutChangeDetails;
        v32->_layoutChangeDetails = v41;

        objc_storeStrong((id *)&v32->_animator, v52);
        uint64_t v43 = [off_1E5DA6B40 newSpriteDataStore];
        animationPresentationSpriteDataStore = v32->_animationPresentationSpriteDataStore;
        v32->_animationPresentationSpriteDataStore = (PXGSpriteDataStore *)v43;

        uint64_t v45 = [off_1E5DA6B40 newSpriteDataStore];
        animationTargetSpriteDataStore = v32->_animationTargetSpriteDataStore;
        v32->_animationTargetSpriteDataStore = (PXGSpriteDataStore *)v45;

        v32->_stats = ($6AF0136504CCF97645EE7C74F8AB9C3B *)malloc_type_calloc(1uLL, 0xF0uLL, 0x100004019FCA701uLL);
        v32->_BOOL keepDisplayLinkAlive = 0;
        CGFloat v47 = objc_alloc_init(PXGAXCoalescingResponder);
        coalescingAXResponder = v32->_coalescingAXResponder;
        v32->_coalescingAXResponder = v47;

        [(PXGEngine *)v32 _propagateTextureConverters];
        uint64_t v49 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v49 addObserver:v32 selector:sel__extensionHostDidEnterBackground_ name:*MEMORY[0x1E4F28278] object:0];

        uint64_t v50 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v50 addObserver:v32 selector:sel__extensionHostWillEnterForeground_ name:*MEMORY[0x1E4F28280] object:0];

        id v12 = v54;
        id v11 = v55;
        break;
      }
    }
  }

  return v14;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_lowMemoryMode != a3)
  {
    BOOL v3 = a3;
    self->_lowMemoryMode = a3;
    BOOL v5 = [(PXGEngine *)self lowMemoryMode];
    char v6 = [(PXGEngine *)self textureManager];
    [v6 setLowMemoryMode:v5];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = [(PXGEngine *)self renderers];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setLowMemoryMode:v3];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)_propagateTextureConverters
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PXGEngine__propagateTextureConverters__block_invoke;
  v6[3] = &unk_1E5DC6030;
  id v7 = v3;
  id v4 = v3;
  [(PXGEngine *)self _enumerateRenderers:v6];
  BOOL v5 = [(PXGEngine *)self textureManager];
  [v5 setTextureConverters:v4];
}

- (id)_createDisplayLinkWithScreen:(id)a3
{
  displayLinkClass = self->_displayLinkClass;
  id v5 = a3;
  char v6 = (void *)[[displayLinkClass alloc] initWithWeakTarget:self selector:sel_handleDisplayLink_ screen:v5 queue:self->_layoutQueue];

  return v6;
}

- (void)setVisible:(BOOL)a3
{
  if (self->_visible != a3)
  {
    self->_visible = a3;
    [(PXGEngine *)self _updateDisplayLink];
    if (a3)
    {
      id pendingIsInvisibleForSomeTimeBlock = self->_pendingIsInvisibleForSomeTimeBlock;
      if (pendingIsInvisibleForSomeTimeBlock)
      {
        dispatch_block_cancel(pendingIsInvisibleForSomeTimeBlock);
        id v6 = self->_pendingIsInvisibleForSomeTimeBlock;
        self->_id pendingIsInvisibleForSomeTimeBlock = 0;
      }
      [(PXGEngine *)self setIsInvisibleForSomeTime:0];
    }
    else
    {
      [(PXGEngine *)self setDidDisappear:1];
      id v7 = [(PXGEngine *)self layout];
      [v7 setAppearState:3];

      if (!self->_pendingIsInvisibleForSomeTimeBlock)
      {
        objc_initWeak(&location, self);
        uint64_t v14 = MEMORY[0x1E4F143A8];
        uint64_t v15 = 3221225472;
        uint64_t v16 = __24__PXGEngine_setVisible___block_invoke;
        uint64_t v17 = &unk_1E5DD32D0;
        objc_copyWeak(&v18, &location);
        dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, &v14);
        id v9 = self->_pendingIsInvisibleForSomeTimeBlock;
        self->_id pendingIsInvisibleForSomeTimeBlock = v8;

        uint64_t v10 = objc_msgSend(off_1E5DA9658, "sharedInstance", v14, v15, v16, v17);
        [v10 inactivityTimeout];
        dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
        long long v13 = [(PXGEngine *)self layoutQueue];
        dispatch_after(v12, v13, self->_pendingIsInvisibleForSomeTimeBlock);

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      if ([(PXGEngine *)self lowMemoryMode]) {
        [(PXGEngine *)self _releaseResources];
      }
    }
  }
}

- (void)setScreen:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_screen, obj);
    id v5 = obj;
    if (obj)
    {
      int v6 = [(objc_class *)self->_displayLinkClass supportsSpecificScreen];
      id v5 = obj;
      if (v6)
      {
        [(PXDisplayLinkProtocol *)self->_displayLink invalidate];
        id v7 = [(PXGEngine *)self _createDisplayLinkWithScreen:obj];
        displayLink = self->_displayLink;
        self->_displayLink = v7;

        [(PXGEngine *)self _updateDisplayLink];
        id v5 = obj;
      }
    }
  }
}

- (void)setIsInvisibleForSomeTime:(BOOL)a3
{
  if (self->_isInvisibleForSomeTime != a3)
  {
    BOOL v4 = a3;
    self->_isInvisibleForSomeTime = a3;
    if ([(PXGEngine *)self shouldReleaseResourcesWhenInvisible])
    {
      if (v4)
      {
        id v3 = [off_1E5DA9658 sharedInstance];
        uint64_t v6 = [v3 shouldDeactivateTextureManagerWhenNotVisible];
      }
      else
      {
        uint64_t v6 = 0;
      }
      id v7 = [(PXGEngine *)self textureManager];
      [v7 setIsInactive:v6];

      if (v4)
      {

        [(PXGEngine *)self _updateInvisibleTextureManager];
        [(PXGEngine *)self _releaseResources];
      }
      else
      {
        [(PXGEngine *)self _invalidateOrDefer:13];
      }
    }
  }
}

- (void)setDisableMetalViewDisplayCompositing:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_disableMetalViewDisplayCompositing != a3)
  {
    BOOL v3 = a3;
    self->_disableMetalViewDisplayCompositing = a3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    BOOL v4 = [(PXGEngine *)self renderers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(id *)(*((void *)&v14 + 1) + 8 * v8);
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0) {
            id v10 = v9;
          }
          else {
            id v10 = 0;
          }

          double v11 = [v10 renderDestination];

          if (v11)
          {
            id v12 = v11;
            if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
            {
              id v13 = v12;

              [v13 setDisableDisplayCompositing:v3];
            }
            else
            {

              id v13 = 0;
            }
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (void)_updateAnimatorWithTargetTimestamp:(double)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  double Current = CFAbsoluteTimeGetCurrent();
  [(PXGAnimator *)self->_animator setPreferredFramesPerSecond:[(PXDisplayLinkProtocol *)self->_displayLink preferredFramesPerSecond]];
  animator = self->_animator;
  layoutSpriteDataStore = self->_layoutSpriteDataStore;
  layoutChangeDetails = self->_layoutChangeDetails;
  layout = self->_layout;
  animationPresentationSpriteDataStore = self->_animationPresentationSpriteDataStore;
  animationTargetSpriteDataStore = self->_animationTargetSpriteDataStore;
  id v23 = 0;
  id v24 = 0;
  -[PXGAnimator computeAnimationStateForTime:inputSpriteDataStore:inputChangeDetails:inputLayout:viewportShift:animationPresentationSpriteDataStore:animationTargetSpriteDataStore:animationChangeDetails:animationLayout:](animator, "computeAnimationStateForTime:inputSpriteDataStore:inputChangeDetails:inputLayout:viewportShift:animationPresentationSpriteDataStore:animationTargetSpriteDataStore:animationChangeDetails:animationLayout:", layoutSpriteDataStore, layoutChangeDetails, layout, animationPresentationSpriteDataStore, animationTargetSpriteDataStore, &v24, a3, self->_viewportShift.x, self->_viewportShift.y, &v23);
  id v12 = v24;
  id v13 = v24;
  long long v14 = (PXGLayout *)v23;
  self->_viewportShift = (CGPoint)*MEMORY[0x1E4F1DAD8];
  objc_storeStrong((id *)&self->_animationChangeDetails, v12);
  if (!v14) {
    PXAssertGetLog();
  }
  animationLayout = self->_animationLayout;
  self->_animationLayout = v14;
  long long v16 = v14;

  long long v17 = [(PXGLayout *)self->_layout spriteMetadataStore];
  presentationSpriteMetadaStore = self->_presentationSpriteMetadaStore;
  self->_presentationSpriteMetadaStore = v17;

  [(PXGSpriteDataStore *)self->_animationPresentationSpriteDataStore count];
  kdebug_trace();
  uint64_t v19 = self;
  uint64_t v20 = [(PXGEngine *)v19 stats];
  double v21 = CFAbsoluteTimeGetCurrent() - Current;
  *(double *)(v20 + 16) = v21;
  *(double *)(v20 + 64) = v21 + *(double *)(v20 + 64);
  ++*(void *)(v20 + 112);
  double v22 = *(double *)(v20 + 160);
  if (v22 > v21 || v22 == 0.0) {
    *(double *)(v20 + 160) = v21;
  }
  if (*(double *)(v20 + 208) < v21) {
    *(double *)(v20 + 208) = v21;
  }
  if (v19->_renderForTargetTimestamp == 0.0) {
    v19->_double renderForTargetTimestamp = a3;
  }
  [(PXGEngine *)v19 _forceInvalidate:12];
}

- (void)registerAllTextureProvidersWithMediaProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_coalescingAXResponder, 0);
  objc_destroyWeak((id *)&self->_interactionView);
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_renderers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_overlayTextureManager, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_pendingContentLoadedNotificationBlocks, 0);
  objc_storeStrong((id *)&self->_activeInteractions, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_drivingRenderer, 0);
  objc_storeStrong(&self->_animationRenderingCompletionHandler, 0);
  objc_storeStrong(&self->_renderingCompletionHandler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_textureManager, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_scrollViewSpeedometer, 0);
  objc_storeStrong((id *)&self->_scrollController, 0);
  objc_storeStrong((id *)&self->_pendingViewEnvironment, 0);
  objc_storeStrong(&self->_pendingIsInvisibleForSomeTimeBlock, 0);
  objc_storeStrong((id *)&self->_presentationSpriteMetadaStore, 0);
  objc_storeStrong((id *)&self->_animationChangeDetails, 0);
  objc_storeStrong((id *)&self->_animationLayout, 0);
  objc_storeStrong((id *)&self->_animationTargetSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_animationPresentationSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_layoutChangeDetails, 0);
  objc_storeStrong((id *)&self->_layoutSpriteDataStore, 0);
  objc_storeStrong((id *)&self->_animator, 0);
}

- (void)setShouldReleaseResourcesWhenInvisible:(BOOL)a3
{
  self->_shouldReleaseResourcesWhenInvisible = a3;
}

- (BOOL)shouldReleaseResourcesWhenInvisible
{
  return self->_shouldReleaseResourcesWhenInvisible;
}

- (BOOL)didChangeWindow
{
  return self->_didChangeWindow;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (BOOL)disableMetalViewDisplayCompositing
{
  return self->_disableMetalViewDisplayCompositing;
}

- (void)setWantsImmediateUpdates:(BOOL)a3
{
  self->_wantsImmediateUpdates = a3;
}

- (BOOL)slowAnimationsEnabled
{
  return self->_slowAnimationsEnabled;
}

- (void)setStatsTrackingEnabled:(BOOL)a3
{
  self->_statsTrackingEnabled = a3;
}

- (UIScreen)screen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_screen);
  return (UIScreen *)WeakRetained;
}

- (void)setRecursiveUpdateRescheduled:(BOOL)a3
{
  self->_recursiveUpdateRescheduled = a3;
}

- (BOOL)recursiveUpdateRescheduled
{
  return self->_recursiveUpdateRescheduled;
}

- (void)setRecordingSession:(id)a3
{
}

- (PXGTungstenEngineRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (BOOL)isInvisibleForSomeTime
{
  return self->_isInvisibleForSomeTime;
}

- (void)setLastScrollEventTime:(double)a3
{
  self->_lastScrollEventTime = a3;
}

- (BOOL)isSuspended
{
  return self->_isSuspended;
}

- (void)setIsExporting:(BOOL)a3
{
  self->_isExporting = a3;
}

- (void)setAnimationRenderingCompletionHandler:(id)a3
{
}

- (void)setRenderingCompletionHandler:(id)a3
{
}

- (void)setSlowAnimationsEnabled:(BOOL)a3
{
  if (self->_slowAnimationsEnabled != a3)
  {
    self->_slowAnimationsEnabled = a3;
    BOOL v4 = [off_1E5DA9658 sharedInstance];
    [v4 slowAnimationsSpeed];
    double v6 = v5;

    double v7 = 1.0;
    if (self->_slowAnimationsEnabled) {
      double v7 = v6;
    }
    animator = self->_animator;
    [(PXGAnimator *)animator setSpeed:v7];
  }
}

- (BOOL)debugEngineUpdates
{
  return 0;
}

- (id)startRecordingToDirectoryURL:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXGEngine *)self recordingSession];
  if (v5
    && (double v6 = (void *)v5,
        [(PXGEngine *)self recordingSession],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isStopped],
        v7,
        v6,
        !v8))
  {
    double v11 = 0;
  }
  else
  {
    id v9 = [[PXGTungstenEngineRecordingSession alloc] initWithEngine:self directoryURL:v4];
    recordingSession = self->_recordingSession;
    self->_recordingSession = v9;

    [(PXGEngine *)self _invalidateOrDefer:8];
    double v11 = [(PXGEngine *)self recordingSession];
  }

  return v11;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)speedometerObservationContext != a5)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXGEngine.m" lineNumber:1727 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 2) != 0)
  {
    id v11 = v9;
    if (self->_isUpdatingScrollView) {
      [(PXGEngine *)self _deferredInvalidate:5];
    }
    else {
      [(PXGEngine *)self _invalidateOrDefer:5];
    }
    id v9 = v11;
  }
}

- (id)textureManager:(id)a3 requestRenderSnapshot:(id *)a4 offscreenEffect:(id)a5
{
  uint64_t var0 = a4->var0;
  id v8 = a5;
  id v9 = [(PXGEngine *)self _rendererForPresentationType:var0];
  long long v10 = *(_OWORD *)&a4->var1.origin.y;
  v13[0] = *(_OWORD *)&a4->var0;
  v13[1] = v10;
  CGFloat height = a4->var1.size.height;
  id v11 = [v9 renderSnapshotForRequest:v13 offscreenEffect:v8];

  return v11;
}

- (void)layoutNeedsRenderUpdate:(id)a3
{
}

- (id)_rendererForPresentationType:(unsigned __int8)a3
{
  int v3 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(PXGEngine *)self renderers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 presentationType] == v3)
        {
          id v10 = v9;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return v10;
}

- (void)_performOnLayoutQueue:(id)a3
{
  dispatch_block_t block = a3;
  id v4 = [(PXGEngine *)self layoutQueue];
  uint64_t v5 = (void *)MEMORY[0x1E4F14428];

  if (v4 == v5) {
    px_dispatch_on_main_queue();
  }
  uint64_t v6 = [(PXGEngine *)self layoutQueue];
  dispatch_async(v6, block);
}

uint64_t __26__PXGEngine__updateLayout__block_invoke_3()
{
  return kdebug_trace();
}

- (void)updateIfNeeded
{
}

- (void)ensureUpdatedLayout
{
  if (self->_updateFlags.isPerformingUpdate) {
    return;
  }
  int v3 = [(PXGEngine *)self layout];
  id v4 = [v3 changeDetails];
  if ([v4 count])
  {

LABEL_5:
    [(PXGEngine *)self _forceInvalidate:1];
    goto LABEL_6;
  }
  unint64_t pendingUpdateEntities = self->_pendingUpdateEntities;

  if (pendingUpdateEntities) {
    goto LABEL_5;
  }
LABEL_6:
  [(PXGEngine *)self _updateIfNeededWithReason:@"ensureUpdatedLayout"];
}

- (void)allowSecondRenderThisFrame
{
}

- (void)_handleRescheduledRecursiveUpdate
{
  [(PXGEngine *)self setRecursiveUpdateRescheduled:0];
  [(PXGEngine *)self _forceInvalidate:15];
}

- (void)_recursiveUpdateDetected
{
  if (![(PXGEngine *)self recursiveUpdateRescheduled])
  {
    [(PXGEngine *)self setRecursiveUpdateRescheduled:1];
    objc_initWeak(&location, self);
    int v3 = [(PXGEngine *)self layoutQueue];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __37__PXGEngine__recursiveUpdateDetected__block_invoke;
    v4[3] = &unk_1E5DD32D0;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __37__PXGEngine__recursiveUpdateDetected__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRescheduledRecursiveUpdate];
}

- (void)setMissedScrollEventThisFrame:(BOOL)a3
{
  if (self->_missedScrollEventThisFrame != a3)
  {
    self->_missedScrollEventThisFrame = a3;
    kdebug_trace();
  }
}

uint64_t __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke(uint64_t result, uint64_t a2, unsigned int **a3, unsigned char *a4)
{
  if (*(unsigned __int8 *)(*(void *)(result + 40) + **a3) - 1 <= 1)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateObjectsUsingBlock:&__block_literal_global_41];
}

uint64_t __50__PXGEngine__notifyContentLoadedObserversIfNeeded__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, 1);
}

- (void)_handleTimeoutForNotificationBlock:(id)a3
{
  id aBlock = a3;
  id v4 = [(PXGEngine *)self pendingContentLoadedNotificationBlocks];
  id v5 = _Block_copy(aBlock);
  uint64_t v6 = [v4 indexOfObject:v5];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = [(PXGEngine *)self pendingContentLoadedNotificationBlocks];
    [v7 removeObjectAtIndex:v6];

    (*((void (**)(id, void))aBlock + 2))(aBlock, 0);
  }
}

- (void)notifyContentFullyLoadedWithTimeout:(double)a3 block:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PXGEngine *)self pendingContentLoadedNotificationBlocks];
  id v8 = _Block_copy(v6);
  [v7 addObject:v8];

  [(PXGEngine *)self _invalidateOrDefer:5];
  objc_initWeak(&location, self);
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  id v10 = [(PXGEngine *)self layoutQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PXGEngine_notifyContentFullyLoadedWithTimeout_block___block_invoke;
  block[3] = &unk_1E5DD1848;
  objc_copyWeak(&v14, &location);
  id v13 = v6;
  id v11 = v6;
  dispatch_after(v9, v10, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __55__PXGEngine_notifyContentFullyLoadedWithTimeout_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleTimeoutForNotificationBlock:*(void *)(a1 + 32)];
}

- (PXGAnimator)ppt_animator
{
  return self->_animator;
}

- (int64_t)currentFrameTime
{
  v2 = [(PXGEngine *)self displayLink];
  [v2 targetTimestamp];
  int64_t v4 = llround(v3 * 1000.0);

  return v4;
}

- (void)test_installRenderSnapshotHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__PXGEngine_test_installRenderSnapshotHandler___block_invoke;
  v6[3] = &unk_1E5DC5FE8;
  id v7 = v4;
  id v5 = v4;
  [(PXGEngine *)self _enumerateRenderers:v6];
  [(PXGEngine *)self _invalidateOrDefer:8];
}

void __47__PXGEngine_test_installRenderSnapshotHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "setTest_renderSnapshotHandler:", *(void *)(a1 + 32));
  }
}

- (void)_releaseResources
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  PXGTungstenGetLog();
}

uint64_t __30__PXGEngine__releaseResources__block_invoke(uint64_t a1, void *a2)
{
  return [a2 releaseResources];
}

- (void)_updateInvisibleTextureManager
{
  [(PXGEngine *)self _updateInteractionState];
  [(PXGEngine *)self _updateTextureManager];
  [(PXGEngine *)self _invalidateOrDefer:4];
}

- (void)_hasBeenInvisibleForSomeTime
{
  if (![(PXGEngine *)self isVisible])
  {
    [(PXGEngine *)self setIsInvisibleForSomeTime:1];
  }
}

- (void)setIsSuspended:(BOOL)a3
{
  if (self->_isSuspended != a3)
  {
    self->_isSuspended = a3;
    if (!a3) {
      [(PXGEngine *)self __setNeedsUpdate];
    }
  }
}

void __24__PXGEngine_setVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hasBeenInvisibleForSomeTime];
}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  if (self->_allowLargerImagesDuringScrollingInLowMemoryMode != a3)
  {
    self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
    BOOL v4 = [(PXGEngine *)self allowLargerImagesDuringScrollingInLowMemoryMode];
    id v5 = [(PXGEngine *)self textureManager];
    [v5 setAllowLargerImagesDuringScrollingInLowMemoryMode:v4];
  }
}

- (BOOL)lowMemoryMode
{
  if (self->_lowMemoryMode) {
    return 1;
  }
  id v3 = [off_1E5DA9658 sharedInstance];
  char v4 = [v3 lowMemoryMode];

  return v4;
}

- (void)_windowSceneDidEndLiveResize:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXGEngine__windowSceneDidEndLiveResize___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXGEngine *)self _performOnLayoutQueue:v3];
}

uint64_t __42__PXGEngine__windowSceneDidEndLiveResize___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 265) = 0;
  return [*(id *)(a1 + 32) _invalidateOrDefer:13];
}

- (void)_windowSceneDidBeginLiveResize:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXGEngine__windowSceneDidBeginLiveResize___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXGEngine *)self _performOnLayoutQueue:v3];
}

uint64_t __44__PXGEngine__windowSceneDidBeginLiveResize___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 265) = 1;
  return result;
}

- (void)_extensionHostWillEnterForeground:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__PXGEngine__extensionHostWillEnterForeground___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXGEngine *)self _performOnLayoutQueue:v3];
}

void __47__PXGEngine__extensionHostWillEnterForeground___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 264) = 0;
  PXGTungstenGetLog();
}

- (void)_extensionHostDidEnterBackground:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PXGEngine__extensionHostDidEnterBackground___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXGEngine *)self _performOnLayoutQueue:v3];
}

void __46__PXGEngine__extensionHostDidEnterBackground___block_invoke(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 264) = 1;
  PXGTungstenGetLog();
}

- (void)handleScreensDidWakeNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__PXGEngine_handleScreensDidWakeNotification___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXGEngine *)self _performOnLayoutQueue:v3];
}

uint64_t __46__PXGEngine_handleScreensDidWakeNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateDisplayLink];
}

- (BOOL)copyPresentedSpriteFor:(id)a3 geometry:(id *)a4 style:(id *)a5 info:(id *)a6
{
  id v10 = a3;
  [(PXGEngine *)self ensureUpdatedLayout];
  id v11 = [(PXGEngine *)self layout];
  long long v12 = [v11 changeDetails];
  uint64_t v13 = [v12 count];

  if (v13) {
    PXAssertGetLog();
  }
  id v14 = [(PXGEngine *)self layout];
  unsigned int v15 = [v14 spriteIndexForSpriteReference:v10 options:0];

  if (v15 != -1)
  {
    layoutSpriteDataStore = self->_layoutSpriteDataStore;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__PXGEngine_copyPresentedSpriteFor_geometry_style_info___block_invoke;
    v18[3] = &__block_descriptor_56_e34_v52__0I8____________________12_B44l;
    v18[4] = a4;
    v18[5] = a5;
    v18[6] = a6;
    [(PXGSpriteDataStore *)layoutSpriteDataStore enumerateSpritesInRange:v15 | 0x100000000 usingBlock:v18];
  }
  return v15 != -1;
}

__n128 __56__PXGEngine_copyPresentedSpriteFor_geometry_style_info___block_invoke(void *a1, uint64_t a2, void *a3)
{
  id v3 = (_OWORD *)a1[4];
  char v4 = (_OWORD *)a3[1];
  long long v5 = v4[1];
  *id v3 = *v4;
  v3[1] = v5;
  id v6 = (_OWORD *)a1[5];
  id v7 = (_OWORD *)a3[2];
  long long v8 = v7[5];
  long long v10 = v7[2];
  long long v9 = v7[3];
  void v6[4] = v7[4];
  v6[5] = v8;
  v6[2] = v10;
  v6[3] = v9;
  long long v11 = v7[9];
  long long v13 = v7[6];
  long long v12 = v7[7];
  v6[8] = v7[8];
  v6[9] = v11;
  v6[6] = v13;
  v6[7] = v12;
  long long v14 = v7[1];
  _OWORD *v6 = *v7;
  v6[1] = v14;
  uint64_t v15 = a1[6];
  uint64_t v16 = a3[3];
  __n128 result = *(__n128 *)v16;
  long long v18 = *(_OWORD *)(v16 + 16);
  *(void *)(v15 + 32) = *(void *)(v16 + 32);
  *(__n128 *)uint64_t v15 = result;
  *(_OWORD *)(v15 + 16) = v18;
  return result;
}

- (void)enumerateSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  [(PXGEngine *)self ensureUpdatedLayout];
  long long v10 = [(PXGEngine *)self layout];
  long long v11 = [v10 changeDetails];
  uint64_t v12 = [v11 count];

  if (v12) {
    PXAssertGetLog();
  }
  layoutSpriteDataStore = self->_layoutSpriteDataStore;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __47__PXGEngine_enumerateSpritesInRect_usingBlock___block_invoke;
  v14[3] = &unk_1E5DC5F80;
  id v15 = v9;
  -[PXGSpriteDataStore enumerateSpritesInRect:usingBlock:](layoutSpriteDataStore, "enumerateSpritesInRect:usingBlock:", v14, x, y, width, height);
}

uint64_t __47__PXGEngine_enumerateSpritesInRect_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dealloc
{
  free(self->_stats);
  [(PXDisplayLinkProtocol *)self->_displayLink invalidate];
  [(PXGSpriteDataStore *)self->_layoutSpriteDataStore recycle];
  [(PXGSpriteDataStore *)self->_animationPresentationSpriteDataStore recycle];
  [(PXGSpriteDataStore *)self->_animationTargetSpriteDataStore recycle];
  v3.receiver = self;
  v3.super_class = (Class)PXGEngine;
  [(PXGEngine *)&v3 dealloc];
}

- (PXGEngine)init
{
  char v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXGEngine.m", 365, @"%s is not available as initializer", "-[PXGEngine init]");

  abort();
}

- (PXGEngine)initWithPixelBufferDestination:(id)a3 layoutQueue:(id)a4 displayLinkClass:(Class)a5
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = [v9 layoutQueue];

  if (v11 != v10)
  {
    CGFloat v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"PXGEngine.m", 346, @"Invalid parameter not satisfying: %@", @"pixelBufferDestination.layoutQueue == layoutQueue" object file lineNumber description];
  }
  uint64_t v12 = [[PXGMetalRenderer alloc] initWithRenderDestination:v9 layoutQueue:v10];
  long long v13 = objc_alloc_init(PXGAnimator);
  v36[0] = v12;
  long long v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
  id v15 = [(PXGEngine *)self initWithAnimator:v13 renderers:v14 displayLinkClass:a5 layoutQueue:v10];

  if (v15)
  {
    [v9 renderBoundsInPoints];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    [v9 renderBoundsInPoints];
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    [v9 renderBoundsInPoints];
    v15->_scrollState.referenceSize.double width = v17;
    v15->_scrollState.referenceSize.double height = v19;
    long long v28 = *((_OWORD *)off_1E5DAAF10 + 1);
    *(_OWORD *)&v15->_scrollState.contentInsets.top = *(_OWORD *)off_1E5DAAF10;
    *(_OWORD *)&v15->_scrollState.contentInsets.bottom = v28;
    v15->_scrollState.visibleRect.origin.double x = v21;
    v15->_scrollState.visibleRect.origin.double y = v23;
    v15->_scrollState.visibleRect.size.double width = v25;
    v15->_scrollState.visibleRect.size.double height = v27;
    CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v15->_scrollState.targetRect.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v15->_scrollState.targetRect.CGSize size = v29;
    v15->_scrollState.constrainedVisibleRect.origin.double x = v30;
    v15->_scrollState.constrainedVisibleRect.origin.double y = v31;
    v15->_scrollState.constrainedVisibleRect.size.double width = v32;
    v15->_scrollState.constrainedVisibleRect.size.double height = v33;
    v15->_scrollState.CGPoint lastScrollDirection = (CGPoint)*MEMORY[0x1E4F1DAD8];
    v15->_scrollState.scrollSpeedRegime = 0;
  }

  return v15;
}

@end