@interface MRRenderer
+ (BOOL)isDiskImageCacheEnabled;
+ (double)textScaleForResolution:(CGSize)a3;
- (BOOL)_doActions;
- (BOOL)_r_prerenderWithPassParameters:(id)a3;
- (BOOL)allowsThumbnails;
- (BOOL)asynchronousOperationsAreSuspended;
- (BOOL)beginTextEditingOfElement:(id)a3 inLayer:(id)a4 callDelegate:(BOOL)a5;
- (BOOL)beginTextEditingOfElement:(id)a3 inPlug:(id)a4 callDelegate:(BOOL)a5;
- (BOOL)canGoBack;
- (BOOL)canGoForth;
- (BOOL)canGoToMoreSlides:(BOOL)a3;
- (BOOL)displaysFPS;
- (BOOL)displaysHitZonesVisualFeedback;
- (BOOL)displaysIsPreloadingImages;
- (BOOL)displaysPlayingIDs;
- (BOOL)displaysTouchVisualFeedback;
- (BOOL)getVerticesCoordinatesForCurrentlyEditedTextElement:(CGPoint *)(a3;
- (BOOL)hideTextWhileEditing;
- (BOOL)ignoresBackgroundAudio;
- (BOOL)interactivityIsEnabled;
- (BOOL)isCleanedUp;
- (BOOL)isEditing;
- (BOOL)isFlipped;
- (BOOL)isOffscreen;
- (BOOL)isPlaying;
- (BOOL)logRenderingTimes;
- (BOOL)prerenderWithPassParameters:(id)a3;
- (BOOL)pushRendering;
- (BOOL)requestRenderingOnChanges;
- (BOOL)requestRenderingWithin:(double)a3;
- (BOOL)screenBurnTest;
- (BOOL)slaveFrameMode;
- (BOOL)slideshowIsPlaying;
- (CGImage)currentFrameAsCGImage;
- (CGImage)snapshotAsCGImageForTime:(double)a3 andSize:(CGSize)a4;
- (CGPoint)_fixPointForUnprojectionForOrientation:(CGPoint)a3;
- (CGPoint)_fixProjectedPointForOrientation:(CGPoint)a3;
- (CGPoint)contextOffset;
- (CGSize)_maxSizeForCurrentEditingTextElement;
- (CGSize)size;
- (MCMontage)montage;
- (MRAsynchronousOperationsDelegate)asynchronousOperationsDelegate;
- (MRCameraCaptureSession)cameraCaptureSession;
- (MRContext)context;
- (MREditingDelegate)editingDelegate;
- (MRFeatureDelegate)featureDelegate;
- (MRLiveSlideshowDelegate)liveSlideshowDelegate;
- (MRRenderer)init;
- (MRRenderer)initWithParameters:(id)a3;
- (MRRenderingDelegate)renderingDelegate;
- (MZMediaManagement)assetManagementDelegate;
- (NSDictionary)parameters;
- (NSString)currentFocusedSlideAsset;
- (NSString)renderingLogFilePath;
- (NSString)transitionLayerPlugObjectID;
- (OS_dispatch_queue)renderDispatchQueue;
- (double)_doAction:(id)a3;
- (double)_time;
- (double)_unalteredTime;
- (double)animateCurrentFocuserToSlideFocusModeWithDuration:(double)a3;
- (double)currentSlideshowTime;
- (double)defaultPauseResumeOnTap:(BOOL)a3;
- (double)enterSlideFocusModeWithState:(id)a3 animate:(BOOL)a4;
- (double)enterSlideZoomMode;
- (double)exitSlideFocusMode;
- (double)exitSlideZoomMode:(BOOL)a3;
- (double)fadeInDuration;
- (double)fadeInStartTime;
- (double)fadeOutDuration;
- (double)fadeOutStartTime;
- (double)focusedTransitionCancel:(id)a3;
- (double)focusedTransitionEnd:(id)a3;
- (double)focusedTransitionStart:(id)a3;
- (double)focusedTransitionUpdate:(id)a3;
- (double)interactiveTransitionProgressThreshold;
- (double)interactiveTransitionTrackingBoxRadius;
- (double)interactiveTransitionVelocityThreshold;
- (double)masterClock;
- (double)slideZoomCancel:(id)a3;
- (double)slideZoomEnd:(id)a3;
- (double)slideZoomStart:(id)a3;
- (double)slideZoomUpdate:(id)a3;
- (double)slideshowTransitionCancel:(id)a3;
- (double)slideshowTransitionEnd:(id)a3;
- (double)slideshowTransitionStart:(id)a3;
- (double)slideshowTransitionUpdate:(id)a3;
- (double)time;
- (double)timeQuantum;
- (double)timestampOfLastRenderPass;
- (float)volume;
- (id)_computeMatrixChainForLayer:(id)a3;
- (id)_layerForPlugObjectID:(id)a3;
- (id)actionByEvaluatingConditionalAction:(id)a3 withStates:(id)a4;
- (id)chooseTransitionIDForRandomTransitionPresetID:(id)a3;
- (id)currentState;
- (id)currentStateForMontageSwap;
- (id)currentlyShowingAssetPaths;
- (id)defaultActionsWithHitLayer:(id)a3 atPoint:(CGPoint)a4;
- (id)layerAtPath:(id)a3 fromLayer:(id)a4;
- (id)layerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5;
- (id)plugForCurrentSublayerInNavigatorForPlug:(id)a3;
- (id)selectedLayers;
- (id)slideInfoForCurrentElement:(id)a3;
- (id)slideInfosForCurrentElements;
- (id)snapshotOfStates:(id)a3 atSize:(CGSize)a4;
- (int)mode;
- (int)orientation;
- (int64_t)_maxLinesForCurrentEditingTextElement;
- (unsigned)currentLayoutIndex;
- (void)_adaptToPressureLevel:(int)a3;
- (void)_cleanupGestureRecognizers;
- (void)_createSlideFocusLayer;
- (void)_dimLayersExceptForPathTo:(id)a3;
- (void)_displayFPS:(double)a3 actuallyDisplay:(BOOL)a4;
- (void)_displayHitZonesVisualFeedback;
- (void)_displayIsPreloadingImages;
- (void)_displayPlayingIDs;
- (void)_displayTouchVisualFeedback;
- (void)_doLayerTrackingAtLocation:(CGPoint)a3;
- (void)_findAndHandleBestRecognizerInRecognizers:(id)a3;
- (void)_playbackIsOverWithTime:(double)a3 sendNotification:(BOOL)a4;
- (void)_r_beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5;
- (void)_r_doSnapshot;
- (void)_r_endMorphing;
- (void)_r_pause;
- (void)_r_render;
- (void)_r_renderForScreenBurnTestAtTime:(double)a3;
- (void)_r_renderRotation;
- (void)_r_renderWithPassParameters:(id)a3;
- (void)_r_resume;
- (void)_r_setTime:(double)a3 isResyncing:(BOOL)a4;
- (void)_r_snapshotForRotation;
- (void)_r_startRenderTimer;
- (void)_r_stopRenderTimer;
- (void)_r_syncIsPlayingToOuter;
- (void)_r_syncTimeToOuter;
- (void)_r_updateTimeWithDisplayLinkTimestamp:(double)a3;
- (void)_renderOnDisplayLink:(id)a3;
- (void)_renderThreadMain;
- (void)_startDisplayLinkOnRunloop;
- (void)_startMonitoringThermalPressureLevelChanges;
- (void)_stopMonitoringThermalPressureLevelChanges;
- (void)_undimAllLayersInLayer:(id)a3;
- (void)addAudioObject:(id)a3;
- (void)addIDToDisplay:(id)a3 :(id)a4;
- (void)addNavigatorToBackHistory:(id)a3;
- (void)addNavigatorToForthHistory:(id)a3;
- (void)applyStateForMontageSwap:(id)a3;
- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5;
- (void)cleanup;
- (void)dealloc;
- (void)deselectAllLayers;
- (void)deselectLayer:(id)a3;
- (void)didGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4;
- (void)dimLayersExceptForPathTo:(id)a3;
- (void)disableFadeInAndOut;
- (void)doAction:(id)a3;
- (void)dumpActiveHierarchy;
- (void)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5;
- (void)endMorphing;
- (void)endTextEditing:(BOOL)a3;
- (void)freeze;
- (void)goBack;
- (void)goForth;
- (void)gotoNextFocusedSlide:(BOOL)a3;
- (void)gotoNextInterestingTime:(BOOL)a3;
- (void)gotoPreviousFocusedSlide:(BOOL)a3;
- (void)gotoPreviousInterestingTime:(BOOL)a3;
- (void)gotoState:(id)a3;
- (void)imagePreloadingBegan;
- (void)imagePreloadingEnded;
- (void)jumpToNextMarker;
- (void)jumpToPreviousMarker;
- (void)moveNavigatorFromBackToForthHistory:(id)a3;
- (void)moveNavigatorFromForthToBackHistory:(id)a3;
- (void)nearingEndForSerializer:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)pauseSlideshow;
- (void)pauseWhenStill;
- (void)processAudioObjects;
- (void)removeAudioObject:(id)a3;
- (void)removeNavigatorFromBackHistory:(id)a3;
- (void)removeNavigatorFromForthHistory:(id)a3;
- (void)render;
- (void)requestRendering:(BOOL)a3;
- (void)resetFadeInAndOut;
- (void)resume;
- (void)resumeSlideshow;
- (void)selectLayer:(id)a3;
- (void)sendMCAction:(id)a3 fromSender:(id)a4;
- (void)sendMCAction:(id)a3 fromSender:(id)a4 toTarget:(id)a5;
- (void)sendNotification:(id)a3;
- (void)setAllowsThumbnails:(BOOL)a3;
- (void)setAssetManagementDelegate:(id)a3;
- (void)setAsynchronousOperationsDelegate:(id)a3;
- (void)setCameraCaptureSession:(id)a3;
- (void)setContextOffset:(CGPoint)a3;
- (void)setCurrentLayoutIndex:(unsigned __int8)a3;
- (void)setDisplaysFPS:(BOOL)a3;
- (void)setDisplaysHitZonesVisualFeedback:(BOOL)a3;
- (void)setDisplaysIsPreloadingImages:(BOOL)a3;
- (void)setDisplaysPlayingIDs:(BOOL)a3;
- (void)setDisplaysTouchVisualFeedback:(BOOL)a3;
- (void)setEAGLContext:(id)a3;
- (void)setEditingDelegate:(id)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeInStartTime:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setFadeOutStartTime:(double)a3;
- (void)setFeatureDelegate:(id)a3;
- (void)setFreezeSizeOfImageRequests:(BOOL)a3;
- (void)setHideTextWhileEditing:(BOOL)a3;
- (void)setIgnoresBackgroundAudio:(BOOL)a3;
- (void)setInteractiveTransitionProgressThreshold:(double)a3;
- (void)setInteractiveTransitionTrackingBoxRadius:(double)a3;
- (void)setInteractiveTransitionVelocityThreshold:(double)a3;
- (void)setInteractivityIsEnabled:(BOOL)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setLiveSlideshowDelegate:(id)a3;
- (void)setLogRenderingTimes:(BOOL)a3;
- (void)setMasterClock:(double)a3;
- (void)setMasterStartTime:(double)a3 andDuration:(double)a4 mode:(int)a5;
- (void)setMode:(int)a3;
- (void)setMontage:(id)a3;
- (void)setOrientation:(int)a3;
- (void)setPushRendering:(BOOL)a3;
- (void)setRenderingDelegate:(id)a3;
- (void)setRequestRenderingOnChanges:(BOOL)a3;
- (void)setScreenBurnTest:(BOOL)a3;
- (void)setSize:(CGSize)a3;
- (void)setSlaveFrameMode:(BOOL)a3;
- (void)setSlideFocusModeBackgroundColor:(CGColor *)a3;
- (void)setSlideshowTime:(double)a3;
- (void)setTemporarySize:(CGSize)a3;
- (void)setTime:(double)a3;
- (void)setTimeQuantum:(double)a3;
- (void)setTimestampOfLastRenderPass:(double)a3;
- (void)setTransitionLayerPlugObjectID:(id)a3;
- (void)setUseCGLFlushDrawableWorkaround:(BOOL)a3;
- (void)setUsesExternalDisplayLink:(BOOL)a3;
- (void)setVolume:(float)a3;
- (void)stepBackward;
- (void)stepForward;
- (void)suspendAsynchronousOperations:(BOOL)a3;
- (void)swapMontage:(id)a3;
- (void)touchesBegan:(id)a3;
- (void)touchesCancelled:(id)a3;
- (void)touchesEnded:(id)a3;
- (void)touchesMoved:(id)a3;
- (void)transitionToNextPlugInContainerOfPlug:(id)a3;
- (void)transitionToPreviousPlugInContainerOfPlug:(id)a3;
- (void)undimAllLayers;
- (void)unfreeze;
- (void)updateTimeWithDisplayLinkTimestamp:(double)a3;
- (void)warmupVideo:(BOOL)a3;
- (void)willGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4 animate:(BOOL)a5;
@end

@implementation MRRenderer

- (void)doAction:(id)a3
{
  if (a3)
  {
    [a3 check];
    mActions = self->mInternal->mActions;
    objc_sync_enter(mActions);
    [(NSMutableArray *)self->mInternal->mActions addObject:a3];
    objc_sync_exit(mActions);
    if ([(MRRenderer *)self requestRenderingOnChanges])
    {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (void)sendMCAction:(id)a3 fromSender:(id)a4
{
  v6 = [[MRAction alloc] initWithAction:a3 inRenderer:self];
  [(MRAction *)v6 setSender:a4];
  [(MRRenderer *)self time];
  -[MRAction setTime:](v6, "setTime:");
  mActions = self->mInternal->mActions;
  objc_sync_enter(mActions);
  [(NSMutableArray *)self->mInternal->mActions addObject:v6];
  objc_sync_exit(mActions);

  [(MRRenderer *)self requestRendering:0];
}

- (void)sendMCAction:(id)a3 fromSender:(id)a4 toTarget:(id)a5
{
  v7 = [[MRAction alloc] initWithAction:a3 andTarget:a5];
  [(MRAction *)v7 setSender:a4];
  [(MRRenderer *)self time];
  -[MRAction setTime:](v7, "setTime:");
  mActions = self->mInternal->mActions;
  objc_sync_enter(mActions);
  [(NSMutableArray *)self->mInternal->mActions addObject:v7];
  objc_sync_exit(mActions);

  [(MRRenderer *)self requestRendering:0];
}

- (id)actionByEvaluatingConditionalAction:(id)a3 withStates:(id)a4
{
  id v6 = [a3 predicate];
  id v7 = (id)qword_1F12F0;
  if (!qword_1F12F0)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    qword_1F12F0 = (uint64_t)v7;
  }
  v8 = (MUMathExpressionFloatBased *)[v7 objectForKey:v6];
  if (v8)
  {
    v9 = v8;
    [(MUMathExpressionFloatBased *)v8 resetAllVariables];
  }
  else
  {
    v9 = [[MUMathExpressionFloatBased alloc] initWithString:v6 error:0];
    if (v9)
    {
      [(id)qword_1F12F0 setObject:v9 forKey:v6];
    }
  }
  [(MUMathExpressionFloatBased *)v9 setVariableValues:a4];
  [(MUMathExpressionFloatBased *)v9 evaluate];
  if (v10 == 0.0)
  {
    return [a3 actionIfFalse];
  }
  else
  {
    return [a3 actionIfTrue];
  }
}

- (double)_doAction:(id)a3
{
  id v5 = [a3 mcAction];
  if (v5)
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = (void (*)(void))*((void *)[v6 block] + 2);
      v7();
      return result;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [a3 resolvedTarget];
      if (v9)
      {
        float v10 = v9;
        id v11 = [a3 mcAction];
        id v12 = [a3 specificObject];
        [v10 doTransition:v11 backwards:0 pzr:v12];
        return result;
      }
      return 0.0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [a3 resolvedTarget];
      if (v13)
      {
        [v13 doAnimationTrigger:a3];
        return result;
      }
      return 0.0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = [a3 resolvedTarget];
      if (!v14) {
        return 0.0;
      }
      [v14 doActionTrigger:a3];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [a3 resolvedTarget];
        if (!v15) {
          return 0.0;
        }
        [v15 doStateOperation:a3];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v16 = [a3 resolvedTarget];
          if (!v16) {
            return 0.0;
          }
          [v16 doMotionTrigger:a3];
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = -[MRAction initWithAction:inRenderer:]([MRAction alloc], "initWithAction:inRenderer:", -[MRRenderer actionByEvaluatingConditionalAction:withStates:](self, "actionByEvaluatingConditionalAction:withStates:", [a3 mcAction], objc_msgSend(a3, "states")), self);
              -[MRAction setSender:](v23, "setSender:", [a3 sender]);
              -[MRAction setStates:](v23, "setStates:", [a3 states]);
              [a3 time];
              -[MRAction setTime:](v23, "setTime:");
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                double v17 = 0.0;
                if (objc_opt_isKindOfClass())
                {
                  long long v47 = 0u;
                  long long v48 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  id v30 = objc_msgSend(objc_msgSend(a3, "mcAction"), "actions");
                  id v31 = [v30 countByEnumeratingWithState:&v47 objects:v55 count:16];
                  if (v31)
                  {
                    id v32 = v31;
                    uint64_t v33 = *(void *)v48;
                    do
                    {
                      for (i = 0; i != v32; i = (char *)i + 1)
                      {
                        if (*(void *)v48 != v33) {
                          objc_enumerationMutation(v30);
                        }
                        v35 = [[MRAction alloc] initWithAction:*(void *)(*((void *)&v47 + 1) + 8 * i) inRenderer:self];
                        -[MRAction setSender:](v35, "setSender:", [a3 sender]);
                        -[MRAction setStates:](v35, "setStates:", objc_msgSend(objc_msgSend(a3, "states"), "mutableCopy"));
                        [a3 time];
                        -[MRAction setTime:](v35, "setTime:");
                        [(MRRenderer *)self _doAction:v35];
                        double v37 = v36;

                        if (v37 > v17) {
                          double v17 = v37;
                        }
                      }
                      id v32 = [v30 countByEnumeratingWithState:&v47 objects:v55 count:16];
                    }
                    while (v32);
                  }
                }
                return v17;
              }
              id v24 = [a3 resolvedTarget];
              id v25 = [v6 prefix];
              id v26 = v25;
              if (v25)
              {
                v27 = (char *)[v25 length] + 1;
                v28 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [a3 states]);
              }
              else
              {
                v28 = (NSMutableDictionary *)[a3 states];
                v27 = 0;
              }
              v23 = -[MRAction initWithAction:inRenderer:]([MRAction alloc], "initWithAction:inRenderer:", [v6 action], self);
              -[MRAction setSender:](v23, "setSender:", [a3 sender]);
              [(MRAction *)v23 setStates:v28];
              [a3 time];
              -[MRAction setTime:](v23, "setTime:");
              long long v53 = 0u;
              long long v54 = 0u;
              long long v51 = 0u;
              long long v52 = 0u;
              id v40 = [v24 sublayers];
              id v41 = [v40 countByEnumeratingWithState:&v51 objects:v56 count:16];
              if (v41)
              {
                id v42 = v41;
                uint64_t v43 = *(void *)v52;
                do
                {
                  for (j = 0; j != v42; j = (char *)j + 1)
                  {
                    if (*(void *)v52 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    uint64_t v45 = *(void *)(*((void *)&v51 + 1) + 8 * (void)j);
                    if (v26) {
                      -[NSMutableDictionary setObject:forKey:](v28, "setObject:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*((void *)&v51 + 1) + 8 * (void)j), "idInSupercontainer"), "substringFromIndex:", v27), "intValue")), @"_forEachPlugIndex");
                    }
                    [(MRAction *)v23 setResolvedTarget:v45];
                    [(MRRenderer *)self _doAction:v23];
                  }
                  id v42 = [v40 countByEnumeratingWithState:&v51 objects:v56 count:16];
                }
                while (v42);
              }
            }
            [(MRRenderer *)self _doAction:v23];
            double v17 = v46;

            return v17;
          }
          id v18 = [a3 resolvedTarget];
          double v17 = 0.0;
          if (!v18) {
            return v17;
          }
          v19 = v18;
          id v20 = objc_msgSend(objc_msgSend(a3, "mcAction"), "attributes");
          id v21 = [v20 objectForKey:@"type"];
          if ([v21 isEqualToString:@"phaseIn"])
          {
            id v22 = [v20 objectForKey:@"plugID"];
            [v19 phaseInSublayerForKey:v22];
          }
          else if ([v21 isEqualToString:@"phaseOut"])
          {
            id v29 = [v20 objectForKey:@"plugID"];
            [v19 phaseOutSublayerForKey:v29];
          }
          else
          {
            if ([v21 isEqualToString:@"startTracking"])
            {
              id v38 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithObjectsAndKeys:", v19, @"layer", objc_msgSend(a3, "mcAction"), @"action", 0);
              mLayerTrackings = self->mInternal->mLayerTrackings;
              if (!mLayerTrackings)
              {
                self->mInternal->mLayerTrackings = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
                mLayerTrackings = self->mInternal->mLayerTrackings;
              }
              -[NSMutableDictionary setObject:forKey:](mLayerTrackings, "setObject:forKey:", v38, [v19 uuid]);

              return v17;
            }
            if ([v21 isEqualToString:@"endTracking"])
            {
              -[NSMutableDictionary removeObjectForKey:](self->mInternal->mLayerTrackings, "removeObjectForKey:", [v19 uuid]);
              return v17;
            }
            [v19 doGenericAction:a3];
          }
        }
      }
    }
  }
  else
  {
    [a3 invoke];
  }
  return result;
}

- (BOOL)_doActions
{
  BOOL v3 = 0;
  double v4 = 0.0;
  while (1)
  {
    mActions = self->mInternal->mActions;
    objc_sync_enter(mActions);
    if (![(NSMutableArray *)self->mInternal->mActions count]) {
      break;
    }
    id v6 = self->mInternal->mActions;
    self->mInternal->mActions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_sync_exit(mActions);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v24;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v24 != v8) {
            objc_enumerationMutation(v6);
          }
          float v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          [(MRRenderer *)self _doAction:v10];
          double v12 = v11;
          [v10 time];
          if (v12 > v4 && v13 > -100000.0) {
            double v4 = v12;
          }
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v7);
      BOOL v3 = 1;
    }
  }
  objc_sync_exit(mActions);
  [(MRRenderer *)self time];
  if (v4 > 0.0)
  {
    double v16 = v15;
    if (![(MRRenderer *)self isPlaying]
      || (mInternal = self->mInternal, double mMasterDuration = mInternal->mMasterDuration, mMasterDuration > 0.0)
      && v4 + v16 >= mMasterDuration + mInternal->mMasterStartTime)
    {
      [(MRRenderer *)self time];
      double v20 = v19;
      [(MRRenderer *)self timeQuantum];
      [(MRRenderer *)self setMasterStartTime:2 andDuration:v20 mode:v4 + v21];
      [(MRRenderer *)self resume];
    }
  }
  return v3;
}

- (double)defaultPauseResumeOnTap:(BOOL)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3C438;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  return 0.0;
}

- (BOOL)slideshowIsPlaying
{
  return !self->_slideshowIsPaused;
}

- (void)resumeSlideshow
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3C504;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)pauseSlideshow
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3C740;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (double)currentSlideshowTime
{
  id v2 = [(MRRenderer *)self _layerForPlugObjectID:self->mInternal->mTransitionLayerPlugObjectID];
  [v2 timeIn];
  double v4 = v3;
  [v2 currentSlideshowTime];
  return v4 + v5;
}

- (void)setSlideshowTime:(double)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3C9E4;
  v4[3] = &unk_1AA668;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (BOOL)canGoToMoreSlides:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MRRenderer *)self _layerForPlugObjectID:self->mInternal->mTransitionLayerPlugObjectID];
  return [v4 canTransitionToMoreSlides:v3];
}

- (void)jumpToNextMarker
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3CC10;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)jumpToPreviousMarker
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3CD58;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)gotoNextInterestingTime:(BOOL)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3CEA4;
  v4[3] = &unk_1AA720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (void)gotoPreviousInterestingTime:(BOOL)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_3CFFC;
  v4[3] = &unk_1AA720;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (void)gotoNextFocusedSlide:(BOOL)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3D150;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (void)gotoPreviousFocusedSlide:(BOOL)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3D2CC;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
}

- (id)defaultActionsWithHitLayer:(id)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (![(MRRenderer *)self cameraCaptureSession])
  {
    mSlideFocusState = self->mInternal->mSlideFocusState;
    if (!mSlideFocusState)
    {
      id v8 = +[NSMutableDictionary dictionary];
      if (a3) {
        id v14 = objc_msgSend(a3, "elementHitAtPoint:localPoint:", 0, x, y);
      }
      else {
        id v14 = 0;
      }
      v24[5] = _NSConcreteStackBlock;
      v24[6] = 3221225472;
      v24[7] = sub_3DD60;
      v24[8] = &unk_1AA770;
      v24[9] = a3;
      v24[10] = v14;
      v24[11] = self;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_3DDE0;
      v24[3] = &unk_1AA798;
      v24[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v24), @"onDoubleHitEnd");
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_3DDEC;
      v23[3] = &unk_1AA748;
      v23[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v23), @"onPanHorizontalStart");
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_3DDF8;
      v22[3] = &unk_1AA748;
      v22[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v22), @"onPanHorizontalUpdate");
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_3DE04;
      v21[3] = &unk_1AA748;
      v21[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v21), @"onPanHorizontalEnd");
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_3DE10;
      v20[3] = &unk_1AA748;
      v20[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v20), @"onPanHorizontalCancel");
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_3DE1C;
      v19[3] = &unk_1AA748;
      v19[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v19), @"onPanHorizontalStart2");
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_3DE28;
      v18[3] = &unk_1AA748;
      v18[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v18), @"onPanHorizontalUpdate2");
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_3DE34;
      v17[3] = &unk_1AA748;
      v17[4] = self;
      objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v17), @"onPanHorizontalEnd2");
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_3DE40;
      v16[3] = &unk_1AA748;
      v16[4] = self;
      double v12 = +[MRMCBlockAction blockActionWithBlock:v16];
      CFStringRef v13 = @"onPanHorizontalCancel2";
      goto LABEL_17;
    }
    unsigned __int8 v10 = [(MRSlideFocusState *)mSlideFocusState isInZoomMode];
    id v8 = +[NSMutableDictionary dictionary];
    if (a3)
    {
      id v11 = objc_msgSend(a3, "elementHitAtPoint:localPoint:", 0, x, y);
      if (v10)
      {
        if (!v11) {
          return v8;
        }
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_3DC98;
        v36[3] = &unk_1AA748;
        v36[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v36), @"onPanZoomRotationStart");
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_3DCA4;
        v35[3] = &unk_1AA748;
        v35[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v35), @"onPanZoomRotationUpdate");
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_3DCB0;
        v34[3] = &unk_1AA748;
        v34[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v34), @"onPanZoomRotationEnd");
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_3DCBC;
        v33[3] = &unk_1AA748;
        v33[4] = self;
        double v12 = +[MRMCBlockAction blockActionWithBlock:v33];
        CFStringRef v13 = @"onPanZoomRotationCancel";
LABEL_17:
        [v8 setObject:v12 forKey:v13];
        return v8;
      }
      if (v11)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_3DCC8;
        v32[3] = &unk_1AA748;
        v32[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v32), @"onZoomStart");
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_3DD0C;
        v31[3] = &unk_1AA748;
        v31[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v31), @"onZoomUpdate");
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_3DD18;
        v30[3] = &unk_1AA748;
        v30[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v30), @"onZoomEnd");
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_3DD24;
        v29[3] = &unk_1AA748;
        v29[4] = self;
        objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v29), @"onZoomCancel");
      }
    }
    else if (v10)
    {
      return v8;
    }
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_3DD30;
    v28[3] = &unk_1AA748;
    v28[4] = self;
    objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v28), @"onPanHorizontalStart");
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_3DD3C;
    v27[3] = &unk_1AA748;
    v27[4] = self;
    objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v27), @"onPanHorizontalUpdate");
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_3DD48;
    v26[3] = &unk_1AA748;
    v26[4] = self;
    objc_msgSend(v8, "setObject:forKey:", +[MRMCBlockAction blockActionWithBlock:](MRMCBlockAction, "blockActionWithBlock:", v26), @"onPanHorizontalEnd");
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_3DD54;
    v25[3] = &unk_1AA748;
    v25[4] = self;
    double v12 = +[MRMCBlockAction blockActionWithBlock:v25];
    CFStringRef v13 = @"onPanHorizontalCancel";
    goto LABEL_17;
  }
  return 0;
}

- (NSString)transitionLayerPlugObjectID
{
  return self->mInternal->mTransitionLayerPlugObjectID;
}

- (void)setTransitionLayerPlugObjectID:(id)a3
{
  self->mInternal->mTransitionLayerPlugObjectID = (NSString *)[a3 copy];
}

- (void)touchesBegan:(id)a3
{
  [(MRRenderer *)self _cleanupGestureRecognizers];
  if (self->_interactivityIsEnabled)
  {
    if ([self->mTopMRLayer isActivated])
    {
      long long v51 = self;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v43 = [a3 countByEnumeratingWithState:&v59 objects:v64 count:16];
      id v4 = self;
      if (v43)
      {
        uint64_t v42 = *(void *)v60;
        __asm { FMOV            V0.2D, #2.0 }
        float64x2_t v40 = _Q0;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v60 != v42)
            {
              uint64_t v11 = v10;
              objc_enumerationMutation(a3);
              id v4 = v51;
              uint64_t v10 = v11;
            }
            uint64_t v44 = v10;
            double v12 = *(void **)(*((void *)&v59 + 1) + 8 * v10);
            if ([(MRRenderer *)v4 displaysTouchVisualFeedback])
            {
              mTouchesForVisualFeedback = v51->mInternal->mTouchesForVisualFeedback;
              objc_sync_enter(mTouchesForVisualFeedback);
              [(NSMutableArray *)v51->mInternal->mTouchesForVisualFeedback addObject:v12];
              objc_sync_exit(mTouchesForVisualFeedback);
            }
            CGPoint v58 = CGPointZero;
            [v12 location];
            mTopMRLayer = -[MRRenderer layerHitAtPoint:onlyIfHitElement:localPoint:](v51, "layerHitAtPoint:onlyIfHitElement:localPoint:", 1, &v58);
            uint64_t v45 = mTopMRLayer;
            if (!mTopMRLayer)
            {
              [v12 location];
              v16.f64[1] = v15;
              CGPoint v58 = (CGPoint)vdivq_f64(vmlaq_f64(vnegq_f64((float64x2_t)v51->mSize), v40, v16), (float64x2_t)v51->mSize);
              mTopMRLayer = v51->mTopMRLayer;
            }
            id v4 = v51;
            if (v51->mInternal->mGestureRecognizers)
            {
              if (!mTopMRLayer) {
                goto LABEL_72;
              }
            }
            else
            {
              double v17 = mTopMRLayer;
              id v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
              id v4 = v51;
              v51->mInternal->mGestureRecognizers = v18;
              mTopMRLayer = v17;
              if (!v17) {
                goto LABEL_72;
              }
            }
            uint64_t v52 = 0;
            do
            {
              long long v50 = mTopMRLayer;
              if (mTopMRLayer == v4->mTopMRLayer) {
                id v53 = [(MRRenderer *)v4 defaultActionsWithHitLayer:v45 atPoint:v58];
              }
              else {
                id v53 = [mTopMRLayer actions];
              }
              if (![v53 count]) {
                goto LABEL_70;
              }
              long long v47 = +[MURetainingKey retainingKeyWithObject:v50];
              id v19 = [(NSMutableDictionary *)v51->mInternal->mGestureRecognizers objectForKey:v47];
              double v20 = v19;
              if (v19)
              {
                long long v56 = 0u;
                long long v57 = 0u;
                long long v54 = 0u;
                long long v55 = 0u;
                id v21 = [v19 countByEnumeratingWithState:&v54 objects:v63 count:16];
                if (v21)
                {
                  uint64_t v22 = *(void *)v55;
                  do
                  {
                    for (i = 0; i != v21; i = (char *)i + 1)
                    {
                      if (*(void *)v55 != v22) {
                        objc_enumerationMutation(v20);
                      }
                      long long v24 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                      if (([v24 state] & 0x24) == 0) {
                        [v24 touchBegan:v12];
                      }
                    }
                    id v21 = [v20 countByEnumeratingWithState:&v54 objects:v63 count:16];
                  }
                  while (v21);
                }
                goto LABEL_70;
              }
              id v49 = objc_alloc_init((Class)NSMutableArray);
              id v46 = [(MRRenderer *)v51 _computeMatrixChainForLayer:v50];
              if ((v52 & 1) == 0)
              {
                unint64_t v25 = (unint64_t)[v53 objectForKey:@"onHitStart"];
                unint64_t v26 = (unint64_t)[v53 objectForKey:@"onHitEnd"];
                if (v25 | v26)
                {
                  v27 = [(MRGestureRecognizer *)[MRTapGestureRecognizer alloc] initWithRenderer:v51 startAction:v25 andSender:v50];
                  [(MRGestureRecognizer *)v27 setRequiredTouchCount:1];
                  -[MRGestureRecognizer setUpdateAction:](v27, "setUpdateAction:", [v53 objectForKey:@"onHitUpdate"]);
                  [(MRGestureRecognizer *)v27 setEndAction:v26];
                  -[MRGestureRecognizer setCancelAction:](v27, "setCancelAction:", [v53 objectForKey:@"onHitCancel"]);
                  [(MRGestureRecognizer *)v27 setMatrixChain:v46];
                  [(MRLayer *)v50 pixelSize];
                  -[MRGestureRecognizer setReferenceSize:](v27, "setReferenceSize:");
                  [(MRTapGestureRecognizer *)v27 touchBegan:v12];
                  [v49 addObject:v27];

                  v52 |= 1uLL;
                }
              }
              if ((v52 & 2) == 0)
              {
                unint64_t v28 = (unint64_t)[v53 objectForKey:@"onDoubleHitStart"];
                unint64_t v29 = (unint64_t)[v53 objectForKey:@"onDoubleHitEnd"];
                if (v28 | v29)
                {
                  id v30 = [(MRGestureRecognizer *)[MRTapGestureRecognizer alloc] initWithRenderer:v51 startAction:v28 andSender:v50];
                  [(MRGestureRecognizer *)v30 setRequiredTouchCount:2];
                  -[MRGestureRecognizer setUpdateAction:](v30, "setUpdateAction:", [v53 objectForKey:@"onDoubleHitUpdate"]);
                  [(MRGestureRecognizer *)v30 setEndAction:v29];
                  -[MRGestureRecognizer setCancelAction:](v30, "setCancelAction:", [v53 objectForKey:@"onDoubleHitCancel"]);
                  [(MRGestureRecognizer *)v30 setMatrixChain:v46];
                  [(MRLayer *)v50 pixelSize];
                  -[MRGestureRecognizer setReferenceSize:](v30, "setReferenceSize:");
                  [(MRTapGestureRecognizer *)v30 touchBegan:v12];
                  [v49 addObject:v30];

                  v52 |= 2uLL;
                }
              }
              uint64_t v31 = 0;
              id v48 = 0;
              do
              {
                uint64_t v32 = word_165038[v31];
                if ((v52 & (word_165038[v31] << ((v32 >> 5) & 0xF8 | 2))) != 0) {
                  goto LABEL_66;
                }
                uint64_t v33 = off_1AA7B8[v31];
                id v34 = [v53 objectForKey:v33];
                if (v34)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0
                    || (id v34 = [(MRRenderer *)v51 actionByEvaluatingConditionalAction:v34 withStates:[(MRLayer *)v50 persistentState]]) != 0)
                  {
                    v35 = [[MRPanZoomRotationGestureRecognizer alloc] initWithRenderer:v51 masterAction:v34 direction:v32 andSender:v50];
                    double v36 = off_1AA840[v31];
                    -[MRGestureRecognizer setStartAction:](v35, "setStartAction:", [v53 objectForKey:v36]);
                    char v37 = 0;
                    int v38 = 1;
                    if (!v35) {
                      goto LABEL_66;
                    }
LABEL_54:
                    [(MRRenderer *)v51 interactiveTransitionTrackingBoxRadius];
                    -[MRPanZoomRotationGestureRecognizer setTrackingBoxRadius:](v35, "setTrackingBoxRadius:");
                    [(MRRenderer *)v51 interactiveTransitionProgressThreshold];
                    -[MRPanZoomRotationGestureRecognizer setProgressThreshold:](v35, "setProgressThreshold:");
                    [(MRRenderer *)v51 interactiveTransitionVelocityThreshold];
                    -[MRPanZoomRotationGestureRecognizer setVelocityThreshold:](v35, "setVelocityThreshold:");
                    if (v38) {
                      -[MRGestureRecognizer setStartAction:](v35, "setStartAction:", [v53 objectForKey:v36]);
                    }
                    -[MRGestureRecognizer setEndAction:](v35, "setEndAction:", [v53 objectForKey:off_1AA950[v31]]);
                    if ((v37 & 1) == 0)
                    {
                      -[MRGestureRecognizer setUpdateAction:](v35, "setUpdateAction:", [v53 objectForKey:off_1AA8C8[v31]]);
                      -[MRGestureRecognizer setCancelAction:](v35, "setCancelAction:", [v53 objectForKey:off_1AA9D8[v31]]);
                    }
                    if ([v34 tracksInParent])
                    {
                      id v39 = v48;
                      if (!v48) {
                        id v39 = [(MRRenderer *)v51 _computeMatrixChainForLayer:[(MRLayer *)v50 superlayer]];
                      }
                      id v48 = v39;
                      -[MRGestureRecognizer setMatrixChain:](v35, "setMatrixChain:");
                      [[(MRLayer *)v50 superlayer] pixelSize];
                    }
                    else
                    {
                      [(MRGestureRecognizer *)v35 setMatrixChain:v46];
                      [(MRLayer *)v50 pixelSize];
                    }
                    -[MRGestureRecognizer setReferenceSize:](v35, "setReferenceSize:");
                    if ([(__CFString *)v33 hasSuffix:@"2"]) {
                      [(MRGestureRecognizer *)v35 setRequiredTouchCount:2];
                    }
                    [(MRGestureRecognizer *)v35 touchBegan:v12];
                    [v49 addObject:v35];

                    v52 |= 4 * v32;
                    goto LABEL_66;
                  }
                }
                double v36 = off_1AA840[v31];
                id v34 = [v53 objectForKey:v36];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v34 = [(MRRenderer *)v51 actionByEvaluatingConditionalAction:v34 withStates:[(MRLayer *)v50 persistentState]];
                }
                if (v34)
                {
                  v35 = [[MRPanZoomRotationGestureRecognizer alloc] initWithRenderer:v51 startAction:v34 direction:v32 andSender:v50];
                  int v38 = 0;
                  char v37 = 0;
                  if (!v35) {
                    goto LABEL_66;
                  }
                  goto LABEL_54;
                }
                id v34 = [v53 objectForKey:off_1AA950[v31]];
                objc_opt_class();
                if (objc_opt_isKindOfClass()) {
                  id v34 = [(MRRenderer *)v51 actionByEvaluatingConditionalAction:v34 withStates:[(MRLayer *)v50 persistentState]];
                }
                if (v34)
                {
                  v35 = [[MRPanZoomRotationGestureRecognizer alloc] initWithRenderer:v51 endAction:v34 direction:v32 andSender:v50];
                  int v38 = 0;
                  char v37 = 1;
                  if (v35) {
                    goto LABEL_54;
                  }
                }
LABEL_66:
                ++v31;
              }
              while (v31 != 17);
              if ([v49 count]) {
                [(NSMutableDictionary *)v51->mInternal->mGestureRecognizers setObject:v49 forKey:v47];
              }

LABEL_70:
              mTopMRLayer = [(MRLayer *)v50 superlayer];
              id v4 = v51;
            }
            while (mTopMRLayer && v52 != 1023);
LABEL_72:
            uint64_t v10 = v44 + 1;
          }
          while ((id)(v44 + 1) != v43);
          id v43 = [a3 countByEnumeratingWithState:&v59 objects:v64 count:16];
          id v4 = v51;
        }
        while (v43);
      }
    }
  }
}

- (void)touchesMoved:(id)a3
{
  [(MRRenderer *)self _cleanupGestureRecognizers];
  if (self->_interactivityIsEnabled && [self->mTopMRLayer isActivated])
  {
    double v17 = self;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(a3);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v10 = objc_msgSend(v9, "gestureRecognizers", v17);
          id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                float64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
                [v15 touchMoved:v9];
                if (([v4 containsObject:v15] & 1) == 0) {
                  [v4 addObject:v15];
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }
        }
        id v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v6);
    }
    float64x2_t v16 = v17;
    -[MRRenderer _findAndHandleBestRecognizerInRecognizers:](v17, "_findAndHandleBestRecognizerInRecognizers:", v4, v17);

    [(MRRenderer *)v16 _cleanupGestureRecognizers];
  }
}

- (void)touchesEnded:(id)a3
{
  [(MRRenderer *)self _cleanupGestureRecognizers];
  if (self->_interactivityIsEnabled && [self->mTopMRLayer isActivated])
  {
    double v17 = self;
    id v4 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(a3);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v10 = objc_msgSend(v9, "gestureRecognizers", v17);
          id v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v20;
            do
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v10);
                }
                float64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
                [v15 touchEnded:v9];
                if (([v4 containsObject:v15] & 1) == 0) {
                  [v4 addObject:v15];
                }
              }
              id v12 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v12);
          }
        }
        id v6 = [a3 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v6);
    }
    float64x2_t v16 = v17;
    -[MRRenderer _findAndHandleBestRecognizerInRecognizers:](v17, "_findAndHandleBestRecognizerInRecognizers:", v4, v17);

    [(MRRenderer *)v16 _cleanupGestureRecognizers];
  }
}

- (void)touchesCancelled:(id)a3
{
  [(MRRenderer *)self _cleanupGestureRecognizers];
  if (self->_interactivityIsEnabled && [self->mTopMRLayer isActivated])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(a3);
          }
          id v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
          long long v15 = 0u;
          long long v16 = 0u;
          long long v17 = 0u;
          long long v18 = 0u;
          id v10 = objc_msgSend(v9, "gestureRecognizers", 0);
          id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
          if (v11)
          {
            id v12 = v11;
            uint64_t v13 = *(void *)v16;
            do
            {
              id v14 = 0;
              do
              {
                if (*(void *)v16 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v15 + 1) + 8 * (void)v14) abort];
                id v14 = (char *)v14 + 1;
              }
              while (v12 != v14);
              id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
            }
            while (v12);
          }
          id v8 = (char *)v8 + 1;
        }
        while (v8 != v6);
        id v6 = [a3 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v6);
    }
    [(MRRenderer *)self _cleanupGestureRecognizers];
  }
}

- (void)_findAndHandleBestRecognizerInRecognizers:(id)a3
{
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v45 objects:v52 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v46;
    double v9 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v46 != v8) {
          objc_enumerationMutation(a3);
        }
        id v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if (([v11 state] & 8) != 0)
        {
          [v11 score];
          if (v12 > v9)
          {
            uint64_t v7 = v11;
            double v9 = v12;
          }
        }
      }
      id v6 = [a3 countByEnumeratingWithState:&v45 objects:v52 count:16];
    }
    while (v6);
    if (v7)
    {
      [v7 recognize];
      id v13 = [v7 sender];
      if (v13)
      {
        id v14 = v13;
        do
        {
          id v15 = [(NSMutableDictionary *)self->mInternal->mGestureRecognizers objectForKey:+[MURetainingKey retainingKeyWithObject:v14]];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          id v16 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v42;
            do
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v42 != v18) {
                  objc_enumerationMutation(v15);
                }
                long long v20 = *(void **)(*((void *)&v41 + 1) + 8 * (void)j);
                if (v20 != v7) {
                  [v20 abort];
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v41 objects:v51 count:16];
            }
            while (v17);
          }
          id v14 = [v14 superlayer];
        }
        while (v14);
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v21 = [v7 touches];
      id v22 = [v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v22)
      {
        id v23 = v22;
        uint64_t v24 = *(void *)v38;
        do
        {
          for (k = 0; k != v23; k = (char *)k + 1)
          {
            if (*(void *)v38 != v24) {
              objc_enumerationMutation(v21);
            }
            long long v26 = *(void **)(*((void *)&v37 + 1) + 8 * (void)k);
            long long v33 = 0u;
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v27 = objc_msgSend(v26, "gestureRecognizers", 0);
            id v28 = [v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v34;
              do
              {
                for (m = 0; m != v29; m = (char *)m + 1)
                {
                  if (*(void *)v34 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  uint64_t v32 = *(void **)(*((void *)&v33 + 1) + 8 * (void)m);
                  if (v32 != v7) {
                    [v32 abort];
                  }
                }
                id v29 = [v27 countByEnumeratingWithState:&v33 objects:v49 count:16];
              }
              while (v29);
            }
          }
          id v23 = [v21 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v23);
      }
    }
  }
}

- (id)layerHitAtPoint:(CGPoint)a3 onlyIfHitElement:(BOOL)a4 localPoint:(CGPoint *)a5
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  if (![self->mTopMRLayer isActivated]) {
    return 0;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3052000000;
  long long v26 = sub_3F2E0;
  id v27 = sub_3F2F0;
  uint64_t v28 = 0;
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F2FC;
  block[3] = &unk_1AAA68;
  block[4] = self;
  void block[5] = &v23;
  v9.f64[0] = x;
  v9.f64[1] = y;
  __asm { FMOV            V2.2D, #2.0 }
  float64x2_t v20 = vdivq_f64(vmlaq_f64(vnegq_f64((float64x2_t)self->mSize), _Q2, v9), (float64x2_t)self->mSize);
  BOOL v22 = a4;
  id v21 = a5;
  dispatch_sync(mRenderDispatchQueue, block);
  id v15 = (id)v24[5];
  _Block_object_dispose(&v23, 8);
  return v15;
}

- (void)willGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4 animate:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v7 = a3;
  float64x2_t v9 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate];
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (v7)
  {
    [(MRLayer *)v9 willFocusOnNextSlideWithState:mSlideFocusState animate:v5];
    [(MRLayerNavigator *)self->mInternal->mSlideFocusNavigator gotoNextSublayer:a4 animate:v5];
  }
  else
  {
    [(MRLayer *)v9 willFocusOnPreviousSlideWithState:mSlideFocusState animate:v5];
    [(MRLayerNavigator *)self->mInternal->mSlideFocusNavigator gotoPreviousSublayer:a4 animate:v5];
  }
  if ([(MRSlideFocusState *)self->mInternal->mSlideFocusState delegateIsTransitioningToo]) {
    [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] setForcedTransitionProgress:0.0];
  }
  [(MRSlideFocusState *)self->mInternal->mSlideFocusState setIsTransitioning:1];
  id v11 = self->mInternal->mSlideFocusState;
  [(MRSlideFocusState *)v11 setIsGoingToNext:v7];
}

- (void)didGoToPreviousOrNextFocusedSlide:(BOOL)a3 withAction:(id)a4
{
  BOOL v5 = a3;
  if ([(MRSlideFocusState *)self->mInternal->mSlideFocusState delegateIsTransitioningToo])
  {
    BOOL v7 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate];
    [(MRLayer *)v7 setForcedTransitionProgress:1.1];
    [(MRLayer *)v7 finishTransition:a4];
  }
  uint64_t v8 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo];
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (v5)
  {
    [(MRSlideFocusState *)mSlideFocusState setPreviousSlideInfo:v8];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setPreviousSlideID:[(MRSlideFocusState *)self->mInternal->mSlideFocusState slideID]];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setSlideInfo:[(MRSlideFocusState *)self->mInternal->mSlideFocusState nextSlideInfo]];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setSlideID:[(MRSlideFocusState *)self->mInternal->mSlideFocusState nextSlideID]];
    [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] didFocusOnNextSlideWithState:self->mInternal->mSlideFocusState];
    uint64_t v10 = 1;
  }
  else
  {
    [(MRSlideFocusState *)mSlideFocusState setNextSlideInfo:v8];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setNextSlideID:[(MRSlideFocusState *)self->mInternal->mSlideFocusState slideID]];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setSlideInfo:[(MRSlideFocusState *)self->mInternal->mSlideFocusState previousSlideInfo]];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setSlideID:[(MRSlideFocusState *)self->mInternal->mSlideFocusState previousSlideID]];
    [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] didFocusOnPreviousSlideWithState:self->mInternal->mSlideFocusState];
    uint64_t v10 = 2;
  }
  mInternal = self->mInternal;
  unint64_t v12 = (mInternal->mCurrentSlideFocuserIndex + v10) % 3;
  mInternal->mCurrentSlideFocuserIndeCGFloat x = v12;
  unint64_t v13 = v12 + v10;
  if (v13 >= 3) {
    v13 -= 3;
  }
  id v14 = self->mInternal;
  id v15 = v14->mSlideFocuser[v13];
  id v16 = v14->mSlideFocusState;
  if (v5) {
    id v17 = [(MRSlideFocusState *)v16 nextSlideInfo];
  }
  else {
    id v17 = [(MRSlideFocusState *)v16 previousSlideInfo];
  }
  uint64_t v18 = v17;
  [(MRLayerEffect *)v15 setAssetPath:[(MRSlideInfo *)v17 assetPath] ofSlide:@"image0"];
  [(MRLayerEffect *)v15 setCenter:@"image0", 0.5, 0.5 ofSlide];
  [(MRSlideInfo *)v18 aspectRatio];
  double v20 = v19 * self->mSize.height / self->mSize.width;
  if (v20 > 1.0) {
    double v20 = 1.0;
  }
  [(MRLayerEffect *)v15 setScale:@"image0" ofSlide:v20];
  [(MRSlideInfo *)v18 aspectRatio];
  [(MRLayerEffect *)v15 setMaxScale:@"image0" ofSlide:fmax((v21 + v21) * self->mSize.height / self->mSize.width, 2.0)];
  [(MRLayerEffect *)v15 setRotation:@"image0" ofSlide:0.0];
  NSLog(@"didGoToPreviousOrNextFocusedSlide: %@ %@ %@", [(MRSlideFocusState *)self->mInternal->mSlideFocusState previousSlideID], [(MRSlideFocusState *)self->mInternal->mSlideFocusState slideID], [(MRSlideFocusState *)self->mInternal->mSlideFocusState nextSlideID]);
}

- (double)slideshowTransitionStart:(id)a3
{
  BOOL v5 = (double *)[a3 specificObject];
  id v6 = [(MRLayerParallelizer *)self->mTopMRLayer sublayerForPlugObjectID:self->mInternal->mTransitionLayerPlugObjectID recursive:1];
  int v7 = *((unsigned __int8 *)v5 + 96);
  if (v7 == 1) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = v7 != 3 || v5[8] >= 0.0;
  }
  BOOL v9 = fabs(v5[8]) < 1.0;
  [v6 gotoMoreSlidesWithAction:a3 backwards:v8 animate:1 canCatchCurrentTransition:v9];
  return result;
}

- (double)slideshowTransitionUpdate:(id)a3
{
  return 0.0;
}

- (double)slideshowTransitionEnd:(id)a3
{
  id v4 = [(MRLayerParallelizer *)self->mTopMRLayer sublayerForPlugObjectID:self->mInternal->mTransitionLayerPlugObjectID recursive:1];
  [v4 attemptToFinishTransition:a3 didTransition:0 gotReversed:0];
  return result;
}

- (double)slideshowTransitionCancel:(id)a3
{
  id v4 = [(MRLayerParallelizer *)self->mTopMRLayer sublayerForPlugObjectID:self->mInternal->mTransitionLayerPlugObjectID recursive:1];
  [v4 abortTransition:a3];
  return result;
}

- (double)focusedTransitionStart:(id)a3
{
  if (self->mInternal->mSlideFocusState)
  {
    BOOL v5 = (double *)[a3 specificObject];
    BOOL v6 = *((unsigned char *)v5 + 96) == 1 || v5[8] < 0.0;
    [(MRRenderer *)self willGoToPreviousOrNextFocusedSlide:v6 withAction:a3 animate:1];
  }
  return 0.0;
}

- (double)focusedTransitionUpdate:(id)a3
{
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (mSlideFocusState && [(MRSlideFocusState *)mSlideFocusState isTransitioning])
  {
    if ([(MRSlideFocusState *)self->mInternal->mSlideFocusState delegateIsTransitioningToo])
    {
      [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] updateTransition:a3];
    }
    [(MRLayerNavigator *)self->mInternal->mSlideFocusNavigator updateTransition:a3];
  }
  return 0.0;
}

- (double)focusedTransitionEnd:(id)a3
{
  mSlideFocusState = self->mInternal->mSlideFocusState;
  double v5 = 0.0;
  if (mSlideFocusState && [(MRSlideFocusState *)mSlideFocusState isTransitioning])
  {
    __int16 v11 = 0;
    [(MRLayerNavigator *)self->mInternal->mSlideFocusNavigator attemptToFinishTransition:a3 didTransition:(char *)&v11 + 1 gotReversed:&v11];
    double v5 = v7;
    BOOL v8 = self->mInternal->mSlideFocusState;
    if (HIBYTE(v11))
    {
      if ([(MRSlideFocusState *)v8 isInZoomMode]) {
        [(MRRenderer *)self exitSlideZoomMode:0];
      }
      unsigned int v9 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState isGoingToNext];
      [(MRRenderer *)self didGoToPreviousOrNextFocusedSlide:v11 != v9 withAction:a3];
    }
    else if ([(MRSlideFocusState *)v8 delegateIsTransitioningToo])
    {
      [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] abortTransition:a3];
    }
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setIsTransitioning:0];
  }
  return v5;
}

- (double)focusedTransitionCancel:(id)a3
{
  mSlideFocusState = self->mInternal->mSlideFocusState;
  if (mSlideFocusState && [(MRSlideFocusState *)mSlideFocusState isTransitioning])
  {
    if ([(MRSlideFocusState *)self->mInternal->mSlideFocusState delegateIsTransitioningToo])
    {
      [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] abortTransition:a3];
    }
    [(MRLayerNavigator *)self->mInternal->mSlideFocusNavigator abortTransition:a3];
    [(MRSlideFocusState *)self->mInternal->mSlideFocusState setIsTransitioning:0];
  }
  return 0.0;
}

- (double)slideZoomStart:(id)a3
{
  if (!self->mInternal->mSlideFocusState) {
    return 0.0;
  }
  id v5 = [a3 specificObject];
  *((unsigned char *)v5 + 99) = 1;
  *((unsigned char *)v5 + 100) = [(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode];
  if (![(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode]) {
    goto LABEL_10;
  }
  BOOL v6 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
  if (v6) {
    BOOL v6 = [(MRLayerEffect *)v6 effect];
  }
  if (*((unsigned char *)v5 + 97) == 1
    && *((double *)v5 + 6) == 1.0
    && *((double *)v5 + 7) == 0.0
    && fabs(*((double *)v5 + 8)) > fabs(*((double *)v5 + 9))
    && ![(MRLayerEffect *)v6 canMoveInDirection:3 withPZR:v5])
  {
    [(MRRenderer *)self focusedTransitionStart:a3];
  }
  else
  {
LABEL_10:
    double v7 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
    [(MRLayerEffect *)v7 pzrStart:a3];
  }
  return result;
}

- (double)slideZoomUpdate:(id)a3
{
  if (!self->mInternal->mSlideFocusState) {
    return 0.0;
  }
  id v5 = [a3 specificObject];
  v5[99] = 1;
  v5[100] = [(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode];
  if (![(MRSlideFocusState *)self->mInternal->mSlideFocusState isTransitioning])
  {
    BOOL v6 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
    [(MRLayerEffect *)v6 pzrUpdate:a3];
    id v7 = [(MRLayerEffect *)v6 currentSlideInfoForElement:@"image0"];
    [v7 aspectRatio];
    double v9 = v8 * self->mSize.height / self->mSize.width;
    if (v9 <= 1.0) {
      double v10 = v9;
    }
    else {
      double v10 = 1.0;
    }
    [v7 scale];
    double v12 = v11 / v10;
    BOOL v13 = v11 <= 0.0;
    double v14 = 0.001;
    if (!v13) {
      double v14 = v12;
    }
    double v15 = v14 * v14;
    if (v15 <= 1.0) {
      double v16 = v15;
    }
    else {
      double v16 = 1.0;
    }
    mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
    [(MRLayer *)mSlideFocusLayer opacity];
    [(MRLayer *)mSlideFocusLayer animateOpacityTo:v16 withDuration:1.0 - v18];
    return 0.0;
  }
  [(MRRenderer *)self focusedTransitionUpdate:a3];
  return result;
}

- (double)slideZoomEnd:(id)a3
{
  if (!self->mInternal->mSlideFocusState) {
    return 0.0;
  }
  id v5 = [a3 specificObject];
  v5[99] = 1;
  v5[100] = [(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode];
  if (![(MRSlideFocusState *)self->mInternal->mSlideFocusState isTransitioning])
  {
    id v7 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
    id v8 = [(MRLayerEffect *)v7 currentSlideInfoForElement:@"image0"];
    [v8 aspectRatio];
    double v10 = v9 * self->mSize.height / self->mSize.width;
    v5[98] = 0;
    if (v10 <= 1.0) {
      double v11 = v10;
    }
    else {
      double v11 = 1.0;
    }
    [v8 scale];
    if (v12 >= v11 * 0.8)
    {
      if ([(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode]
        && ([v8 scale], v14 < v11))
      {
        [(MRRenderer *)self exitSlideZoomMode:1];
      }
      else
      {
        if ([(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode])
        {
          v5[98] = 1;
          double v6 = 0.0;
LABEL_19:
          v5[100] = [(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode];
          [(MRLayerEffect *)v7 pzrEnd:a3];
          return v6;
        }
        [(MRRenderer *)self animateCurrentFocuserToSlideFocusModeWithDuration:0.25];
      }
    }
    else
    {
      [(MRRenderer *)self exitSlideFocusMode];
    }
    double v6 = v13;
    goto LABEL_19;
  }
  [(MRRenderer *)self focusedTransitionEnd:a3];
  return result;
}

- (double)slideZoomCancel:(id)a3
{
  if (!self->mInternal->mSlideFocusState) {
    return 0.0;
  }
  id v5 = [a3 specificObject];
  v5[99] = 1;
  v5[100] = [(MRSlideFocusState *)self->mInternal->mSlideFocusState isInZoomMode];
  if (![(MRSlideFocusState *)self->mInternal->mSlideFocusState isTransitioning])
  {
    [(MRLayerEffect *)self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex] pzrCancel:a3];
    return 0.0;
  }
  [(MRRenderer *)self focusedTransitionCancel:a3];
  return result;
}

- (void)_cleanupGestureRecognizers
{
  id v2 = self;
  if ([(NSMutableDictionary *)self->mInternal->mGestureRecognizers count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obj = v2->mInternal->mGestureRecognizers;
    id v22 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v32 objects:v38 count:16];
    if (v22)
    {
      uint64_t v23 = 0;
      double v20 = v2;
      uint64_t v21 = *(void *)v33;
      while (1)
      {
        for (i = 0; i != v22; i = (char *)i + 1)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(obj);
          }
          id v4 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v4, "object"), "isActivated"))
          {
            id v5 = [(NSMutableDictionary *)v2->mInternal->mGestureRecognizers objectForKey:v4];
            long long v24 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            id v6 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
            if (!v6) {
              continue;
            }
            id v7 = v6;
            id v8 = 0;
            uint64_t v9 = *(void *)v25;
            do
            {
              for (j = 0; j != v7; j = (char *)j + 1)
              {
                if (*(void *)v25 != v9) {
                  objc_enumerationMutation(v5);
                }
                double v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)j);
                if (([v11 state] & 0x24) != 0)
                {
                  if (!v8) {
                    id v8 = objc_alloc_init((Class)NSMutableArray);
                  }
                  [v8 addObject:v11];
                  [v11 cleanup];
                }
              }
              id v7 = [v5 countByEnumeratingWithState:&v24 objects:v36 count:16];
            }
            while (v7);
            if (!v8 || ([v5 removeObjectsInArray:v8], v8, objc_msgSend(v5, "count")))
            {
              id v2 = v20;
              continue;
            }
          }
          else
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v12 = [(NSMutableDictionary *)v2->mInternal->mGestureRecognizers objectForKey:v4];
            id v13 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v29;
              do
              {
                for (k = 0; k != v14; k = (char *)k + 1)
                {
                  if (*(void *)v29 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  id v17 = *(void **)(*((void *)&v28 + 1) + 8 * (void)k);
                  [v17 abort];
                  [v17 cleanup];
                }
                id v14 = [v12 countByEnumeratingWithState:&v28 objects:v37 count:16];
              }
              while (v14);
            }
          }
          id v2 = v20;
          id v18 = v23;
          if (!v23) {
            id v18 = objc_alloc_init((Class)NSMutableArray);
          }
          uint64_t v23 = v18;
          [v18 addObject:v4];
        }
        id v22 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v32 objects:v38 count:16];
        if (!v22)
        {
          if (v23)
          {
            [(NSMutableDictionary *)v2->mInternal->mGestureRecognizers removeObjectsForKeys:v23];
          }
          return;
        }
      }
    }
  }
}

- (id)_computeMatrixChainForLayer:(id)a3
{
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", a3, 0);
  id v5 = [a3 superlayer];
  if (v5)
  {
    id v6 = v5;
    do
    {
      if (*((unsigned char *)[v6 renderingState] + 242)) {
        [v4 addObject:v6];
      }
      id v6 = [v6 superlayer];
    }
    while (v6);
  }
  id v7 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v4 reverseObjectEnumerator];
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        memset(v21, 0, sizeof(v21));
        memset(v20, 0, sizeof(v20));
        MRMatrix_MultiplyWithMatrix((float *)[v13 renderingState] + 28, (float *)objc_msgSend(v13, "renderingState") + 44, (float *)v21);
        if (MRMatrix_Invert((float *)v21, (float *)v20))
        {
          id v14 = [objc_alloc((Class)NSData) initWithBytes:v20 length:64];
          [(NSMutableArray *)v7 addObject:v14];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)_doLayerTrackingAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = self;
  long long v66 = 0u;
  long long v67 = 0u;
  mInternal = self->mInternal;
  long long v68 = 0u;
  long long v69 = 0u;
  id obj = [(NSMutableDictionary *)mInternal->mLayerTrackings objectEnumerator];
  id v7 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
  if (v7)
  {
    id v8 = v7;
    id v9 = 0;
    uint64_t v10 = *(void *)v67;
    uint64_t v53 = *(void *)v67;
    long long v54 = v5;
    do
    {
      uint64_t v11 = 0;
      id v55 = v8;
      do
      {
        if (*(void *)v67 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v11);
        id v13 = [v12 objectForKey:@"layer"];
        if ([v13 isActivated])
        {
          id v14 = -[MRAction initWithAction:andTarget:]([MRAction alloc], "initWithAction:andTarget:", +[MCActionTrigger actionTriggerForTargetPlugObjectID:withActionKey:](MCActionTrigger, "actionTriggerForTargetPlugObjectID:withActionKey:", 0, objc_msgSend(objc_msgSend(objc_msgSend(v12, "objectForKey:", @"action"), "attributes"), "objectForKey:", @"actionKey")), v13);
          [(MRAction *)v14 setSender:v13];
          uint64_t v15 = +[NSMutableArray arrayWithObject:v13];
          id v16 = [v13 superlayer];
          if (v16)
          {
            id v17 = v16;
            do
            {
              if (*((unsigned char *)[v17 renderingState] + 242)) {
                [(NSMutableArray *)v15 addObject:v17];
              }
              id v17 = [v17 superlayer];
            }
            while (v17);
          }
          double height = v5->mSize.height;
          double v19 = -(v5->mSize.width - x * 2.0) / v5->mSize.width;
          long long v62 = 0u;
          long long v63 = 0u;
          double v20 = -(height - y * 2.0) / height;
          long long v64 = 0u;
          long long v65 = 0u;
          id v21 = [(NSMutableArray *)v15 reverseObjectEnumerator];
          id v22 = [v21 countByEnumeratingWithState:&v62 objects:v73 count:16];
          if (v22)
          {
            id v23 = v22;
            id v24 = v9;
            uint64_t v25 = *(void *)v63;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(void *)v63 != v25) {
                  objc_enumerationMutation(v21);
                }
                long long v27 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                memset(v72, 0, sizeof(v72));
                memset(v71, 0, sizeof(v71));
                MRMatrix_MultiplyWithMatrix((float *)[v27 renderingState] + 28, (float *)objc_msgSend(v27, "renderingState") + 44, (float *)v72);
                if (MRMatrix_Invert((float *)v72, (float *)v71))
                {
                  double v19 = MRMatrix_UnprojectPoint((float *)v71, v19, v20);
                  double v20 = v28;
                }
              }
              id v23 = [v21 countByEnumeratingWithState:&v62 objects:v73 count:16];
            }
            while (v23);
          }
          else
          {
            id v24 = v9;
          }
          [v13 pixelSize];
          double v30 = v29;
          [v13 pixelSize];
          double v32 = v20 * (v30 / v31);
          long long v33 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [v13 persistentState]);
          *(float *)&double v34 = v19;
          [(NSMutableDictionary *)v33 setObject:+[NSNumber numberWithFloat:v34] forKey:@"trackingX"];
          *(float *)&double v35 = v32;
          [(NSMutableDictionary *)v33 setObject:+[NSNumber numberWithFloat:v35] forKey:@"trackingY"];
          [(MRAction *)v14 setStates:v33];
          [(MRRenderer *)v54 time];
          -[MRAction setTime:](v14, "setTime:");
          [(MRRenderer *)v54 doAction:v14];

          id v9 = v24;
          id v5 = v54;
          uint64_t v10 = v53;
          id v8 = v55;
        }
        else
        {
          if (!v9) {
            id v9 = objc_alloc_init((Class)NSMutableArray);
          }
          objc_msgSend(v9, "addObject:", objc_msgSend(v13, "uuid"));
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v11 != v8);
      id v8 = [obj countByEnumeratingWithState:&v66 objects:v74 count:16];
    }
    while (v8);
    if (v9)
    {
      [(NSMutableDictionary *)v5->mInternal->mLayerTrackings removeObjectsForKeys:v9];
    }
  }
  v72[0] = CGPointZero;
  id v36 = -[MRRenderer layerHitAtPoint:onlyIfHitElement:localPoint:](v5, "layerHitAtPoint:onlyIfHitElement:localPoint:", 1, v72, x, y);
  if (v36)
  {
    while (1)
    {
      id v37 = objc_msgSend(objc_msgSend(v36, "plug"), "actionForKey:", @"onTrackIn");
      if (v37) {
        break;
      }
      id v36 = [v36 superlayer];
      if (!v36) {
        goto LABEL_34;
      }
    }
    id obja = v37;
  }
  else
  {
LABEL_34:
    id obja = 0;
  }
  id v38 = [(NSMutableSet *)v5->mInternal->mLayersCurrentlyTrackedIn copy];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v39 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = *(void *)v59;
    do
    {
      for (j = 0; j != v40; j = (char *)j + 1)
      {
        if (*(void *)v59 != v41) {
          objc_enumerationMutation(v38);
        }
        id v43 = *(id *)(*((void *)&v58 + 1) + 8 * (void)j);
        if (![v43 isActivated]) {
          goto LABEL_54;
        }
        BOOL v44 = v36 == v43 || v36 == 0;
        id v45 = v36;
        if (!v44)
        {
          id v45 = v36;
          do
            id v45 = [v45 superlayer];
          while (v45 != v43 && v45);
        }
        if (!v45)
        {
          id v46 = objc_msgSend(objc_msgSend(v43, "plug"), "actionForKey:", @"onTrackOut");
          if (v46)
          {
            long long v47 = [[MRAction alloc] initWithAction:v46 inRenderer:v5];
            [(MRAction *)v47 setSender:v43];
            id v48 = [v43 persistentState];
            if (v48) {
              [(MRAction *)v47 setStates:+[NSMutableDictionary dictionaryWithDictionary:v48]];
            }
            [(MRRenderer *)v5 time];
            -[MRAction setTime:](v47, "setTime:");
            [(MRRenderer *)v5 doAction:v47];
          }
LABEL_54:
          [(NSMutableSet *)v5->mInternal->mLayersCurrentlyTrackedIn removeObject:v43];
          continue;
        }
      }
      id v40 = [v38 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v40);
  }

  id v49 = obja;
  if (v36
    && ([(NSMutableSet *)v5->mInternal->mLayersCurrentlyTrackedIn containsObject:v36] & 1) == 0)
  {
    do
    {
      if (v49)
      {
        [(NSMutableSet *)v5->mInternal->mLayersCurrentlyTrackedIn addObject:v36];
        long long v50 = [[MRAction alloc] initWithAction:v49 inRenderer:v5];
        [(MRAction *)v50 setSender:v36];
        id v51 = [v36 persistentState];
        if (v51) {
          [(MRAction *)v50 setStates:+[NSMutableDictionary dictionaryWithDictionary:v51]];
        }
        [(MRRenderer *)v5 time];
        -[MRAction setTime:](v50, "setTime:");
        [(MRRenderer *)v5 doAction:v50];
      }
      id v52 = [v36 superlayer];
      if (!v52) {
        break;
      }
      id v36 = v52;
      id v49 = objc_msgSend(objc_msgSend(v52, "plug"), "actionForKey:", @"onTrackIn");
    }
    while (![(NSMutableSet *)v5->mInternal->mLayersCurrentlyTrackedIn containsObject:v36]);
  }
}

+ (double)textScaleForResolution:(CGSize)a3
{
  if (a3.width >= a3.height) {
    a3.width = a3.height;
  }
  return a3.width / 800.0;
}

- (BOOL)getVerticesCoordinatesForCurrentlyEditedTextElement:(CGPoint *)(a3
{
  mInternal = self->mInternal;
  if (mInternal->mCurrentlyEditedTextElement)
  {
    unsigned int v6 = -[MRLayerEffect getVerticesCoordinates:forElement:](mInternal->mLayerCurrentlyTextEditing, "getVerticesCoordinates:forElement:");
    if (v6)
    {
      uint64_t v7 = 0;
      CGSize mSize = self->mSize;
      __asm
      {
        FMOV            V1.2D, #1.0
        FMOV            V2.2D, #0.5
      }
      do
      {
        uint64_t v15 = &(*a3)[v7];
        float64x2_t v16 = vmulq_f64(vmulq_f64(vaddq_f64((float64x2_t)(*a3)[v7 + 1], _Q1), (float64x2_t)mSize), _Q2);
        *(float64x2_t *)uint64_t v15 = vmulq_f64(vmulq_f64(vaddq_f64((float64x2_t)(*a3)[v7], _Q1), (float64x2_t)mSize), _Q2);
        v15[1] = (CGPoint)v16;
        v7 += 2;
      }
      while (v7 != 4);
      LOBYTE(v6) = 1;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (CGSize)_maxSizeForCurrentEditingTextElement
{
  mInternal = self->mInternal;
  mLayerCurrentlyTextEditing = mInternal->mLayerCurrentlyTextEditing;
  if (mLayerCurrentlyTextEditing)
  {
    [(MRLayerEffect *)mLayerCurrentlyTextEditing _maxSizeForTextElement:[(MRLayerEffect *)mInternal->mLayerCurrentlyTextEditing editedElement]];
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

- (int64_t)_maxLinesForCurrentEditingTextElement
{
  mInternal = self->mInternal;
  mLayerCurrentlyTextEditing = mInternal->mLayerCurrentlyTextEditing;
  if (!mLayerCurrentlyTextEditing) {
    return 0;
  }
  id v4 = [(MRLayerEffect *)mInternal->mLayerCurrentlyTextEditing editedElement];
  return [(MRLayerEffect *)mLayerCurrentlyTextEditing _maxLinesForTextElement:v4];
}

- (BOOL)beginTextEditingOfElement:(id)a3 inLayer:(id)a4 callDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  if (![a3 hasPrefix:@"text"]) {
    return 0;
  }
  mInternal = self->mInternal;
  if (mInternal->mLayerCurrentlyTextEditing == a4)
  {
    if (mInternal->mCurrentlyEditedTextElement == a3 || (objc_msgSend(a3, "isEqualToString:") & 1) != 0) {
      return 1;
    }
    mInternal = self->mInternal;
  }
  if (mInternal->mCurrentlyEditedTextElement) {
    [(MRRenderer *)self endTextEditing:v5];
  }
  self->mInternal->mLayerCurrentlyTextEditing = (MRLayerEffect *)a4;
  [(MRLayerEffect *)self->mInternal->mLayerCurrentlyTextEditing setEditedElement:a3];
  self->mInternal->mCurrentlyEditedTextElement = (NSString *)[a3 copy];
  uint64_t v10 = [(MRRenderer *)self editingDelegate];
  unsigned __int8 v11 = 1;
  if (v5)
  {
    id v12 = v10;
    if (v10)
    {
      memset(v21, 0, sizeof(v21));
      CGPoint v19 = (CGPoint)0;
      long long v20 = 0u;
      if (([a4 getVerticesCoordinates:&v19 forElement:a3] & 1) == 0)
      {
        CGPoint v19 = CGPointZero;
        *(void *)&v21[0] = 0;
        long long v20 = 0x3FF0000000000000uLL;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)((char *)v21 + 8) = _Q0;
        *((void *)&v21[1] + 1) = 0x3FF0000000000000;
      }
      unsigned __int8 v11 = -[MREditingDelegate beginEditingTextElement:inContainer:clickAt:vertices:](v12, "beginEditingTextElement:inContainer:clickAt:vertices:", a3, objc_msgSend(objc_msgSend(a4, "plug", v19, v20, v21[0], v21[1]), "container"), &v19, CGPointZero.x, CGPointZero.y);
      if (v11)
      {
        [(MRRenderer *)self requestRendering:0];
      }
      else
      {
        [(MRLayerEffect *)self->mInternal->mLayerCurrentlyTextEditing setEditedElement:0];

        self->mInternal->mLayerCurrentlyTextEditing = 0;
        self->mInternal->mCurrentlyEditedTextElement = 0;
      }
    }
  }
  return v11;
}

- (BOOL)beginTextEditingOfElement:(id)a3 inPlug:(id)a4 callDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = (MCMontage *)[a4 montage];
  if (v9 != [(MRRenderer *)self montage]) {
    return 0;
  }
  [a4 container];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id v10 = -[MRLayerParallelizer sublayerForPlugObjectID:recursive:](self->mTopMRLayer, "sublayerForPlugObjectID:recursive:", [a4 objectID], 1);
  if (![v10 isActivated]) {
    return 0;
  }
  return [(MRRenderer *)self beginTextEditingOfElement:a3 inLayer:v10 callDelegate:v5];
}

- (void)endTextEditing:(BOOL)a3
{
  if (self->mInternal->mCurrentlyEditedTextElement)
  {
    BOOL v3 = a3;
    BOOL v5 = [(MRRenderer *)self editingDelegate];
    if (v3 && v5) {
      [(MREditingDelegate *)v5 endEditingTextElement:self->mInternal->mCurrentlyEditedTextElement inContainer:[(MCPlug *)[(MRLayer *)self->mInternal->mLayerCurrentlyTextEditing plug] container]];
    }
    [(MRLayerEffect *)self->mInternal->mLayerCurrentlyTextEditing setEditedElement:0];

    self->mInternal->mCurrentlyEditedTextElement = 0;
    self->mInternal->mLayerCurrentlyTextEditing = 0;
    [(MRRenderer *)self requestRendering:0];
  }
}

+ (BOOL)isDiskImageCacheEnabled
{
  return 0;
}

- (MRRenderer)initWithParameters:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRRenderer;
  id v4 = [(MRRenderer *)&v10 init];
  if (v4)
  {
    v4->mInternal = objc_alloc_init(MRRendererInternal);
    v4->mMode = 0;
    v4->mPushRendering = 1;
    v4->mVolume = 1.0;
    v4->mTimeQuantum = 0.0166666667;
    v4->mInternal->mSelectedLayers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mInternal->mMasterClock = -1.0;
    v4->mDisplayLinkTimestamp = -1.0;
    v4->mInternal->mRenderDispatchQueue = (OS_dispatch_queue *)dispatch_queue_create([+[NSString stringWithFormat:@"MRRenderer %p", v4] UTF8String], 0);
    mRenderDispatchQueue = v4->mInternal->mRenderDispatchQueue;
    global_queue = dispatch_get_global_queue(33, 0);
    dispatch_set_target_queue(mRenderDispatchQueue, global_queue);
    dispatch_queue_set_specific((dispatch_queue_t)v4->mInternal->mRenderDispatchQueue, sRenderDispatchQueueSpecificKey, v4, 0);
    v4->mInternal->mRenderThread = (NSThread *)[objc_alloc((Class)NSThread) initWithTarget:v4 selector:"_renderThreadMain" object:0];
    v4->mInternal->mRenderDispatchQueueCopyForRenderThread = v4->mInternal->mRenderDispatchQueue;
    dispatch_retain((dispatch_object_t)v4->mInternal->mRenderDispatchQueueCopyForRenderThread);
    [(NSThread *)v4->mInternal->mRenderThread start];
    v4->mInternal->mFrameLock = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    [(NSConditionLock *)v4->mInternal->mFrameLock setName:@"MRRenderer.frameLock"];
    v4->mInternal->mSnapshotAsCGImageLock = (NSConditionLock *)[objc_alloc((Class)NSConditionLock) initWithCondition:0];
    [(NSConditionLock *)v4->mInternal->mSnapshotAsCGImageLock setName:@"MRRenderer.snapshotAsCGImageLock"];
    v4->mDisplaysFPS = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MRDisplaysFPS"];
    v4->mDisplaysPlayingIDs = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MRDisplaysPlayingIDs"];
    v4->mDisplaysIsPreloadingImages = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MRDisplaysIsPreloadingImages"];
    id v7 = objc_alloc_init((Class)NSOperationQueue);
    objc_msgSend(v7, "setMaxConcurrentOperationCount:", +[MRUtilities operationQueueConcurrentOperationCount](MRUtilities, "operationQueueConcurrentOperationCount"));
    [v7 setSuspended:0];
    v4->mInternal->mRenderArguments = [[MRRenderArguments alloc] initWithRenderer:v4];
    [(MRRenderArguments *)v4->mInternal->mRenderArguments setPreloadQueue:v7];

    id v8 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    [(NSDictionary *)v8 addEntriesFromDictionary:a3];
    [(NSDictionary *)v8 setObject:v4 forKey:@"renderer"];
    v4->mParameters = v8;
    v4->mOrientation = 0;
    v4->mInternal->mMorphingStartTime = -1.0;
    v4->mInternal->mActions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mInternal->mLayersCurrentlyTrackedIn = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v4->mInternal->mHideTextWhileEditing = 1;
    v4->mInternal->mTouchesForVisualFeedback = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->mInternal->mHitZonesForVisualFeedback = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v4->_allowsThumbnails = 1;
    v4->_interactivityIsEnabled = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"MarimbaInteractivityIsEnabled"];
    [(MRRenderer *)v4 _startMonitoringThermalPressureLevelChanges];
  }
  return v4;
}

- (MRRenderer)init
{
  return [(MRRenderer *)self initWithParameters:0];
}

- (void)dealloc
{
  [(MRRenderer *)self cleanup];
  [(MRRenderer *)self _stopMonitoringThermalPressureLevelChanges];

  self->mInternal->mFrameLock = 0;
  self->mInternal->mSnapshotAsCGImageLock = 0;
  dispatch_release((dispatch_object_t)self->mInternal->mRenderDispatchQueue);
  self->mInternal->mRenderDispatchQueue = 0;

  self->_renderingLogFilePath = 0;
  self->mInternal = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRRenderer;
  [(MRRenderer *)&v3 dealloc];
}

- (void)cleanup
{
  if (!self->mIsCleanedUp)
  {
    self->mIsCleanedUp = 1;
    [(MRRenderer *)self endTextEditing:0];
    mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_4BDF4;
    v14[3] = &unk_1AA6F8;
    v14[4] = self;
    PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v14);
    [(NSOperationQueue *)[(MRRenderArguments *)self->mInternal->mRenderArguments preloadQueue] setSuspended:0];
    [(MRAsynchronousOperationsDelegate *)self->mInternal->mAsynchronousOperationsDelegate setSuspended:0];
    mInternal = self->mInternal;
    mRenderThread = mInternal->mRenderThread;
    mInternal->mRenderThread = 0;
    +[NSNull performSelector:"null" onThread:mRenderThread withObject:0 waitUntilDone:0];

    self->mInternal->mSelectedLayers = 0;
    objc_storeWeak((id *)&self->_assetManagementDelegate, 0);
    objc_storeWeak((id *)&self->_renderingDelegate, 0);
    objc_storeWeak((id *)&self->_editingDelegate, 0);

    self->mDescriptionsForRandomTransitionPresetIDs = 0;
    objc_storeWeak((id *)&self->_featureDelegate, 0);
    [(MRRenderArguments *)self->mInternal->mRenderArguments cleanup];

    self->mInternal->mRenderArguments = 0;
    unsigned int v6 = self->mInternal;
    mScreenBurnTestAccumulationImage1 = v6->mScreenBurnTestAccumulationImage1;
    if (mScreenBurnTestAccumulationImage1)
    {
      [(MRImage *)mScreenBurnTestAccumulationImage1 cleanup];
      [(MRImage *)self->mInternal->mScreenBurnTestAccumulationImage1 releaseByUser];
      self->mInternal->mScreenBurnTestAccumulationImage1 = 0;
      unsigned int v6 = self->mInternal;
    }
    mScreenBurnTestAccumulationImage2 = v6->mScreenBurnTestAccumulationImage2;
    if (mScreenBurnTestAccumulationImage2)
    {
      [(MRImage *)mScreenBurnTestAccumulationImage2 cleanup];
      [(MRImage *)self->mInternal->mScreenBurnTestAccumulationImage2 releaseByUser];
      self->mInternal->mScreenBurnTestAccumulationImage2 = 0;
    }

    self->mParameters = 0;
    self->mInternal->mActions = 0;

    self->mInternal->mDefaultActions = 0;
    [(NSMutableSet *)self->mInternal->mLayersCurrentlyTrackedIn removeAllObjects];

    self->mInternal->mLayersCurrentlyTrackedIn = 0;
    [(NSMutableDictionary *)self->mInternal->mLayerTrackings removeAllObjects];

    self->mInternal->mLayerTrackings = 0;
    [(NSMutableDictionary *)self->mInternal->mGestureRecognizers removeAllObjects];

    self->mInternal->mGestureRecognizers = 0;
    id v9 = self->mInternal;
    mAudioPlayerBuckets = v9->mAudioPlayerBuckets;
    if (mAudioPlayerBuckets)
    {

      self->mInternal->mAudioPlayerBuckets = 0;
      id v9 = self->mInternal;
    }
    mAudioPlayerSortedBuckets = v9->mAudioPlayerSortedBuckets;
    if (mAudioPlayerSortedBuckets)
    {

      self->mInternal->mAudioPlayerSortedBuckets = 0;
      id v9 = self->mInternal;
    }

    self->mInternal->mTouchesForVisualFeedback = 0;
    self->mInternal->mHitZonesForVisualFeedback = 0;

    self->_cameraCaptureSession = 0;
    [(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock lock];
    id v12 = self->mInternal;
    mSnapshotAsCGImage = v12->mSnapshotAsCGImage;
    if (mSnapshotAsCGImage)
    {
      CGImageRelease(mSnapshotAsCGImage);
      self->mInternal->mSnapshotAsCGImage = 0;
      id v12 = self->mInternal;
    }
    [(NSConditionLock *)v12->mSnapshotAsCGImageLock unlock];

    self->mInternal->mNavigatorHistoryBack = 0;
    self->mInternal->mNavigatorHistoryForth = 0;

    self->mInternal->mCurrentIDs = 0;
    self->mInternal->mPreviousCurrentIDs = 0;
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (NSStringIsEqual(a3, "rootPlug.fullDuration")
    || NSStringHasPrefix(a3, "fadeInDuration")
    || NSStringHasPrefix(a3, "fadeOutDuration"))
  {
    [(MRRenderer *)self resetFadeInAndOut];
  }
}

- (void)setEAGLContext:(id)a3
{
  objc_opt_class();
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4C104;
  v6[3] = &unk_1AAB00;
  v6[4] = self;
  v6[5] = a3;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v6);
}

- (void)setMontage:(id)a3
{
  if (self->mMontage != a3)
  {
    mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_4C3BC;
    v4[3] = &unk_1AAB00;
    v4[4] = self;
    void v4[5] = a3;
    PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v4);
  }
}

- (void)setCameraCaptureSession:(id)a3
{
  self->_cameraCaptureSession = (MRCameraCaptureSession *)a3;
}

- (OS_dispatch_queue)renderDispatchQueue
{
  return self->mInternal->mRenderDispatchQueue;
}

- (BOOL)slaveFrameMode
{
  return self->mInternal->mSlaveFrameMode;
}

- (void)setSlaveFrameMode:(BOOL)a3
{
  self->mInternal->mSlaveFrameMode = a3;
}

- (BOOL)isPlaying
{
  mInternal = self->mInternal;
  uint64_t v3 = 1040;
  if (mInternal->mIsPlayingSyncRequestCount <= 0) {
    uint64_t v3 = 1041;
  }
  return *((unsigned char *)&mInternal->super.isa + v3);
}

- (void)pause
{
  self->mInternal->mOuterIsPlaying = 0;
  atomic_fetch_add(&self->mInternal->mIsPlayingSyncRequestCount, 1u);
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4C7A0;
  v3[3] = &unk_1AA6F8;
  v3[4] = self;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v3);
}

- (void)resume
{
  self->mInternal->mOuterIsPlaying = 1;
  atomic_fetch_add(&self->mInternal->mIsPlayingSyncRequestCount, 1u);
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4C838;
  v3[3] = &unk_1AA6F8;
  v3[4] = self;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v3);
}

- (void)_r_syncIsPlayingToOuter
{
  if (!self->mIsCleanedUp)
  {
    if (self->mInternal->mOuterIsPlaying) {
      [(MRRenderer *)self _r_resume];
    }
    else {
      [(MRRenderer *)self _r_pause];
    }
    atomic_fetch_add(&self->mInternal->mIsPlayingSyncRequestCount, 0xFFFFFFFF);
  }
}

- (void)_r_pause
{
  if (!self->mIsCleanedUp)
  {
    self->mInternal->mShouldPauseWhenStill = 0;
    if (self->mInternal->mInnerIsPlaying)
    {
      [(MRRenderer *)self _time];
      self->mInternal->mTimeOffset = v3;
      [(MRRenderer *)self _unalteredTime];
      self->mInternal->mUnalteredTimeOffset = v4;
      self->mInternal->mInnerIsPlaying = 0;
      self->mDisplayLinkTimestamp = -1.0;
      self->mInternal->mIsStalled = 0;
      BOOL v5 = +[NSString stringWithFormat:@"Rendering ended at time %f\n", MRGetCurrentTime()];
      mInternal = self->mInternal;
      if (mInternal->mRespondsToLogDelegateMethod)
      {
        [(MRRenderingDelegate *)[(MRRenderer *)self renderingDelegate] renderer:self renderingTimeLogMessage:v5 withTimestamp:CFAbsoluteTimeGetCurrent()];
        self->mInternal->mRespondsToLogDelegateMethod = 0;
      }
      else
      {
        mRenderingLogFile = mInternal->mRenderingLogFile;
        if (mRenderingLogFile)
        {
          fputs([(NSString *)v5 UTF8String], mRenderingLogFile);
          fclose(self->mInternal->mRenderingLogFile);
          self->mInternal->mRenderingLogFile = 0;
        }
      }
      self->mInternal->mNeedsToResumeOrPauseLayers = 1;
      self->mInternal->mRenderingRequested = 0;
      id v8 = self->mInternal;
      if (!v8->mSlaveFrameMode)
      {
        [(MRRenderer *)self _r_stopRenderTimer];
        id v8 = self->mInternal;
      }
      if (v8->mMasterMode == 2) {
        [(MRRenderer *)self setMasterStartTime:0 andDuration:0.0 mode:0.0];
      }
      [(MRRenderer *)self _r_prerenderWithPassParameters:0];
    }
  }
}

- (void)_r_resume
{
  if (!self->mIsCleanedUp)
  {
    self->mInternal->mShouldPauseWhenStill = 0;
    if (!self->mInternal->mInnerIsPlaying)
    {
      if ([+[NSUserDefaults standardUserDefaults] BOOLForKey:@"LogRenderingTimes"]|| self->_logRenderingTimes)
      {
        double v3 = +[NSString stringWithFormat:@"Rendering starting at time %f\n", MRGetCurrentTime()];
        double v4 = [(MRRenderer *)self renderingDelegate];
        self->mInternal->mRespondsToLogDelegateMethod = objc_opt_respondsToSelector() & 1;
        if (self->mInternal->mRespondsToLogDelegateMethod)
        {
          [(MRRenderingDelegate *)v4 renderer:self renderingTimeLogMessage:v3 withTimestamp:CFAbsoluteTimeGetCurrent()];
        }
        else
        {
          time_t v10 = 0;
          time(&v10);
          BOOL v5 = ctime(&v10);
          size_t v6 = 0;
          if (strlen(v5) != 1)
          {
            size_t v6 = 0;
            do
            {
              if (v5[v6] == 32) {
                v5[v6] = 95;
              }
              ++v6;
            }
            while (strlen(v5) - 1 > v6);
          }
          v5[v6] = 0;
          id v7 = NSTemporaryDirectory();
          [+[NSFileManager defaultManager] createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:0];
          id v8 = [(NSString *)v7 stringByAppendingPathComponent:+[NSString stringWithFormat:@"RenderingTimes-%s.log", v5]];
          self->_renderingLogFilePath = (NSString *)&v8->_p;
          if (v8) {
            id v8 = fopen((const char *)[(FILE *)v8 UTF8String], "wc");
          }
          self->mInternal->mRenderingLogFile = v8;
          if (self->mInternal->mRenderingLogFile)
          {
            NSLog(@"Logging rendering times to '%@'", self->_renderingLogFilePath);
            fputs([(NSString *)v3 UTF8String], self->mInternal->mRenderingLogFile);
          }
          else
          {
            NSLog(@"Failed creating rendering times log file at '%@'", self->_renderingLogFilePath);
          }
        }
      }
      self->mInternal->mInnerIsPlaying = 1;
      self->mInternal->mIsStalled = 0;
      double mTimeOffset = self->mInternal->mTimeOffset;
      [(MRRenderer *)self _r_setTime:1 isResyncing:mTimeOffset];
      self->mInternal->mUnalteredTimeOffset = mTimeOffset
                                            + self->mInternal->mTimeOffset
                                            - self->mInternal->mUnalteredTimeOffset;
      self->mInternal->mNeedsToResumeOrPauseLayers = 1;
      if (!self->mInternal->mSlaveFrameMode) {
        [(MRRenderer *)self _r_startRenderTimer];
      }
    }
  }
}

- (void)pauseWhenStill
{
  self->mInternal->mShouldPauseWhenStill = 1;
}

- (void)requestRendering:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    mInternal = self->mInternal;
  }
  else
  {
    if ([(MRRenderer *)self isPlaying] && self->mPushRendering) {
      return;
    }
    mInternal = self->mInternal;
    if (mInternal->mRenderingRequested) {
      return;
    }
  }
  mInternal->mRenderingRequested = 1;
  size_t v6 = self->mInternal->mFrameLock;
  if (v3)
  {
    [(NSConditionLock *)v6 lockBeforeDate:+[NSDate dateWithTimeIntervalSinceNow:5.0]];
    [(NSConditionLock *)v6 unlockWithCondition:1];
  }
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4CDBC;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  if (v3 && !self->mIsCleanedUp)
  {
    if ([(NSConditionLock *)v6 lockWhenCondition:0 beforeDate:+[NSDate dateWithTimeIntervalSinceNow:5.0]])
    {
      [(NSConditionLock *)v6 unlock];
    }
  }
}

- (BOOL)requestRenderingWithin:(double)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4CE48;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  return 1;
}

- (void)warmupVideo:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    p_mInternal = &self->mInternal;
    self->mInternal->mRenderingRequested = 1;
    size_t v6 = dispatch_semaphore_create(0);
  }
  else
  {
    if ([(MRRenderer *)self isPlaying] && self->mPushRendering) {
      return;
    }
    p_mInternal = &self->mInternal;
    mInternal = self->mInternal;
    if (mInternal->mRenderingRequested) {
      return;
    }
    size_t v6 = 0;
    mInternal->mRenderingRequested = 1;
  }
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4CF98;
  block[3] = &unk_1AAB28;
  BOOL v11 = v3;
  block[4] = self;
  void block[5] = v6;
  dispatch_async(mRenderDispatchQueue, block);
  if (v3)
  {
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v9);
    if (!self->mIsCleanedUp)
    {
      [(NSOperationQueue *)[(MRRenderArguments *)(*p_mInternal)->mRenderArguments preloadQueue] setSuspended:0];
      [(NSOperationQueue *)[(MRRenderArguments *)(*p_mInternal)->mRenderArguments preloadQueue] waitUntilAllOperationsAreFinished];
    }
    dispatch_release(v6);
  }
}

- (void)_renderThreadMain
{
  +[NSThread setThreadPriority:1.0];
  +[NSTimer scheduledTimerWithTimeInterval:objc_opt_class() target:"null" selector:0 userInfo:1 repeats:1000000000.0];
  while (1)
  {
    mInternal = self->mInternal;
    if (!mInternal->mRenderThread) {
      break;
    }
    if (CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1000000000.0, 1u) != kCFRunLoopRunHandledSource)
    {
      mInternal = self->mInternal;
      break;
    }
  }
  if (!self->mIsCleanedUp)
  {
    mRenderDispatchQueueCopyForRenderThread = mInternal->mRenderDispatchQueueCopyForRenderThread;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4D190;
    block[3] = &unk_1AA6F8;
    block[4] = self;
    dispatch_sync(mRenderDispatchQueueCopyForRenderThread, block);
    mInternal = self->mInternal;
  }
  dispatch_release((dispatch_object_t)mInternal->mRenderDispatchQueueCopyForRenderThread);
  self->mInternal->mRenderDispatchQueueCopyForRenderThread = 0;
}

- (void)_r_updateTimeWithDisplayLinkTimestamp:(double)a3
{
  if (!self->mIsCleanedUp)
  {
    [(MRRenderer *)self _time];
    double mDisplayLinkTimestamp = self->mDisplayLinkTimestamp;
    mInternal = self->mInternal;
    if (mDisplayLinkTimestamp < 0.0)
    {
      if (mInternal->mInnerIsPlaying) {
        self->double mDisplayLinkTimestamp = a3;
      }
      double mTimeOffset = mInternal->mTimeOffset;
      -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 1);
      self->mInternal->mUnalteredTimeOffset = self->mInternal->mUnalteredTimeOffset
                                            + self->mInternal->mTimeOffset
                                            - mTimeOffset;
      goto LABEL_13;
    }
    if (mInternal->mInnerIsPlaying)
    {
      if (mInternal->mIsStalled)
      {
        self->double mDisplayLinkTimestamp = a3;
      }
      else
      {
        double v8 = self->mTimeQuantum * 12.0;
        self->double mDisplayLinkTimestamp = a3;
        if (a3 - mDisplayLinkTimestamp < v8) {
          return;
        }
      }
      goto LABEL_12;
    }
    if (mInternal->mIsStalled)
    {
LABEL_12:
      -[MRRenderer _r_setTime:isResyncing:](self, "_r_setTime:isResyncing:", 1);
LABEL_13:
      self->mInternal->mIsStalled = 0;
    }
  }
}

- (void)updateTimeWithDisplayLinkTimestamp:(double)a3
{
  mRenderDispatchQueueCopyForRenderThread = self->mInternal->mRenderDispatchQueueCopyForRenderThread;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4D2E0;
  v4[3] = &unk_1AA668;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_sync(mRenderDispatchQueueCopyForRenderThread, v4);
}

- (void)_renderOnDisplayLink:(id)a3
{
  mRenderDispatchQueueCopyForRenderThread = self->mInternal->mRenderDispatchQueueCopyForRenderThread;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4D368;
  v4[3] = &unk_1AAB00;
  v4[4] = a3;
  void v4[5] = self;
  dispatch_sync(mRenderDispatchQueueCopyForRenderThread, v4);
}

- (void)_startDisplayLinkOnRunloop
{
  mDisplayLink = self->mDisplayLink;
  BOOL v3 = +[NSRunLoop currentRunLoop];
  [(CADisplayLink *)mDisplayLink addToRunLoop:v3 forMode:NSDefaultRunLoopMode];
}

- (void)_r_startRenderTimer
{
  if (!self->mIsCleanedUp)
  {
    if (self->mDisplayLink)
    {
      NSLog(@"there already is a display link!!!", a2);
    }
    else if (!self->mInternal->mUsesExternalDisplayLink)
    {
      BOOL v3 = +[CADisplayLink displayLinkWithTarget:self selector:"_renderOnDisplayLink:"];
      self->mDisplayLink = v3;
      [(CADisplayLink *)v3 setPreferredFramesPerSecond:llround(1.0 / self->mTimeQuantum)];
      mRenderThread = self->mInternal->mRenderThread;
      [(MRRenderer *)self performSelector:"_startDisplayLinkOnRunloop" onThread:mRenderThread withObject:0 waitUntilDone:0];
    }
  }
}

- (void)_r_stopRenderTimer
{
  if (!self->mIsCleanedUp)
  {
    mDisplayLink = self->mDisplayLink;
    self->mDisplayLink = 0;
    self->double mDisplayLinkTimestamp = -1.0;
    [(CADisplayLink *)mDisplayLink performSelector:"invalidate" onThread:self->mInternal->mRenderThread withObject:0 waitUntilDone:0];
  }
}

- (BOOL)prerenderWithPassParameters:(id)a3
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_4D614;
  v6[3] = &unk_1AAB50;
  v6[5] = a3;
  void v6[6] = &v7;
  v6[4] = self;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_r_prerenderWithPassParameters:(id)a3
{
  if (self->mIsCleanedUp) {
    return 0;
  }
  mInternal = self->mInternal;
  if (!mInternal->mContext
    || (self->mSize.width == CGSizeZero.width ? (BOOL v7 = self->mSize.height == CGSizeZero.height) : (BOOL v7 = 0),
        v7 || !self->mTopMRLayer))
  {
    if ((char *)[(NSConditionLock *)mInternal->mFrameLock condition] == (char *)&dword_0 + 1)
    {
      double width = self->mSize.width;
      double height = self->mSize.height;
      BOOL v20 = width == CGSizeZero.width && height == CGSizeZero.height;
      if (v20 || !self->mTopMRLayer)
      {
        NSLog(@"Attempting a framelock with context %p, size %f,%f, topLayer %p, aborting", self->mInternal->mContext, *(void *)&width, *(void *)&height, self->mTopMRLayer);
        [(NSConditionLock *)self->mInternal->mFrameLock lock];
        [(NSConditionLock *)self->mInternal->mFrameLock unlockWithCondition:0];
      }
    }
    goto LABEL_23;
  }
  mInternal->mRenderingRequested = 0;
  double v8 = self->mInternal;
  if (v8->mRenderingLogFile || v8->mRespondsToLogDelegateMethod)
  {
    double v9 = MRGetCurrentTime();
    char v10 = self->mInternal;
    double v11 = v9 - v10->mPreviousLogTime;
    double mTimeQuantum = self->mTimeQuantum;
    if (v11 < 5.0 && v11 > mTimeQuantum + mTimeQuantum)
    {
      uint64_t v14 = llround(v11 / mTimeQuantum) - 1;
      [(MRRenderer *)self _time];
      float64x2_t v16 = +[NSString stringWithFormat:@"\t%d frames dropped at time %f, slideshow time %f\n", v14, *(void *)&v9, v15];
      id v17 = self->mInternal;
      if (v17->mRespondsToLogDelegateMethod)
      {
        [(MRRenderingDelegate *)[(MRRenderer *)self renderingDelegate] renderer:self renderingTimeLogMessage:v16 withTimestamp:CFAbsoluteTimeGetCurrent()];
      }
      else
      {
        mRenderingLogFile = v17->mRenderingLogFile;
        if (mRenderingLogFile) {
          fputs([(NSString *)v16 UTF8String], mRenderingLogFile);
        }
      }
      char v10 = self->mInternal;
      if (v9 - v10->mLastSavedLogTime >= 1.0)
      {
        fflush(v10->mRenderingLogFile);
        self->mInternal->mLastSavedLogTime = v9;
        char v10 = self->mInternal;
      }
    }
    v10->mPreviousLogTime = v9;
  }
  if (a3) {
    unsigned int v23 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"forceRendering"), "BOOLValue");
  }
  else {
    unsigned int v23 = 0;
  }
  id v24 = self->mInternal;
  if (v24->mScreenBurnTest)
  {
    double v25 = (double)v24->mScreenBurnTestCurrentPass / 60.0;
    if (v23) {
      goto LABEL_39;
    }
  }
  else
  {
    [(MRRenderer *)self _time];
    double v25 = v26 + 1.0e-10;
    id v24 = self->mInternal;
    if (v23) {
      goto LABEL_39;
    }
  }
  if (v24->mInnerIsPlaying && v25 == self->_lastRenderedTime) {
    goto LABEL_23;
  }
LABEL_39:
  if (v24->mNeedsToResize)
  {
    if (!v24->mMorphingHandlesRotation)
    {
      if ([(MRContext *)v24->mContext orientation])
      {
LABEL_48:
        -[MRContext setPixelOffset:](self->mInternal->mContext, "setPixelOffset:", self->mInternal->mContextOffset.x, self->mInternal->mContextOffset.y);
        -[MRContext setPixelSize:](self->mInternal->mContext, "setPixelSize:", self->mSize.width, self->mSize.height);
        [self->mTopMRLayer updateGeometry];
        goto LABEL_49;
      }
      id v24 = self->mInternal;
    }
    unsigned int mOrientation = self->mOrientation;
    if (mOrientation) {
      uint64_t v28 = mOrientation;
    }
    else {
      uint64_t v28 = 4;
    }
    [(MRContext *)v24->mContext setOrientation:v28];
    goto LABEL_48;
  }
  if (!v24->mNeedsToTemporaryResize) {
    goto LABEL_50;
  }
  -[MRContext setPixelSize:](v24->mContext, "setPixelSize:", v24->mTemporarySize.width, v24->mTemporarySize.height);
LABEL_49:
  unsigned int v23 = 1;
LABEL_50:
  double v29 = self->mInternal;
  if (v29->mMorphingDuration <= 0.0)
  {
    v29->double mMorphingProgress = 1.0;
  }
  else
  {
    double v30 = 0.0;
    if (v29->mMorphingStartTime > 0.0)
    {
      double v31 = MRGetCurrentTime();
      double v29 = self->mInternal;
      double v30 = (v31 - v29->mMorphingStartTime) / v29->mMorphingDuration;
    }
    v29->double mMorphingProgress = v30;
    double v32 = self->mInternal;
    double mMorphingProgress = v32->mMorphingProgress;
    if (mMorphingProgress <= 1.0)
    {
      v32->double mMorphingProgress = mMorphingProgress * (mMorphingProgress * (mMorphingProgress * -2.0 + 3.0));
    }
    else
    {
      [(MRRenderer *)self _r_endMorphing];
      self->mInternal->double mMorphingProgress = 1.0;
    }
    unsigned int v23 = 1;
  }
  double v34 = self->mInternal;
  if (v34->mNeedsToSynchronizeTimeInLayers)
  {
    unsigned int v23 = 1;
    [self->mTopMRLayer setNeedsToSynchronizeTime:1];
    self->mInternal->mNeedsToSynchronizeTimeInLayers = 0;
    double v34 = self->mInternal;
  }
  if (v34->mNeedsToResumeOrPauseLayers)
  {
    [(MRLayerClock *)[self->mTopMRLayer clock] setParentIsPaused:!self->mInternal->mInnerIsPlaying];
    self->mInternal->mNeedsToResumeOrPauseLayers = 0;
    unsigned int v23 = 1;
  }
  if ([a3 objectForKey:@"thumbnailPolicy"]) {
    id v35 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"thumbnailPolicy"), "intValue");
  }
  else {
    id v35 = (id)(2 * !self->_allowsThumbnails);
  }
  [(MRRenderArguments *)self->mInternal->mRenderArguments setThumbnailPolicy:v35];
  [(MRRenderArguments *)self->mInternal->mRenderArguments setSkipsAnimations:[(MRRenderArguments *)self->mInternal->mRenderArguments forcedState] != 0];
  [(MRRenderer *)self _unalteredTime];
  -[MRRenderArguments setUnalteredTime:](self->mInternal->mRenderArguments, "setUnalteredTime:");
  id v36 = self->mInternal;
  double v37 = 0.0;
  if (v36->mMorphingDuration > 0.0) {
    double v37 = v36->mMorphingProgress;
  }
  [(MRRenderArguments *)v36->mRenderArguments setMorphingProgress:v37];
  BOOL asynchronousOperationsAreSuspended = self->_asynchronousOperationsAreSuspended;
  self->_BOOL asynchronousOperationsAreSuspended = 0;
  [(MCMontage *)self->mMontage lock];
  [(MCPlug *)[self->mTopMRLayer plug] fullDuration];
  if (v25 >= v39)
  {
    [(MCPlug *)[self->mTopMRLayer plug] fullDuration];
    double v25 = v43 - self->mTimeQuantum + 0.00001;
    id v40 = self->mInternal;
  }
  else
  {
    id v40 = self->mInternal;
    double mMasterDuration = v40->mMasterDuration;
    if (mMasterDuration > 0.0)
    {
      double v42 = mMasterDuration + v40->mMasterStartTime;
      if (v25 >= v42) {
        double v25 = v42 - self->mTimeQuantum + 0.00001;
      }
    }
  }
  if (v25 < 0.0) {
    double v25 = 0.0;
  }
  [(MRRenderArguments *)v40->mRenderArguments setDisplayLinkTimestamp:self->mDisplayLinkTimestamp];
  do
  {
    unsigned int v44 = [(MRLayerParallelizer *)self->mTopMRLayer prerenderForTime:self->mInternal->mContext inContext:self->mInternal->mRenderArguments withArguments:v25];
    v23 |= MRIsAppleTV() | v44;
  }
  while ([(MRRenderer *)self _doActions]);
  [(MCMontage *)self->mMontage unlock];
  id v45 = self->mInternal;
  if (!v45->mInnerIsPlaying
    || [(MRRenderArguments *)v45->mRenderArguments thumbnailPolicy]
    || (id v46 = self->mInternal, v46->mSlideFocusState)
    || [(NSMutableDictionary *)v46->mGestureRecognizers count])
  {
    self->_BOOL asynchronousOperationsAreSuspended = 0;
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v47 = [(NSOperationQueue *)[(MRRenderArguments *)self->mInternal->mRenderArguments preloadQueue] operations];
  id v48 = [(NSArray *)v47 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v48)
  {
    id v49 = v48;
    uint64_t v50 = *(void *)v62;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(void *)v62 != v50) {
          objc_enumerationMutation(v47);
        }
        if ([*(id *)(*((void *)&v61 + 1) + 8 * i) queuePriority] == &dword_8) {
          self->_BOOL asynchronousOperationsAreSuspended = 0;
        }
      }
      id v49 = [(NSArray *)v47 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v49);
  }
  if (asynchronousOperationsAreSuspended != self->_asynchronousOperationsAreSuspended)
  {
    [(NSOperationQueue *)[(MRRenderArguments *)self->mInternal->mRenderArguments preloadQueue] setSuspended:self->_asynchronousOperationsAreSuspended];
    [(MRAsynchronousOperationsDelegate *)self->mInternal->mAsynchronousOperationsDelegate setSuspended:self->_asynchronousOperationsAreSuspended];
  }
  [(MRRenderArguments *)self->mInternal->mRenderArguments setForcedState:0];
  [(MRRenderArguments *)self->mInternal->mRenderArguments setTimeWasSet:0];
  NSInteger v52 = [(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock condition];
  uint64_t v53 = self->mInternal;
  if (v52 == 1 || v53->mScreenBurnTest) {
    LOBYTE(v23) = 1;
  }
  if (self->mDisplaysTouchVisualFeedback)
  {
    LOBYTE(v23) = ([(NSMutableArray *)v53->mTouchesForVisualFeedback count] != 0) | v23;
    uint64_t v53 = self->mInternal;
  }
  if (self->mDisplaysHitZonesVisualFeedback)
  {
    LOBYTE(v23) = ([(NSMutableArray *)v53->mHitZonesForVisualFeedback count] != 0) | v23;
    uint64_t v53 = self->mInternal;
  }
  if (v53->mInnerIsPlaying) {
    [(MRRenderer *)self processAudioObjects];
  }
  if (v25 < self->_fadeInStartTime + self->_fadeInDuration || (v25 > self->_fadeOutStartTime) | v23 & 1)
  {
    char v54 = 1;
  }
  else
  {
    if (self->mInternal->mInnerIsPlaying && self->mDisplaysFPS) {
      [(MRRenderer *)self _displayFPS:0 actuallyDisplay:MRGetCurrentTime()];
    }
    char v54 = 0;
  }
  id v55 = self->mInternal;
  if (v55->mMorphingDuration > 0.0)
  {
    [(MRRenderer *)self requestRendering:0];
    id v55 = self->mInternal;
  }
  if (!v55->mInnerIsPlaying || !self->mPushRendering)
  {
LABEL_119:
    if (v54) {
      return !self->_isFrozen;
    }
    return 0;
  }
  [(MCPlug *)[self->mTopMRLayer plug] fullDuration];
  long long v57 = self->mInternal;
  double v58 = v57->mMasterDuration;
  if (v58 > 0.0)
  {
    double v59 = v58 + v57->mMasterStartTime;
    if (v59 < v56) {
      double v56 = v59;
    }
  }
  double v60 = self->mTimeQuantum;
  if (v25 + v60 >= v56)
  {
    [(MRRenderer *)self _playbackIsOverWithTime:v57->mMasterMode != 2 sendNotification:v56 + v60];
    goto LABEL_119;
  }
  if ((v54 & 1) == 0)
  {
    if (v57->mShouldPauseWhenStill) {
      [(MRRenderer *)self _r_pause];
    }
LABEL_23:
    return 0;
  }
  return !self->_isFrozen;
}

- (void)render
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4DEF0;
  v3[3] = &unk_1AA6F8;
  v3[4] = self;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v3);
}

- (void)_r_render
{
  if (self->mIsCleanedUp) {
    return;
  }
  mInternal = self->mInternal;
  if (mInternal->mScreenBurnTest)
  {
    double v5 = (double)mInternal->mScreenBurnTestCurrentPass / 60.0;
  }
  else
  {
    [(MRRenderer *)self _time];
    double v5 = v6 + 1.0e-10;
  }
  BOOL v7 = [(MRRenderer *)self renderingDelegate];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [(MRRenderingDelegate *)v7 renderer:self willRenderAtTime:v5];
    }
    if (self->mInternal->mMorphingDuration > 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      double mMorphingProgress = self->mInternal->mMorphingProgress;
      *(float *)&double mMorphingProgress = mMorphingProgress;
      [(MRRenderingDelegate *)v7 isMorphingWithProgress:mMorphingProgress];
    }
  }
  [(MRContext *)self->mInternal->mContext lock];
  double v9 = +[EAGLContext currentContext];
  char v10 = v9;
  if (v9 != [(MRContext *)self->mInternal->mContext glContext]) {
    +[EAGLContext setCurrentContext:[(MRContext *)self->mInternal->mContext glContext]];
  }
  double v11 = self->mInternal;
  if (v11->mNeedsToResize)
  {
    pthread_setname_np([+[NSString stringWithFormat:@"MRRenderer %@: Render %dx%d", self, (int)self->mSize.width, (int)self->mSize.height] UTF8String]);
    double v11 = self->mInternal;
  }
  else if (!v11->mNeedsToTemporaryResize)
  {
    goto LABEL_17;
  }
  v11->mNeedsToTemporaryResize = 0;
  self->mInternal->mNeedsToResize = 0;
  [(MRContext *)self->mInternal->mContext updateGeometry];
  double v11 = self->mInternal;
LABEL_17:
  [(MRContext *)v11->mContext startFrame];
  [(MRContext *)self->mInternal->mContext pixelSize];
  double v13 = v12;
  [(MRContext *)self->mInternal->mContext pixelSize];
  double v15 = v13 / v14;
  *(float *)&double v15 = v13 / v14;
  [(MRContext *)self->mInternal->mContext setLocalAspectRatio:v15];
  float64x2_t v16 = self->mInternal;
  if (!v16->mScreenBurnTest)
  {
    [self->mTopMRLayer renderAtTime:v16->mContext inContext:v16->mRenderArguments withArguments:v5];
    if (self->mInternal->mMorphingDuration > 0.0) {
      [(MRRenderer *)self _r_renderRotation];
    }
    double fadeInDuration = self->_fadeInDuration;
    double v18 = self->_fadeInStartTime + fadeInDuration;
    double fadeOutStartTime = self->_fadeOutStartTime;
    if (v5 >= v18 && v5 <= fadeOutStartTime) {
      goto LABEL_32;
    }
    if (v5 <= fadeOutStartTime)
    {
      double v21 = 1.0;
      if (fadeInDuration > 0.0)
      {
        double v22 = v18 - v5;
        goto LABEL_30;
      }
    }
    else
    {
      double fadeInDuration = self->_fadeOutDuration;
      double v21 = 1.0;
      if (fadeInDuration > 0.0)
      {
        double v22 = v5 - fadeOutStartTime;
LABEL_30:
        double v21 = v22 / fadeInDuration;
      }
    }
    [(MRContext *)self->mInternal->mContext setShader:@"PlainColor"];
    *(float *)&double v23 = v21;
    [(MRContext *)self->mInternal->mContext setForeColorRed:v25 green:0.0 blue:0.0 alpha:0.0 saveTo:v23];
    [(MRContext *)self->mInternal->mContext blend:3];
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderDumbImage:inContext:atPosition:andSize:", 0, self->mInternal->mContext, CGPointZero.x, CGPointZero.y, 2.0, 2.0);
    [(MRContext *)self->mInternal->mContext blend:0];
    [(MRContext *)self->mInternal->mContext restoreForeColor:v25];
    [(MRContext *)self->mInternal->mContext unsetShader];
    goto LABEL_32;
  }
  [(MRRenderer *)self _r_renderForScreenBurnTestAtTime:v5];
LABEL_32:
  if ([(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock tryLockWhenCondition:1])
  {
    [(MRRenderer *)self _r_doSnapshot];
    [(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock unlockWithCondition:0];
  }
  if (self->mDisplaysTouchVisualFeedback) {
    [(MRRenderer *)self _displayTouchVisualFeedback];
  }
  if (self->mDisplaysHitZonesVisualFeedback) {
    [(MRRenderer *)self _displayHitZonesVisualFeedback];
  }
  if (self->mInternal->mInnerIsPlaying && self->mDisplaysFPS) {
    [(MRRenderer *)self _displayFPS:1 actuallyDisplay:MRGetCurrentTime()];
  }
  if (self->mDisplaysPlayingIDs) {
    [(MRRenderer *)self _displayPlayingIDs];
  }
  id v24 = self->mInternal;
  if (self->mDisplaysIsPreloadingImages)
  {
    if (v24->mCountOfPreloadingImages
      || [(NSOperationQueue *)[(MRRenderArguments *)v24->mRenderArguments preloadQueue] isSuspended]|| (id v24 = self->mInternal, v24->mIsStalled))
    {
      [(MRRenderer *)self _displayIsPreloadingImages];
      id v24 = self->mInternal;
    }
  }
  [(MRContext *)v24->mContext flush];
  self->_timestampOfLastRenderPass = MRGetCurrentTime();
  if (+[EAGLContext currentContext] != v9) {
    +[EAGLContext setCurrentContext:v9];
  }

  [(MRContext *)self->mInternal->mContext unlock];
  [(MRContext *)self->mInternal->mContext purgeResources:0];
  if ((char *)[(NSConditionLock *)self->mInternal->mFrameLock condition] == (char *)&dword_0 + 1)
  {
    [(NSConditionLock *)self->mInternal->mFrameLock lock];
    [(NSConditionLock *)self->mInternal->mFrameLock unlockWithCondition:0];
  }
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      [(MRRenderingDelegate *)v7 renderer:self didRenderAtTime:v5];
    }
  }
  self->_lastRenderedTime = v5;
}

- (void)_r_renderWithPassParameters:(id)a3
{
  if ([(MRRenderer *)self _r_prerenderWithPassParameters:a3])
  {
    [(MRRenderer *)self _r_render];
  }
  else
  {
    char v4 = [(MRRenderer *)self renderingDelegate];
    if (v4)
    {
      double v5 = v4;
      [(MRRenderer *)self _time];
      double v7 = v6 + 1.0e-10;
      if (objc_opt_respondsToSelector()) {
        [(MRRenderingDelegate *)v5 renderer:self willRenderAtTime:v7];
      }
      if (objc_opt_respondsToSelector())
      {
        [(MRRenderingDelegate *)v5 renderer:self didRenderAtTime:v7];
      }
    }
  }
}

- (void)_r_renderRotation
{
  mInternal = self->mInternal;
  mSnapshotForMorphing = mInternal->mSnapshotForMorphing;
  if (mSnapshotForMorphing)
  {
    double mMorphingStartTime = mInternal->mMorphingStartTime;
    if (mInternal->mMorphingHandlesRotation)
    {
      if (mMorphingStartTime < 0.0)
      {
        self->mInternal->double mMorphingStartTime = MRGetCurrentTime();
        mSnapshotForMorphing = self->mInternal->mSnapshotForMorphing;
      }
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v54 = 0;
      uint64_t v56 = 0;
      long long v55 = xmmword_165170;
      uint64_t v57 = 0x400921FB54442D18;
      double v6 = *((double *)&v54 + self->mOrientation);
      [(MRImage *)mSnapshotForMorphing rotationAngle];
      float v8 = v6 - v7;
      MRMatrix_SetRotationFromAnglesXYZRad((uint64_t)&v62, 0.0, 0.0, v8);
      *(&v62 + (self->mOrientation < 3u)) = (__int128)vnegq_f32(*((float32x4_t *)&v62 + (self->mOrientation < 3u)));
      [(MRContext *)self->mInternal->mContext composeModelViewMatrix:&v62 saveTo:&v58];
      double v9 = self->mInternal;
      double v10 = 1.0 - v9->mMorphingProgress;
      *(float *)&double v11 = v10;
      LODWORD(v10) = 1.0;
      LODWORD(v12) = 1.0;
      LODWORD(v13) = 1.0;
      [(MRContext *)v9->mContext setForeColorRed:v53 green:v10 blue:v12 alpha:v13 saveTo:v11];
      [(MRContext *)self->mInternal->mContext blend:3];
      [(MRContext *)self->mInternal->mContext setShader:@"PlainTexture"];
      double y = CGPointZero.y;
      [(MRImage *)self->mInternal->mSnapshotForMorphing scale];
      double v15 = self->mInternal->mSnapshotForMorphing;
      if (v16 == 1.0)
      {
        [(MRImage *)v15 width];
        double v18 = (v51 + v51) / self->mSize.width;
        [(MRImage *)self->mInternal->mSnapshotForMorphing height];
      }
      else
      {
        [(MRImage *)v15 height];
        double v18 = (v17 + v17) / self->mSize.width;
        [(MRImage *)self->mInternal->mSnapshotForMorphing width];
      }
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:", self->mInternal->mSnapshotForMorphing, self->mInternal->mContext, CGPointZero.x, y, v18, (v19 + v19) / self->mSize.height);
      [(MRContext *)self->mInternal->mContext unsetShader];
      [(MRContext *)self->mInternal->mContext blend:0];
      mContext = self->mInternal->mContext;
      uint64_t v50 = (uint64_t *)v53;
    }
    else
    {
      if (mMorphingStartTime < 0.0)
      {
        self->mInternal->double mMorphingStartTime = MRGetCurrentTime();
        mSnapshotForMorphing = self->mInternal->mSnapshotForMorphing;
      }
      double width = self->mSize.width;
      [(MRImage *)mSnapshotForMorphing width];
      if (width >= v32) {
        double v33 = width;
      }
      else {
        double v33 = v32;
      }
      double height = self->mSize.height;
      [(MRImage *)self->mInternal->mSnapshotForMorphing height];
      long long v64 = 0u;
      long long v65 = 0u;
      if (height >= v35) {
        double v36 = height;
      }
      else {
        double v36 = v35;
      }
      long long v62 = 0uLL;
      long long v63 = 0uLL;
      long long v60 = 0uLL;
      long long v61 = 0uLL;
      long long v58 = 0uLL;
      long long v59 = 0uLL;
      MRMatrix_SetDiagonal((uint64_t)&v62, 1.0, -1.0, 1.0);
      [(MRContext *)self->mInternal->mContext composeModelViewMatrix:&v62 saveTo:&v58];
      double v37 = self->mInternal;
      double v38 = 1.0;
      double v39 = 1.0 - v37->mMorphingProgress;
      *(float *)&double v40 = v39;
      LODWORD(v39) = 1.0;
      LODWORD(v38) = 1.0;
      LODWORD(v41) = 1.0;
      [(MRContext *)v37->mContext setForeColorRed:&v54 green:v39 blue:v38 alpha:v41 saveTo:v40];
      [(MRContext *)self->mInternal->mContext blend:3];
      [(MRContext *)self->mInternal->mContext setShader:@"PlainTexture"];
      [(MRImage *)self->mInternal->mSnapshotForMorphing width];
      double v43 = (v42 - v33) / v33;
      [(MRImage *)self->mInternal->mSnapshotForMorphing height];
      double v45 = (v44 - v36) / v36;
      [(MRImage *)self->mInternal->mSnapshotForMorphing width];
      double v47 = (v46 + v46) / v33;
      [(MRImage *)self->mInternal->mSnapshotForMorphing height];
      +[MRCroppingSprite renderImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:", self->mInternal->mSnapshotForMorphing, self->mInternal->mContext, v43, v45, v47, (v48 + v48) / v36);
      [(MRContext *)self->mInternal->mContext unsetShader];
      [(MRContext *)self->mInternal->mContext blend:0];
      mContext = self->mInternal->mContext;
      uint64_t v50 = &v54;
    }
    [(MRContext *)mContext restoreForeColor:v50];
    [(MRContext *)self->mInternal->mContext restoreModelViewMatrix:&v58];
  }
  else
  {
    uint64_t v20 = 104;
    uint64_t v21 = 32;
    if ((self->mOrientation - 3) >= 2) {
      uint64_t v22 = 32;
    }
    else {
      uint64_t v22 = 24;
    }
    if ((self->mOrientation - 3) < 2)
    {
      uint64_t v23 = 112;
    }
    else
    {
      uint64_t v21 = 24;
      uint64_t v23 = 104;
    }
    double v24 = *(double *)((char *)&self->super.isa + v21);
    double v25 = *(double *)((char *)&self->super.isa + v22);
    if ((self->mOrientation - 3) >= 2) {
      uint64_t v20 = 112;
    }
    double v26 = *(double *)((char *)&mInternal->super.isa + v20);
    double v27 = *(double *)((char *)&mInternal->super.isa + v23);
    self->mInternal->mSnapshotForMorphing = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]([(MRContext *)mInternal->mContext imageManager], "retainedByUserImageWithSize:andColor:", 0, v25, v24);
    [(MRImage *)self->mInternal->mSnapshotForMorphing setLabel:@"Marimba SnapshotForMorphing"];
    -[MRContext snapshotWithTextureName:offset:size:](self->mInternal->mContext, "snapshotWithTextureName:offset:size:", [(MRTexture *)[(MRImage *)self->mInternal->mSnapshotForMorphing texture] textureName], v26, v27, v25, v24);
    uint64_t v28 = self->mInternal;
    if (v28->mMorphingHandlesRotation)
    {
      int mOrientation = self->mOrientation;
      if ((mOrientation - 1) >= 2)
      {
        if (mOrientation == 3)
        {
          NSInteger v52 = v28->mSnapshotForMorphing;
          [(MRImage *)v52 setRotationAngle:3.14159265];
        }
      }
      else
      {
        [(MRImage *)v28->mSnapshotForMorphing setRotationAngle:*((double *)&xmmword_165180 + (mOrientation == 1))];
        double v30 = self->mInternal->mSnapshotForMorphing;
        [(MRImage *)v30 setScale:v25 / v24];
      }
    }
  }
}

- (void)_r_snapshotForRotation
{
  mInternal = self->mInternal;
  uint64_t v4 = 104;
  uint64_t v5 = 32;
  if ((self->mOrientation - 3) >= 2) {
    uint64_t v6 = 32;
  }
  else {
    uint64_t v6 = 24;
  }
  if ((self->mOrientation - 3) < 2)
  {
    uint64_t v7 = 112;
  }
  else
  {
    uint64_t v5 = 24;
    uint64_t v7 = 104;
  }
  double v8 = *(double *)((char *)&self->super.isa + v5);
  double v9 = *(double *)((char *)&self->super.isa + v6);
  if ((self->mOrientation - 3) >= 2) {
    uint64_t v4 = 112;
  }
  double v10 = *(double *)((char *)&mInternal->super.isa + v4);
  double v11 = *(double *)((char *)&mInternal->super.isa + v7);
  self->mInternal->mSnapshotForMorphing = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]([(MRContext *)mInternal->mContext imageManager], "retainedByUserImageWithSize:andColor:", 0, v9, v8);
  [(MRImage *)self->mInternal->mSnapshotForMorphing setLabel:@"Marimba SnapshotForMorphing"];
  -[MRContext snapshotWithTextureName:offset:size:](self->mInternal->mContext, "snapshotWithTextureName:offset:size:", [(MRTexture *)[(MRImage *)self->mInternal->mSnapshotForMorphing texture] textureName], v10, v11, v9, v8);
  double v12 = self->mInternal;
  if (v12->mMorphingHandlesRotation)
  {
    int mOrientation = self->mOrientation;
    if ((mOrientation - 1) >= 2)
    {
      if (mOrientation == 3)
      {
        mSnapshotForMorphing = v12->mSnapshotForMorphing;
        [(MRImage *)mSnapshotForMorphing setRotationAngle:3.14159265];
      }
    }
    else
    {
      [(MRImage *)v12->mSnapshotForMorphing setRotationAngle:*((double *)&xmmword_165180 + (mOrientation == 1))];
      double v14 = self->mInternal->mSnapshotForMorphing;
      [(MRImage *)v14 setScale:v9 / v8];
    }
  }
}

- (void)_r_renderForScreenBurnTestAtTime:(double)a3
{
  if (!self->mIsCleanedUp)
  {
    id v4 = [self->mTopMRLayer retainedByUserRenderedImageAtTime:self->mInternal->mContext inContext:self->mInternal->mRenderArguments withArguments:a3];
    mInternal = self->mInternal;
    if (__ROR8__(0x8F5C28F5C28F5C29 * mInternal->mScreenBurnTestCurrentPass, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      NSLog(@"Pass %lld", mInternal->mScreenBurnTestCurrentPass);
      mInternal = self->mInternal;
    }
    v32[0] = 0;
    v32[1] = 0;
    if (!mInternal->mScreenBurnTestAccumulationImage1)
    {
      self->mInternal->mScreenBurnTestAccumulationImage1 = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]([(MRContext *)mInternal->mContext imageManager], "retainedByUserImageWithSize:andColor:", v32, self->mSize.width, self->mSize.height);
      mInternal = self->mInternal;
    }
    if (!mInternal->mScreenBurnTestAccumulationImage2)
    {
      self->mInternal->mScreenBurnTestAccumulationImage2 = (MRImage *)-[MRImageManager retainedByUserImageWithSize:andColor:]([(MRContext *)mInternal->mContext imageManager], "retainedByUserImageWithSize:andColor:", v32, self->mSize.width, self->mSize.height);
      mInternal = self->mInternal;
    }
    uint64_t v6 = 416;
    if (mInternal->mScreenBurnTestCurrentPass) {
      uint64_t v7 = 416;
    }
    else {
      uint64_t v7 = 408;
    }
    double v8 = *(Class *)((char *)&mInternal->super.isa + v7);
    if (mInternal->mScreenBurnTestCurrentPass) {
      uint64_t v6 = 408;
    }
    double v9 = *(Class *)((char *)&mInternal->super.isa + v6);
    id v10 = -[MRContext initLocalWithContext:glContext:andSize:]([MRContext alloc], "initLocalWithContext:glContext:andSize:", self->mInternal->mContext, [v8 updateGLContext], self->mSize.width, self->mSize.height);
    double v11 = +[EAGLContext currentContext];
    double v12 = v11;
    if (v11 != [v10 glContext]) {
      +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v10 glContext]);
    }
    __int16 v26 = 0;
    [v10 aspectRatio];
    objc_msgSend(v10, "setImage:onTextureUnit:withReferenceAspectRatio:state:", v4, 0, (char *)&v26 + 1);
    [v9 setFiltersNearest:1];
    [v10 aspectRatio];
    objc_msgSend(v10, "setImage:onTextureUnit:withReferenceAspectRatio:state:", v9, 1, &v26);
    [v10 setShader:@"ScreenBurnTest"];
    long long v27 = xmmword_1651D0;
    long long v28 = unk_1651E0;
    [v10 setTextureCoordinatesPointer:&v27 onTextureUnit:0];
    [v10 setTextureCoordinatesPointer:&v27 onTextureUnit:1];
    [v10 aspectRatio];
    v31[0] = -1082130432;
    float v14 = 1.0 / v13;
    *(float *)&v31[1] = -v14;
    v31[2] = -1082130432;
    *(float *)&v31[3] = v14;
    v31[4] = 1065353216;
    *(float *)&void v31[5] = -v14;
    v31[6] = 1065353216;
    *(float *)&v31[7] = v14;
    [v10 setVertex2DPointer:v31];
    [v10 drawTriangleStripFromOffset:0 count:4];
    [v10 unsetVertexPointer];
    [v10 unsetTextureCoordinatesPointerOnTextureUnit:1];
    [v10 unsetTextureCoordinatesPointerOnTextureUnit:0];
    [v10 unsetShader];
    [v10 unsetImage:v9 onTextureUnit:1 state:&v26];
    [v10 unsetImage:v4 onTextureUnit:0 state:(char *)&v26 + 1];
    [v10 flush];
    [v10 cleanup];
    if (+[EAGLContext currentContext] != v11) {
      +[EAGLContext setCurrentContext:v11];
    }

    [v4 releaseByUser];
    double v15 = +[EAGLContext currentContext];
    double v16 = v15;
    if (v15 != [(MRContext *)self->mInternal->mContext glContext]) {
      +[EAGLContext setCurrentContext:[(MRContext *)self->mInternal->mContext glContext]];
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    [(MRContext *)self->mInternal->mContext setModelViewMatrix:MRMatrix_Identity() saveTo:&v27];
    LODWORD(v17) = 1.0;
    LODWORD(v18) = 1.0;
    LODWORD(v19) = 1.0;
    LODWORD(v20) = 1.0;
    [(MRContext *)self->mInternal->mContext setForeColorRed:0 green:v17 blue:v18 alpha:v19 saveTo:v20];
    LODWORD(v21) = 1.0;
    [(MRContext *)self->mInternal->mContext setBackColorRed:0 green:0.0 blue:0.0 alpha:0.0 saveTo:v21];
    [(MRContext *)self->mInternal->mContext clear:1];
    [(MRContext *)self->mInternal->mContext setShader:@"ScreenBurnTest2"];
    uint64_t v22 = self->mInternal;
    mContext = v22->mContext;
    uint64_t v24 = v22->mScreenBurnTestCurrentPass + 1;
    v22->mScreenBurnTestCurrentPass = v24;
    double v25 = 1.0 / (double)(unint64_t)v24;
    *(float *)&double v25 = v25;
    [(MRContext *)mContext setShaderUniformFloat:@"factor" forKey:v25];
    [v8 setFiltersNearest:1];
    +[MRCroppingSprite renderDumbImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderDumbImage:inContext:atPosition:andSize:", v8, self->mInternal->mContext, CGPointZero.x, CGPointZero.y, 2.0, 2.0);
    [(MRContext *)self->mInternal->mContext unsetShader];
    [(MRContext *)self->mInternal->mContext restoreModelViewMatrix:&v27];
    if (+[EAGLContext currentContext] != v15) {
      +[EAGLContext setCurrentContext:v15];
    }
  }
}

- (void)_r_doSnapshot
{
  if (!self->mIsCleanedUp)
  {
    size_t v3 = (unint64_t)(self->mSize.width * 4.0 * self->mSize.height);
    id v4 = malloc_type_malloc(v3, 0xBE612BAEuLL);
    glPixelStorei(0xD05u, 4);
    glReadPixels(0, 0, (int)self->mSize.width, (int)self->mSize.height, 0x1908u, 0x1401u, v4);
    glFinish();
    uint64_t v5 = CGDataProviderCreateWithData(0, v4, v3, (CGDataProviderReleaseDataCallback)MyCGImageBufferReleaseCallback);
    self->mInternal->mSnapshotAsCGImage = CGImageCreate((unint64_t)self->mSize.width, (unint64_t)self->mSize.height, 8uLL, 0x20uLL, vcvtd_n_u64_f64(self->mSize.width, 2uLL), [(MRContext *)self->mInternal->mContext colorSpace], 1u, v5, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v5);
  }
}

- (void)freeze
{
  self->_isFrozen = 1;
}

- (void)unfreeze
{
  self->_isFrozen = 0;
}

- (void)stepForward
{
  [(MRRenderer *)self time];
  double v4 = v3 + self->mTimeQuantum;
  [(MRRenderer *)self setTime:v4];
}

- (void)stepBackward
{
  [(MRRenderer *)self time];
  double v4 = v3 - self->mTimeQuantum;
  [(MRRenderer *)self setTime:v4];
}

- (void)goBack
{
  if ([(NSMutableArray *)self->mInternal->mNavigatorHistoryBack count])
  {
    do
    {
      id v3 = [(NSMutableArray *)self->mInternal->mNavigatorHistoryBack lastObject];
      if ([v3 isActivated]) {
        break;
      }
      [(NSMutableArray *)self->mInternal->mNavigatorHistoryBack removeLastObject];
    }
    while ([(NSMutableArray *)self->mInternal->mNavigatorHistoryBack count]);
    if (v3)
    {
      id v4 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:](MCGenericAction, "genericActionForTargetPlugObjectID:withAttributes:", 0, +[NSDictionary dictionaryWithObject:@"goBack" forKey:@"type"]);
      [(MRRenderer *)self sendMCAction:v4 fromSender:self];
    }
  }
}

- (void)goForth
{
  if ([(NSMutableArray *)self->mInternal->mNavigatorHistoryForth count])
  {
    do
    {
      id v3 = [(NSMutableArray *)self->mInternal->mNavigatorHistoryForth lastObject];
      if ([v3 isActivated]) {
        break;
      }
      [(NSMutableArray *)self->mInternal->mNavigatorHistoryForth removeLastObject];
    }
    while ([(NSMutableArray *)self->mInternal->mNavigatorHistoryForth count]);
    if (v3)
    {
      id v4 = +[MCGenericAction genericActionForTargetPlugObjectID:withAttributes:](MCGenericAction, "genericActionForTargetPlugObjectID:withAttributes:", 0, +[NSDictionary dictionaryWithObject:@"goForth" forKey:@"type"]);
      [(MRRenderer *)self sendMCAction:v4 fromSender:self];
    }
  }
}

- (BOOL)canGoBack
{
  return [(NSMutableArray *)self->mInternal->mNavigatorHistoryBack count] != 0;
}

- (BOOL)canGoForth
{
  return [(NSMutableArray *)self->mInternal->mNavigatorHistoryForth count] != 0;
}

- (void)addNavigatorToBackHistory:(id)a3
{
  mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  if (!mNavigatorHistoryBack)
  {
    self->mInternal->mNavigatorHistoryBack = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  }
  [(NSMutableArray *)mNavigatorHistoryBack addObject:a3];
}

- (void)addNavigatorToForthHistory:(id)a3
{
  mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  if (!mNavigatorHistoryForth)
  {
    self->mInternal->mNavigatorHistoryForth = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  }
  [(NSMutableArray *)mNavigatorHistoryForth addObject:a3];
}

- (void)removeNavigatorFromBackHistory:(id)a3
{
}

- (void)removeNavigatorFromForthHistory:(id)a3
{
}

- (void)moveNavigatorFromBackToForthHistory:(id)a3
{
  mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  if (!mNavigatorHistoryForth)
  {
    self->mInternal->mNavigatorHistoryForth = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  }
  [(NSMutableArray *)mNavigatorHistoryForth addObject:a3];
  uint64_t v6 = (char *)[(NSMutableArray *)self->mInternal->mNavigatorHistoryBack count];
  do
  {
    if ((uint64_t)--v6 < 0)
    {
      NSLog(@"Consistency error: can't move '%@' from back history", a3);
      return;
    }
  }
  while ([(NSMutableArray *)self->mInternal->mNavigatorHistoryBack objectAtIndex:v6] != a3);
  mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  [(NSMutableArray *)mNavigatorHistoryBack removeObjectAtIndex:v6];
}

- (void)moveNavigatorFromForthToBackHistory:(id)a3
{
  mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  if (!mNavigatorHistoryBack)
  {
    self->mInternal->mNavigatorHistoryBack = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    mNavigatorHistoryBack = self->mInternal->mNavigatorHistoryBack;
  }
  [(NSMutableArray *)mNavigatorHistoryBack addObject:a3];
  uint64_t v6 = (char *)[(NSMutableArray *)self->mInternal->mNavigatorHistoryForth count];
  do
  {
    if ((uint64_t)--v6 < 0)
    {
      NSLog(@"Consistency error: can't move '%@' from forth history", a3);
      return;
    }
  }
  while ([(NSMutableArray *)self->mInternal->mNavigatorHistoryForth objectAtIndex:v6] != a3);
  mNavigatorHistoryForth = self->mInternal->mNavigatorHistoryForth;
  [(NSMutableArray *)mNavigatorHistoryForth removeObjectAtIndex:v6];
}

- (void)setUsesExternalDisplayLink:(BOOL)a3
{
  self->mInternal->mUsesExternalDisplayLink = a3;
}

- (double)time
{
  mInternal = self->mInternal;
  if (mInternal->mTimeSyncRequestCount >= 1) {
    return mInternal->mOuterTime;
  }
  [(MRRenderer *)self _time];
  return result;
}

- (void)setTime:(double)a3
{
  self->mInternal->mOuterTime = a3;
  atomic_fetch_add(&self->mInternal->mTimeSyncRequestCount, 1u);
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4F6B0;
  v4[3] = &unk_1AA6F8;
  v4[4] = self;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (double)_time
{
  mInternal = self->mInternal;
  if (mInternal->mInnerIsPlaying)
  {
    [(MRRenderer *)self masterClock];
    id v4 = self->mInternal;
    double result = vabdd_f64(v5, v4->mTimeOffset);
    if (self->mDisplayLinkTimestamp >= 0.0)
    {
      double mTimeQuantum = self->mTimeQuantum;
      if (mTimeQuantum > 0.0) {
        double result = mTimeQuantum * floor((result + mTimeQuantum * 0.1) / mTimeQuantum);
      }
    }
    long double mMasterDuration = v4->mMasterDuration;
    if (mMasterDuration > 0.0)
    {
      double mMasterStartTime = v4->mMasterStartTime;
      if (result > mMasterStartTime)
      {
        if (v4->mMasterMode == 1)
        {
          return mMasterStartTime + fmod(result - mMasterStartTime, mMasterDuration);
        }
        else
        {
          double v11 = mMasterDuration + mMasterStartTime;
          if (result >= v11) {
            return v11;
          }
        }
      }
    }
  }
  else
  {
    double v10 = self->mTimeQuantum;
    double result = mInternal->mTimeOffset;
    if (v10 > 0.0) {
      return v10 * floor((result + 0.0000001) / v10);
    }
  }
  return result;
}

- (void)_r_syncTimeToOuter
{
  if (!self->mIsCleanedUp)
  {
    [(MRRenderer *)self _r_setTime:0 isResyncing:self->mInternal->mOuterTime];
    atomic_fetch_add_explicit(&self->mInternal->mTimeSyncRequestCount, 0xFFFFFFFF, memory_order_relaxed);
    if (self->mRequestRenderingOnChanges)
    {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (void)_r_setTime:(double)a3 isResyncing:(BOOL)a4
{
  if (!self->mIsCleanedUp)
  {
    mInternal = self->mInternal;
    if (mInternal->mInnerIsPlaying)
    {
      [(MRRenderer *)self masterClock];
      a3 = v8 - a3;
      mInternal = self->mInternal;
    }
    mInternal->double mTimeOffset = a3;
    double v9 = self->mInternal;
    if (v9->mTimeOffset < 0.0) {
      v9->double mTimeOffset = 0.0;
    }
    if (!a4)
    {
      self->mInternal->mUnalteredTimeOffset = self->mInternal->mTimeOffset;
      self->mInternal->mNeedsToSynchronizeTimeInAudioMovies = 1;
      self->mInternal->mNeedsToSynchronizeTimeInLayers = 1;
      mRenderArguments = self->mInternal->mRenderArguments;
      [(MRRenderArguments *)mRenderArguments setTimeWasSet:1];
    }
  }
}

- (double)_unalteredTime
{
  mInternal = self->mInternal;
  if (mInternal->mInnerIsPlaying)
  {
    [(MRRenderer *)self masterClock];
    id v4 = self->mInternal;
    double result = vabdd_f64(v5, v4->mUnalteredTimeOffset);
    if (self->mDisplayLinkTimestamp >= 0.0)
    {
      double mTimeQuantum = self->mTimeQuantum;
      if (mTimeQuantum > 0.0) {
        double result = mTimeQuantum * floor((result + mTimeQuantum * 0.1) / mTimeQuantum);
      }
    }
    long double mMasterDuration = v4->mMasterDuration;
    if (mMasterDuration > 0.0)
    {
      double mMasterStartTime = v4->mMasterStartTime;
      if (result > mMasterStartTime)
      {
        if (v4->mMasterMode == 1)
        {
          return mMasterStartTime + fmod(result - mMasterStartTime, mMasterDuration);
        }
        else
        {
          double v11 = mMasterDuration + mMasterStartTime;
          if (result >= v11) {
            return v11;
          }
        }
      }
    }
  }
  else
  {
    double v10 = self->mTimeQuantum;
    double result = mInternal->mUnalteredTimeOffset;
    if (v10 > 0.0) {
      return v10 * floor((result + 0.0000001) / v10);
    }
  }
  return result;
}

- (void)setTimeQuantum:(double)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_4FA2C;
  v4[3] = &unk_1AA668;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (void)setSize:(CGSize)a3
{
  double v3 = ceil(a3.width);
  double v4 = ceil(a3.height);
  if (v3 != self->mSize.width || v4 != self->mSize.height)
  {
    mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_4FB18;
    v8[3] = &unk_1AABA0;
    v8[4] = self;
    *(double *)&v8[5] = v3;
    *(double *)&v8[6] = v4;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v8);
    if (self->mRequestRenderingOnChanges) {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (void)setTemporarySize:(CGSize)a3
{
  double v3 = ceil(a3.width);
  double v4 = ceil(a3.height);
  mInternal = self->mInternal;
  if (v3 != mInternal->mTemporarySize.width || v4 != mInternal->mTemporarySize.height)
  {
    mRenderDispatchQueue = mInternal->mRenderDispatchQueue;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_4FE34;
    v9[3] = &unk_1AABA0;
    v9[4] = self;
    *(double *)&v9[5] = v3;
    *(double *)&v9[6] = v4;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v9);
    if (self->mRequestRenderingOnChanges) {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (CGPoint)contextOffset
{
  mInternal = self->mInternal;
  double x = mInternal->mContextOffset.x;
  double y = mInternal->mContextOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContextOffset:(CGPoint)a3
{
  mInternal = self->mInternal;
  BOOL v4 = a3.x == mInternal->mContextOffset.x && a3.y == mInternal->mContextOffset.y;
  if (!v4 && mInternal->mContext)
  {
    mRenderDispatchQueue = mInternal->mRenderDispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_4FF20;
    v7[3] = &unk_1AABA0;
    v7[4] = self;
    CGPoint v8 = a3;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v7);
    if (self->mRequestRenderingOnChanges) {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (int)orientation
{
  return self->mOrientation;
}

- (void)setOrientation:(int)a3
{
  if (self->mOrientation != a3)
  {
    mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_4FFFC;
    v5[3] = &unk_1AABC8;
    v5[4] = self;
    int v6 = a3;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
    if (self->mRequestRenderingOnChanges) {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (void)resetFadeInAndOut
{
  self->_fadeInStartTime = 0.0;
  [(MCMontage *)self->mMontage fadeInDuration];
  self->_double fadeInDuration = v3;
  [(MCMontage *)self->mMontage fadeOutDuration];
  self->_fadeOutDuration = v4;
  [(MCPlug *)[(MCMontage *)self->mMontage rootPlug] fullDuration];
  self->_double fadeOutStartTime = v5 - self->_fadeOutDuration;
}

- (void)disableFadeInAndOut
{
  self->_fadeInStartTime = -1000000000.0;
  self->_double fadeOutStartTime = 1000000000.0;
}

- (CGPoint)_fixProjectedPointForOrientation:(CGPoint)a3
{
  double x = a3.x;
  int mOrientation = self->mOrientation;
  double v5 = -a3.y;
  if (mOrientation != 1)
  {
    double v6 = -x;
    if (mOrientation == 3)
    {
      double x = -x;
      double y = -a3.y;
    }
    else
    {
      double y = a3.y;
    }
    if (mOrientation == 2) {
      double v5 = a3.y;
    }
    else {
      double v5 = x;
    }
    if (mOrientation == 2) {
      double x = v6;
    }
    else {
      double x = y;
    }
  }
  double v8 = x;
  result.double y = v8;
  result.double x = v5;
  return result;
}

- (CGPoint)_fixPointForUnprojectionForOrientation:(CGPoint)a3
{
  double y = a3.y;
  int mOrientation = self->mOrientation;
  double x = -a3.x;
  if (mOrientation != 1)
  {
    if (mOrientation == 3)
    {
      double v6 = -y;
    }
    else
    {
      double x = a3.x;
      double v6 = y;
    }
    if (mOrientation == 2) {
      double y = -y;
    }
    else {
      double y = x;
    }
    if (mOrientation == 2) {
      double x = a3.x;
    }
    else {
      double x = v6;
    }
  }
  double v7 = y;
  result.double y = x;
  result.double x = v7;
  return result;
}

- (unsigned)currentLayoutIndex
{
  return [(MRRenderArguments *)self->mInternal->mRenderArguments currentLayoutIndex];
}

- (void)setCurrentLayoutIndex:(unsigned __int8)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_501C8;
  v5[3] = &unk_1AA720;
  v5[4] = self;
  unsigned __int8 v6 = a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
  if (self->mRequestRenderingOnChanges) {
    [(MRRenderer *)self requestRendering:0];
  }
}

- (void)setMode:(int)a3
{
  if (self->mMode != a3)
  {
    mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_502A0;
    v7[3] = &unk_1AABC8;
    v7[4] = self;
    int v8 = a3;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v7);
    BOOL v5 = self->mMode == 1 || !self->mRequestRenderingOnChanges;
    BOOL v6 = !v5;
    self->mRequestRenderingOnChanges = v6;
    if (!v5) {
      [(MRRenderer *)self requestRendering:0];
    }
  }
}

- (BOOL)isOffscreen
{
  return self->mMode == 1;
}

- (MZMediaManagement)assetManagementDelegate
{
  return (MZMediaManagement *)objc_loadWeak((id *)&self->_assetManagementDelegate);
}

- (void)setAssetManagementDelegate:(id)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_50408;
  v4[3] = &unk_1AAB00;
  v4[4] = self;
  void v4[5] = a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (MRFeatureDelegate)featureDelegate
{
  return (MRFeatureDelegate *)objc_loadWeak((id *)&self->_featureDelegate);
}

- (void)setFeatureDelegate:(id)a3
{
}

- (MRRenderingDelegate)renderingDelegate
{
  return (MRRenderingDelegate *)objc_loadWeak((id *)&self->_renderingDelegate);
}

- (void)setRenderingDelegate:(id)a3
{
}

- (MREditingDelegate)editingDelegate
{
  return (MREditingDelegate *)objc_loadWeak((id *)&self->_editingDelegate);
}

- (void)setEditingDelegate:(id)a3
{
}

- (void)setDisplaysFPS:(BOOL)a3
{
  self->mDisplaysFPS = a3;
  if (self->mRequestRenderingOnChanges) {
    [(MRRenderer *)self requestRendering:0];
  }
}

- (void)transitionToNextPlugInContainerOfPlug:(id)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_50534;
  v4[3] = &unk_1AAB00;
  v4[4] = self;
  void v4[5] = a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (void)transitionToPreviousPlugInContainerOfPlug:(id)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5063C;
  v4[3] = &unk_1AAB00;
  v4[4] = self;
  void v4[5] = a3;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v4);
}

- (id)_layerForPlugObjectID:(id)a3
{
  if (self->mIsCleanedUp) {
    return 0;
  }
  else {
    return [(MRLayerParallelizer *)self->mTopMRLayer sublayerForPlugObjectID:a3 recursive:1];
  }
}

- (id)plugForCurrentSublayerInNavigatorForPlug:(id)a3
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x3052000000;
  double v10 = sub_507E0;
  double v11 = sub_507F0;
  uint64_t v12 = 0;
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_507FC;
  block[3] = &unk_1AABF0;
  block[4] = self;
  void block[5] = a3;
  void block[6] = &v7;
  dispatch_sync(mRenderDispatchQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)currentState
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_507E0;
  double v10 = sub_507F0;
  uint64_t v11 = 0;
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_5097C;
  v5[3] = &unk_1AAC18;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(mRenderDispatchQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)gotoState:(id)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_50A9C;
  v4[3] = &unk_1AAB00;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(mRenderDispatchQueue, v4);
}

- (id)snapshotOfStates:(id)a3 atSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = +[NSMutableArray array];
  uint64_t v9 = [[MRSnapshotter alloc] initWithMontage:self->mMontage andAssetManagementDelegate:[(MRRenderer *)self assetManagementDelegate] isReadOnly:1];
  -[MRSnapshotter setSize:](v9, "setSize:", width, height);

  return v7;
}

- (void)dumpActiveHierarchy
{
  id v3 = [(MRLayerParallelizer *)self->mTopMRLayer _dumpLayerWithOptions:0];
  uint64_t width = (int)self->mSize.width;
  uint64_t height = (int)self->mSize.height;
  [(MRRenderer *)self _time];
  NSLog(@"%dx%d: %f\n%@", width, height, v6, v3);
}

- (void)nearingEndForSerializer:(id)a3
{
  if (self->mInternal->mLiveSlideshowDelegate)
  {
    BOOL v5 = (NSString *)objc_msgSend(objc_msgSend(a3, "referencingPlug"), "objectID");
    mInternal = self->mInternal;
    if (v5 == mInternal->mTransitionLayerPlugObjectID)
    {
      mRenderDispatchQueue = mInternal->mRenderDispatchQueue;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_50CE0;
      v8[3] = &unk_1AAB00;
      v8[4] = self;
      v8[5] = a3;
      PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v8);
    }
  }
}

- (void)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5
{
  mInternal = self->mInternal;
  if (mInternal->mLiveSlideshowDelegate)
  {
    mRenderDispatchQueue = mInternal->mRenderDispatchQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_50DCC;
    v7[3] = &unk_1AAC40;
    v7[4] = self;
    void v7[5] = a3;
    v7[6] = a4;
    v7[7] = a5;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v7);
  }
}

- (void)imagePreloadingBegan
{
}

- (void)imagePreloadingEnded
{
  mInternal = self->mInternal;
  unint64_t mCountOfPreloadingImages = mInternal->mCountOfPreloadingImages;
  if (mCountOfPreloadingImages) {
    mInternal->unint64_t mCountOfPreloadingImages = mCountOfPreloadingImages - 1;
  }
}

- (void)addIDToDisplay:(id)a3 :(id)a4
{
  if (self->mDisplaysPlayingIDs)
  {
    mInternal = self->mInternal;
    if (mInternal->mCurrentIDs)
    {
      mCurrentIDs = mInternal->mCurrentIDs;
      if (a4 && ![a4 isEqualToString:@"Default"]) {
        uint64_t v8 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@, %@/%@", mCurrentIDs, a3, a4];
      }
      else {
        uint64_t v8 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@, %@", mCurrentIDs, a3, v10];
      }
      self->mInternal->mCurrentIDs = v8;
    }
    else
    {
      if (a4 && ![a4 isEqualToString:@"Default"]) {
        uint64_t v9 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@/%@", a3, a4];
      }
      else {
        uint64_t v9 = (NSString *)a3;
      }
      self->mInternal->mCurrentIDs = v9;
    }
  }
}

- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_51008;
  v6[3] = &unk_1AAC68;
  v6[4] = self;
  int v7 = a4;
  *(double *)&v6[5] = a3;
  *(double *)&void v6[6] = a5;
  PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v6);
}

- (void)endMorphing
{
  mInternal = self->mInternal;
  if (mInternal->mMorphingDuration == 0.0)
  {
    mRenderDispatchQueue = mInternal->mRenderDispatchQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_510B4;
    v5[3] = &unk_1AA6F8;
    v5[4] = self;
    PerformAsynchronouslyOnRenderQueueIfNotOnRenderQueue(mRenderDispatchQueue, v5);
    [(MRRenderer *)self requestRendering:0];
  }
}

- (void)_r_beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5
{
  if (!self->mIsCleanedUp)
  {
    mInternal = self->mInternal;
    if (mInternal->mMorphingStartTime >= 0.0 && mInternal->mMorphingDuration > 0.0)
    {
      [(MRRenderer *)self _r_endMorphing];
      mInternal = self->mInternal;
    }
    if (a5 > 0.0)
    {
      mInternal->mMorphingDuration = a5;
      [(MRRenderer *)self _r_snapshotForRotation];
      mInternal = self->mInternal;
    }
    mInternal->mMorphingHandlesRotation = (a4 - 1) < 4;
    uint64_t v9 = self->mInternal;
    if (v9->mMorphingHandlesRotation)
    {
      int mOrientation_low = LOBYTE(self->mOrientation);
      v9->mMorphingRotationAngle = 0.0;
      if (mOrientation_low != a4)
      {
        switch(a4)
        {
          case 1:
            double v11 = dbl_1651A0[mOrientation_low == 3];
            BOOL v12 = mOrientation_low == 2;
            goto LABEL_14;
          case 2:
            double v11 = *((double *)&xmmword_165190 + (mOrientation_low == 3));
            BOOL v12 = mOrientation_low == 1;
            goto LABEL_14;
          case 3:
            double v11 = dbl_1651A0[mOrientation_low == 2];
            BOOL v12 = mOrientation_low == 4;
            goto LABEL_14;
          case 4:
            double v11 = *((double *)&xmmword_165190 + (mOrientation_low == 2));
            BOOL v12 = mOrientation_low == 3;
LABEL_14:
            if (v12) {
              double v11 = 180.0;
            }
            self->mInternal->mMorphingRotationAngle = v11;
            break;
          default:
            break;
        }
      }
      self->int mOrientation = a4;
      self->mInternal->mNeedsToResize = 1;
    }
  }
}

- (void)_r_endMorphing
{
  if (!self->mIsCleanedUp)
  {
    self->mInternal->double mMorphingStartTime = -1.0;
    self->mInternal->mMorphingDuration = 0.0;
    mSnapshotForMorphing = self->mInternal->mSnapshotForMorphing;
    if (mSnapshotForMorphing)
    {
      [(MRImage *)mSnapshotForMorphing releaseByUser];
      self->mInternal->mSnapshotForMorphing = 0;
    }
  }
}

- (void)_playbackIsOverWithTime:(double)a3 sendNotification:(BOOL)a4
{
  BOOL v4 = a4;
  [(MRRenderer *)self _r_pause];
  if (a3 < 0.0)
  {
    [(MRRenderer *)self time];
    a3 = v7;
  }
  self->mInternal->double mTimeOffset = a3;
  self->mInternal->mNeedsToResumeOrPauseLayers = 1;
  self->mInternal->mInnerIsPlaying = 0;
  self->mInternal->mShouldPauseWhenStill = 0;
  if (v4)
  {
    uint64_t v8 = kMRNotificationPlaybackOver;
    [(MRRenderer *)self sendNotification:v8];
  }
}

- (NSString)currentFocusedSlideAsset
{
  id v2 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo];
  return [(MRSlideInfo *)v2 assetPath];
}

- (void)setSlideFocusModeBackgroundColor:(CGColor *)a3
{
  if (a3)
  {
    size_t NumberOfComponents = CGColorGetNumberOfComponents(a3);
    if (NumberOfComponents == 4)
    {
      Components = CGColorGetComponents(a3);
      double v9 = Components[2];
      *(_OWORD *)self->_slideFocusModeBackgroundColor = *(_OWORD *)Components;
      self->_slideFocusModeBackgroundColor[2] = v9;
    }
    else if (NumberOfComponents == 2)
    {
      uint64_t v6 = CGColorGetComponents(a3);
      double v7 = *v6;
      self->_slideFocusModeBackgroundColor[1] = *v6;
      self->_slideFocusModeBackgroundColor[2] = v7;
      self->_slideFocusModeBackgroundColor[0] = v7;
    }
    else
    {
      NSLog(@"Background color is in an unsupported color space (not generic gray or RGB)\n");
    }
  }
  else
  {
    self->_slideFocusModeBackgroundColor[0] = 0.0;
    self->_slideFocusModeBackgroundColor[1] = 0.0;
    self->_slideFocusModeBackgroundColor[2] = 0.0;
  }
  self->_slideFocusModeBackgroundColor[3] = 1.0;
}

- (id)currentlyShowingAssetPaths
{
  id v3 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = objc_msgSend(-[MRRenderer slideInfosForCurrentElements](self, "slideInfosForCurrentElements"), "objectEnumerator", 0);
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 assetPath]) {
          objc_msgSend(v3, "addObject:", objc_msgSend(v9, "assetPath"));
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)currentStateForMontageSwap
{
  if (self->mIsCleanedUp) {
    return 0;
  }
  id v2 = +[NSMutableDictionary dictionary];
  id v4 = [(MRRenderer *)self slideInfosForCurrentElements];
  if (v4) {
    [v2 setObject:v4 forKey:@"slideInfosForCurrentElements"];
  }
  objc_msgSend(v2, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MRRenderer isPlaying](self, "isPlaying")), @"isPlaying");
  objc_msgSend(v2, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[MRRenderer slideshowIsPlaying](self, "slideshowIsPlaying")), @"slideshowIsPlaying");
  return v2;
}

- (void)swapMontage:(id)a3
{
  if (a3 && !self->mIsCleanedUp && self->mMontage != a3)
  {
    if (self->mInternal->mSlideFocusLayer) {
      -[MRLayerParallelizer removeSublayer:](self->mTopMRLayer, "removeSublayer:");
    }
    if ([self->mTopMRLayer isActivated]) {
      [(MRLayerParallelizer *)self->mTopMRLayer deactivate];
    }
    if ([self->mTopMRLayer isPreactivated]) {
      [(MRLayerParallelizer *)self->mTopMRLayer depreactivate:0];
    }
    [(MRLayerParallelizer *)self->mTopMRLayer cleanup];

    self->mTopMRLayer = 0;
    [(MRRenderer *)self willChangeValueForKey:@"montage"];
    mMontage = self->mMontage;
    if (mMontage)
    {
      [(MCMontage *)mMontage removeObserver:self forKeyPath:@"rootPlug.fullDuration"];
      [(MCMontage *)self->mMontage removeObserver:self forKeyPath:@"fadeInDuration"];
      [(MCMontage *)self->mMontage removeObserver:self forKeyPath:@"fadeOutDuration"];

      self->mMontage = 0;
    }
    self->mMontage = (MCMontage *)a3;
    [(MRRenderer *)self didChangeValueForKey:@"montage"];
    [(MCMontage *)self->mMontage addObserver:self forKeyPath:@"rootPlug.fullDuration" options:0 context:0];
    [(MCMontage *)self->mMontage addObserver:self forKeyPath:@"fadeInDuration" options:0 context:0];
    [(MCMontage *)self->mMontage addObserver:self forKeyPath:@"fadeOutDuration" options:0 context:0];
    id v6 = [[MRLayerParallelizer alloc] initWithPlug:[(MCMontage *)self->mMontage rootPlug] andParameters:self->mParameters inSuperlayer:0];
    self->mTopMRLayer = v6;
    mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
    if (mSlideFocusLayer)
    {
      [(MRLayerParallelizer *)v6 setSublayer:mSlideFocusLayer forKey:@"SlideFocusLayer"];
      [(MRLayer *)self->mInternal->mSlideFocusLayer setZIndex:32000];
      [(MRLayer *)self->mInternal->mSlideFocusLayer setPhaseInDuration:0.5];
      [(MRLayer *)self->mInternal->mSlideFocusLayer setPhaseOutDuration:0.5];
    }
    [(MRRenderer *)self _r_setTime:0 isResyncing:0.0];
    [self->mTopMRLayer updateGeometry];
    [(MRLayerParallelizer *)self->mTopMRLayer preactivate];
    [self->mTopMRLayer activate];
    self->mInternal->mNeedsToResumeOrPauseLayers = 1;
  }
}

- (void)applyStateForMontageSwap:(id)a3
{
  if (self->mIsCleanedUp) {
    return;
  }
  id v4 = self;
  [(MRRenderer *)self _r_prerenderWithPassParameters:&off_1BBCA8];
  id v5 = [(MRRenderer *)v4 _layerForPlugObjectID:v4->mInternal->mTransitionLayerPlugObjectID];
  mSlideFocusState = v4->mInternal->mSlideFocusState;
  if (mSlideFocusState)
  {
    uint64_t v7 = [(MRSlideFocusState *)mSlideFocusState slideInfo];
    int v8 = 0;
  }
  else
  {
    id v9 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"slideInfosForCurrentElements"), "allValues");
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (!v10)
    {
LABEL_43:
      CFStringRef v31 = 0;
      goto LABEL_51;
    }
    id v11 = v10;
    uint64_t v7 = 0;
    uint64_t v12 = *(void *)v53;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(MRSlideInfo **)(*((void *)&v52 + 1) + 8 * i);
        if ([(MRSlideInfo *)v14 isMain])
        {
          if ([(MZMediaManagement *)[(MRRenderer *)v4 assetManagementDelegate] isSupportedMovieForAssetAtPath:[(MRSlideInfo *)v14 assetPath]])
          {
            int v8 = 1;
            uint64_t v7 = v14;
            goto LABEL_17;
          }
          if (!v7) {
            uint64_t v7 = v14;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v52 objects:v58 count:16];
      int v8 = 0;
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_17:
  if (!v7) {
    goto LABEL_43;
  }
  double v15 = [(MRSlideInfo *)v7 assetPath];
  if (!v15) {
    goto LABEL_43;
  }
  double v16 = v15;
  id v40 = a3;
  double v41 = v4;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  double v39 = v5;
  id obj = [v5 sublayers];
  id v17 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
  if (!v17)
  {
    double v21 = 0;
    CFStringRef v31 = 0;
    goto LABEL_48;
  }
  id v18 = v17;
  int v38 = v8;
  uint64_t v19 = *(void *)v49;
LABEL_21:
  uint64_t v20 = 0;
  id v42 = v18;
  while (1)
  {
    if (*(void *)v49 != v19) {
      objc_enumerationMutation(obj);
    }
    double v21 = *(void **)(*((void *)&v48 + 1) + 8 * v20);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_40;
    }
    if (objc_msgSend(objc_msgSend(objc_msgSend(v21, "container"), "effectID"), "hasPrefix:", @"TableTop"))break; {
    long long v46 = 0u;
    }
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v22 = objc_msgSend(objc_msgSend(v21, "container"), "slides");
    id v23 = [v22 countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v45;
LABEL_32:
      __int16 v26 = v7;
      uint64_t v27 = v19;
      uint64_t v28 = 0;
      while (1)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v29 = *(void **)(*((void *)&v44 + 1) + 8 * v28);
        if (objc_msgSend(objc_msgSend(objc_msgSend(v29, "asset"), "path"), "isEqualToString:", v16)) {
          break;
        }
        if (v24 == (id)++v28)
        {
          id v24 = [v22 countByEnumeratingWithState:&v44 objects:v56 count:16];
          uint64_t v19 = v27;
          uint64_t v7 = v26;
          id v18 = v42;
          if (v24) {
            goto LABEL_32;
          }
          goto LABEL_40;
        }
      }
      long long v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"image%d", [v29 index]);
      uint64_t v19 = v27;
      uint64_t v7 = v26;
      id v18 = v42;
      if (!v30) {
        goto LABEL_40;
      }
      CFStringRef v31 = (const __CFString *)v30;
      goto LABEL_46;
    }
LABEL_40:
    if ((id)++v20 == v18)
    {
      id v18 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      if (v18) {
        goto LABEL_21;
      }
      double v21 = 0;
      CFStringRef v31 = 0;
      goto LABEL_46;
    }
  }
  if (objc_msgSend(objc_msgSend(v21, "container"), "countOfSlides") == (char *)&dword_4 + 2
    || (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v21, "container"), "orderedSlides"), "objectAtIndex:", 1), "asset"), "path"), "isEqualToString:", v16) & 1) == 0)
  {
    if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v21, "container"), "orderedSlides"), "objectAtIndex:", 0), "asset"), "path"), "isEqualToString:", v16))
    {
      CFStringRef v31 = @"image0";
LABEL_46:
      int v8 = v38;
      goto LABEL_48;
    }
    goto LABEL_40;
  }
  int v8 = v38;
  CFStringRef v31 = @"image1";
LABEL_48:
  double v32 = 0.0;
  id v5 = v39;
  [v39 jumpToSublayer:v21 atTime:0.0];
  id v4 = v41;
  [(MRRenderer *)v41 _r_prerenderWithPassParameters:&off_1BBCD0];
  [v21 interestingTimeForElement:v31];
  double v34 = v33;
  if (v8)
  {
    [(MRSlideInfo *)v7 time];
    double v32 = v35;
  }
  [v39 jumpToSublayer:v21 atTime:v34 + v32];
  a3 = v40;
LABEL_51:
  double v36 = v4->mInternal->mSlideFocusState;
  if (v36)
  {
    [(MRSlideFocusState *)v36 setDelegate:v5];
    [(MRSlideFocusState *)v4->mInternal->mSlideFocusState setSlideID:v31];
    [v5 enterSlideFocusModeWithState:v4->mInternal->mSlideFocusState];
  }
  unsigned int v37 = objc_msgSend(objc_msgSend(a3, "objectForKey:", @"slideshowIsPlaying"), "BOOLValue");
  v4->_slideshowIsPaused = v37;
  if (v37) {
    [(MRRenderer *)v4 resumeSlideshow];
  }
  else {
    [(MRRenderer *)v4 pauseSlideshow];
  }
  if (objc_msgSend(objc_msgSend(a3, "objectForKey:", @"isPlaying"), "BOOLValue")) {
    [(MRRenderer *)v4 resume];
  }
  else {
    [(MRRenderer *)v4 pause];
  }
  [(MRRenderer *)v4 _r_render];
}

- (MCMontage)montage
{
  return self->mMontage;
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int)mode
{
  return self->mMode;
}

- (BOOL)isEditing
{
  return self->mIsEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->mIsEditing = a3;
}

- (BOOL)pushRendering
{
  return self->mPushRendering;
}

- (void)setPushRendering:(BOOL)a3
{
  self->mPushRendering = a3;
}

- (BOOL)requestRenderingOnChanges
{
  return self->mRequestRenderingOnChanges;
}

- (void)setRequestRenderingOnChanges:(BOOL)a3
{
  self->mRequestRenderingOnChanges = a3;
}

- (BOOL)displaysFPS
{
  return self->mDisplaysFPS;
}

- (BOOL)displaysPlayingIDs
{
  return self->mDisplaysPlayingIDs;
}

- (void)setDisplaysPlayingIDs:(BOOL)a3
{
  self->mDisplaysPlayingIDs = a3;
}

- (BOOL)displaysIsPreloadingImages
{
  return self->mDisplaysIsPreloadingImages;
}

- (void)setDisplaysIsPreloadingImages:(BOOL)a3
{
  self->mDisplaysIsPreloadingImages = a3;
}

- (BOOL)displaysTouchVisualFeedback
{
  return self->mDisplaysTouchVisualFeedback;
}

- (void)setDisplaysTouchVisualFeedback:(BOOL)a3
{
  self->mDisplaysTouchVisualFeedback = a3;
}

- (BOOL)displaysHitZonesVisualFeedback
{
  return self->mDisplaysHitZonesVisualFeedback;
}

- (void)setDisplaysHitZonesVisualFeedback:(BOOL)a3
{
  self->mDisplaysHitZonesVisualFeedback = a3;
}

- (float)volume
{
  return self->mVolume;
}

- (void)setVolume:(float)a3
{
  self->mVolume = a3;
}

- (BOOL)ignoresBackgroundAudio
{
  return self->_ignoresBackgroundAudio;
}

- (void)setIgnoresBackgroundAudio:(BOOL)a3
{
  self->_ignoresBackgroundAudio = a3;
}

- (double)timeQuantum
{
  return self->mTimeQuantum;
}

- (NSDictionary)parameters
{
  return self->mParameters;
}

- (BOOL)isCleanedUp
{
  return self->mIsCleanedUp;
}

- (BOOL)asynchronousOperationsAreSuspended
{
  return self->_asynchronousOperationsAreSuspended;
}

- (void)suspendAsynchronousOperations:(BOOL)a3
{
  self->_BOOL asynchronousOperationsAreSuspended = a3;
}

- (BOOL)interactivityIsEnabled
{
  return self->_interactivityIsEnabled;
}

- (void)setInteractivityIsEnabled:(BOOL)a3
{
  self->_interactivityIsEnabled = a3;
}

- (MRCameraCaptureSession)cameraCaptureSession
{
  return self->_cameraCaptureSession;
}

- (BOOL)allowsThumbnails
{
  return self->_allowsThumbnails;
}

- (void)setAllowsThumbnails:(BOOL)a3
{
  self->_allowsThumbnails = a3;
}

- (double)fadeInStartTime
{
  return self->_fadeInStartTime;
}

- (void)setFadeInStartTime:(double)a3
{
  self->_fadeInStartTime = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_double fadeInDuration = a3;
}

- (double)fadeOutStartTime
{
  return self->_fadeOutStartTime;
}

- (void)setFadeOutStartTime:(double)a3
{
  self->_double fadeOutStartTime = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_fadeOutDuration = a3;
}

- (BOOL)logRenderingTimes
{
  return self->_logRenderingTimes;
}

- (void)setLogRenderingTimes:(BOOL)a3
{
  self->_logRenderingTimes = a3;
}

- (NSString)renderingLogFilePath
{
  return self->_renderingLogFilePath;
}

- (double)timestampOfLastRenderPass
{
  return self->_timestampOfLastRenderPass;
}

- (void)setTimestampOfLastRenderPass:(double)a3
{
  self->_timestampOfLastRenderPass = a3;
}

- (double)interactiveTransitionTrackingBoxRadius
{
  return self->_interactiveTransitionTrackingBoxRadius;
}

- (void)setInteractiveTransitionTrackingBoxRadius:(double)a3
{
  self->_interactiveTransitionTrackingBoxRadius = a3;
}

- (double)interactiveTransitionProgressThreshold
{
  return self->_interactiveTransitionProgressThreshold;
}

- (void)setInteractiveTransitionProgressThreshold:(double)a3
{
  self->_interactiveTransitionProgressThreshold = a3;
}

- (double)interactiveTransitionVelocityThreshold
{
  return self->_interactiveTransitionVelocityThreshold;
}

- (void)setInteractiveTransitionVelocityThreshold:(double)a3
{
  self->_interactiveTransitionVelocityThreshold = a3;
}

- (void)_displayFPS:(double)a3 actuallyDisplay:(BOOL)a4
{
  if (a4)
  {
    id v6 = +[EAGLContext currentContext];
    uint64_t v7 = v6;
    if (v6 != [(MRContext *)self->mInternal->mContext glContext]) {
      +[EAGLContext setCurrentContext:[(MRContext *)self->mInternal->mContext glContext]];
    }
    double width = self->mSize.width;
    float v9 = self->mSize.height / width;
    float v10 = round(64.0 / (a3 - self->mInternal->mFrameTime[self->mInternal->mFrameTimeIndex]));
    double v11 = (float)-v9;
    float v12 = v11 * 0.95;
    float v13 = 4.0 / width + v12;
    float v14 = v10 / 30.0;
    v56[0] = -1082130432;
    *(float *)&v56[1] = v12;
    v56[2] = -1082130432;
    double v15 = (float)(v10 / 30.0);
    double v16 = v15 + -1.0;
    if (v15 >= 1.33333333) {
      double v16 = 0.333333333;
    }
    float v17 = v16;
    *(float *)&v56[3] = v13;
    *(float *)&v56[4] = v17;
    float v57 = v11 * 0.95;
    float v58 = v17;
    float v59 = v13;
    float v60 = v14 + -1.0;
    float v61 = v57;
    float v62 = v14 + -1.0;
    float v63 = v13;
    v43[0] = xmmword_1651B0;
    v43[1] = xmmword_1651B0;
    int v44 = 1065353216;
    float v18 = fmin(v15 * 0.75, 1.0);
    float v45 = v18;
    uint64_t v46 = 0x3F80000000000000;
    int v47 = 1065353216;
    float v48 = v18;
    uint64_t v49 = 0x3F80000000000000;
    float v19 = 2.0 - v15 * 0.75;
    float v50 = v19;
    uint64_t v51 = 1065353216;
    int v52 = 1065353216;
    float v53 = v19;
    uint64_t v54 = 1065353216;
    int v55 = 1065353216;
    unint64_t v27 = 0;
    unint64_t v28 = 0;
    getMem(&v28, &v27);
    float v20 = ((double)v27 + (double)v27) / (float)v28;
    double v21 = 4.0 / self->mSize.width;
    float v22 = v21 + v11;
    *(float *)&double v21 = v21 + v22;
    v42[0] = -1082130432;
    *(float *)&v42[1] = v22;
    v42[2] = -1082130432;
    double v23 = fmin(v20, 1.0);
    float v24 = v23 + -1.0;
    v42[3] = LODWORD(v21);
    *(float *)&v42[4] = v24;
    *(float *)&v42[5] = v22;
    *(float *)&v42[6] = v24;
    v42[7] = LODWORD(v21);
    *(float *)&v42[8] = v20 + -1.0;
    *(float *)&v42[9] = v22;
    *(float *)&v42[10] = v20 + -1.0;
    v42[11] = LODWORD(v21);
    v29[0] = xmmword_1651B0;
    v29[1] = xmmword_1651B0;
    int v30 = 1065353216;
    *(float *)&double v21 = v23;
    int v31 = LODWORD(v21);
    uint64_t v32 = 0x3F80000000000000;
    int v33 = 1065353216;
    int v34 = LODWORD(v21);
    uint64_t v35 = 0x3F80000000000000;
    float v36 = 2.0 - v20;
    uint64_t v37 = 1065353216;
    int v38 = 1065353216;
    float v39 = 2.0 - v20;
    uint64_t v40 = 1065353216;
    int v41 = 1065353216;
    [(MRContext *)self->mInternal->mContext setShader:@"PerVertexColor"];
    [(MRContext *)self->mInternal->mContext setColorsPointer:v43];
    [(MRContext *)self->mInternal->mContext setVertex2DPointer:v56];
    if (v14 <= 1.0) {
      uint64_t v25 = 4;
    }
    else {
      uint64_t v25 = 6;
    }
    -[MRContext drawTriangleStripFromOffset:count:](self->mInternal->mContext, "drawTriangleStripFromOffset:count:", 0, v25, 1065353216, 0x3F80000000000000);
    [(MRContext *)self->mInternal->mContext setColorsPointer:v29];
    [(MRContext *)self->mInternal->mContext setVertex2DPointer:v42];
    if (v20 <= 1.0) {
      uint64_t v26 = 4;
    }
    else {
      uint64_t v26 = 6;
    }
    [(MRContext *)self->mInternal->mContext drawTriangleStripFromOffset:0 count:v26];
    [(MRContext *)self->mInternal->mContext unsetVertexPointer];
    [(MRContext *)self->mInternal->mContext unsetColorsPointer];
    [(MRContext *)self->mInternal->mContext unsetShader];
    if (+[EAGLContext currentContext] != v6) {
      +[EAGLContext setCurrentContext:v6];
    }
  }
  self->mInternal->mFrameTime[self->mInternal->mFrameTimeIndex] = a3;
  self->mInternal->mFrameTimeIndedouble x = (self->mInternal->mFrameTimeIndex + 1) & 0x3F;
}

- (void)_displayPlayingIDs
{
  mInternal = self->mInternal;
  mCurrentIDs = mInternal->mCurrentIDs;
  if (mCurrentIDs != mInternal->mPreviousCurrentIDs)
  {
    unsigned __int8 v5 = -[NSString isEqualToString:](mCurrentIDs, "isEqualToString:");
    mInternal = self->mInternal;
    if ((v5 & 1) == 0)
    {
      [(MRImage *)mInternal->mCurrentIDsImage releaseByUser];
      self->mInternal->mCurrentIDsImage = 0;
      id v6 = self->mInternal;
      if (v6->mCurrentIDs)
      {
        uint64_t v7 = +[MRUtilities newColorSpaceForDevice];
        *(_OWORD *)components = xmmword_1651F0;
        long long v21 = unk_165200;
        int v8 = CGColorCreate(v7, components);
        CGColorSpaceRelease(v7);
        id v9 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", self->mInternal->mCurrentIDs, +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v8, kCTForegroundColorAttributeName, 0));
        CGColorRelease(v8);
        float v10 = -[MRTextRenderer initWithText:resolution:]([MRTextRenderer alloc], "initWithText:resolution:", v9, self->mSize.width, self->mSize.height * 0.0799999982);
        double v11 = [(MRTextRenderer *)v10 retainedContext];
        if (v11)
        {
          float v12 = v11;
          self->mInternal->mCurrentIDsImage = (MRImage *)[(MRImageManager *)[(MRContext *)self->mInternal->mContext imageManager] retainedByUserImageWithCGContext:v11];
          [(MRImage *)self->mInternal->mCurrentIDsImage setLabel:@"Marimba DisplayedIDs"];
          CGContextRelease(v12);
        }

        id v6 = self->mInternal;
      }

      self->mInternal->mPreviousCurrentIDs = self->mInternal->mCurrentIDs;
      mInternal = self->mInternal;
    }
  }

  self->mInternal->mCurrentIDs = 0;
  float v13 = self->mInternal;
  if (v13->mCurrentIDsImage)
  {
    [(MRContext *)v13->mContext setShader:@"PlainTexture"];
    [(MRImage *)self->mInternal->mCurrentIDsImage width];
    double v14 = 0.0799999982;
    double v16 = v15 * 0.0799999982;
    [(MRImage *)self->mInternal->mCurrentIDsImage height];
    double v18 = v16 / v17 * self->mSize.height / self->mSize.width;
    double v19 = 2.0;
    if (v18 <= 2.0) {
      double v19 = v18;
    }
    else {
      double v14 = 2.0 / v18 * 0.0799999982;
    }
    +[MRCroppingSprite renderImage:inContext:atPosition:andSize:](MRCroppingSprite, "renderImage:inContext:atPosition:andSize:", self->mInternal->mCurrentIDsImage, self->mInternal->mContext, v19 * 0.5 + -1.0, v14 * 0.5 + -1.0, v19, v14);
    [(MRContext *)self->mInternal->mContext unsetShader];
  }
}

- (void)_displayIsPreloadingImages
{
  id v3 = +[EAGLContext currentContext];
  id v4 = v3;
  if (v3 != [(MRContext *)self->mInternal->mContext glContext]) {
    +[EAGLContext setCurrentContext:[(MRContext *)self->mInternal->mContext glContext]];
  }
  [(MRContext *)self->mInternal->mContext setShader:@"PlainColor"];
  [(MRContext *)self->mInternal->mContext aspectRatio];
  v30[0] = 1064849900;
  double v6 = (float)(1.0 / v5);
  float v7 = v6 * -0.96;
  *(float *)&v30[1] = v7;
  v30[2] = 1064849900;
  *(float *)&double v6 = v6 * -0.99;
  v30[3] = LODWORD(v6);
  v30[4] = 1065185444;
  *(float *)&void v30[5] = v7;
  v30[6] = 1065185444;
  v30[7] = LODWORD(v6);
  [(MRContext *)self->mInternal->mContext setVertex2DPointer:v30];
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 1.0;
  [(MRContext *)self->mInternal->mContext setForeColorRed:v29 green:0.0 blue:v8 alpha:v9 saveTo:v10];
  *(_OWORD *)unint64_t v28 = 0u;
  memset(v27, 0, sizeof(v27));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  -[MRContext setModelViewMatrix:saveTo:](self->mInternal->mContext, "setModelViewMatrix:saveTo:", v27, &v23, MRMatrix_Clear((uint64_t)v27));
  mInternal = self->mInternal;
  if (mInternal->mIsStalled)
  {
    -[MRContext drawTriangleStripFromOffset:count:](mInternal->mContext, "drawTriangleStripFromOffset:count:", 0, 4, v23, v24, v25, v26);
    mInternal = self->mInternal;
  }
  float v12 = v28[0] + -0.03;
  v28[0] = v12;
  [(MRContext *)mInternal->mContext setModelViewMatrix:v27 saveTo:&v23];
  if ([(NSOperationQueue *)[(MRRenderArguments *)self->mInternal->mRenderArguments preloadQueue] isSuspended])
  {
    LODWORD(v13) = 1.0;
    LODWORD(v14) = 1.0;
    LODWORD(v16) = 1.0;
    [(MRContext *)self->mInternal->mContext setForeColorRed:0 green:v13 blue:v14 alpha:0.0 saveTo:v16];
    [(MRContext *)self->mInternal->mContext drawTriangleStripFromOffset:0 count:4];
  }
  double v17 = v28[0] + -0.03;
  *(float *)&double v17 = v17;
  v28[0] = *(float *)&v17;
  LODWORD(v17) = 1.0;
  LODWORD(v15) = 1.0;
  LODWORD(v16) = 1.0;
  -[MRContext setForeColorRed:green:blue:alpha:saveTo:](self->mInternal->mContext, "setForeColorRed:green:blue:alpha:saveTo:", 0, v17, 0.0, v15, v16, v23, v24, v25, v26);
  double v18 = self->mInternal;
  unint64_t mCountOfPreloadingImages = v18->mCountOfPreloadingImages;
  if (mCountOfPreloadingImages >= 0xA) {
    unint64_t mCountOfPreloadingImages = 10;
  }
  if (mCountOfPreloadingImages)
  {
    unint64_t v20 = 0;
    do
    {
      [(MRContext *)v18->mContext setModelViewMatrix:v27 saveTo:0];
      [(MRContext *)self->mInternal->mContext drawTriangleStripFromOffset:0 count:4];
      float v21 = v28[0] + -0.03;
      v28[0] = v21;
      ++v20;
      double v18 = self->mInternal;
      unint64_t v22 = v18->mCountOfPreloadingImages;
      if (v22 >= 0xA) {
        unint64_t v22 = 10;
      }
    }
    while (v20 < v22);
  }
  [(MRContext *)v18->mContext restoreModelViewMatrix:&v23];
  [(MRContext *)self->mInternal->mContext restoreForeColor:v29];
  [(MRContext *)self->mInternal->mContext unsetVertexPointer];
  [(MRContext *)self->mInternal->mContext unsetShader];
  if (+[EAGLContext currentContext] != v3) {
    +[EAGLContext setCurrentContext:v3];
  }
}

- (void)_displayTouchVisualFeedback
{
  if ([(NSMutableArray *)self->mInternal->mTouchesForVisualFeedback count])
  {
    double v46 = MRGetCurrentTime();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    mTouchesForVisualFeedback = self->mInternal->mTouchesForVisualFeedback;
    id v4 = 0;
    id v5 = [(NSMutableArray *)mTouchesForVisualFeedback countByEnumeratingWithState:&v51 objects:v60 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v52;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v52 != v6) {
            objc_enumerationMutation(mTouchesForVisualFeedback);
          }
          double v8 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if ([v8 phase] >= 3)
          {
            [v8 timestamp];
            if (v9 <= v46 + -0.5)
            {
              if (!v4) {
                id v4 = objc_alloc_init((Class)NSMutableArray);
              }
              [v4 addObject:v8];
            }
          }
        }
        id v5 = [(NSMutableArray *)mTouchesForVisualFeedback countByEnumeratingWithState:&v51 objects:v60 count:16];
      }
      while (v5);
    }
    double v10 = self->mInternal->mTouchesForVisualFeedback;
    objc_sync_enter(v10);
    [(NSMutableArray *)self->mInternal->mTouchesForVisualFeedback removeObjectsInArray:v4];

    if (self->mInternal->mTouchesForVisualFeedback)
    {
      double v11 = +[EAGLContext currentContext];
      float v12 = v11;
      if (v11 != [(MRContext *)self->mInternal->mContext glContext]) {
        +[EAGLContext setCurrentContext:[(MRContext *)self->mInternal->mContext glContext]];
      }
      [(MRContext *)self->mInternal->mContext setShader:@"PlainColor"];
      LODWORD(v13) = 0.75;
      LODWORD(v14) = 1.0;
      LODWORD(v15) = 1.0;
      LODWORD(v16) = 1055286886;
      [(MRContext *)self->mInternal->mContext setForeColorRed:v59 green:v16 blue:v13 alpha:v14 saveTo:v15];
      memset(v58, 0, sizeof(v58));
      memset(v57, 0, sizeof(v57));
      -[MRContext setModelViewMatrix:saveTo:](self->mInternal->mContext, "setModelViewMatrix:saveTo:", v58, v57, MRMatrix_Clear((uint64_t)v58));
      [(MRContext *)self->mInternal->mContext blend:3];
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      double v17 = self->mInternal->mTouchesForVisualFeedback;
      id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v48;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(void *)v48 != v19) {
              objc_enumerationMutation(v17);
            }
            float v21 = *(void **)(*((void *)&v47 + 1) + 8 * (void)j);
            unsigned int v22 = [v21 phase];
            mInternal = self->mInternal;
            mContext = mInternal->mContext;
            if (v22 > 2)
            {
              [v21 timestamp];
              double v30 = v29 + 0.5 - v46;
              *(float *)&double v31 = v30;
              LODWORD(v32) = 1.0;
              LODWORD(v30) = 1055286886;
              [(MRContext *)mContext setForeColorRed:0 green:v30 blue:COERCE_DOUBLE(__PAIR64__(HIDWORD(v46), 0.75)) alpha:v32 saveTo:v31];
            }
            else
            {
              LODWORD(v24) = 0.75;
              LODWORD(v25) = 1.0;
              LODWORD(v26) = 1.0;
              LODWORD(v23) = 1055286886;
              [(MRContext *)mInternal->mContext setForeColorRed:v59 green:v23 blue:v24 alpha:v25 saveTo:v26];
            }
            [v21 location];
            double v34 = v33;
            double width = self->mSize.width;
            [v21 location];
            double v36 = -(width - v34 * 2.0) / width;
            CGFloat v38 = -(self->mSize.height - v37 * 2.0) / self->mSize.width;
            float v39 = v36;
            float v40 = v38;
            *(float *)int v55 = v39;
            *(float *)&v55[1] = v40;
            float v41 = v36 + -0.05;
            *(float *)&v55[2] = v41;
            *(float *)&v55[3] = v40;
            float v42 = v36 + -0.033;
            float v43 = v38 + 0.033;
            *(float *)&v55[4] = v42;
            *(float *)&v55[5] = v43;
            float v44 = v38 + 0.05;
            *(float *)&v55[6] = v39;
            *(float *)&v55[7] = v44;
            float v45 = v36 + 0.033;
            *(float *)&v55[8] = v45;
            *(float *)&v55[9] = v43;
            *(float *)&double v36 = v36 + 0.05;
            v55[10] = LODWORD(v36);
            *(float *)&v55[11] = v40;
            *(float *)&double v36 = v38 + -0.033;
            *(float *)&v55[12] = v45;
            v55[13] = LODWORD(v36);
            *(float *)&CGFloat v38 = v38 + -0.05;
            *(float *)&v55[14] = v39;
            v55[15] = LODWORD(v38);
            *(float *)&v55[16] = v42;
            v55[17] = LODWORD(v36);
            *(float *)&v55[18] = v41;
            *(float *)&v55[19] = v40;
            [(MRContext *)self->mInternal->mContext setVertex2DPointer:v55];
            [(MRContext *)self->mInternal->mContext drawTriangleFanFromOffset:0 count:10];
            [(MRContext *)self->mInternal->mContext unsetVertexPointer];
          }
          id v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v47 objects:v56 count:16];
        }
        while (v18);
      }
      [(MRContext *)self->mInternal->mContext blend:0];
      [(MRContext *)self->mInternal->mContext restoreModelViewMatrix:v57];
      [(MRContext *)self->mInternal->mContext restoreForeColor:v59];
      [(MRContext *)self->mInternal->mContext unsetShader];
      if (+[EAGLContext currentContext] != v11) {
        +[EAGLContext setCurrentContext:v11];
      }
    }
    objc_sync_exit(v10);
  }
}

- (void)_displayHitZonesVisualFeedback
{
  if ([(NSMutableArray *)self->mInternal->mHitZonesForVisualFeedback count])
  {
    double v3 = MRGetCurrentTime();
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    mHitZonesForVisualFeedback = self->mInternal->mHitZonesForVisualFeedback;
    id v5 = 0;
    id v6 = [(NSMutableArray *)mHitZonesForVisualFeedback countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v40;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v40 != v7) {
            objc_enumerationMutation(mHitZonesForVisualFeedback);
          }
          double v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v9 hasEnded])
          {
            [v9 timestamp];
            if (v10 <= v3 + -0.5)
            {
              if (!v5) {
                id v5 = objc_alloc_init((Class)NSMutableArray);
              }
              [v5 addObject:v9];
            }
          }
        }
        id v6 = [(NSMutableArray *)mHitZonesForVisualFeedback countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v6);
    }
    double v11 = self->mInternal->mHitZonesForVisualFeedback;
    objc_sync_enter(v11);
    [(NSMutableArray *)self->mInternal->mHitZonesForVisualFeedback removeObjectsInArray:v5];

    if ([(NSMutableArray *)self->mInternal->mHitZonesForVisualFeedback count])
    {
      float v12 = +[EAGLContext currentContext];
      double v13 = v12;
      if (v12 != [(MRContext *)self->mInternal->mContext glContext]) {
        +[EAGLContext setCurrentContext:[(MRContext *)self->mInternal->mContext glContext]];
      }
      [(MRContext *)self->mInternal->mContext setShader:@"PlainColor"];
      LODWORD(v14) = 0.75;
      LODWORD(v15) = 1.0;
      LODWORD(v16) = 1.0;
      LODWORD(v17) = 1055286886;
      [(MRContext *)self->mInternal->mContext setForeColorRed:v46 green:v17 blue:v14 alpha:v15 saveTo:v16];
      memset(v45, 0, sizeof(v45));
      memset(v44, 0, sizeof(v44));
      -[MRContext setModelViewMatrix:saveTo:](self->mInternal->mContext, "setModelViewMatrix:saveTo:", v45, v44, MRMatrix_Clear((uint64_t)v45));
      [(MRContext *)self->mInternal->mContext blend:3];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v18 = self->mInternal->mHitZonesForVisualFeedback;
      id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v36;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(void *)v36 != v20) {
              objc_enumerationMutation(v18);
            }
            unsigned int v22 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
            unsigned __int8 v23 = [v22 hasEnded];
            mInternal = self->mInternal;
            mContext = mInternal->mContext;
            if (v23)
            {
              [v22 timestamp];
              double v31 = v30 + 0.5 - v3;
              *(float *)&double v32 = v31;
              LODWORD(v33) = 0.75;
              LODWORD(v34) = 1.0;
              LODWORD(v31) = 1055286886;
              [(MRContext *)mContext setForeColorRed:0 green:v31 blue:v33 alpha:v34 saveTo:v32];
            }
            else
            {
              LODWORD(v25) = 0.75;
              LODWORD(v26) = 1.0;
              LODWORD(v27) = 1.0;
              LODWORD(v24) = 1055286886;
              [(MRContext *)mInternal->mContext setForeColorRed:v46 green:v24 blue:v25 alpha:v26 saveTo:v27];
            }
            -[MRContext setVertex2DPointer:](self->mInternal->mContext, "setVertex2DPointer:", [v22 vertices]);
            -[MRContext drawTriangleStripFromOffset:count:](self->mInternal->mContext, "drawTriangleStripFromOffset:count:", 0, [v22 countOfVertices]);
            [(MRContext *)self->mInternal->mContext unsetVertexPointer];
          }
          id v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
        }
        while (v19);
      }
      [(MRContext *)self->mInternal->mContext blend:0];
      [(MRContext *)self->mInternal->mContext restoreModelViewMatrix:v44];
      [(MRContext *)self->mInternal->mContext restoreForeColor:v46];
      [(MRContext *)self->mInternal->mContext unsetShader];
      if (+[EAGLContext currentContext] != v12) {
        +[EAGLContext setCurrentContext:v12];
      }
    }
    objc_sync_exit(v11);
  }
}

- (MRContext)context
{
  return self->mInternal->mContext;
}

- (double)masterClock
{
  double result = self->mInternal->mMasterClock;
  if (result < 0.0)
  {
    double result = self->mDisplayLinkTimestamp;
    if (result < 0.0) {
      return MRGetCurrentTime();
    }
  }
  return result;
}

- (void)setMasterClock:(double)a3
{
  self->mInternal->mMasterClock = a3;
}

- (void)setFreezeSizeOfImageRequests:(BOOL)a3
{
}

- (BOOL)isFlipped
{
  id v2 = [(NSDictionary *)self->mParameters objectForKey:@"flipped"];
  return [v2 BOOLValue];
}

- (void)selectLayer:(id)a3
{
  -[NSMutableArray addObject:](self->mInternal->mSelectedLayers, "addObject:");
  [a3 setIsSelected:1];
  [(MRRenderer *)self _updateSelectionLayer];
}

- (void)deselectLayer:(id)a3
{
  -[NSMutableArray removeObject:](self->mInternal->mSelectedLayers, "removeObject:");
  [a3 setIsSelected:0];
  if (self->mInternal->mLayerCurrentlyTextEditing == a3) {
    [(MRRenderer *)self endTextEditing:1];
  }
  [(MRRenderer *)self _updateSelectionLayer];
}

- (void)deselectAllLayers
{
  [(MRRenderer *)self endTextEditing:1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  mSelectedLayers = self->mInternal->mSelectedLayers;
  id v4 = [(NSMutableArray *)mSelectedLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mSelectedLayers);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * i) setIsSelected:0];
      }
      id v5 = [(NSMutableArray *)mSelectedLayers countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  [(NSMutableArray *)self->mInternal->mSelectedLayers removeAllObjects];
  [(MRRenderer *)self _updateSelectionLayer];
}

- (id)selectedLayers
{
  return self->mInternal->mSelectedLayers;
}

- (void)_dimLayersExceptForPathTo:(id)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_534FC;
  v4[4] = sub_5350C;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_53518;
  v3[3] = &unk_1AAC90;
  v3[4] = a3;
  void v3[5] = self;
  v3[6] = v4;
  void v4[5] = v3;
  sub_53518((uint64_t)v3, self->mTopMRLayer);
  _Block_object_dispose(v4, 8);
}

- (void)_undimAllLayersInLayer:(id)a3
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3052000000;
  v4[3] = sub_534FC;
  v4[4] = sub_5350C;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_53780;
  v3[3] = &unk_1AACB8;
  v3[4] = v4;
  void v4[5] = v3;
  sub_53780((uint64_t)v3, a3);
  _Block_object_dispose(v4, 8);
}

- (void)dimLayersExceptForPathTo:(id)a3
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_53938;
  v5[3] = &unk_1AAB00;
  v5[4] = self;
  void v5[5] = a3;
  dispatch_async(mRenderDispatchQueue, v5);
  [(MRRenderer *)self requestRendering:0];
}

- (void)undimAllLayers
{
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_539E0;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_async(mRenderDispatchQueue, block);
  [(MRRenderer *)self requestRendering:0];
}

- (id)layerAtPath:(id)a3 fromLayer:(id)a4
{
  id v5 = [a3 componentsSeparatedByString:@"."];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          break;
        }
      }
      a4 = [a4 sublayerForKey:v10];
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        return a4;
      }
    }
  }
  return a4;
}

- (CGImage)snapshotAsCGImageForTime:(double)a3 andSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v9 = [objc_alloc((Class)EAGLContext) initWithAPI:2];
  if (!v9)
  {
    return 0;
  }
  uint64_t v10 = v9;
  id v11 = [[MRTexture alloc] initFBOWithSize:width | ((unint64_t)height << 32) inGLContext:v9 options:0];
  [v11 setLabel:@"Marimba Snapshot"];
  long long v12 = [[MRRenderer alloc] initWithParameters:+[NSDictionary dictionaryWithObjectsAndKeys:@"readonly", &__kCFBooleanTrue, @"noAudio", 0]];
  [(MRRenderer *)v12 setAssetManagementDelegate:[(MRRenderer *)self assetManagementDelegate]];
  -[MRRenderer setEAGLContext:](v12, "setEAGLContext:", [v11 glContext]);
  [(MRContext *)[(MRRenderer *)v12 context] setIsFlipped:1];
  [(MRRenderer *)v12 setTimeQuantum:self->mTimeQuantum];
  [(MRRenderer *)v12 setMode:1];
  [(MRRenderer *)v12 setMontage:self->mMontage];
  [(MRRenderer *)v12 setTime:a3];
  -[MRRenderer setSize:](v12, "setSize:", width, height);
  [(MRRenderer *)v12 requestRendering:1];
  [(MRRenderer *)v12 cleanup];

  long long v13 = +[EAGLContext currentContext];
  long long v14 = v13;
  if (v13 != [v11 glContext]) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:", [v11 glContext]);
  }
  long long v15 = malloc_type_malloc((unint64_t)(height * (width * 4.0)), 0x4F6B816BuLL);
  glPixelStorei(0xD05u, 1);
  glReadPixels(0, 0, (int)width, (int)height, 0x1908u, 0x1401u, v15);
  glFinish();
  if (+[EAGLContext currentContext] != v13) {
    +[EAGLContext setCurrentContext:v13];
  }

  double v16 = CGDataProviderCreateWithData(0, v15, (unint64_t)(height * (width * 4.0)), (CGDataProviderReleaseDataCallback)MyCGImageBufferReleaseCallback);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CGImageRef v18 = CGImageCreate((unint64_t)width, (unint64_t)height, 8uLL, 0x20uLL, (unint64_t)(width * 4.0), DeviceRGB, 1u, v16, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v16);
  CGColorSpaceRelease(DeviceRGB);

  if (!v18) {
    return 0;
  }
  return v18;
}

- (CGImage)currentFrameAsCGImage
{
  double v3 = +[NSDate dateWithTimeIntervalSinceNow:10.0];
  if (![(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock lockBeforeDate:v3]) {
    return 0;
  }
  [(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock unlockWithCondition:1];
  [(MRRenderer *)self requestRendering:1];
  unsigned int v4 = [(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock lockWhenCondition:0 beforeDate:v3];
  mSnapshotAsCGImage = 0;
  if (v4)
  {
    mSnapshotAsCGImage = self->mInternal->mSnapshotAsCGImage;
    id v6 = mSnapshotAsCGImage;
    self->mInternal->mSnapshotAsCGImage = 0;
    [(NSConditionLock *)self->mInternal->mSnapshotAsCGImageLock unlock];
  }
  return mSnapshotAsCGImage;
}

- (void)setMasterStartTime:(double)a3 andDuration:(double)a4 mode:(int)a5
{
  self->mInternal->double mMasterStartTime = a3;
  self->mInternal->long double mMasterDuration = a4;
  self->mInternal->mMasterMode = a5;
}

- (MRLiveSlideshowDelegate)liveSlideshowDelegate
{
  return self->mInternal->mLiveSlideshowDelegate;
}

- (void)setLiveSlideshowDelegate:(id)a3
{
  mInternal = self->mInternal;
  if (mInternal->mLiveSlideshowDelegate != a3) {
    mInternal->mLiveSlideshowDelegate = (MRLiveSlideshowDelegate *)a3;
  }
}

- (MRAsynchronousOperationsDelegate)asynchronousOperationsDelegate
{
  return self->mInternal->mAsynchronousOperationsDelegate;
}

- (void)setAsynchronousOperationsDelegate:(id)a3
{
  mInternal = self->mInternal;
  if (mInternal->mAsynchronousOperationsDelegate != a3) {
    mInternal->mAsynchronousOperationsDelegate = (MRAsynchronousOperationsDelegate *)a3;
  }
}

- (BOOL)screenBurnTest
{
  return self->mInternal->mScreenBurnTest;
}

- (void)setScreenBurnTest:(BOOL)a3
{
  mInternal = self->mInternal;
  if (mInternal->mScreenBurnTest != a3)
  {
    mRenderDispatchQueue = mInternal->mRenderDispatchQueue;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_53FF4;
    v5[3] = &unk_1AA720;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(mRenderDispatchQueue, v5);
  }
}

- (BOOL)hideTextWhileEditing
{
  return self->mInternal->mHideTextWhileEditing;
}

- (void)setHideTextWhileEditing:(BOOL)a3
{
  self->mInternal->mHideTextWhileEditing = a3;
}

- (void)setUseCGLFlushDrawableWorkaround:(BOOL)a3
{
}

- (void)_createSlideFocusLayer
{
  double v3 = [[MRLayerParallelizer alloc] initWithParameters:self->mParameters];
  self->mInternal->mSlideFocusLayer = v3;
  double v4 = self->_slideFocusModeBackgroundColor[0];
  *(float *)&double v4 = v4;
  [(MRLayerParallelizer *)v3 setBackgroundColorRed:v4 green:self->_slideFocusModeBackgroundColor[1] blue:self->_slideFocusModeBackgroundColor[2] alpha:self->_slideFocusModeBackgroundColor[3]];
  [(MRLayerParallelizer *)self->mTopMRLayer setSublayer:v3 forKey:@"SlideFocusLayer"];
  [(MRLayer *)v3 setZIndex:32000];
  [(MRLayer *)v3 setPhaseInDuration:0.5];
  [(MRLayer *)v3 setPhaseOutDuration:0.5];
  id v5 = [[MRLayerNavigator alloc] initWithParameters:self->mParameters];
  self->mInternal->mSlideFocusNavigator = v5;
  [(MRLayerParallelizer *)v3 setSublayer:v5 forKey:@"SlideFocusNavigator"];
  BOOL v6 = [[MRLayerEffect alloc] initWithEffectID:@"JustASlide" andParameters:self->mParameters];
  [(MREffect *)[(MRLayerEffect *)v6 effect] setIsFocuser:1];
  self->mInternal->mSlideFocuser[0] = v6;
  [(MRLayerEffect *)v6 setKenBurnsType:0 ofSlide:@"image0"];
  [(MRLayerNavigator *)v5 setSublayer:v6 forKey:@"SlideFocuser0"];
  id v7 = +[MCTransitionTrigger transitionForTargetPlugObjectID:0 withTransitionID:@"Push"];
  [v7 setTransitionDestinationPlugID:@"SlideFocuser0"];
  [v7 setTransitionDuration:0.5];
  [v7 setTransitionAttributes:&off_1BBCF8];
  uint64_t v8 = [[MRLayerEffect alloc] initWithEffectID:@"JustASlide" andParameters:self->mParameters];
  [(MREffect *)[(MRLayerEffect *)v8 effect] setIsFocuser:1];
  self->mInternal->mSlideFocuser[1] = v8;
  [(MRLayerEffect *)v8 setKenBurnsType:0 ofSlide:@"image0"];
  [(MRLayerNavigator *)v5 setSublayer:v8 forKey:@"SlideFocuser1"];
  id v9 = +[MCTransitionTrigger transitionForTargetPlugObjectID:0 withTransitionID:@"Push"];
  [v9 setTransitionDestinationPlugID:@"SlideFocuser1"];
  [v9 setTransitionDuration:0.5];
  [v9 setTransitionAttributes:&off_1BBD20];
  uint64_t v10 = [[MRLayerEffect alloc] initWithEffectID:@"JustASlide" andParameters:self->mParameters];
  [(MREffect *)[(MRLayerEffect *)v10 effect] setIsFocuser:1];
  self->mInternal->mSlideFocuser[2] = v10;
  [(MRLayerEffect *)v10 setKenBurnsType:0 ofSlide:@"image0"];
  [(MRLayerNavigator *)v5 setSublayer:v10 forKey:@"SlideFocuser2"];
  id v11 = +[MCTransitionTrigger transitionForTargetPlugObjectID:0 withTransitionID:@"Push"];
  [v11 setTransitionDestinationPlugID:@"SlideFocuser2"];
  [v11 setTransitionDuration:0.5];
  [v11 setTransitionAttributes:&off_1BBD48];
  [(MRLayer *)v8 setNextTransition:v11];
  [(MRLayer *)v6 setPreviousTransition:v11];
  [(MRLayer *)v10 setNextTransition:v7];
  [(MRLayer *)v8 setPreviousTransition:v7];
  [(MRLayer *)v6 setNextTransition:v9];
  [(MRLayer *)v10 setPreviousTransition:v9];
}

- (double)enterSlideFocusModeWithState:(id)a3 animate:(BOOL)a4
{
  double v4 = 0.0;
  if (!self->mInternal->mSlideFocusState)
  {
    BOOL v5 = a4;
    if (objc_msgSend(objc_msgSend(a3, "delegate"), "enterSlideFocusModeWithState:", a3))
    {
      self->mInternal->mSlideFocusState = (MRSlideFocusState *)a3;
      mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
      if (!mSlideFocusLayer)
      {
        [(MRRenderer *)self _createSlideFocusLayer];
        mSlideFocusLayer = self->mInternal->mSlideFocusLayer;
      }
      [(MRLayer *)mSlideFocusLayer setIsTriggered:1];
      double v9 = self->mSize.height / self->mSize.width;
      uint64_t v10 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo];
      id v11 = [(MRSlideInfo *)v10 assetPath];
      double v12 = self->mSize.width / self->mSize.height;
      [(MRSlideInfo *)v10 aspectRatio];
      double v14 = v13;
      [(MRSlideInfo *)v10 center];
      double v16 = v15;
      double v18 = v17;
      [(MRSlideInfo *)v10 scale];
      double v20 = v19;
      double v21 = (1.0 - v16 / v19) * 0.5;
      double v22 = (1.0 - v14 / v12 * v18 / v19) * 0.5;
      [(MRSlideInfo *)v10 rotation];
      double v24 = v23;
      double v25 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
      -[MRLayerEffect setPixelSize:](v25, "setPixelSize:", self->mSize.width, self->mSize.height);
      [(MRLayerEffect *)v25 setAssetPath:v11 ofSlide:@"image0"];
      if ([(MZMediaManagement *)[(MRRenderer *)self assetManagementDelegate] isSupportedMovieForAssetAtPath:v11])[(MRLayerEffect *)v25 setPlayerHint:[(MRSlideInfo *)v10 player] ofSlide:@"image0"]; {
      [(MRLayerEffect *)v25 setCenter:@"image0", v21, v22 ofSlide];
      }
      [(MRLayerEffect *)v25 setScale:@"image0" ofSlide:v20];
      [(MRSlideInfo *)v10 aspectRatio];
      [(MRLayerEffect *)v25 setMaxScale:@"image0" ofSlide:fmax(v9 * (v26 + v26), 2.0)];
      [(MRLayerEffect *)v25 setRotation:@"image0" ofSlide:v24];
      double v27 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState previousSlideInfo];
      unint64_t v28 = self->mInternal->mSlideFocuser[(self->mInternal->mCurrentSlideFocuserIndex + 2) % 3];
      -[MRLayerEffect setPixelSize:](v28, "setPixelSize:", self->mSize.width, self->mSize.height);
      [(MRLayerEffect *)v28 setAssetPath:[(MRSlideInfo *)v27 assetPath] ofSlide:@"image0"];
      if ([(MZMediaManagement *)[(MRRenderer *)self assetManagementDelegate] isSupportedMovieForAssetAtPath:[(MRSlideInfo *)v27 assetPath]])[(MRLayerEffect *)v28 setPlayerHint:[(MRSlideInfo *)v27 player] ofSlide:@"image0"]; {
      [(MRLayerEffect *)v28 setCenter:@"image0", 0.5, 0.5 ofSlide];
      }
      [(MRSlideInfo *)v27 aspectRatio];
      double v30 = v29 / v12;
      if (v30 > 1.0) {
        double v30 = 1.0;
      }
      [(MRLayerEffect *)v28 setScale:@"image0" ofSlide:v30];
      [(MRSlideInfo *)v27 aspectRatio];
      [(MRLayerEffect *)v28 setMaxScale:@"image0" ofSlide:fmax(v9 * (v31 + v31), 2.0)];
      [(MRLayerEffect *)v28 setRotation:@"image0" ofSlide:0.0];
      double v32 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState nextSlideInfo];
      double v33 = self->mInternal->mSlideFocuser[(self->mInternal->mCurrentSlideFocuserIndex + 1) % 3];
      -[MRLayerEffect setPixelSize:](v33, "setPixelSize:", self->mSize.width, self->mSize.height);
      [(MRLayerEffect *)v33 setAssetPath:[(MRSlideInfo *)v32 assetPath] ofSlide:@"image0"];
      if ([(MZMediaManagement *)[(MRRenderer *)self assetManagementDelegate] isSupportedMovieForAssetAtPath:[(MRSlideInfo *)v32 assetPath]])[(MRLayerEffect *)v33 setPlayerHint:[(MRSlideInfo *)v32 player] ofSlide:@"image0"]; {
      double v4 = 0.5;
      }
      [(MRLayerEffect *)v33 setCenter:@"image0", 0.5, 0.5 ofSlide];
      [(MRSlideInfo *)v32 aspectRatio];
      double v35 = v34 / v12;
      if (v35 > 1.0) {
        double v35 = 1.0;
      }
      [(MRLayerEffect *)v33 setScale:@"image0" ofSlide:v35];
      [(MRSlideInfo *)v32 aspectRatio];
      [(MRLayerEffect *)v33 setMaxScale:@"image0" ofSlide:fmax(v9 * (v36 + v36), 2.0)];
      [(MRLayerEffect *)v33 setRotation:@"image0" ofSlide:0.0];
      [(MRLayerParallelizer *)self->mTopMRLayer phaseInSublayerForKey:@"SlideFocusLayer"];
      [(MRLayer *)self->mInternal->mSlideFocusLayer setOpacity:0.001];
      if (v5) {
        [(MRRenderer *)self animateCurrentFocuserToSlideFocusModeWithDuration:0.5];
      }
      [(MRRenderer *)self sendNotification:kMRNotificationEnteredSlideFocusMode];
    }
  }
  return v4;
}

- (double)exitSlideFocusMode
{
  double v3 = self->mInternal->mSlideFocuser[self->mInternal->mCurrentSlideFocuserIndex];
  id v4 = [(MRLayerEffect *)v3 currentSlideInfoForElement:@"image0"];
  id v5 = [v4 player];
  if (v5 == [(MRSlideInfo *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo] player])
  {
    [v4 time];
    double v7 = v6;
    [(MRSlideInfo *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo] time];
    [(MRSlideInfo *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo] setTime:v7 - v8];
  }
  [(MRLayer *)[(MRSlideFocusState *)self->mInternal->mSlideFocusState delegate] exitSlideFocusModeWithState:self->mInternal->mSlideFocusState];
  double v9 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo];
  CGFloat v10 = self->mSize.width / self->mSize.height;
  [(MRSlideInfo *)v9 aspectRatio];
  double v12 = v11;
  [(MRSlideInfo *)v9 center];
  double v14 = v13;
  double v16 = v15;
  [(MRSlideInfo *)v9 scale];
  double v18 = v17;
  double v19 = v12 / v10 * v16;
  double v20 = (1.0 - v14 / v18) * 0.5;
  double v21 = (1.0 - v19 / v18) * 0.5;
  [(MRSlideInfo *)v9 rotation];
  double v23 = v22;
  [(MRLayerEffect *)v3 animateCenterOfSlide:@"image0", v20, v21, 0.5 to withDuration];
  [(MRLayerEffect *)v3 animateScaleOfSlide:@"image0" to:v18 withDuration:0.5];
  [(MRLayerEffect *)v3 animateRotationOfSlide:@"image0" to:v23 withDuration:0.5];
  [(MRLayer *)self->mInternal->mSlideFocusLayer animateOpacityTo:0.0 withDuration:0.5];
  [(MRLayerParallelizer *)self->mTopMRLayer phaseOutSublayerForKey:@"SlideFocusLayer"];
  dispatch_time_t v24 = dispatch_time(0, 550000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_54A64;
  block[3] = &unk_1AA6F8;
  block[4] = self;
  dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, block);
  [(MRRenderer *)self sendNotification:kMRNotificationExitedSlideFocusMode];

  self->mInternal->mSlideFocusState = 0;
  return 0.5;
}

- (double)enterSlideZoomMode
{
  return 0.0;
}

- (double)exitSlideZoomMode:(BOOL)a3
{
  BOOL v3 = a3;
  [(MRSlideFocusState *)self->mInternal->mSlideFocusState setIsInZoomMode:0];
  double v5 = 0.0;
  if (v3) {
    double v5 = 0.5;
  }
  [(MRRenderer *)self animateCurrentFocuserToSlideFocusModeWithDuration:v5];
  return result;
}

- (double)animateCurrentFocuserToSlideFocusModeWithDuration:(double)a3
{
  double v5 = [(MRSlideFocusState *)self->mInternal->mSlideFocusState slideInfo];
  CGFloat v6 = self->mSize.width / self->mSize.height;
  [(MRSlideInfo *)v5 aspectRatio];
  double v7 = &self->mInternal->super.isa + self->mInternal->mCurrentSlideFocuserIndex;
  Class v8 = v7[40];
  double v10 = v9 / v6;
  if (v10 <= 1.0) {
    double v11 = v10;
  }
  else {
    double v11 = 1.0;
  }
  Class v12 = v7[40];
  if (a3 <= 0.0)
  {
    [(objc_class *)v12 setCenter:@"image0", 0.5, 0.5 ofSlide];
    [(objc_class *)v8 setScale:@"image0" ofSlide:v11];
    a3 = 0.0;
    [(objc_class *)v8 setRotation:@"image0" ofSlide:0.0];
    [(MRLayer *)self->mInternal->mSlideFocusLayer setOpacity:1.0];
  }
  else
  {
    [(objc_class *)v12 animateCenterOfSlide:@"image0", 0.5, 0.5, a3 to withDuration];
    [(objc_class *)v8 animateScaleOfSlide:@"image0" to:v11 withDuration:a3];
    [(objc_class *)v8 animateRotationOfSlide:@"image0" to:0.0 withDuration:a3];
    [(MRLayer *)self->mInternal->mSlideFocusLayer animateOpacityTo:1.0 withDuration:a3];
  }
  return a3;
}

- (id)slideInfoForCurrentElement:(id)a3
{
  uint64_t v7 = 0;
  Class v8 = &v7;
  uint64_t v9 = 0x3052000000;
  double v10 = sub_507E0;
  double v11 = sub_507F0;
  uint64_t v12 = 0;
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_54D3C;
  v6[3] = &unk_1AACE0;
  v6[5] = a3;
  void v6[6] = &v7;
  v6[4] = self;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v6);
  id v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)slideInfosForCurrentElements
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_507E0;
  double v10 = sub_507F0;
  uint64_t v11 = 0;
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_54E70;
  v5[3] = &unk_1AAC18;
  v5[4] = self;
  void v5[5] = &v6;
  PerformSynchronouslyOnRenderQueue(mRenderDispatchQueue, (uint64_t)v5);
  BOOL v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)sendNotification:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_54F28;
  v3[3] = &unk_1AAB00;
  v3[4] = a3;
  void v3[5] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

- (id)chooseTransitionIDForRandomTransitionPresetID:(id)a3
{
  id v5 = [(MRFeatureDelegate *)[(MRRenderer *)self featureDelegate] descriptionForRandomTransitionPresetID:a3];
  if (!v5)
  {
    mDescriptionsForRandomTransitionPresetIDs = self->mDescriptionsForRandomTransitionPresetIDs;
    if (!mDescriptionsForRandomTransitionPresetIDs)
    {
      mDescriptionsForRandomTransitionPresetIDs = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", -[NSBundle pathForResource:ofType:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class()), "pathForResource:ofType:", @"TemporaryRandomTransitionDescriptions", @"plist"));
      self->mDescriptionsForRandomTransitionPresetIDs = mDescriptionsForRandomTransitionPresetIDs;
    }
    id v5 = [(NSDictionary *)mDescriptionsForRandomTransitionPresetIDs objectForKey:a3];
    if (!v5) {
      return 0;
    }
  }
  id v7 = [v5 objectForKey:@"transitionPresetIDs"];
  id v8 = objc_msgSend(v7, "objectAtIndex:", arc4random() % (unint64_t)objc_msgSend(v7, "count"));
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    return v8;
  }
  unint64_t v9 = arc4random();
  unint64_t v10 = v9 % (unint64_t)[v8 count];
  return [v8 objectAtIndex:v10];
}

- (void)_adaptToPressureLevel:(int)a3
{
  if (a3 <= 29)
  {
    if (a3)
    {
      if (a3 != 20) {
        return;
      }
      double v3 = 0.0333333333;
    }
    else
    {
      double v3 = 0.0166666667;
    }
    goto LABEL_10;
  }
  if (a3 == 30 || a3 == 40 || a3 == 50)
  {
    double v3 = 0.05;
LABEL_10:
    self->double mTimeQuantum = v3;
  }
}

- (void)_startMonitoringThermalPressureLevelChanges
{
  int out_token = 0;
  if (!notify_register_check(kOSThermalNotificationPressureLevelName, &out_token))
  {
    uint64_t state64 = 0;
    notify_get_state(out_token, &state64);
    NSLog(@"Initial thermal pressure level is %llu", state64);
    [(MRRenderer *)self _adaptToPressureLevel:state64];
    notify_cancel(out_token);
  }
  mRenderDispatchQueue = self->mInternal->mRenderDispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_551E4;
  handler[3] = &unk_1AAD08;
  handler[4] = self;
  uint64_t v4 = notify_register_dispatch(kOSThermalNotificationPressureLevelName, &self->_thermalNotificationToken, mRenderDispatchQueue, handler);
  if (v4) {
    NSLog(@"notify_register_dispatch failed (%u) for kOSThermalNotificationPressureLevelName", v4);
  }
}

- (void)_stopMonitoringThermalPressureLevelChanges
{
  int thermalNotificationToken = self->_thermalNotificationToken;
  if (thermalNotificationToken)
  {
    notify_cancel(thermalNotificationToken);
    self->_int thermalNotificationToken = 0;
  }
}

- (void)processAudioObjects
{
  [(MRRenderer *)self time];
  double v4 = v3;
  [(MCMontage *)self->mMontage audioFadeOutDuration];
  double v6 = v5;
  [(MRRenderer *)self volume];
  double v8 = v7;
  if (v6 > 0.0)
  {
    [(MCPlug *)[(MCMontage *)self->mMontage rootPlug] fullDuration];
    double v10 = (v9 - v4) / v6;
    if (v10 > 1.0) {
      double v10 = 1.0;
    }
    double v8 = v10 * v8;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  mInternal = self->mInternal;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [(NSArray *)mInternal->mAudioPlayerSortedBuckets reverseObjectEnumerator];
  id v31 = [(NSEnumerator *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v37;
    float v12 = 1.0;
    do
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v37 != v30) {
          objc_enumerationMutation(obj);
        }
        double v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v15 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v33;
          float v18 = 1.0;
          do
          {
            for (j = 0; j != v16; j = (char *)j + 1)
            {
              if (*(void *)v33 != v17) {
                objc_enumerationMutation(v14);
              }
              double v20 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
              [v20 currentDuckLevel];
              float v22 = v21;
              if (v18 > v22) {
                float v18 = v22;
              }
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                if ([v20 shouldBePlaying])
                {
                  [v20 processWithDuckLevel:v8 * v12];
                  id v23 = [v20 avPlayer];
                  if (self->mInternal->mInnerIsPlaying)
                  {
                    dispatch_time_t v24 = v23;
                    [v23 rate];
                    if (v25 == 0.0) {
                      [v24 play];
                    }
                  }
                }
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v16);
        }
        else
        {
          float v18 = 1.0;
        }
        if (v18 < v12) {
          float v12 = v18;
        }
      }
      id v31 = [(NSEnumerator *)obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v31);
  }
  else
  {
    float v12 = 1.0;
  }
  double v26 = [(MRRenderer *)self renderingDelegate];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v27 = v8;
    *(float *)&double v28 = v12;
    [(MRRenderingDelegate *)v26 setAudioFadingLevel:v27 andDuckingLevel:v28];
  }
}

- (void)addAudioObject:(id)a3
{
  if (![(MRRenderer *)self ignoresBackgroundAudio]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    double v5 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 priority]);
    id v6 = [(NSMutableDictionary *)self->mInternal->mAudioPlayerBuckets objectForKey:v5];
    if (!v6)
    {
      id v6 = objc_alloc_init((Class)NSMutableSet);
      mAudioPlayerBuckets = self->mInternal->mAudioPlayerBuckets;
      if (!mAudioPlayerBuckets)
      {
        self->mInternal->mAudioPlayerBuckets = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        mAudioPlayerBuckets = self->mInternal->mAudioPlayerBuckets;
      }
      [(NSMutableDictionary *)mAudioPlayerBuckets setObject:v6 forKey:v5];

      self->mInternal->mAudioPlayerSortedBuckets = (NSArray *)-[NSMutableDictionary objectsForKeys:notFoundMarker:](self->mInternal->mAudioPlayerBuckets, "objectsForKeys:notFoundMarker:", objc_msgSend(-[NSMutableDictionary allKeys](self->mInternal->mAudioPlayerBuckets, "allKeys"), "sortedArrayUsingSelector:", "compare:"), +[NSNull null](NSNull, "null"));
    }
    [v6 addObject:a3];
  }
}

- (void)removeAudioObject:(id)a3
{
  id v4 = -[NSMutableDictionary objectForKey:](self->mInternal->mAudioPlayerBuckets, "objectForKey:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [a3 priority]));
  if (v4)
  {
    double v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_msgSend(objc_msgSend(a3, "avPlayer"), "pause");
    }
    [v5 removeObject:a3];
  }
}

@end