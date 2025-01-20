@interface TSDMovieRep
+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4;
- (BOOL)canResetMediaSize;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)handleSingleTapAtPoint:(CGPoint)a3;
- (BOOL)isDraggable;
- (BOOL)isPlayable;
- (BOOL)isPlaying;
- (BOOL)p_needsTilingLayerForStroke:(id)a3;
- (BOOL)p_playButtonFitsInFrame;
- (BOOL)p_shouldPlayerControllerExistThroughoutSelection;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)shouldSingleTapPlay;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGImage)alternatePosterImage;
- (CGRect)p_strokeFrameForLayerFrame:(CGRect)a3;
- (TSDButtonKnob)p_playButtonKnob;
- (TSDMovieInfo)movieInfo;
- (TSDMovieRep)initWithLayout:(id)a3 canvas:(id)a4;
- (double)visibleTime;
- (float)volume;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
- (id)additionalLayersOverLayer;
- (id)additionalLayersUnderLayer;
- (id)movieLayout;
- (id)p_shapeLayerForPlayerStroke;
- (id)p_shapeLayerForReflectionStroke;
- (id)p_tilingLayerForPlayerStroke;
- (id)p_tilingLayerForReflectionStroke;
- (id)playerController;
- (id)playerStrokeLayer;
- (id)reflectionPlayerStrokeLayer;
- (unint64_t)enabledKnobMask;
- (void)addKnobsToArray:(id)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)createReflectionLayer;
- (void)dealloc;
- (void)didUpdateLayer:(id)a3;
- (void)disposeReflectionLayer;
- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8;
- (void)drawInLayerContext:(CGContext *)a3;
- (void)drawLayer:(id)a3 inContext:(CGContext *)a4;
- (void)dynamicVisibleTimeChangeDidBegin;
- (void)dynamicVisibleTimeChangeDidEnd;
- (void)dynamicVisibleTimeUpdateToValue:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5;
- (void)dynamicVolumeChangeDidBegin;
- (void)dynamicVolumeChangeDidEnd;
- (void)dynamicVolumeUpdateToValue:(float)a3;
- (void)i_updateFrameRep;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_addPlayButtonToKnobs:(id)a3;
- (void)p_applyBasicStrokeToLayer:(id)a3 layer:(id)a4 bounds:(CGRect)a5;
- (void)p_arrangeLayerVisibility:(id)a3;
- (void)p_cancelUpdatingUIStateForMoviePlayability;
- (void)p_checkAndsyncTilingLayerState:(BOOL)a3;
- (void)p_commonDrawStrokeInContext:(CGContext *)a3;
- (void)p_createMaskLayerForLayer:(id)a3;
- (void)p_createReflectionPlayerStrokeMaskLayer;
- (void)p_disposeMaskLayer;
- (void)p_disposeReflectionStrokeLayers;
- (void)p_disposeStrokeLayer;
- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 withMask:(BOOL)a7 forShadowOrHitTest:(BOOL)a8;
- (void)p_drawPosterImageInContext:(CGContext *)a3;
- (void)p_drawReflectionGradientIntoMovieReflectionLayer:(CGContext *)a3 reflectionSize:(CGSize)a4;
- (void)p_hideReflectionLayer;
- (void)p_placeReflectionPlayerLayer:(CGRect)a3 transform:(CGAffineTransform *)a4;
- (void)p_playForKnob;
- (void)p_setNeedsTeardownPlayerControllerOnUpdateLayer;
- (void)p_setPositionAndBoundsIfDifferent:(id)a3 position:(CGPoint)a4 bounds:(CGRect)a5;
- (void)p_setupPlayerControllerIfNecessary;
- (void)p_setupPlayerLayerIfNecessary;
- (void)p_setupPlayerStrokeLayers:(BOOL)a3;
- (void)p_setupReflectionPlayerLayerIfNecessary;
- (void)p_setupShapePlayerStrokeLayer;
- (void)p_setupShapeReflectionPlayerStrokeLayer;
- (void)p_setupStrokeLayers:(BOOL)a3 needsMaskLayer:(BOOL)a4 isFrame:(BOOL)a5;
- (void)p_setupTilingPlayerStrokeLayer;
- (void)p_setupTilingReflectionPlayerStrokeLayer;
- (void)p_showReflectionLayer;
- (void)p_stopUpdatingUIStateForMoviePlayability;
- (void)p_teardownPlayerController;
- (void)p_teardownPlayerControllerIfNeeded;
- (void)p_togglePlaying;
- (void)p_updateEndTime;
- (void)p_updateMovieReflectionMaskLayer;
- (void)p_updatePlayButtonVisibility;
- (void)p_updateReflectionFrameRep;
- (void)p_updateRepeatMode;
- (void)p_updateStartTime;
- (void)p_updateStrokeLayerForStroke:(id)a3 repLayer:(id)a4;
- (void)p_updateUIStateForMoviePlayability;
- (void)p_updateVolume;
- (void)playbackDidStopForPlayerController:(id)a3;
- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4;
- (void)processChangedProperty:(int)a3;
- (void)screenScaleDidChange;
- (void)setAlternatePosterImage:(CGImage *)a3;
- (void)setShapeReflectionPlayerStrokeLayer:(id)a3;
- (void)updateFromLayout;
- (void)updateLayerGeometryFromLayout:(id)a3;
- (void)willBeRemoved;
- (void)willBeginReadMode;
- (void)willEndReadMode;
- (void)willUpdateLayer:(id)a3;
@end

@implementation TSDMovieRep

- (TSDMovieRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDMovieRep;
  v4 = [(TSDRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4 && ![(TSDMovieRep *)v4 movieInfo])
  {

    return 0;
  }
  return v5;
}

- (TSDMovieInfo)movieInfo
{
  objc_opt_class();
  [(TSDRep *)self info];

  return (TSDMovieInfo *)TSUDynamicCast();
}

- (id)movieLayout
{
  objc_opt_class();
  [(TSDRep *)self layout];

  return (id)TSUDynamicCast();
}

- (void)dealloc
{
  [(TSDMovieRep *)self p_disposeStrokeLayer];
  [(TSDMovieRep *)self p_disposeMaskLayer];
  [(TSDMovieRep *)self p_disposeReflectionStrokeLayers];
  [(TSDMovieRep *)self disposeReflectionLayer];
  [(AVPlayerLayer *)self->mPlayerLayer setDelegate:0];
  [*(id *)&self->mCurrentlyObservingPlayerLayer setDelegate:0];

  CGImageRelease(*(CGImageRef *)&self->mPlayButtonKnobVisible);
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDMediaRep *)&v3 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)p_createMaskLayerForLayer:(id)a3
{
  if (!self->super.mTapToReplaceLayer)
  {
    v5 = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]);
    self->super.mTapToReplaceLayer = v5;
    [(CALayer *)v5 setDelegate:self];
    -[CALayer setAnchorPoint:](self->super.mTapToReplaceLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    mTapToReplaceLayer = self->super.mTapToReplaceLayer;
    [a3 setMask:mTapToReplaceLayer];
  }
}

- (void)p_createReflectionPlayerStrokeMaskLayer
{
  if (self->mMovieReflectionMaskLayer
    || self->mReflectionPlayerLayer
    && (v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler],
        uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMovieRep p_createReflectionPlayerStrokeMaskLayer]"], objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 293, @"layer lifetime messup"), self->mMovieReflectionMaskLayer))
  {
    if (!self->mReflectionPlayerLayer)
    {
      objc_super v3 = (AVPlayerLayer *)objc_alloc_init(MEMORY[0x263F15880]);
      self->mReflectionPlayerLayer = v3;
      [(AVPlayerLayer *)v3 setDelegate:self];
      -[AVPlayerLayer setAnchorPoint:](self->mReflectionPlayerLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
      mReflectionPlayerLayer = self->mReflectionPlayerLayer;
      mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
      [(CALayer *)mMovieReflectionMaskLayer setMask:mReflectionPlayerLayer];
    }
  }
}

- (void)p_disposeStrokeLayer
{
  objc_super v3 = *(void **)&self->mPreventDisposeOfPlayerLayer;
  if (v3)
  {
    [v3 setDelegate:0];

    *(void *)&self->mPreventDisposeOfPlayerLayer = 0;
    long long v4 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x263F001A8];
    *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.y = v4;
  }
}

- (void)p_disposeMaskLayer
{
  mTapToReplaceLayer = self->super.mTapToReplaceLayer;
  if (mTapToReplaceLayer)
  {
    [(CALayer *)mTapToReplaceLayer removeFromSuperlayer];
    [(CALayer *)self->super.mTapToReplaceLayer setDelegate:0];

    self->super.mTapToReplaceLayer = 0;
    self->super.mStrokeLayer = 0;
  }
}

- (void)p_disposeReflectionStrokeLayers
{
  mPlayerStrokeLayer = self->mPlayerStrokeLayer;
  if (mPlayerStrokeLayer)
  {
    [(CALayer *)mPlayerStrokeLayer removeFromSuperlayer];
    [(CALayer *)self->mPlayerStrokeLayer setDelegate:0];

    self->mPlayerStrokeLayer = 0;
  }
  mReflectionPlayerLayer = self->mReflectionPlayerLayer;
  if (mReflectionPlayerLayer)
  {
    [(AVPlayerLayer *)mReflectionPlayerLayer removeFromSuperlayer];
    [(AVPlayerLayer *)self->mReflectionPlayerLayer setDelegate:0];

    self->mReflectionPlayerLayer = 0;
  }
  if (self->mReflectionFrameRep) {
    self->mReflectionFrameRep = 0;
  }
  mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
  if (mReflectionPlayerStrokeLayer)
  {

    self->mReflectionPlayerStrokeLayer = 0;
  }
}

- (void)p_hideReflectionLayer
{
  mReflectionLayer = self->super.super.mReflectionLayer;
  if (mReflectionLayer && !BYTE1(self->mPlayerController))
  {
    if ([(CALayer *)mReflectionLayer isHidden])
    {
      long long v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v5 = [NSString stringWithUTF8String:"-[TSDMovieRep p_hideReflectionLayer]"];
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 355, @"Hiding layer that is already hidden!");
    }
    [(CALayer *)self->super.super.mReflectionLayer setHidden:1];
  }
  mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
  if (mMovieReflectionMaskLayer)
  {
    if ([(CALayer *)mMovieReflectionMaskLayer isHidden])
    {
      uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSDMovieRep p_hideReflectionLayer]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 359, @"Hiding layer that is already hidden!");
    }
    [(CALayer *)self->mMovieReflectionMaskLayer setHidden:1];
  }
  mLayerToStroke = self->mLayerToStroke;
  if (mLayerToStroke && BYTE1(self->mPlayerController))
  {
    if ([(CALayer *)mLayerToStroke isHidden])
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSDMovieRep p_hideReflectionLayer]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 363, @"Hiding layer that is already hidden!");
    }
    v12 = self->mLayerToStroke;
    [(CALayer *)v12 setHidden:1];
  }
}

- (void)p_showReflectionLayer
{
  mReflectionLayer = self->super.super.mReflectionLayer;
  if (mReflectionLayer && !BYTE1(self->mPlayerController)) {
    [(CALayer *)mReflectionLayer setHidden:0];
  }
  mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
  if (mMovieReflectionMaskLayer) {
    [(CALayer *)mMovieReflectionMaskLayer setHidden:0];
  }
  mLayerToStroke = self->mLayerToStroke;
  if (mLayerToStroke && BYTE1(self->mPlayerController))
  {
    [(CALayer *)mLayerToStroke setHidden:0];
  }
}

- (void)disposeReflectionLayer
{
  if (LOBYTE(self->mReflectionPlayerStrokeMaskLayer))
  {
    uint64_t v8 = self;
    objc_super v3 = &v8;
  }
  else
  {
    mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
    if (mMovieReflectionMaskLayer)
    {
      [(CALayer *)mMovieReflectionMaskLayer removeFromSuperlayer];
      [(CALayer *)self->mMovieReflectionMaskLayer setDelegate:0];

      self->mMovieReflectionMaskLayer = 0;
    }
    mLayerToStroke = self->mLayerToStroke;
    if (mLayerToStroke)
    {
      [(CALayer *)mLayerToStroke setDelegate:0];
      [(CALayer *)self->mLayerToStroke setMask:0];

      self->mLayerToStroke = 0;
    }
    mMovieReflectionLayer = self->mMovieReflectionLayer;
    if (mMovieReflectionLayer)
    {
      [(CALayer *)mMovieReflectionLayer removeFromSuperlayer];
      [(CALayer *)self->mMovieReflectionLayer setDelegate:0];

      self->mMovieReflectionLayer = 0;
    }
    [(TSDMovieRep *)self p_disposeReflectionStrokeLayers];
    uint64_t v7 = self;
    objc_super v3 = &v7;
  }
  v3[1] = (TSDMovieRep *)TSDMovieRep;
  objc_msgSendSuper2((objc_super *)v3, sel_disposeReflectionLayer, v7);
}

- (void)createReflectionLayer
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  [(TSDStyledRep *)&v5 createReflectionLayer];

  objc_super v3 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  self->mLayerToStroke = v3;
  [(CALayer *)v3 setDelegate:self];
  [(CALayer *)self->mLayerToStroke setNeedsDisplay];
  [(CALayer *)self->mLayerToStroke setHidden:1];

  long long v4 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
  self->mMovieReflectionLayer = v4;
  [(CALayer *)v4 setDelegate:self];
  -[CALayer setAnchorPoint:](self->mMovieReflectionLayer, "setAnchorPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(CALayer *)self->mLayerToStroke addSublayer:self->mMovieReflectionLayer];
  if ([*(id *)&self->super.mLastPictureFrameLayerRect.size.height player]) {
    [(TSDMovieRep *)self p_setupReflectionPlayerLayerIfNecessary];
  }
}

- (void)p_setupReflectionPlayerLayerIfNecessary
{
  if (*(void *)&self->super.mLastPictureFrameLayerRect.size.height && !self->mMovieReflectionMaskLayer)
  {
    objc_super v3 = (CALayer *)objc_alloc_init(MEMORY[0x263EFA838]);
    self->mMovieReflectionMaskLayer = v3;
    [(CALayer *)v3 setDelegate:self];
    BOOL v4 = [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isStreaming];
    objc_super v5 = (void *)MEMORY[0x263EF9C70];
    if (!v4) {
      objc_super v5 = (void *)MEMORY[0x263EF9C68];
    }
    [(CALayer *)self->mMovieReflectionMaskLayer setVideoGravity:*v5];
    [(CALayer *)self->mMovieReflectionMaskLayer setHidden:0];
    if (![*(id *)&self->super.mLastPictureFrameLayerRect.size.height player])
    {
      v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMovieRep p_setupReflectionPlayerLayerIfNecessary]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 456, @"invalid nil value for '%s'", "mPlayerController.player");
    }
    -[CALayer setPlayer:](self->mMovieReflectionMaskLayer, "setPlayer:", [*(id *)&self->super.mLastPictureFrameLayerRect.size.height player]);
  }
  mLayerToStroke = self->mLayerToStroke;
  if (mLayerToStroke)
  {
    mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
    [(CALayer *)mLayerToStroke addSublayer:mMovieReflectionMaskLayer];
  }
}

- (void)p_setupPlayerLayerIfNecessary
{
  if (!*(void *)&self->mCurrentlyObservingPlayerLayer)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFA838]);
    *(void *)&self->mCurrentlyObservingPlayerLayer = v3;
    [v3 setDelegate:self];
    BOOL v4 = [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isStreaming];
    objc_super v5 = (void *)MEMORY[0x263EF9C70];
    if (!v4) {
      objc_super v5 = (void *)MEMORY[0x263EF9C68];
    }
    [*(id *)&self->mCurrentlyObservingPlayerLayer setVideoGravity:*v5];
    [*(id *)&self->mCurrentlyObservingPlayerLayer setHidden:1];
    BYTE1(self->mPlayerController) = 0;
    [*(id *)&self->mCurrentlyObservingPlayerLayer addObserver:self forKeyPath:@"readyForDisplay" options:5 context:TSDMovieRepPlayerLayerReadyForDisplayObserverContext];
    LOBYTE(self->mPlayerController) = 1;
    if (![*(id *)&self->super.mLastPictureFrameLayerRect.size.height player])
    {
      v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMovieRep p_setupPlayerLayerIfNecessary]"];
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 482, @"invalid nil value for '%s'", "mPlayerController.player");
    }
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setPlayer:", objc_msgSend(*(id *)&self->super.mLastPictureFrameLayerRect.size.height, "player"));
    uint64_t v8 = objc_msgSend(-[TSDRep info](self, "info"), "geometry");
    if (v8)
    {
      objc_msgSend(v8, "transformBasedOnPoint:centeredAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    }
    else
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v18 = 0u;
    }
    v9 = *(void **)&self->mCurrentlyObservingPlayerLayer;
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    [v9 setAffineTransform:v17];
    mCanvas = self->super.super.super.mCanvas;
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] size];
    [(TSDCanvas *)mCanvas convertUnscaledToBoundsRect:TSDRectWithSize()];
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setBounds:");
    uint64_t v11 = self->super.super.super.mCanvas;
    [(TSDLayoutGeometry *)[(TSDAbstractLayout *)[(TSDRep *)self layout] geometry] frame];
    [(TSDCanvas *)v11 convertUnscaledToBoundsPoint:TSDCenterOfRect(v12, v13, v14, v15)];
    objc_msgSend(*(id *)&self->mCurrentlyObservingPlayerLayer, "setPosition:");
    [(TSDStyledRep *)self opacity];
    *(float *)&double v16 = v16;
    [*(id *)&self->mCurrentlyObservingPlayerLayer setOpacity:v16];
    if (self->super.super.mReflectionLayer) {
      [(TSDMovieRep *)self p_setupReflectionPlayerLayerIfNecessary];
    }
    [(TSDCanvas *)[(TSDRep *)self canvas] invalidateLayers];
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  if (self->mPlayerStrokeLayer == a3)
  {
    [(TSDMovieRep *)self p_drawReflectionStrokeInContext:a4];
  }
  else if (*(id *)&self->mPreventDisposeOfPlayerLayer == a3)
  {
    [(TSDMovieRep *)self p_drawStrokeInContext:a4];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)TSDMovieRep;
    -[TSDStyledRep drawLayer:inContext:](&v4, sel_drawLayer_inContext_);
  }
}

- (id)p_shapeLayerForPlayerStroke
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)p_tilingLayerForPlayerStroke
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)playerStrokeLayer
{
  return *(id *)&self->mPreventDisposeOfPlayerLayer;
}

- (void)p_setupTilingPlayerStrokeLayer
{
  if (!*(void *)&self->mPreventDisposeOfPlayerLayer)
  {
    id v3 = objc_alloc_init(TSDTilingLayer);
    *(void *)&self->mPreventDisposeOfPlayerLayer = v3;
    [(TSDTilingLayer *)v3 setDelegate:self];
    [(TSDTilingLayer *)v3 setDrawsInBackground:1];
    [(TSDTilingLayer *)v3 setNeedsDisplay];
  }
}

- (void)p_setupShapePlayerStrokeLayer
{
  if (!*(void *)&self->mPreventDisposeOfPlayerLayer)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F15880]);
    *(void *)&self->mPreventDisposeOfPlayerLayer = v3;
    [v3 setDelegate:self];
    [v3 setFillColor:0];
  }
}

- (id)p_shapeLayerForReflectionStroke
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)p_tilingLayerForReflectionStroke
{
  objc_opt_class();

  return (id)TSUDynamicCast();
}

- (id)reflectionPlayerStrokeLayer
{
  return self->mPlayerStrokeLayer;
}

- (void)p_setupShapeReflectionPlayerStrokeLayer
{
  if (!self->mPlayerStrokeLayer)
  {
    id v3 = (CALayer *)objc_alloc_init(MEMORY[0x263F15880]);
    self->mPlayerStrokeLayer = v3;
    [(CALayer *)v3 setDelegate:self];
    [(CALayer *)v3 setFillColor:0];
  }
}

- (void)p_setupTilingReflectionPlayerStrokeLayer
{
  if (!self->mPlayerStrokeLayer)
  {
    id v3 = objc_alloc_init(TSDTilingLayer);
    self->mPlayerStrokeLayer = &v3->super;
    [(TSDTilingLayer *)v3 setDelegate:self];
    [(TSDTilingLayer *)v3 setDrawsInBackground:1];
    [(TSDTilingLayer *)v3 setNeedsDisplay];
  }
}

- (void)setShapeReflectionPlayerStrokeLayer:(id)a3
{
  self->mPlayerStrokeLayer = (CALayer *)a3;
}

- (BOOL)p_needsTilingLayerForStroke:(id)a3
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)p_setupPlayerStrokeLayers:(BOOL)a3
{
  if (a3)
  {
    [(TSDMovieRep *)self p_setupTilingPlayerStrokeLayer];
    [(TSDMovieRep *)self p_setupTilingReflectionPlayerStrokeLayer];
  }
  else
  {
    [(TSDMovieRep *)self p_setupShapePlayerStrokeLayer];
    [(TSDMovieRep *)self p_setupShapeReflectionPlayerStrokeLayer];
  }
}

- (void)p_checkAndsyncTilingLayerState:(BOOL)a3
{
  [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if (!a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(TSDMovieRep *)self p_disposeStrokeLayer];
      [(TSDMovieRep *)self p_disposeReflectionStrokeLayers];
    }
  }
}

- (void)p_setupStrokeLayers:(BOOL)a3 needsMaskLayer:(BOOL)a4 isFrame:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  if (a4)
  {
    [(TSDMovieRep *)self p_createMaskLayerForLayer:self->mPlayerLayer];
    if (self->super.super.mReflectionLayer) {
      [(TSDMovieRep *)self p_createReflectionPlayerStrokeMaskLayer];
    }
  }
  [(TSDMovieRep *)self p_checkAndsyncTilingLayerState:v6];
  [(TSDMovieRep *)self p_setupPlayerStrokeLayers:v6];
  if (v5)
  {
    [(TSDMovieRep *)self i_updateFrameRep];
    mStrokeLayer = self->super.mStrokeLayer;
    if (mStrokeLayer)
    {
      [(CAShapeLayer *)mStrokeLayer removeFromSuperlayer];
      self->super.mStrokeLayer = 0;
    }
    mReflectionFrameRep = self->mReflectionFrameRep;
    if (mReflectionFrameRep)
    {
      [(TSDFrameRep *)mReflectionFrameRep removeFromSuperlayer];
      self->mReflectionFrameRep = 0;
    }
    [(TSDMovieRep *)self i_updateFrameRep];
    [(TSDCanvas *)[(TSDRep *)self canvas] contentsScale];
    double v11 = v10;
    mFrameMaskLayer = self->super.mFrameMaskLayer;
    id v13 = [(TSDMovieRep *)self playerStrokeLayer];
    mPlayerLayer = self->mPlayerLayer;
    mTapToReplaceLayer = self->super.mTapToReplaceLayer;
    [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
    self->super.mStrokeLayer = (CAShapeLayer *)[(CALayer *)mFrameMaskLayer applyToCALayer:v13 withRepLayer:mPlayerLayer maskLayer:mTapToReplaceLayer viewScale:v11 * v16];
    if (self->mMovieReflectionMaskLayer)
    {
      mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
      id v18 = [(TSDMovieRep *)self reflectionPlayerStrokeLayer];
      mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
      mReflectionPlayerLayer = self->mReflectionPlayerLayer;
      [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
      self->mReflectionFrameRep = (TSDFrameRep *)[(CALayer *)mReflectionPlayerStrokeLayer applyToCALayer:v18 withRepLayer:mMovieReflectionMaskLayer maskLayer:mReflectionPlayerLayer viewScale:v11 * v21];
    }
    long long v22 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
    *(_OWORD *)&self->super.mFrameRep = *MEMORY[0x263F001A8];
    *(_OWORD *)&self->super.mLastPictureFrameLayerRect.origin.y = v22;
  }
}

- (CGRect)p_strokeFrameForLayerFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v8 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v10 = v9;
  [v8 width];
  CGFloat v12 = v10 * (v11 * -0.5);
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  CGRectInset(v18, v12, v12);

  double v13 = TSDRectWithSize();
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)p_arrangeLayerVisibility:(id)a3
{
  id v3 = (AVPlayerLayer *)a3;
  if (BYTE1(self->mPlayerController) && !BYTE5(self->mIsChangingDynamicVisibleTimeCount))
  {
    [*(id *)&self->mCurrentlyObservingPlayerLayer setHidden:0];
    uint64_t v7 = 1;
    [(AVPlayerLayer *)v3 setHidden:1];
    id v3 = *(AVPlayerLayer **)&self->mCurrentlyObservingPlayerLayer;
    p_mReflectionLayer = &self->super.super.mReflectionLayer;
    if (!self->super.super.mReflectionLayer) {
      goto LABEL_8;
    }
    uint64_t v5 = 0;
  }
  else
  {
    [a3 setHidden:0];
    uint64_t v5 = 1;
    [*(id *)&self->mCurrentlyObservingPlayerLayer setHidden:1];
    p_mReflectionLayer = &self->super.super.mReflectionLayer;
    if (!self->super.super.mReflectionLayer) {
      goto LABEL_8;
    }
    uint64_t v7 = 0;
  }
  [(CALayer *)self->mLayerToStroke setHidden:v5];
  [(CALayer *)*p_mReflectionLayer setHidden:v7];
LABEL_8:
  if (v3 != self->mPlayerLayer)
  {
    [(TSDMovieRep *)self p_disposeMaskLayer];
    [(TSDMovieRep *)self p_disposeStrokeLayer];
    [(TSDMovieRep *)self p_disposeReflectionStrokeLayers];
    id v8 = v3;

    self->mPlayerLayer = v3;
  }
}

- (void)willUpdateLayer:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)TSDMovieRep;
  -[TSDStyledRep willUpdateLayer:](&v12, sel_willUpdateLayer_);
  id v5 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  [(TSDMovieRep *)self p_arrangeLayerVisibility:a3];
  BOOL v6 = [(TSDMediaRep *)self i_shouldRenderStroke:v5];
  BOOL v7 = v6;
  if (v6)
  {
    BOOL v8 = [(TSDMovieRep *)self p_needsTilingLayerForStroke:v5];
    uint64_t v9 = [v5 isFrame];
    if (v9 && [v5 hasMask])
    {
      BOOL v10 = [(TSDMediaLayout *)[(TSDMediaRep *)self mediaLayout] shouldRenderFrameStroke];
      [(TSDMovieRep *)self p_setupStrokeLayers:v8 needsMaskLayer:v10 isFrame:1];
      if (v10) {
        return;
      }
    }
    else
    {
      [(TSDMovieRep *)self p_setupStrokeLayers:v8 needsMaskLayer:0 isFrame:v9];
    }
  }
  mStrokeLayer = self->super.mStrokeLayer;
  if (mStrokeLayer)
  {
    [(CAShapeLayer *)mStrokeLayer removeFromSuperlayer];
    self->super.mStrokeLayer = 0;
  }
  [(TSDMovieRep *)self p_disposeMaskLayer];
  if (!v7)
  {
    [(TSDMovieRep *)self p_disposeStrokeLayer];
    [(TSDMovieRep *)self p_disposeReflectionStrokeLayers];
  }
}

- (void)didUpdateLayer:(id)a3
{
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __30__TSDMovieRep_didUpdateLayer___block_invoke;
  v25[3] = &unk_2646AF7B8;
  v25[4] = self;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [MEMORY[0x263F158F8] setCompletionBlock:v25];
  v24.receiver = self;
  v24.super_class = (Class)TSDMovieRep;
  [(TSDStyledRep *)&v24 didUpdateLayer:a3];
  if (self->mLayerToStroke && [(TSDStyledRep *)self shouldShowReflection])
  {
    [(CALayer *)self->super.super.mReflectionLayer position];
    -[CALayer setPosition:](self->mLayerToStroke, "setPosition:");
    [(CALayer *)self->super.super.mReflectionLayer bounds];
    -[CALayer setBounds:](self->mLayerToStroke, "setBounds:");
    [(CALayer *)self->super.super.mReflectionLayer opacity];
    -[CALayer setOpacity:](self->mLayerToStroke, "setOpacity:");
    mReflectionLayer = self->super.super.mReflectionLayer;
    if (mReflectionLayer)
    {
      [(CALayer *)mReflectionLayer affineTransform];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v21 = 0u;
    }
    mLayerToStroke = self->mLayerToStroke;
    v20[0] = v21;
    v20[1] = v22;
    v20[2] = v23;
    [(CALayer *)mLayerToStroke setAffineTransform:v20];
    [(TSDMovieRep *)self p_updateMovieReflectionMaskLayer];
  }
  [(TSDStyledRep *)self opacity];
  double v8 = v7;
  [a3 opacity];
  double v10 = v9;
  if (v8 != v10)
  {
    *(float *)&double v10 = v8;
    [a3 setOpacity:v10];
  }
  double v11 = *(void **)&self->mCurrentlyObservingPlayerLayer;
  if (v11)
  {
    [v11 opacity];
    double v13 = v12;
    if (v8 != v13)
    {
      *(float *)&double v13 = v8;
      [*(id *)&self->mCurrentlyObservingPlayerLayer setOpacity:v13];
    }
  }
  id v14 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if ([(TSDMediaRep *)self i_shouldRenderStroke:v14])
  {
    id v15 = a3;
    if (BYTE1(self->mPlayerController)) {
      id v15 = *(id *)&self->mCurrentlyObservingPlayerLayer;
    }
    [(TSDMovieRep *)self p_updateStrokeLayerForStroke:v14 repLayer:v15];
    if (self->mMovieReflectionMaskLayer)
    {
      id v16 = [(TSDMovieRep *)self reflectionPlayerStrokeLayer];
      if (self->mPlayerStrokeLayer)
      {
        id v17 = v16;
        if (![(NSArray *)[(CALayer *)self->mLayerToStroke sublayers] containsObject:v16])[(CALayer *)self->mLayerToStroke addSublayer:v17]; {
      }
        }
    }
  }
  CGRect v18 = [(TSDMovieRep *)self alternatePosterImage];
  if (v18) {
    goto LABEL_22;
  }
  long long v19 = [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] posterImageData];
  if (v19)
  {
    CGRect v18 = +[TSDBitmapImageProvider CGImageForImageData:v19];
LABEL_22:
    [a3 setContents:v18];
  }
  [MEMORY[0x263F158F8] commit];
}

uint64_t __30__TSDMovieRep_didUpdateLayer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_teardownPlayerControllerIfNeeded");
}

- (void)p_setPositionAndBoundsIfDifferent:(id)a3 position:(CGPoint)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.y;
  double v10 = a4.x;
  [a3 position];
  if (v13 != v10 || v12 != v9) {
    objc_msgSend(a3, "setPosition:", v10, v9);
  }
  [a3 bounds];
  v21.origin.double x = v15;
  v21.origin.double y = v16;
  v21.size.double width = v17;
  v21.size.double height = v18;
  v20.origin.double x = x;
  v20.origin.double y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  if (!CGRectEqualToRect(v20, v21))
  {
    objc_msgSend(a3, "setBounds:", x, y, width, height);
  }
}

- (void)p_placeReflectionPlayerLayer:(CGRect)a3 transform:(CGAffineTransform *)a4
{
  mCanvas = self->super.super.super.mCanvas;
  objc_msgSend(-[TSDMovieRep movieLayout](self, "movieLayout", a3.origin.x, a3.origin.y), "fullReflectionFrame");
  [(TSDCanvas *)mCanvas convertUnscaledToBoundsRect:TSDRectWithSize()];
  double v11 = TSDCenterOfRect(v7, v8, v9, v10);
  double v13 = v12;
  double v14 = TSDRectWithSize();
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  -[TSDMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", self->mMovieReflectionMaskLayer, v11, v13, v14, v15, v17, v19);
  mPlayerStrokeLayer = self->mPlayerStrokeLayer;
  -[TSDMovieRep p_strokeFrameForLayerFrame:](self, "p_strokeFrameForLayerFrame:", v14, v16, v18, v20);
  -[TSDMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", mPlayerStrokeLayer, v11, v13, v22, v23, v24, v25);
  long long v26 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v33.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v33.c = v26;
  *(_OWORD *)&v33.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  *(_OWORD *)&v32.a = *(_OWORD *)&v33.a;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tdouble x = *(_OWORD *)&v33.tx;
  CGAffineTransformScale(&v33, &v32, 1.0, -1.0);
  long long v27 = *(_OWORD *)&a4->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a4->a;
  *(_OWORD *)&t1.c = v27;
  t1.tdouble x = 0.0;
  t1.tdouble y = 0.0;
  CGAffineTransform t2 = v33;
  CGAffineTransformConcat(&v32, &t1, &t2);
  CGAffineTransform v33 = v32;
  CGAffineTransform v29 = v32;
  [(CALayer *)self->mMovieReflectionMaskLayer setAffineTransform:&v29];
  CGAffineTransform v28 = v33;
  [(CALayer *)self->mPlayerStrokeLayer setAffineTransform:&v28];
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  -[TSDRep computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:](self, "computeDirectLayerFrame:andTransform:basedOnLayoutGeometry:", &v12, &v9, objc_msgSend(-[TSDMovieRep movieLayout](self, "movieLayout"), "pureGeometry"));
  -[TSDRep antiAliasDefeatLayerTransform:forFrame:](self, "antiAliasDefeatLayerTransform:forFrame:", &v9, v12, v13);
  long long v6 = v9;
  long long v7 = v10;
  long long v8 = v11;
  objc_msgSend(a3, "setIfDifferentFrame:orTransform:", &v6, v12, v13);
  if (*(void *)&self->mCurrentlyObservingPlayerLayer)
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    id v5 = *(void **)&self->mCurrentlyObservingPlayerLayer;
    long long v6 = v9;
    long long v7 = v10;
    long long v8 = v11;
    objc_msgSend(v5, "setIfDifferentFrame:orTransform:", &v6, v12, v13);
    if (self->mMovieReflectionMaskLayer)
    {
      long long v6 = v9;
      long long v7 = v10;
      long long v8 = v11;
      -[TSDMovieRep p_placeReflectionPlayerLayer:transform:](self, "p_placeReflectionPlayerLayer:transform:", &v6, v12, v13);
    }
    [MEMORY[0x263F158F8] commit];
  }
}

- (void)updateFromLayout
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDRep *)&v3 updateFromLayout];
  [(TSDMovieRep *)self p_updatePlayButtonVisibility];
}

- (void)p_updateReflectionFrameRep
{
  id v3 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
  if ([(TSDMediaRep *)self i_shouldRenderStroke:v3]
    && [v3 isFrame])
  {
    mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
    if (!mReflectionPlayerStrokeLayer)
    {
LABEL_6:
      self->mReflectionPlayerStrokeLayer = (CALayer *)[[TSDFrameRep alloc] initWithTSDFrame:v3];
      return;
    }
    uint64_t v5 = [(CALayer *)mReflectionPlayerStrokeLayer frame];
    long long v6 = self->mReflectionPlayerStrokeLayer;
    if ((id)v5 != v3)
    {

      self->mReflectionPlayerStrokeLayer = 0;
      goto LABEL_6;
    }
    if (!v6) {
      goto LABEL_6;
    }
  }
  else
  {
    long long v7 = self->mReflectionPlayerStrokeLayer;
    if (v7)
    {

      self->mReflectionPlayerStrokeLayer = 0;
    }
  }
}

- (void)i_updateFrameRep
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDMediaRep *)&v3 i_updateFrameRep];
  if (self->super.super.mReflectionLayer || [(TSDStyledRep *)self shouldShowReflection]) {
    [(TSDMovieRep *)self p_updateReflectionFrameRep];
  }
}

- (void)p_commonDrawStrokeInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  CGContextScaleCTM(a3, v5, v5);
  [(TSDMovieRep *)self p_drawInContext:a3 withContent:0 withStroke:1 withOpacity:0 withMask:0 forShadowOrHitTest:0.0];

  CGContextRestoreGState(a3);
}

- (void)p_applyBasicStrokeToLayer:(id)a3 layer:(id)a4 bounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v12 = v11;
  objc_msgSend(a4, "setBounds:", x, y, width, height);
  objc_msgSend(a3, "applyToRepRenderable:withScale:", +[TSDRenderable renderableFromLayer:](TSDRenderable, "renderableFromLayer:", a4), v12);
  Mutable = CGPathCreateMutable();
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  CGPathAddRect(Mutable, 0, v15);
  [a4 setHidden:0];
  [a4 setPath:Mutable];

  CGPathRelease(Mutable);
}

- (void)p_updateStrokeLayerForStroke:(id)a3 repLayer:(id)a4
{
  id v7 = [(TSDMovieRep *)self playerStrokeLayer];
  id v8 = [(TSDMovieRep *)self reflectionPlayerStrokeLayer];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(TSDCanvas *)[(TSDRep *)self canvas] viewScale];
  double v10 = v9;
  BOOL v11 = [(TSDMovieRep *)self p_needsTilingLayerForStroke:a3];
  long long v75 = 0u;
  memset(&v76, 0, sizeof(v76));
  long long v74 = 0u;
  [(TSDRep *)self computeDirectLayerFrame:&v74 andTransform:&v76 basedOnLayoutGeometry:[(TSDLayout *)[(TSDRep *)self layout] pureGeometry]];
  long long v12 = v75;
  double v13 = TSDRectWithSize();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v20 = TSDCenterOfRect(*(CGFloat *)&v74, *((CGFloat *)&v74 + 1), *(CGFloat *)&v12, *((CGFloat *)&v12 + 1));
  double v22 = v21;
  [v7 position];
  if (v24 != v20 || v23 != v22) {
    objc_msgSend(v7, "setPosition:", v20, v22);
  }
  mMaskLayer = self->super.mMaskLayer;
  if (mMaskLayer) {
    [(CAShapeLayer *)mMaskLayer affineTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  CGAffineTransform t2 = v76;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    CGAffineTransform v71 = v76;
    [v7 setAffineTransform:&v71];
  }
  [(TSDStyledRep *)self opacity];
  double v27 = v26;
  [v7 opacity];
  double v29 = v28;
  if (v27 != v29)
  {
    *(float *)&double v29 = v27;
    [v7 setOpacity:v29];
  }
  if (self->super.super.mReflectionLayer)
  {
    mPlayerStrokeLayer = self->mPlayerStrokeLayer;
    if (mPlayerStrokeLayer)
    {
      [(CALayer *)mPlayerStrokeLayer opacity];
      double v32 = v31;
      if (v27 != v32)
      {
        *(float *)&double v32 = v27;
        [v8 setOpacity:v32];
      }
    }
  }
  if ([a3 isFrame])
  {
    double v33 = TSDMultiplyRectScalar(*(double *)&v74, *((CGFloat *)&v74 + 1), *(CGFloat *)&v75, *((CGFloat *)&v75 + 1), 1.0 / v10);
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v70 = v38;
    objc_msgSend(a3, "coverageRectWithoutAdornment:");
    double x = v77.origin.x;
    CGFloat y = v77.origin.y;
    double width = v77.size.width;
    double height = v77.size.height;
    if (!CGRectEqualToRect(v77, *(CGRect *)&self->super.mFrameRep))
    {
      double v66 = v33;
      double v43 = TSDCenterOfRect(v33, v35, v37, v70);
      CGFloat v67 = y;
      v68 = *(TSDFrameRep **)&x;
      double v45 = TSDSubtractPoints(v43, v44, x);
      objc_msgSend(v7, "setAnchorPoint:", v45 / width, v46 / height);
      double v69 = v10;
      TSDMultiplySizeScalar(width, height, v10);
      double v47 = TSDRectWithSize();
      double v49 = v48;
      double v51 = v50;
      double v53 = v52;
      [v7 bounds];
      v80.origin.double x = v47;
      v80.origin.CGFloat y = v49;
      v80.size.double width = v51;
      v80.size.double height = v53;
      if (!CGRectEqualToRect(v78, v80)) {
        objc_msgSend(v7, "setBounds:", v47, v49, v51, v53);
      }
      [(TSDMovieRep *)self i_updateFrameRep];
      mFrameMaskLayer = self->super.mFrameMaskLayer;
      mTapToReplaceLayer = self->super.mTapToReplaceLayer;
      long long v64 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      long long v65 = *MEMORY[0x263F000D0];
      *(_OWORD *)&t2.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&t2.c = v64;
      long long v63 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      *(_OWORD *)&t2.tdouble x = v63;
      -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](mFrameMaskLayer, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v7, a4, mTapToReplaceLayer, &t2, v66, v35, v37, v70, v69);
      if (self->super.super.mReflectionLayer && self->mMovieReflectionMaskLayer)
      {
        [v8 bounds];
        v81.origin.double x = v47;
        v81.origin.CGFloat y = v49;
        v81.size.double width = v51;
        v81.size.double height = v53;
        if (!CGRectEqualToRect(v79, v81)) {
          objc_msgSend(v8, "setBounds:", v47, v49, v51, v53);
        }
        mReflectionPlayerStrokeLayer = self->mReflectionPlayerStrokeLayer;
        mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
        mReflectionPlayerLayer = self->mReflectionPlayerLayer;
        *(_OWORD *)&t2.a = v65;
        *(_OWORD *)&t2.c = v64;
        *(_OWORD *)&t2.tdouble x = v63;
        -[CALayer updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:](mReflectionPlayerStrokeLayer, "updateCALayer:toRect:withRepLayer:maskLayer:viewScale:maskLayerTransform:", v8, mMovieReflectionMaskLayer, mReflectionPlayerLayer, &t2, v66, v35, v37, v70, v69);
      }
      self->super.mFrameRep = v68;
      self->super.mLastPictureFrameLayerRect.origin.double x = v67;
      self->super.mLastPictureFrameLayerRect.origin.CGFloat y = width;
      self->super.mLastPictureFrameLayerRect.size.double width = height;
    }
  }
  else
  {
    -[TSDMovieRep p_strokeFrameForLayerFrame:](self, "p_strokeFrameForLayerFrame:", v13, v15, v17, v19);
    -[TSDMovieRep p_setPositionAndBoundsIfDifferent:position:bounds:](self, "p_setPositionAndBoundsIfDifferent:position:bounds:", v7, v20, v22, v59, v60, v61, v62);
    if (!v11)
    {
      -[TSDMovieRep p_applyBasicStrokeToLayer:layer:bounds:](self, "p_applyBasicStrokeToLayer:layer:bounds:", a3, [(TSDMovieRep *)self p_shapeLayerForPlayerStroke], v13, v15, v17, v19);
      if (self->super.super.mReflectionLayer)
      {
        if (self->mMovieReflectionMaskLayer) {
          -[TSDMovieRep p_applyBasicStrokeToLayer:layer:bounds:](self, "p_applyBasicStrokeToLayer:layer:bounds:", a3, [(TSDMovieRep *)self p_shapeLayerForReflectionStroke], v13, v15, v17, v19);
        }
      }
    }
  }
  [MEMORY[0x263F158F8] commit];
}

- (void)p_drawReflectionGradientIntoMovieReflectionLayer:(CGContext *)a3 reflectionSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  CGContextSaveGState(a3);
  CGContextSetFillColorWithColor(a3, (CGColorRef)objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C808], "whiteColor"), "CGColor"));
  v9.origin.double x = TSDRectWithSize();
  CGContextFillRect(a3, v9);
  -[TSDStyledRep drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:](self, "drawGradientWithAlphaOverReflection:applyingOpacity:reflectionSize:", a3, 0, width, height);

  CGContextRestoreGState(a3);
}

- (void)p_updateMovieReflectionMaskLayer
{
  [(CALayer *)self->mLayerToStroke bounds];
  double v4 = v3;
  double v6 = v5;
  [(CALayer *)self->mLayerToStroke bounds];
  -[CALayer setBounds:](self->mMovieReflectionLayer, "setBounds:");
  id v7 = TSDBitmapContextCreate(11, v4);
  -[TSDMovieRep p_drawReflectionGradientIntoMovieReflectionLayer:reflectionSize:](self, "p_drawReflectionGradientIntoMovieReflectionLayer:reflectionSize:", v7, v4, v6);
  Image = CGBitmapContextCreateImage(v7);
  [(CALayer *)self->mMovieReflectionLayer setContents:Image];
  [(CALayer *)self->mLayerToStroke setMask:self->mMovieReflectionLayer];
  CGContextRelease(v7);

  CGImageRelease(Image);
}

- (void)p_drawPosterImageInContext:(CGContext *)a3
{
  CGContextSaveGState(a3);
  [(TSDMediaLayout *)[(TSDMediaRep *)self mediaLayout] boundsForStandardKnobs];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(TSDMovieRep *)self alternatePosterImage];
  if (v13)
  {
    double v14 = v13;
    v22.origin.double x = v6;
    v22.origin.CGFloat y = v8;
    v22.size.double width = v10;
    v22.size.double height = v12;
    double MinY = CGRectGetMinY(v22);
    v23.origin.double x = v6;
    v23.origin.CGFloat y = v8;
    v23.size.double width = v10;
    v23.size.double height = v12;
    CGFloat MaxY = CGRectGetMaxY(v23);
    CGContextTranslateCTM(a3, 0.0, MinY + MaxY);
    CGContextScaleCTM(a3, 1.0, -1.0);
    v24.origin.double x = v6;
    v24.origin.CGFloat y = v8;
    v24.size.double width = v10;
    v24.size.double height = v12;
    CGContextDrawImage(a3, v24, v14);
  }
  else
  {
    id v17 = +[TSDImageProviderPool sharedPool];
    double v18 = [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] posterImageData];
    if (v18)
    {
      double v19 = v18;
      objc_opt_class();
      [v17 providerForData:v19 shouldValidate:1];
      double v20 = (void *)TSUDynamicCast();
      if (v20) {
        objc_msgSend(v20, "drawImageInContext:rect:", a3, v6, v8, v10, v12);
      }
    }
  }

  CGContextRestoreGState(a3);
}

- (void)p_drawInContext:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(double)a6 withMask:(BOOL)a7 forShadowOrHitTest:(BOOL)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  BOOL v11 = a4;
  if ((objc_msgSend(-[TSDStyledRep styledLayout](self, "styledLayout", a3, a4, a5, a7, a8), "isInvisible") & 1) == 0)
  {
    [(TSDMovieRep *)self i_updateFrameRep];
    id v14 = [(TSDLayout *)[(TSDRep *)self layout] stroke];
    id v15 = v14;
    if (v14)
    {
      if ([v14 shouldRender])
      {
        if ([(TSDCanvas *)[(TSDRep *)self canvas] shouldSuppressBackgrounds]
          && ([v15 isFrame] & 1) == 0)
        {
          id v15 = (id)[v15 mutableCopy];
          objc_msgSend(v15, "setColor:", objc_msgSend(MEMORY[0x263F7C808], "blackColor"));
        }
      }
      else
      {
        id v15 = 0;
      }
    }
    BOOL v16 = a6 < 1.0 && v10;
    int v17 = v16 && v11;
    if (v16 && v11 && (CGContextSaveGState(a3), CGContextSetAlpha(a3, a6), v15))
    {
      CGContextBeginTransparencyLayer(a3, 0);
      int v18 = 1;
    }
    else
    {
      int v18 = 0;
    }
    CGContextSaveGState(a3);
    double v19 = [(TSDMediaRep *)self mediaLayout];
    [(TSDMediaLayout *)v19 boundsForStandardKnobs];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    if (v11)
    {
      if (v8 && self->super.mFrameMaskLayer && [v15 hasMask])
      {
        objc_msgSend(v15, "coverageRect:", v21, v23, v25, v27);
        -[CALayer applyMaskForRectWithCoverage:toContext:](self->super.mFrameMaskLayer, "applyMaskForRectWithCoverage:toContext:", a3);
      }
      [(TSDMovieRep *)self p_drawPosterImageInContext:a3];
    }
    CGContextRestoreGState(a3);
    if (v10 && v15)
    {
      CGContextSaveGState(a3);
      if ([v15 isFrame])
      {
        if ([(TSDMediaLayout *)v19 shouldRenderFrameStroke])
        {
          mFrameMaskLayer = self->super.mFrameMaskLayer;
          CGContextGetCTM(&v29, a3);
          -[CALayer frameRect:inContext:withTotalScale:](mFrameMaskLayer, "frameRect:inContext:withTotalScale:", a3, v21, v23, v25, v27, TSDTransformScale(&v29.a));
        }
      }
      else
      {
        objc_msgSend(v15, "paintRect:inContext:", a3, v21, v23, v25, v27);
      }
      CGContextRestoreGState(a3);
    }
    if (v18) {
      CGContextEndTransparencyLayer(a3);
    }
    if (v17) {
      CGContextRestoreGState(a3);
    }
  }
}

- (void)drawInContextWithoutEffects:(CGContext *)a3 withContent:(BOOL)a4 withStroke:(BOOL)a5 withOpacity:(BOOL)a6 forAlphaOnly:(BOOL)a7 drawChildren:(BOOL)a8
{
  BOOL v8 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  double v13 = 1.0;
  if (a6) {
    [(TSDStyledRep *)self opacity];
  }

  -[TSDMovieRep p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:](self, "p_drawInContext:withContent:withStroke:withOpacity:withMask:forShadowOrHitTest:", a3, v10, v9, 1, v8, a8, v13);
}

- (void)drawInLayerContext:(CGContext *)a3
{
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x263EFF9D0], "null", a3, a4);
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  -[TSDMediaRep processChangedProperty:](&v5, sel_processChangedProperty_);
  switch(a3)
  {
    case 517:
      [(TSDMovieRep *)self i_updateFrameRep];
      [(TSDMovieRep *)self p_disposeStrokeLayer];
      [(TSDMovieRep *)self p_disposeMaskLayer];
      [(TSDMovieRep *)self p_disposeReflectionStrokeLayers];
      goto LABEL_3;
    case 518:
    case 519:
    case 520:
LABEL_3:
      [(TSDStyledRep *)self setNeedsDisplay];
      break;
    case 532:
      [(TSDMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateLayer];
      [(TSDCanvas *)[(TSDRep *)self canvas] invalidateLayers];
      [(TSDMovieRep *)self p_stopUpdatingUIStateForMoviePlayability];
      [(TSDMovieRep *)self p_updateUIStateForMoviePlayability];
      break;
    case 533:
      [(TSDStyledRep *)self setNeedsDisplay];
      [(TSDCanvas *)[(TSDRep *)self canvas] invalidateLayers];
      break;
    case 534:
      [(TSDMovieRep *)self p_updateStartTime];
      break;
    case 535:
      [(TSDMovieRep *)self p_updateEndTime];
      break;
    case 537:
      [(TSDMovieRep *)self p_updateRepeatMode];
      break;
    case 538:
      [(TSDMovieRep *)self p_updateVolume];
      break;
    default:
      return;
  }
}

- (void)becameSelected
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDRep *)&v3 becameSelected];
  if ([(TSDMovieRep *)self p_shouldPlayerControllerExistThroughoutSelection])
  {
    [(TSDMovieRep *)self p_setupPlayerControllerIfNecessary];
  }
  else
  {
    [(TSDMovieRep *)self p_updatePlayButtonVisibility];
  }
}

- (void)becameNotSelected
{
  [(TSDMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateLayer];
  [(TSDMovieRep *)self p_updatePlayButtonVisibility];
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDRep *)&v3 becameNotSelected];
}

- (BOOL)shouldSingleTapPlay
{
  return ![(TSDMovieRep *)self p_playButtonFitsInFrame];
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)handleSingleTapAtPoint:(CGPoint)a3
{
  BOOL v4 = [(TSDMovieRep *)self isPlaying];
  if (v4
    || (BOOL v5 = [(TSDRep *)self isSelectedIgnoringLocking])
    && (BOOL v5 = [(TSDMovieRep *)self shouldSingleTapPlay])
    && (BOOL v5 = [(TSDMovieRep *)self isPlayable]))
  {
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "setPlaying:", !v4);
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)p_updateRepeatMode
{
  if (![(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isStreaming])
  {
    uint64_t v3 = TSKPlayerRepeatModeForMovieLoopOption([(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] loopOption]);
    id v4 = [(TSDMovieRep *)self playerController];
    [v4 setRepeatMode:v3];
  }
}

- (void)screenScaleDidChange
{
  *(void *)&self->mDidCheckPlayabilitCGFloat y = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDRep *)&v3 screenScaleDidChange];
}

- (void)p_addPlayButtonToKnobs:(id)a3
{
  objc_msgSend(a3, "addObject:", -[TSDMovieRep p_playButtonKnob](self, "p_playButtonKnob"));
  [(TSDMovieRep *)self p_updateUIStateForMoviePlayability];

  [(TSDMovieRep *)self p_updatePlayButtonVisibility];
}

- (void)addKnobsToArray:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  -[TSDMediaRep addKnobsToArray:](&v5, sel_addKnobsToArray_);
  [(TSDMovieRep *)self p_addPlayButtonToKnobs:a3];
}

- (unint64_t)enabledKnobMask
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  unint64_t v3 = [(TSDRep *)&v5 enabledKnobMask];
  if ([(TSDMediaRep *)self shouldCreateKnobs]
    && [(TSDRep *)self isSelected]
    && ![(TSDMovieRep *)self p_playButtonFitsInFrame])
  {
    return v3 & 0x28A;
  }
  return v3;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  if ([(TSDMovieRep *)self p_playButtonKnob] == a3) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDMovieRep;
  return [(TSDRep *)&v6 directlyManagesVisibilityOfKnob:a3];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)TSDMovieRep;
  [(TSDRep *)&v3 willBeRemoved];
  [(TSDMovieRep *)self p_cancelUpdatingUIStateForMoviePlayability];
  [(TSDMovieRep *)self p_teardownPlayerController];
}

- (void)willBeginReadMode
{
  BYTE2(self->mPlayButtonKnob) = 1;
  [(TSDMovieRep *)self p_updatePlayButtonVisibility];

  [(TSDMovieRep *)self p_teardownPlayerController];
}

- (void)willEndReadMode
{
  BYTE2(self->mPlayButtonKnob) = 0;
  [(TSDMovieRep *)self p_updatePlayButtonVisibility];
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (TSDButtonKnob)p_playButtonKnob
{
  CGRect result = *(TSDButtonKnob **)&self->mDidCheckPlayability;
  if (!result)
  {
    *(void *)&self->mDidCheckPlayabilitCGFloat y = -[TSDButtonKnob initWithImage:tag:onRep:]([TSDMovieKnob alloc], "initWithImage:tag:onRep:", [MEMORY[0x263F7C858] imageNamed:@"TSDMoviePlay" inBundle:TSDBundle()], 5, self);
    LOBYTE(self->mPlayButtonKnob) = 1;
    [*(id *)&self->mDidCheckPlayability setWorksWhenRepLocked:1];
    [*(id *)&self->mDidCheckPlayability setWorksWhenInVersionBrowsingMode:1];
    return *(TSDButtonKnob **)&self->mDidCheckPlayability;
  }
  return result;
}

- (void)p_updateUIStateForMoviePlayability
{
  if (!LOBYTE(self->mAssetForPlayability) && !self->mReflectionFrameMaskLayer)
  {
    objc_super v3 = [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] movieData];
    if (v3)
    {
      id v4 = [(TSPData *)v3 AVAsset];
      self->mReflectionFrameMaskLayer = (CALayer *)v4;
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke;
      v6[3] = &unk_2646B0750;
      v6[4] = v4;
      v6[5] = self;
      [v4 loadValuesAsynchronouslyForKeys:&unk_26D7393A8 completionHandler:v6];
    }
    else
    {
      LOBYTE(self->mAssetForPlayability) = 1;
      BYTE1(self->mAssetForPlayability) = 1;
      objc_super v5 = [(TSDMovieRep *)self p_playButtonKnob];
      [(TSDButtonKnob *)v5 setEnabled:1];
    }
  }
}

void __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke(uint64_t a1)
{
  Main = CFRunLoopGetMain();
  objc_super v3 = (const void *)*MEMORY[0x263EFFE78];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke_2;
  v4[3] = &unk_2646B0750;
  long long v5 = *(_OWORD *)(a1 + 32);
  CFRunLoopPerformBlock(Main, v3, v4);
  CFRunLoopWakeUp(Main);
}

void __49__TSDMovieRep_p_updateUIStateForMoviePlayability__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) statusOfValueForKey:@"playable" error:0];
  if (v2 != 4)
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 528) = 1;
    if (v2 == 2) {
      char v3 = [*(id *)(a1 + 32) isPlayable];
    }
    else {
      char v3 = 0;
    }
    *(unsigned char *)(*(void *)(a1 + 40) + 529) = v3;
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "p_playButtonKnob"), "setEnabled:", *(unsigned __int8 *)(*(void *)(a1 + 40) + 529));
    objc_msgSend(*(id *)(a1 + 40), "p_updatePlayButtonVisibility");
  }
  id v4 = *(void **)(*(void *)(a1 + 40) + 520);
  if (v4 == *(void **)(a1 + 32))
  {

    *(void *)(*(void *)(a1 + 40) + 520) = 0;
  }
}

- (void)p_stopUpdatingUIStateForMoviePlayability
{
  self->mReflectionFrameMaskLayer = 0;
  LOBYTE(self->mAssetForPlayability) = 0;
}

- (void)p_cancelUpdatingUIStateForMoviePlayability
{
  BYTE1(self->mPlayButtonKnob) = 1;
}

- (BOOL)p_playButtonFitsInFrame
{
  char v3 = [(TSDRep *)self interactiveCanvasController];
  [(CALayer *)[(TSDKnob *)[(TSDMovieRep *)self p_playButtonKnob] layer] frame];
  double v5 = v4;
  double v7 = v6;
  [(TSDRep *)self naturalBounds];
  -[TSDInteractiveCanvasController convertUnscaledToBoundsRect:](v3, "convertUnscaledToBoundsRect:");
  return v7 <= v9 && v5 <= v8;
}

- (void)p_updatePlayButtonVisibility
{
  if (![(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive]
    || BYTE1(self->mPlayButtonKnob))
  {
    return;
  }
  char v3 = [(TSDCanvasSelection *)[(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor] canvasSelection] infos];
  double v4 = [(TSDMovieRep *)self movieInfo];
  if ([(NSSet *)v3 count] == 1) {
    double v5 = [(NSSet *)v3 anyObject];
  }
  else {
    double v5 = 0;
  }
  BOOL v6 = [(TSDMovieRep *)self p_playButtonFitsInFrame];
  if (LOBYTE(self->mAssetForPlayability)) {
    BOOL v7 = v5 == v4;
  }
  else {
    BOOL v7 = 0;
  }
  if (!v7) {
    goto LABEL_14;
  }
  int v8 = 0;
  if (![(TSDMovieRep *)self isPlaying] && v6)
  {
    if (BYTE2(self->mPlayButtonKnob))
    {
LABEL_14:
      int v8 = 0;
      goto LABEL_15;
    }
    int v8 = self->mAlternatePosterImage == 0;
  }
LABEL_15:
  if (LOBYTE(self->mPlayButtonKnob) != v8)
  {
    LOBYTE(self->mPlayButtonKnob) = v8;
    double v9 = [(TSDKnob *)[(TSDMovieRep *)self p_playButtonKnob] layer];
    BOOL v10 = v9;
    double v11 = 0.0;
    if (v8) {
      *(float *)&double v11 = 1.0;
    }
    [(CALayer *)v9 setOpacity:v11];
    if (LOBYTE(self->mPlayButtonKnob))
    {
      double v12 = [(TSDRep *)self canvas];
      [(TSDCanvas *)v12 invalidateLayers];
    }
    else
    {
      if (v5 == v4) {
        char v13 = 0;
      }
      else {
        char v13 = [(objc_class *)[(TSDMovieInfo *)v5 repClass] isSubclassOfClass:objc_opt_class()];
      }
      if (!BYTE2(self->mPlayButtonKnob)
        && v6
        && (v13 & 1) == 0
        && [(CALayer *)v10 superlayer]
        && LOBYTE(self->mAssetForPlayability))
      {
        id v14 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
        LODWORD(v15) = 1.0;
        objc_msgSend(v14, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", v15));
        objc_msgSend(v14, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
        [v14 setDuration:0.4];
        [(CALayer *)v10 addAnimation:v14 forKey:@"opacity"];
      }
    }
  }
}

- (id)playerController
{
  return *(id *)&self->super.mLastPictureFrameLayerRect.size.height;
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  double v5 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v5 presentError:a4 completionHandler:0];
}

- (void)playbackDidStopForPlayerController:(id)a3
{
  [(TSDMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateLayer];
  double v4 = [(TSDRep *)self canvas];

  [(TSDCanvas *)v4 invalidateLayers];
}

- (BOOL)isPlaying
{
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0) {
    LOBYTE(height) = [*(id *)&height isPlaying];
  }
  return LOBYTE(height);
}

- (void)p_playForKnob
{
  if ([(TSDMovieRep *)self isPlayable])
  {
    id v3 = [(TSDMovieRep *)self playerController];
    [v3 setPlaying:1];
  }
}

- (void)p_togglePlaying
{
  if ([(TSDMovieRep *)self isPlayable])
  {
    id v3 = [(TSDMovieRep *)self playerController];
    uint64_t v4 = objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "isPlaying") ^ 1;
    [v3 setPlaying:v4];
  }
}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setupPlayerControllerIfNecessary
{
  if (!*(void *)&self->super.mLastPictureFrameLayerRect.size.height)
  {
    id v3 = objc_alloc(MEMORY[0x263EFA7F0]);
    id v4 = (id)objc_msgSend(v3, "initWithPlayerItem:", objc_msgSend(MEMORY[0x263EFA800], "playerItemWithAsset:", -[TSDMovieInfo makeAVAsset](-[TSDMovieRep movieInfo](self, "movieInfo"), "makeAVAsset")));
    [(TSDMovieRep *)self willChangeValueForKey:@"playerController"];
    *(void *)&self->super.mLastPictureFrameLayerRect.size.CGFloat height = [[TSKAVPlayerController alloc] initWithPlayer:v4 delegate:self];
    [(TSDMovieRep *)self didChangeValueForKey:@"playerController"];
    [(TSDMovieRep *)self p_updateStartTime];
    [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] endTime];
    if (v5 != 0.0) {
      [(TSDMovieRep *)self p_updateEndTime];
    }
    [(TSDMovieRep *)self p_updateRepeatMode];
    [(TSDMovieRep *)self p_updateVolume];
    [*(id *)&self->super.mLastPictureFrameLayerRect.size.height addObserver:self forKeyPath:@"playing" options:4 context:TSDMovieRepPlayerControllerPlayingObserverContext];
    [(TSDMovieRep *)self p_setupPlayerLayerIfNecessary];
    BOOL v6 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    BOOL v7 = [(TSDRep *)self interactiveCanvasController];
    [v6 postNotificationName:@"TSDInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification" object:v7];
  }
}

- (void)p_teardownPlayerController
{
  [(TSDMovieRep *)self p_setNeedsTeardownPlayerControllerOnUpdateLayer];

  [(TSDMovieRep *)self p_teardownPlayerControllerIfNeeded];
}

- (void)p_setNeedsTeardownPlayerControllerOnUpdateLayer
{
  BYTE5(self->mIsChangingDynamicVisibleTimeCount) = 1;
}

- (void)p_teardownPlayerControllerIfNeeded
{
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0 && BYTE5(self->mIsChangingDynamicVisibleTimeCount))
  {
    if ([*(id *)&height isPlaying]) {
      [*(id *)&self->super.mLastPictureFrameLayerRect.size.height setPlaying:0];
    }
    [*(id *)&self->super.mLastPictureFrameLayerRect.size.height removeObserver:self forKeyPath:@"playing"];
    if (LOBYTE(self->mPlayerController)) {
      [*(id *)&self->mCurrentlyObservingPlayerLayer removeObserver:self forKeyPath:@"readyForDisplay" context:TSDMovieRepPlayerLayerReadyForDisplayObserverContext];
    }
    [(TSDMovieRep *)self willChangeValueForKey:@"playerController"];
    [*(id *)&self->super.mLastPictureFrameLayerRect.size.height teardown];

    self->super.mLastPictureFrameLayerRect.size.CGFloat height = 0.0;
    [(TSDMovieRep *)self didChangeValueForKey:@"playerController"];
    BYTE1(self->mPlayerController) = 0;
    mPlayerLayer = self->mPlayerLayer;
    double v5 = *(AVPlayerLayer **)&self->mCurrentlyObservingPlayerLayer;
    if (mPlayerLayer == v5)
    {

      self->mPlayerLayer = 0;
      double v5 = *(AVPlayerLayer **)&self->mCurrentlyObservingPlayerLayer;
    }
    [(AVPlayerLayer *)v5 setDelegate:0];

    *(void *)&self->mCurrentlyObservingPlayerLayer = 0;
    mReflectionPlayerLayer = self->mReflectionPlayerLayer;
    if (mReflectionPlayerLayer)
    {
      [(AVPlayerLayer *)mReflectionPlayerLayer setDelegate:0];
      [(AVPlayerLayer *)self->mReflectionPlayerLayer removeFromSuperlayer];

      self->mReflectionPlayerLayer = 0;
    }
    mMovieReflectionMaskLayer = self->mMovieReflectionMaskLayer;
    if (mMovieReflectionMaskLayer)
    {
      [(CALayer *)mMovieReflectionMaskLayer setDelegate:0];
      [(CALayer *)self->mMovieReflectionMaskLayer removeFromSuperlayer];

      self->mMovieReflectionMaskLayer = 0;
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", @"TSDInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification", -[TSDRep interactiveCanvasController](self, "interactiveCanvasController"));
  }
  BYTE5(self->mIsChangingDynamicVisibleTimeCount) = 0;
}

- (void)p_updateVolume
{
  [(TSDMovieRep *)self volume];
  int v4 = v3;
  id v5 = [(TSDMovieRep *)self playerController];
  LODWORD(v6) = v4;

  [v5 setVolume:v6];
}

- (void)p_updateStartTime
{
  if (![(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isStreaming])
  {
    [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] startTime];
    double v4 = v3;
    id v5 = [(TSDMovieRep *)self playerController];
    [v5 setStartTime:v4];
  }
}

- (void)p_updateEndTime
{
  if (![(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isStreaming])
  {
    [(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] endTime];
    double v4 = v3;
    id v5 = [(TSDMovieRep *)self playerController];
    [v5 setEndTime:v4];
  }
}

- (id)additionalLayersUnderLayer
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  double v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDStyledRep additionalLayersUnderLayer](&v5, sel_additionalLayersUnderLayer));
  if (self->mLayerToStroke && [(TSDStyledRep *)self shouldShowReflection]) {
    [v3 addObject:self->mLayerToStroke];
  }
  return v3;
}

- (id)additionalLayersOverLayer
{
  v7.receiver = self;
  v7.super_class = (Class)TSDMovieRep;
  double v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithArray:", -[TSDMediaRep additionalLayersOverLayer](&v7, sel_additionalLayersOverLayer));
  double v4 = v3;
  if (*(void *)&self->mCurrentlyObservingPlayerLayer) {
    objc_msgSend(v3, "addObject:");
  }
  id v5 = [(TSDMovieRep *)self playerStrokeLayer];
  if (v5) {
    [v4 addObject:v5];
  }
  return v4;
}

- (BOOL)canResetMediaSize
{
  v5.receiver = self;
  v5.super_class = (Class)TSDMovieRep;
  BOOL v3 = [(TSDMediaRep *)&v5 canResetMediaSize];
  if (v3)
  {
    if ([(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isAudioOnly]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(TSDMovieInfo *)[(TSDMovieRep *)self movieInfo] isStreaming];
    }
  }
  return v3;
}

- (BOOL)isDraggable
{
  return 1;
}

- (void)setAlternatePosterImage:(CGImage *)a3
{
  if (*(CGImage **)&self->mPlayButtonKnobVisible != a3)
  {
    CGImageRetain(a3);
    CGImageRelease(*(CGImageRef *)&self->mPlayButtonKnobVisible);
    *(void *)&self->mPlayButtonKnobVisible = a3;
    [(TSDStyledRep *)self setNeedsDisplay];
    objc_super v5 = [(TSDRep *)self canvas];
    [(TSDCanvas *)v5 invalidateLayers];
  }
}

- (double)visibleTime
{
  if (self->mAlternatePosterImage)
  {
    id v2 = [(TSDMovieRep *)self playerController];
    [v2 absoluteCurrentTime];
  }
  else
  {
    double v4 = [(TSDMovieRep *)self movieInfo];
    [(TSDMovieInfo *)v4 posterTime];
  }
  return result;
}

- (void)dynamicVisibleTimeChangeDidBegin
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMovieRep dynamicVisibleTimeChangeDidBegin]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2125, @"Dynamic poster time changes can only be made on the main thread");
  }
  mAlternatePosterImage = self->mAlternatePosterImage;
  self->mAlternatePosterImage = (CGImage *)((char *)mAlternatePosterImage + 1);
  if (!mAlternatePosterImage)
  {
    [(TSDMovieRep *)self p_updatePlayButtonVisibility];
    id v6 = [(TSDMovieRep *)self playerController];
    [v6 beginScrubbing];
  }
}

- (void)dynamicVisibleTimeUpdateToValue:(double)a3 withTolerance:(double)a4 completionHandler:(id)a5
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    double v9 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSDMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2136, @"Dynamic poster time changes can only be made on the main thread");
  }
  if (!self->mAlternatePosterImage)
  {
    double v11 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v12 = [NSString stringWithUTF8String:"-[TSDMovieRep dynamicVisibleTimeUpdateToValue:withTolerance:completionHandler:]"];
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2137, @"A dynamic poster time change must be in progress");
  }
  id v13 = [(TSDMovieRep *)self playerController];

  [v13 scrubToTime:a5 withTolerance:a3 completionHandler:a4];
}

- (void)dynamicVisibleTimeChangeDidEnd
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    BOOL v3 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v4 = [NSString stringWithUTF8String:"-[TSDMovieRep dynamicVisibleTimeChangeDidEnd]"];
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2144, @"Dynamic poster time changes can only be made on the main thread");
  }
  mAlternatePosterImage = self->mAlternatePosterImage;
  if (!mAlternatePosterImage)
  {
    id v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSDMovieRep dynamicVisibleTimeChangeDidEnd]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDMovieRep.m"), 2145, @"Mismatch between starting and ending dynamic visible poster time changes");
    mAlternatePosterImage = self->mAlternatePosterImage;
  }
  int v8 = (CGImage *)((char *)mAlternatePosterImage - 1);
  self->mAlternatePosterImage = v8;
  if (!v8)
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "player"), "currentItem"), "cancelPendingSeeks");
    objc_msgSend(-[TSDMovieRep playerController](self, "playerController"), "endScrubbing");
    [(TSDMovieRep *)self p_updatePlayButtonVisibility];
  }
}

- (float)volume
{
  if (BYTE4(self->mIsChangingDynamicVisibleTimeCount)) {
    return *(float *)&self->mIsChangingDynamicVisibleTimeCount;
  }
  BOOL v3 = [(TSDMovieRep *)self movieInfo];

  [(TSDMovieInfo *)v3 volume];
  return result;
}

- (void)dynamicVolumeChangeDidBegin
{
  [(TSDMovieRep *)self volume];
  LODWORD(self->mIsChangingDynamicVisibleTimeCount) = v3;
  BYTE4(self->mIsChangingDynamicVisibleTimeCount) = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  *(float *)&self->mIsChangingDynamicVisibleTimeCount = a3;
  [(TSDMovieRep *)self p_updateVolume];
}

- (void)dynamicVolumeChangeDidEnd
{
  BYTE4(self->mIsChangingDynamicVisibleTimeCount) = 0;
}

+ (double)magicMoveAttributeMatchPercentBetweenOutgoingObject:(id)a3 incomingObject:(id)a4
{
  uint64_t v6 = objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "mixingTypeWithObject:", objc_msgSend(a4, "movieInfo"));
  double result = 0.0;
  if (v6 != 1)
  {
    objc_msgSend((id)objc_msgSend(a3, "movieInfo", 0.0), "startTime");
    double v9 = v8;
    objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "startTime");
    if (v9 == v10)
    {
      double v14 = 1.0;
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "endTime");
      double v12 = v11;
      objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "startTime");
      if (v12 == v13) {
        double v14 = 0.9;
      }
      else {
        double v14 = 0.5;
      }
    }
    objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "endTime");
    double v16 = v15;
    objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "endTime");
    if (v16 != v17) {
      double v14 = v14 * 0.5;
    }
    objc_msgSend((id)objc_msgSend(a3, "movieInfo"), "posterTime");
    double v19 = v18;
    objc_msgSend((id)objc_msgSend(a4, "movieInfo"), "posterTime");
    if (v19 == v20) {
      return v14;
    }
    else {
      return v14 * 0.5;
    }
  }
  return result;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TSDMovieRepPlayerControllerPlayingObserverContext == a6)
  {
    [(TSDMovieRep *)self p_updatePlayButtonVisibility];
    [(TSDRep *)self invalidateKnobs];
  }
  else if ((void *)TSDMovieRepPlayerLayerReadyForDisplayObserverContext == a6)
  {
    if (objc_msgSend((id)objc_msgSend(a5, "objectForKey:", *MEMORY[0x263F081B8], a4), "BOOLValue"))
    {
      [*(id *)&self->mCurrentlyObservingPlayerLayer removeObserver:self forKeyPath:@"readyForDisplay" context:TSDMovieRepPlayerLayerReadyForDisplayObserverContext];
      LOBYTE(self->mPlayerController) = 0;
      BYTE1(self->mPlayerController) = 1;
      uint64_t v7 = [(TSDRep *)self interactiveCanvasController];
      [(TSDInteractiveCanvasController *)v7 invalidateLayers];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDMovieRep;
    -[TSDMovieRep observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)isPlayable
{
  return BYTE1(self->mAssetForPlayability);
}

- (CGImage)alternatePosterImage
{
  return *(CGImage **)&self->mPlayButtonKnobVisible;
}

@end