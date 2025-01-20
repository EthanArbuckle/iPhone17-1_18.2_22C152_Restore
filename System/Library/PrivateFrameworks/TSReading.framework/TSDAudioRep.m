@interface TSDAudioRep
- (BOOL)canResetMediaSize;
- (BOOL)containsPoint:(CGPoint)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)exclusivelyProvidesGuidesWhileAligning;
- (BOOL)hitPlayPauseButtonWithPoint:(CGPoint)a3;
- (BOOL)isDraggable;
- (BOOL)p_isEditingAnimations;
- (BOOL)p_isPlaying;
- (BOOL)p_shouldPlayerControllerExistThroughoutSelection;
- (BOOL)p_shouldShowPlayPauseLayers;
- (BOOL)providesGuidesWhileAligning;
- (BOOL)shouldAllowReplacementFromDrop;
- (BOOL)shouldAllowReplacementFromPaste;
- (BOOL)shouldShowDragHUD;
- (BOOL)shouldShowKnobs;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)shouldShowSizesInRulers;
- (CGRect)boundsForStandardKnobs;
- (Class)layerClass;
- (TSDAudioHUDController)audioHUDController;
- (TSDAudioRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSDMovieInfo)movieInfo;
- (TSKAVPlayerController)playerController;
- (float)volume;
- (id)hitRepChrome:(CGPoint)a3;
- (id)textureWithContext:(id)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)dealloc;
- (void)didEndZooming;
- (void)dynamicVolumeChangeDidBegin;
- (void)dynamicVolumeChangeDidEnd;
- (void)dynamicVolumeUpdateToValue:(float)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_setupPlayerControllerIfNecessary;
- (void)p_teardownPlayerController;
- (void)p_updateButtonForPlaying:(BOOL)a3 pressed:(BOOL)a4;
- (void)p_updateEndTime;
- (void)p_updateRepeatMode;
- (void)p_updateStartTime;
- (void)p_updateVolume;
- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4;
- (void)processChangedProperty:(int)a3;
- (void)updateLayerGeometryFromLayout:(id)a3;
- (void)updatePlayButtonForPoint:(CGPoint)a3;
- (void)willBeRemoved;
- (void)willBeginReadMode;
- (void)willBeginZooming;
- (void)willUpdateLayer:(id)a3;
@end

@implementation TSDAudioRep

- (TSDAudioRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSDAudioRep;
  v4 = [(TSDRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4 && ![(TSDAudioRep *)v4 movieInfo])
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

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDAudioRep;
  [(TSDMediaRep *)&v3 dealloc];
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)canResetMediaSize
{
  return 0;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (BOOL)p_shouldShowPlayPauseLayers
{
  return 1;
}

- (void)willUpdateLayer:(id)a3
{
  if ([(TSDAudioRep *)self p_shouldShowPlayPauseLayers])
  {
    if (!self->mPlayerController)
    {
      v5 = (TSKAVPlayerController *)(id)[MEMORY[0x263F157E8] layer];
      self->mPlayerController = v5;
      [(TSKAVPlayerController *)v5 setBounds:TSDRectWithSize()];
      [a3 contentsScale];
      -[TSKAVPlayerController setContentsScale:](self->mPlayerController, "setContentsScale:");
      [a3 addSublayer:self->mPlayerController];
    }
    if (!self->mPlayPauseButtonLayer)
    {
      v6 = (CALayer *)(id)[MEMORY[0x263F157E8] layer];
      self->mPlayPauseButtonLayer = v6;
      [(CALayer *)v6 setBounds:TSDRectWithSize()];
      [a3 position];
      -[CALayer setPosition:](self->mPlayPauseButtonLayer, "setPosition:");
      [a3 contentsScale];
      -[CALayer setContentsScale:](self->mPlayPauseButtonLayer, "setContentsScale:");
      [a3 addSublayer:self->mPlayPauseButtonLayer];
    }
    BOOL v7 = [(TSDAudioRep *)self p_isPlaying];
    [(TSDAudioRep *)self p_updateButtonForPlaying:v7 pressed:0];
  }
}

- (void)becameSelected
{
  [*(id *)&self->mDynamicVolume setSelected:1];
  if ([(TSDAudioRep *)self p_shouldPlayerControllerExistThroughoutSelection])
  {
    [(TSDAudioRep *)self p_setupPlayerControllerIfNecessary];
  }
}

- (void)becameNotSelected
{
  [*(id *)&self->mDynamicVolume setSelected:0];
  [(TSDAudioRep *)self p_teardownPlayerController];
  v3.receiver = self;
  v3.super_class = (Class)TSDAudioRep;
  [(TSDRep *)&v3 becameNotSelected];
}

- (void)willBeRemoved
{
  v3.receiver = self;
  v3.super_class = (Class)TSDAudioRep;
  [(TSDRep *)&v3 willBeRemoved];
  [*(id *)&self->mDynamicVolume setSelected:0];
  [(TSDAudioRep *)self p_teardownPlayerController];
}

- (void)willBeginReadMode
{
  if ([(TSDAudioRep *)self p_isPlaying])
  {
    objc_super v3 = [(TSDAudioRep *)self playerController];
    [(TSKAVPlayerController *)v3 setPlaying:0];
  }
}

- (BOOL)hitPlayPauseButtonWithPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(TSDAudioRep *)self p_shouldShowPlayPauseLayers];
  if (v6)
  {
    -[TSDInteractiveCanvasController convertUnscaledToBoundsPoint:]([(TSDRep *)self interactiveCanvasController], "convertUnscaledToBoundsPoint:", x, y);
    -[TSKAVPlayerController convertPoint:fromLayer:](self->mPlayerController, "convertPoint:fromLayer:", objc_msgSend((id)-[TSDCanvasLayerHosting canvasView](-[TSDInteractiveCanvasController layerHost](-[TSDRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "canvasView"), "layer"), v7, v8);
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    [(TSKAVPlayerController *)self->mPlayerController bounds];
    uint64_t v17 = v10;
    uint64_t v18 = v12;
    LOBYTE(v6) = CGRectContainsPoint(*(CGRect *)&v13, *(CGPoint *)&v17);
  }
  return v6;
}

- (void)updatePlayButtonForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(TSDAudioRep *)self p_shouldShowPlayPauseLayers])
  {
    BOOL v6 = -[TSDAudioRep hitPlayPauseButtonWithPoint:](self, "hitPlayPauseButtonWithPoint:", x, y);
    BOOL v7 = [(TSDAudioRep *)self p_isPlaying];
    [(TSDAudioRep *)self p_updateButtonForPlaying:v7 pressed:v6];
  }
}

- (id)hitRepChrome:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v19.receiver = self;
  v19.super_class = (Class)TSDAudioRep;
  id v6 = -[TSDRep hitRepChrome:](&v19, sel_hitRepChrome_);
  if ([(TSDCanvas *)[(TSDRep *)self canvas] isCanvasInteractive])
  {
    BOOL v7 = [(TSDRep *)self interactiveCanvasController];
    [*(id *)&self->mDynamicVolume hudFrame];
    -[TSDInteractiveCanvasController convertBoundsToUnscaledRect:](v7, "convertBoundsToUnscaledRect:");
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    -[TSDRep convertNaturalPointToUnscaledCanvas:](self, "convertNaturalPointToUnscaledCanvas:", x, y);
    v20.double x = v16;
    v20.double y = v17;
    v21.origin.double x = v9;
    v21.origin.double y = v11;
    v21.size.width = v13;
    v21.size.height = v15;
    if (CGRectContainsPoint(v21, v20)) {
      return self;
    }
  }
  return v6;
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 0;
}

- (BOOL)p_isPlaying
{
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0) {
    LOBYTE(height) = [*(id *)&height isPlaying];
  }
  return LOBYTE(height);
}

- (void)processChangedProperty:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSDAudioRep;
  -[TSDMediaRep processChangedProperty:](&v5, sel_processChangedProperty_);
  if (*(void *)&self->super.mLastPictureFrameLayerRect.size.height)
  {
    switch(a3)
    {
      case 532:
        [(TSDAudioRep *)self p_teardownPlayerController];
        [(TSDAudioRep *)self p_setupPlayerControllerIfNecessary];
        break;
      case 534:
        [(TSDAudioRep *)self p_updateStartTime];
        break;
      case 535:
        [(TSDAudioRep *)self p_updateEndTime];
        break;
      case 537:
        [(TSDAudioRep *)self p_updateRepeatMode];
        break;
      case 538:
        [(TSDAudioRep *)self p_updateVolume];
        break;
      default:
        return;
    }
  }
}

- (void)p_updateRepeatMode
{
  uint64_t v3 = TSKPlayerRepeatModeForMovieLoopOption([(TSDMovieInfo *)[(TSDAudioRep *)self movieInfo] loopOption]);
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;

  [*(id *)&height setRepeatMode:v3];
}

- (void)p_updateVolume
{
  [(TSDAudioRep *)self volume];
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;

  objc_msgSend(*(id *)&height, "setVolume:");
}

- (void)p_updateStartTime
{
  [(TSDMovieInfo *)[(TSDAudioRep *)self movieInfo] startTime];
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;

  objc_msgSend(*(id *)&height, "setStartTime:");
}

- (void)p_updateEndTime
{
  [(TSDMovieInfo *)[(TSDAudioRep *)self movieInfo] endTime];
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;

  objc_msgSend(*(id *)&height, "setEndTime:");
}

- (BOOL)isDraggable
{
  return 1;
}

- (BOOL)shouldShowDragHUD
{
  return 0;
}

- (BOOL)shouldShowSizesInRulers
{
  return 0;
}

- (BOOL)shouldShowSelectionHighlight
{
  BOOL v3 = [(TSDRep *)self isLocked];
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)TSDAudioRep;
    LOBYTE(v3) = [(TSDStyledRep *)&v5 shouldShowSelectionHighlight];
  }
  return v3;
}

- (BOOL)p_isEditingAnimations
{
  v2 = [(TSDRep *)self interactiveCanvasController];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }

  return [(TSDInteractiveCanvasController *)v2 isEditingAnimations];
}

- (BOOL)shouldShowKnobs
{
  return 1;
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  [(TSDRep *)self layerFrameInScaledCanvasRelativeToParent];
  double v9 = TSDCenterOfRect(v5, v6, v7, v8);
  double v11 = TSDRectWithCenterAndSize(v9, v10, 130.0);
  double v15 = TSDRoundedRect(v11, v12, v13, v14);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = TSDCenterOfRect(v15, v16, v18, v20);
  double v24 = v23;
  [a3 position];
  if (v26 != v22 || v25 != v24) {
    objc_msgSend(a3, "setPosition:", v22, v24);
  }
  [a3 bounds];
  v33.origin.double x = v15;
  v33.origin.double y = v17;
  v33.size.width = v19;
  v33.size.CGFloat height = v21;
  if (!CGRectEqualToRect(v32, v33)) {
    objc_msgSend(a3, "setBounds:", v15, v17, v19, v21);
  }
  if ([(TSDAudioRep *)self p_shouldShowPlayPauseLayers])
  {
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [a3 position];
    double v29 = v28 + 31.0;
    [a3 position];
    [(TSKAVPlayerController *)self->mPlayerController setPosition:v29];
    [a3 position];
    -[CALayer setPosition:](self->mPlayPauseButtonLayer, "setPosition:");
    v30 = (void *)MEMORY[0x263F158F8];
    [v30 commit];
  }
}

- (CGRect)boundsForStandardKnobs
{
  v16.receiver = self;
  v16.super_class = (Class)TSDAudioRep;
  [(TSDRep *)&v16 boundsForStandardKnobs];
  double v4 = v3;
  double v6 = v5;
  [(TSDCanvas *)self->super.super.super.mCanvas viewScale];
  CGFloat v7 = *(void **)&self->mDynamicVolume;
  double v9 = 1.0 / v8;
  if (v7)
  {
    [v7 hudFrame];
    double v11 = v9 * v10;
    double v13 = v9 * v12;
  }
  else
  {
    double v11 = v9 * 130.0;
    double v13 = v9 * 66.0;
    double v4 = v4 + (130.0 - v9 * 130.0) * 0.5;
    double v6 = v6 + (66.0 - v9 * 66.0) * 0.5;
  }
  double v14 = v4;
  double v15 = v6;
  result.size.CGFloat height = v13;
  result.size.width = v11;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (BOOL)providesGuidesWhileAligning
{
  return 0;
}

- (BOOL)exclusivelyProvidesGuidesWhileAligning
{
  return 1;
}

- (void)willBeginZooming
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v3 setDelegate:0];
  [v3 setDuration:0.15];
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", v4));
  objc_msgSend(v3, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(TSDRep *)self allLayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 setOpacity:0.0];
        [v10 addAnimation:v3 forKey:@"fade out"];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)didEndZooming
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  double v3 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v3 setDelegate:0];
  [v3 setDuration:0.15];
  objc_msgSend(v3, "setFromValue:", objc_msgSend(NSNumber, "numberWithFloat:", 0.0));
  LODWORD(v4) = 1.0;
  objc_msgSend(v3, "setToValue:", objc_msgSend(NSNumber, "numberWithFloat:", v4));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(TSDRep *)self allLayers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        LODWORD(v7) = 1.0;
        [v11 setOpacity:v7];
        [v11 addAnimation:v3 forKey:@"fade in"];
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  [(TSDRep *)self invalidateKnobPositions];
}

- (BOOL)containsPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TSDAudioRep *)self boundsForStandardKnobs];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (id)textureWithContext:(id)a3
{
  return 0;
}

- (void)p_updateButtonForPlaying:(BOOL)a3 pressed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(TSDAudioRep *)self p_isEditingAnimations]
    && [(TSDRep *)self isSelected]
    && v5)
  {
    double v7 = @"sf_canvas_audio_animation_pause-N";
    uint64_t v8 = @"sf_canvas_audio_animation_pause-P";
    goto LABEL_15;
  }
  if ([(TSDAudioRep *)self p_isEditingAnimations]
    && [(TSDRep *)self isSelected]
    && !v5)
  {
    double v7 = @"sf_canvas_audio_animation_play-N";
    uint64_t v8 = @"sf_canvas_audio_animation_play-P";
    goto LABEL_15;
  }
  if ([(TSDRep *)self isSelected] && v5)
  {
    double v7 = @"sf_canvas_audio_selected_pause-N";
    uint64_t v8 = @"sf_canvas_audio_selected_pause-P";
    goto LABEL_15;
  }
  if ([(TSDRep *)self isSelected] && !v5)
  {
    double v7 = @"sf_canvas_audio_selected_play-N";
    uint64_t v8 = @"sf_canvas_audio_selected_play-P";
LABEL_15:
    if (v4) {
      CGFloat v9 = v8;
    }
    else {
      CGFloat v9 = v7;
    }
    goto LABEL_18;
  }
  long long v11 = @"sf_canvas_audio_play-N";
  if (v4) {
    long long v11 = @"sf_canvas_audio_play-P";
  }
  long long v12 = @"sf_canvas_audio_pause-P";
  if (!v4) {
    long long v12 = @"sf_canvas_audio_pause-N";
  }
  if (v5) {
    CGFloat v9 = v12;
  }
  else {
    CGFloat v9 = v11;
  }
LABEL_18:
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  -[CALayer setContents:](self->mPlayPauseButtonLayer, "setContents:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F7C858], "imageNamed:inBundle:", v9, TSDBundle()), "CGImage"));
  CGFloat v10 = (void *)MEMORY[0x263F158F8];

  [v10 commit];
}

- (float)volume
{
  if (BYTE4(self->mAudioImageLayer)) {
    return *(float *)&self->mAudioImageLayer;
  }
  double v3 = [(TSDAudioRep *)self movieInfo];

  [(TSDMovieInfo *)v3 volume];
  return result;
}

- (void)dynamicVolumeChangeDidBegin
{
  [(TSDAudioRep *)self volume];
  LODWORD(self->mAudioImageLayer) = v3;
  BYTE4(self->mAudioImageLayer) = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  *(float *)&self->mAudioImageLayer = a3;
  [(TSDAudioRep *)self p_updateVolume];
}

- (void)dynamicVolumeChangeDidEnd
{
  BYTE4(self->mAudioImageLayer) = 0;
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
    *(void *)&self->super.mLastPictureFrameLayerRect.size.CGFloat height = -[TSKAVPlayerController initWithPlayer:delegate:]([TSKAVPlayerController alloc], "initWithPlayer:delegate:", (id)objc_msgSend(v3, "initWithPlayerItem:", objc_msgSend(MEMORY[0x263EFA800], "playerItemWithAsset:", -[TSDMovieInfo makeAVAsset](-[TSDAudioRep movieInfo](self, "movieInfo"), "makeAVAsset"))), self);
    [(TSDAudioRep *)self p_updateStartTime];
    [(TSDMovieInfo *)[(TSDAudioRep *)self movieInfo] endTime];
    if (v4 != 0.0) {
      [(TSDAudioRep *)self p_updateEndTime];
    }
    [(TSDAudioRep *)self p_updateRepeatMode];
    [(TSDAudioRep *)self p_updateVolume];
    [*(id *)&self->super.mLastPictureFrameLayerRect.size.height addObserver:self forKeyPath:@"playing" options:4 context:TSDAudioRepPlayerControllerPlayingObserverContext];
    CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;
    uint64_t v6 = *(void **)&self->mDynamicVolume;
    [v6 setPlayerController:*(void *)&height];
  }
}

- (void)p_teardownPlayerController
{
  CGFloat height = self->super.mLastPictureFrameLayerRect.size.height;
  if (height != 0.0)
  {
    if ([*(id *)&height isPlaying]) {
      [*(id *)&self->super.mLastPictureFrameLayerRect.size.height setPlaying:0];
    }
    [*(id *)&self->mDynamicVolume setPlayerController:0];
    [*(id *)&self->super.mLastPictureFrameLayerRect.size.height removeObserver:self forKeyPath:@"playing"];
    [*(id *)&self->super.mLastPictureFrameLayerRect.size.height teardown];

    self->super.mLastPictureFrameLayerRect.size.CGFloat height = 0.0;
  }
}

- (TSKAVPlayerController)playerController
{
  return *(TSKAVPlayerController **)&self->super.mLastPictureFrameLayerRect.size.height;
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  BOOL v5 = [(TSDRep *)self interactiveCanvasController];

  [(TSDInteractiveCanvasController *)v5 presentError:a4 completionHandler:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)TSDAudioRepPlayerControllerPlayingObserverContext == a6)
  {
    if ([(TSKAVPlayerController *)[(TSDAudioRep *)self playerController] isPlaying]&& ![(TSDRep *)self isSelected])
    {
      [(TSDCanvasEditor *)[(TSDInteractiveCanvasController *)[(TSDRep *)self interactiveCanvasController] canvasEditor] setSelectionToRep:self];
    }
    if ([(TSDAudioRep *)self p_shouldShowPlayPauseLayers])
    {
      BOOL v7 = [(TSKAVPlayerController *)[(TSDAudioRep *)self playerController] isPlaying];
      [(TSDAudioRep *)self p_updateButtonForPlaying:v7 pressed:0];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)TSDAudioRep;
    -[TSDAudioRep observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (TSDAudioHUDController)audioHUDController
{
  return *(TSDAudioHUDController **)&self->mDynamicVolume;
}

@end