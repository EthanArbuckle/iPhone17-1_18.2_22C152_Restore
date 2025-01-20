@interface CRLAudioRep
- (BOOL)canDrawDownloadProgressPlaceholderImage;
- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3;
- (BOOL)directlyManagesLayerContent;
- (BOOL)directlyManagesVisibilityOfKnob:(id)a3;
- (BOOL)drawAlbumArtInContext:(CGContext *)a3 rect:(CGRect)a4;
- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4;
- (BOOL)hasAlbumArt;
- (BOOL)i_playButtonFitsInFrame;
- (BOOL)isPlayable;
- (BOOL)isPlaying;
- (BOOL)noKnobTogglePlayAndMiniFormatter;
- (BOOL)p_shouldPlayerControllerExistThroughoutSelection;
- (BOOL)p_shouldStopPlayingWhenDeselected;
- (BOOL)p_togglePlayPause;
- (BOOL)shouldAllowReplacementFromDrop;
- (BOOL)shouldAllowReplacementFromPaste;
- (BOOL)shouldBecomeSelectedWhenPlaying;
- (BOOL)shouldHideSelectionHighlightDueToRectangularPath;
- (BOOL)shouldShowDownloadProgressIndicator;
- (BOOL)shouldShowMediaReplaceUI;
- (BOOL)shouldShowSelectionHighlight;
- (BOOL)wantsToHandleDoubleTapsWhenLocked;
- (BOOL)wantsToHandleTapsWhenLocked;
- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4;
- (CGSize)p_playButtonSize;
- (CRLAudioRep)initWithLayout:(id)a3 canvas:(id)a4;
- (CRLCanvasShapeRenderable)audioImageRenderable;
- (CRLMediaPlayerController)playerControllerForcingCreationIfNotPreExisting;
- (_TtC8Freeform12CRLMovieItem)movieItem;
- (double)absoluteCurrentTime;
- (double)ifFitsDrawCreatorWithContext:(CGContext *)a3 rect:(CGRect)a4 topPadding:(double)a5;
- (double)ifFitsDrawTitleWithContext:(CGContext *)a3 rect:(CGRect)a4;
- (double)p_creatorTextHeightWithRect:(CGRect)a3;
- (double)p_playButtonAndMinPaddingHeight:(BOOL)a3;
- (double)p_playButtonAndTitleHeightWithRepSize:(CGSize)a3;
- (double)p_titleTextHeightWithSize:(CGSize)a3;
- (double)p_unscaledPlayButtonAndMinPaddingHeight;
- (double)uploadIndicatorInset;
- (float)volume;
- (id)additionalRenderablesOverRenderable;
- (id)dataForUpdateUploadIndicator;
- (id)downloadProgressPlaceholderImage;
- (id)imageProviderForAlbumArt;
- (id)newTrackerForKnob:(id)a3;
- (id)nowPlayingImageProviderWithPlaybackController:(id)a3;
- (id)nowPlayingTitleWithPlaybackController:(id)a3;
- (id)p_pauseButtonImage;
- (id)p_playButtonImage;
- (id)p_playButtonKnob;
- (id)p_selectionPath;
- (id)p_unpauseButtonImage;
- (id)resizedGeometryForTransform:(CGAffineTransform *)a3;
- (id)unscaledPathToIncludeForSystemPreviewOutline;
- (int64_t)preferredReplacingInterfaceKind;
- (unint64_t)enabledKnobMask;
- (void)addKnobsToArray:(id)a3;
- (void)becameNotSelected;
- (void)becameSelected;
- (void)documentEditabilityDidChange;
- (void)drawInContext:(CGContext *)a3;
- (void)dynamicVolumeChangeDidBegin;
- (void)dynamicVolumeChangeDidEnd;
- (void)dynamicVolumeUpdateToValue:(float)a3;
- (void)enterPreviewMode;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)p_addPlayButtonToKnobs:(id)a3;
- (void)p_cancelPlayabilityCheck;
- (void)p_handleAssetPreparationCompletionForAsset:(id)a3;
- (void)p_hidePlayButton;
- (void)p_listenForAssetChangesIfAppropriate;
- (void)p_playTriggeredFromKnob;
- (void)p_positionPauseButtonImage;
- (void)p_positionPlayButtonImage;
- (void)p_setUpAudioImageRenderablePath:(CGSize)a3;
- (void)p_setUpPlayerControllerIfNecessary;
- (void)p_setUpRenderables;
- (void)p_setUpSpinnerAnimationIfNeeded;
- (void)p_showPlayButton;
- (void)p_teardownPlayerController;
- (void)p_updateAudioImageRenerableAndTrack;
- (void)p_updateDownloadSpinnerState;
- (void)p_updateEndTime;
- (void)p_updateIsLooping;
- (void)p_updatePlayPauseButton;
- (void)p_updatePlayabilityIfNecessary;
- (void)p_updateStartTime;
- (void)p_updateVolume;
- (void)p_workspaceDidActivate:(id)a3;
- (void)pausePlaybackIfNeeded;
- (void)playbackDidStopForPlayerController:(id)a3;
- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4;
- (void)prepareForPreview;
- (void)processChangedProperty:(unint64_t)a3;
- (void)viewScaleDidChange;
- (void)willBeRemoved;
@end

@implementation CRLAudioRep

- (CRLAudioRep)initWithLayout:(id)a3 canvas:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CRLAudioRep;
  v7 = [(CRLCanvasRep *)&v13 initWithLayout:a3 canvas:v6];
  v8 = v7;
  if (v7)
  {
    v9 = [(CRLAudioRep *)v7 movieItem];

    if (v9)
    {
      v10 = (NSUUID *)objc_alloc_init((Class)NSUUID);
      downloadObserverIdentifier = v8->_downloadObserverIdentifier;
      v8->_downloadObserverIdentifier = v10;

      if ([v6 isCanvasInteractive]) {
        [(CRLAudioRep *)v8 p_listenForAssetChangesIfAppropriate];
      }
    }
    else
    {

      v8 = 0;
    }
  }

  return v8;
}

- (_TtC8Freeform12CRLMovieItem)movieItem
{
  uint64_t v3 = objc_opt_class();
  v4 = [(CRLCanvasRep *)self info];
  v5 = sub_1002469D0(v3, v4);

  return (_TtC8Freeform12CRLMovieItem *)v5;
}

- (id)imageProviderForAlbumArt
{
  v2 = [(CRLAudioRep *)self movieItem];
  uint64_t v3 = [v2 posterImageAssetPayload];
  v4 = +[CRLImageProviderPool sharedPool];
  if (v3)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [v4 providerForAsset:v3 shouldValidate:1];
    v7 = sub_1002469D0(v5, v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasAlbumArt
{
  v2 = [(CRLAudioRep *)self imageProviderForAlbumArt];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)drawAlbumArtInContext:(CGContext *)a3 rect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  v9 = [(CRLAudioRep *)self imageProviderForAlbumArt];
  v10 = v9;
  if (v9) {
    [v9 drawImageInContext:a3 rect:x, y, width, height];
  }

  return v10 != 0;
}

- (double)p_unscaledPlayButtonAndMinPaddingHeight
{
  [(CRLAudioRep *)self p_playButtonSize];
  return v2 + 20.0;
}

- (double)p_playButtonAndMinPaddingHeight:(BOOL)a3
{
  [(CRLAudioRep *)self p_unscaledPlayButtonAndMinPaddingHeight];
  double v6 = v5;
  if (!a3)
  {
    v7 = [(CRLCanvasRep *)self canvas];
    [v7 convertUnscaledToBoundsLength:v6];
    double v6 = v8;
  }
  return v6;
}

- (double)p_playButtonAndTitleHeightWithRepSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CRLAudioRep *)self p_playButtonAndMinPaddingHeight:1];
  double v7 = v6;
  if (![(CRLAudioRep *)self hasAlbumArt])
  {
    -[CRLAudioRep p_titleTextHeightWithSize:](self, "p_titleTextHeightWithSize:", width, height);
    return v7 + v8;
  }
  return v7;
}

- (BOOL)i_playButtonFitsInFrame
{
  [(CRLCanvasRep *)self naturalBounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(CRLCanvasRep *)self canvas];
  [v7 convertUnscaledToBoundsSize:v4, v6];
  double v9 = v8;
  double v11 = v10;

  -[CRLAudioRep p_playButtonAndTitleHeightWithRepSize:](self, "p_playButtonAndTitleHeightWithRepSize:", v9, v11);
  return v12 <= v11;
}

- (void)drawInContext:(CGContext *)a3
{
  double v5 = [(CRLMediaRep *)self mediaLayout];
  [v5 boundsForStandardKnobs];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  CGContextSaveGState(a3);
  v14 = +[CRLColor whiteColor];
  CGContextSetFillColorWithColor(a3, (CGColorRef)[v14 CGColor]);

  v15 = [(CRLAudioRep *)self movieItem];
  [v15 cornerRadius];
  v17 = +[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v7, v9, v11, v13, v16);

  if (v17)
  {
    CGContextAddPath(a3, (CGPathRef)[v17 CGPath]);
    CGContextClip(a3);
  }
  unsigned __int8 v18 = -[CRLAudioRep drawAlbumArtInContext:rect:](self, "drawAlbumArtInContext:rect:", a3, v7, v9, v11, v13);
  unsigned int v19 = [(CRLAudioRep *)self i_playButtonFitsInFrame];
  if ((v18 & 1) == 0)
  {
    v20 = [CRLAngleGradientFill alloc];
    v21 = +[CRLColor whiteColor];
    v22 = +[CRLColor colorWithR:242 G:242 B:247];
    v23 = [(CRLAngleGradientFill *)v20 initWithStartColor:v21 endColor:v22 type:0 angle:-1.57079633];

    -[CRLAngleGradientFill paintRect:inContext:](v23, "paintRect:inContext:", a3, v7, v9, v11, v13);
    v24 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:1];
    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1004F1D8C;
    v66[3] = &unk_101501360;
    v66[4] = self;
    char v67 = v19;
    *(double *)&v66[5] = v7;
    *(double *)&v66[6] = v9;
    *(double *)&v66[7] = v11;
    *(double *)&v66[8] = v13;
    v66[9] = a3;
    +[UITraitCollection crl_withTraitCollectionAsCurrent:v24 performBlock:v66];
  }
  if (v17)
  {
    v25 = [(CRLAudioRep *)self movieItem];
    v26 = [v25 stroke];

    [v26 paintPath:[v17 CGPath] inContext:a3];
  }
  v27 = [(CRLCanvasRep *)self canvas];
  unsigned int v28 = v19 & ~[v27 isCanvasInteractive];

  if (v28 == 1)
  {
    v29 = [(CRLAudioRep *)self p_playButtonKnob];
    -[CRLAudioRep positionOfStandardKnob:forBounds:](self, "positionOfStandardKnob:forBounds:", v29, v7, v9, v11, v13);
    double v31 = v30;
    double v33 = v32;

    double v34 = sub_10006402C(v31, v33, 48.0);
    CGFloat v36 = v35;
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    v41 = +[CRLMovieRep CRLMovieButtonFillColor];
    CGContextSetFillColorWithColor(a3, (CGColorRef)[v41 CGColor]);

    v68.origin.double x = v34;
    v68.origin.double y = v36;
    v68.size.double width = v38;
    v68.size.double height = v40;
    CGContextFillEllipseInRect(a3, v68);
    double v42 = sub_100065738(v34, v36, v38, v40);
    double v44 = v43;
    double v45 = v42 + 2.88;
    v46 = +[CRLImage imageWithSystemImageNamed:@"play.fill" pointSize:22.0];
    [v46 size];
    double v48 = v47;
    double v50 = v49;
    double v51 = sub_10006402C(v45, v44, v47);
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    CGFloat v57 = v56;
    v58 = +[CRLColor whiteColor];
    v59 = [v46 compositedImageWithColor:v58 alpha:20 blendMode:1.0];

    v60 = [v59 CGImageForSize:a3 inContext:0 orContentsScaleProvider:v48];
    v69.origin.double x = v51;
    v69.origin.double y = v53;
    v69.size.double width = v55;
    v69.size.double height = v57;
    CGContextDrawImage(a3, v69, v60);
  }
  CGContextRestoreGState(a3);
  v61 = [(CRLAudioRep *)self movieItem];
  v62 = [v61 posterImageAssetPayload];
  unsigned int v63 = [v62 needsDownload];

  if (v63)
  {
    v64 = [(CRLAudioRep *)self movieItem];
    v65 = [v64 posterImageAssetPayload];
    sub_100458B68(a3, v65);
  }
}

- (void)viewScaleDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRep;
  [(CRLCanvasRep *)&v3 viewScaleDidChange];
  [(CRLCanvasRep *)self invalidateKnobs];
}

- (void)willBeRemoved
{
  v13.receiver = self;
  v13.super_class = (Class)CRLAudioRep;
  [(CRLCanvasRep *)&v13 willBeRemoved];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  double v10 = sub_1004F2374;
  double v11 = &unk_1014CBBB0;
  double v12 = self;
  if (+[NSThread isMainThread]) {
    v10((uint64_t)block);
  }
  else {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  if (!self->_downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501380);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BEE4C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015013A0);
    }
    objc_super v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    double v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep willBeRemoved]");
    double v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 409, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");
  }
  double v6 = [(CRLAudioRep *)self movieItem];
  double v7 = [v6 store];
  double v8 = [v7 assetManager];
  [v8 removeAllDownloadObserversWithIdentifier:self->_downloadObserverIdentifier];
}

- (BOOL)directlyManagesLayerContent
{
  return 0;
}

- (int64_t)preferredReplacingInterfaceKind
{
  return 1;
}

- (BOOL)shouldShowMediaReplaceUI
{
  return 0;
}

- (id)unscaledPathToIncludeForSystemPreviewOutline
{
  objc_super v3 = [(CRLCanvasRep *)self layout];
  double v4 = [v3 geometry];
  [v4 size];

  double v5 = sub_100064070();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(CRLAudioRep *)self movieItem];
  [v12 cornerRadius];
  v14 = +[CRLBezierPath bezierPathWithContinuousCornerRoundedRect:cornerRadius:](CRLBezierPath, "bezierPathWithContinuousCornerRoundedRect:cornerRadius:", v5, v7, v9, v11, v13);

  v15 = [(CRLCanvasRep *)self layout];
  float v16 = v15;
  if (v15) {
    [v15 transformInRoot];
  }
  else {
    memset(v18, 0, sizeof(v18));
  }
  [v14 transformUsingAffineTransform:v18];

  return v14;
}

- (void)p_setUpAudioImageRenderablePath:(CGSize)a3
{
  CGMutablePathRef Mutable = CGPathCreateMutable();
  CFAutorelease(Mutable);
  CGPathAddArc(Mutable, 0, 22.0, 22.0, 22.0, -1.57079633, 4.71238898, 0);
  [(CRLCanvasRenderable *)self->_audioImageRenderable bounds];
  [(CRLCanvasRenderable *)self->_progressRenderable setPosition:sub_100065738(v5, v6, v7, v8)];
  [(CRLCanvasRenderable *)self->_progressRenderable setBounds:sub_100064070()];
  progressRenderable = self->_progressRenderable;

  [(CRLCanvasShapeRenderable *)progressRenderable setPath:Mutable];
}

- (void)p_updateAudioImageRenerableAndTrack
{
  [(CRLAudioRep *)self p_playButtonSize];

  -[CRLAudioRep p_setUpAudioImageRenderablePath:](self, "p_setUpAudioImageRenderablePath:");
}

- (void)p_setUpRenderables
{
  id v24 = [(CRLCanvasRep *)self interactiveCanvasController];
  [(CRLAudioRep *)self p_playButtonSize];
  double v4 = v3;
  uint64_t v5 = objc_opt_class();
  CGFloat v6 = [(CRLAudioRep *)self p_playButtonKnob];
  CGFloat v7 = [v6 renderable];
  sub_1002469D0(v5, v7);
  CGFloat v8 = (CRLCanvasShapeRenderable *)objc_claimAutoreleasedReturnValue();
  audioImageRenderable = self->_audioImageRenderable;
  self->_audioImageRenderable = v8;

  [(CRLCanvasRenderable *)self->_audioImageRenderable setBounds:sub_100064070()];
  double v10 = +[CRLColor whiteColor];
  -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", [v10 CGColor]);

  double v11 = +[CRLColor clearColor];
  -[CRLCanvasShapeRenderable setFillColor:](self->_audioImageRenderable, "setFillColor:", [v11 CGColor]);

  [(CRLCanvasRenderable *)self->_audioImageRenderable setCornerRadius:v4 * 0.5];
  [(CRLCanvasRenderable *)self->_audioImageRenderable setDelegate:v24];
  double v12 = +[CRLCanvasShapeRenderable renderable];
  progressRenderable = self->_progressRenderable;
  self->_progressRenderable = v12;

  [(CRLCanvasShapeRenderable *)self->_progressRenderable setLineWidth:4.0];
  v14 = +[UIColor tintColor];
  v15 = +[CRLColor colorWithUIColor:v14];
  -[CRLCanvasShapeRenderable setStrokeColor:](self->_progressRenderable, "setStrokeColor:", [v15 CGColor]);

  [(CRLCanvasShapeRenderable *)self->_progressRenderable setFillColor:0];
  [(CRLCanvasShapeRenderable *)self->_progressRenderable setStrokeEnd:0.0];
  [(CRLCanvasRenderable *)self->_progressRenderable setHidden:1];
  [(CRLCanvasRenderable *)self->_progressRenderable setDelegate:v24];
  [(CRLCanvasRenderable *)self->_audioImageRenderable addSubrenderable:self->_progressRenderable];
  float v16 = [(CRLAudioRep *)self p_playButtonKnob];
  v17 = [v16 imageRenderable];
  playPauseRenderable = self->_playPauseRenderable;
  self->_playPauseRenderable = v17;

  unsigned int v19 = [(CRLAudioRep *)self p_playButtonImage];
  [v19 size];
  [(CRLCanvasRenderable *)self->_playPauseRenderable setBounds:sub_100064070()];
  [(CRLCanvasRenderable *)self->_playPauseRenderable setDelegate:v24];
  [(CRLCanvasRenderable *)self->_audioImageRenderable bounds];
  [(CRLCanvasRenderable *)self->_playPauseRenderable setPosition:sub_100065738(v20, v21, v22, v23)];
}

- (id)additionalRenderablesOverRenderable
{
  v6.receiver = self;
  v6.super_class = (Class)CRLAudioRep;
  double v3 = [(CRLMediaRep *)&v6 additionalRenderablesOverRenderable];
  double v4 = +[NSMutableArray arrayWithArray:v3];

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CRLAudioRep *)self p_updatePlayabilityIfNecessary];
  if (!self->_audioImageRenderable) {
    [(CRLAudioRep *)self p_setUpRenderables];
  }
  [(CRLAudioRep *)self p_updateAudioImageRenerableAndTrack];
  [(CRLAudioRep *)self p_updatePlayPauseButton];
  +[CATransaction commit];

  return v4;
}

- (void)becameSelected
{
  if ([(CRLAudioRep *)self p_shouldPlayerControllerExistThroughoutSelection])
  {
    [(CRLAudioRep *)self p_setUpPlayerControllerIfNecessary];
  }
  else
  {
    [(CRLAudioRep *)self p_updatePlayabilityIfNecessary];
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRep;
  [(CRLCanvasRep *)&v3 becameSelected];
}

- (void)becameNotSelected
{
  if ([(CRLAudioRep *)self p_shouldStopPlayingWhenDeselected])
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    uint64_t v5 = sub_1004F2A88;
    objc_super v6 = &unk_1014CBBB0;
    CGFloat v7 = self;
    if (+[NSThread isMainThread]) {
      v5((uint64_t)block);
    }
    else {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)CRLAudioRep;
  [(CRLCanvasRep *)&v3 becameNotSelected];
}

- (void)documentEditabilityDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  [(CRLCanvasRep *)&v5 documentEditabilityDidChange];
  objc_super v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  if ([v3 editingDisabled])
  {
    unsigned int v4 = [(CRLAudioRep *)self isPlaying];

    if (!v4) {
      return;
    }
    objc_super v3 = [(CRLAudioRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v3 setPlaying:0];
  }
}

- (BOOL)shouldAllowReplacementFromPaste
{
  return 0;
}

- (BOOL)shouldAllowReplacementFromDrop
{
  return 0;
}

- (void)p_addPlayButtonToKnobs:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLAudioRep *)self p_playButtonKnob];
  [v4 crl_addObjects:v5];

  [(CRLAudioRep *)self p_updatePlayabilityIfNecessary];
}

- (void)addKnobsToArray:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  id v4 = a3;
  [(CRLCanvasRep *)&v5 addKnobsToArray:v4];
  -[CRLAudioRep p_addPlayButtonToKnobs:](self, "p_addPlayButtonToKnobs:", v4, v5.receiver, v5.super_class);
}

- (unint64_t)enabledKnobMask
{
  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  unint64_t v3 = [(CRLCanvasRep *)&v5 enabledKnobMask];
  if ([(CRLCanvasRep *)self shouldCreateKnobs]
    && [(CRLCanvasRep *)self isSelected]
    && ![(CRLAudioRep *)self i_playButtonFitsInFrame])
  {
    return v3 & 0x28A;
  }
  return v3;
}

- (void)p_playTriggeredFromKnob
{
  if ([(CRLAudioRep *)self isPlayable]) {
    [(CRLAudioRep *)self i_togglePlayback];
  }
  id v6 = [(CRLCanvasRep *)self interactiveCanvasController];
  unint64_t v3 = [v6 freehandDrawingToolkit];
  unsigned int v4 = [v3 isLassoSelectionForMixedTypeEnabledInDrawingMode];

  if (v4)
  {
    objc_super v5 = [v6 canvasEditor];
    [v5 hideLassoSelectionEditMenuInDrawingModeIfLassoToolIsSelected];
  }
}

- (id)newTrackerForKnob:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = [[CRLCanvasButtonKnobTracker alloc] initWithRep:self knob:v4];
    [(CRLCanvasButtonKnobTracker *)v5 setTarget:self];
    id v6 = [(CRLAudioRep *)self p_playButtonKnob];

    if (v6 == v4) {
      [(CRLCanvasButtonKnobTracker *)v5 setAction:"p_playTriggeredFromKnob"];
    }
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRep;
    objc_super v5 = [(CRLCanvasRep *)&v8 newTrackerForKnob:v4];
  }

  return v5;
}

- (BOOL)directlyManagesVisibilityOfKnob:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLAudioRep *)self p_playButtonKnob];

  if (v5 == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRep;
    BOOL v6 = [(CRLCanvasRep *)&v8 directlyManagesVisibilityOfKnob:v4];
  }

  return v6;
}

- (BOOL)canUseSpecializedHitRegionForKnob:(id)a3
{
  id v4 = a3;
  id v5 = [(CRLAudioRep *)self p_playButtonKnob];

  if (v5 == v4)
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CRLAudioRep;
    BOOL v6 = [(CRLCanvasRep *)&v8 canUseSpecializedHitRegionForKnob:v4];
  }

  return v6;
}

- (CGPoint)positionOfStandardKnob:(id)a3 forBounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v9 = a3;
  v45.receiver = self;
  v45.super_class = (Class)CRLAudioRep;
  -[CRLCanvasRep positionOfStandardKnob:forBounds:](&v45, "positionOfStandardKnob:forBounds:", v9, x, y, width, height);
  double v11 = v10;
  double v13 = v12;
  id v14 = [(CRLAudioRep *)self p_playButtonKnob];

  if (v14 == v9 && [(CRLAudioRep *)self i_playButtonFitsInFrame])
  {
    [(CRLCanvasRep *)self naturalBounds];
    double v42 = v16;
    double v43 = v15;
    double v18 = v17;
    double v20 = v19;
    CGFloat v21 = [(CRLCanvasRep *)self canvas];
    [v21 convertUnscaledToBoundsSize:v18, v20];
    double v23 = v22;
    double v25 = v24;

    -[CRLAudioRep p_playButtonAndTitleHeightWithRepSize:](self, "p_playButtonAndTitleHeightWithRepSize:", v23, v25);
    double v27 = v26;
    if (![(CRLAudioRep *)self hasAlbumArt])
    {
      -[CRLAudioRep p_creatorTextHeightWithRect:](self, "p_creatorTextHeightWithRect:", v43, v42, v18, v20);
      double v29 = v27 + v28;
      double v30 = [(CRLCanvasRep *)self canvas];
      [v30 viewScale];
      double v44 = v25;
      double v32 = v29 * v31;

      if (v32 < v44) {
        double v27 = v29;
      }
    }
    double v33 = fmin((v20 - v27) * 0.5 + 10.0, 24.0);
    double v11 = sub_100289A18(8, x, y, width, height);
    double v35 = v34;
    [v9 radius];
    double v37 = v35 - v36;
    CGFloat v38 = [(CRLCanvasRep *)self canvas];
    [v38 viewScale];
    double v13 = v37 - v33 / v39;
  }
  double v40 = v11;
  double v41 = v13;
  result.double y = v41;
  result.double x = v40;
  return result;
}

- (id)p_playButtonKnob
{
  playButtonKnob = self->_playButtonKnob;
  if (!playButtonKnob)
  {
    id v4 = [CRLMovieKnob alloc];
    id v5 = [(CRLAudioRep *)self p_playButtonImage];
    BOOL v6 = +[CRLMovieRep CRLMovieButtonFillColor];
    CGFloat v7 = [(CRLMovieKnob *)v4 initWithImage:v5 radius:v6 backgroundColor:self onRep:24.0];
    objc_super v8 = self->_playButtonKnob;
    self->_playButtonKnob = v7;

    playButtonKnob = self->_playButtonKnob;
  }

  return playButtonKnob;
}

- (void)p_hidePlayButton
{
  if (![(CRLMovieKnob *)self->_playButtonKnob isHidden])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CRLMovieKnob *)self->_playButtonKnob setHidden:1];
    unint64_t v3 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
    [v3 removeAnimationForKey:@"hidden"];

    id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v5 setFromValue:&off_10155E388];
    [v5 setToValue:&off_10155E398];
    [v5 setDuration:0.2];
    id v4 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
    [v4 addAnimation:v5 forKey:@"hidden"];

    +[CATransaction commit];
  }
}

- (void)p_showPlayButton
{
  if ([(CRLMovieKnob *)self->_playButtonKnob isHidden])
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CRLMovieKnob *)self->_playButtonKnob setHidden:0];
    unint64_t v3 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
    [v3 removeAnimationForKey:@"hidden"];

    id v5 = +[CABasicAnimation animationWithKeyPath:@"opacity"];
    [v5 setFromValue:&off_10155E398];
    [v5 setToValue:&off_10155E388];
    [v5 setDuration:0.2];
    id v4 = [(CRLCanvasKnob *)self->_playButtonKnob renderable];
    [v4 addAnimation:v5 forKey:@"hidden"];

    +[CATransaction commit];
  }
}

- (CGSize)p_playButtonSize
{
  double v2 = 48.0;
  double v3 = 48.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (id)p_playButtonImage
{
  [(CRLAudioRep *)self p_positionPlayButtonImage];

  return +[CRLImage imageWithSystemImageNamed:@"play.fill" pointSize:22.0];
}

- (id)p_pauseButtonImage
{
  [(CRLAudioRep *)self p_positionPauseButtonImage];

  return +[CRLImage imageWithSystemImageNamed:@"pause.fill" pointSize:22.0];
}

- (id)p_unpauseButtonImage
{
  [(CRLAudioRep *)self p_positionPlayButtonImage];

  return [(CRLAudioRep *)self p_playButtonImage];
}

- (void)p_positionPlayButtonImage
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CRLCanvasRenderable *)self->_audioImageRenderable bounds];
  [(CRLCanvasRenderable *)self->_playPauseRenderable setPosition:sub_100065738(v3, v4, v5, v6) + 2.88];

  +[CATransaction commit];
}

- (void)p_positionPauseButtonImage
{
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [(CRLCanvasRenderable *)self->_audioImageRenderable bounds];
  [(CRLCanvasRenderable *)self->_playPauseRenderable setPosition:sub_100065738(v3, v4, v5, v6)];

  +[CATransaction commit];
}

- (void)p_updatePlayabilityIfNecessary
{
  if (!self->_didCheckPlayability)
  {
    p_assetForPlayabilityCheck = &self->_assetForPlayabilityCheck;
    if (!self->_assetForPlayabilityCheck)
    {
      CGFloat v4 = [(CRLAudioRep *)self movieItem];
      CGFloat v5 = [v4 movieAssetPayload];

      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1004F3754;
      v13[3] = &unk_1014CBBB0;
      v13[4] = self;
      CGFloat v6 = objc_retainBlock(v13);
      if (v5)
      {
        if ([v5 needsDownload])
        {
          self->_isPlayable = 0;
          self->_didCheckPlayabilitdouble y = 1;
          ((void (*)(void *))v6[2])(v6);
        }
        else
        {
          CGFloat v7 = [v5 AVAssetAndReturnError:0];
          objc_storeStrong((id *)p_assetForPlayabilityCheck, v7);
          self->_isPlayable = 0;
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_1004F385C;
          v9[3] = &unk_1014D3990;
          id v10 = v7;
          double v11 = self;
          double v12 = v6;
          id v8 = v7;
          [v8 loadValuesAsynchronouslyForKeys:&off_10155D0A0 completionHandler:v9];
        }
      }
    }
  }
}

- (void)p_cancelPlayabilityCheck
{
  [(AVAsset *)self->_assetForPlayabilityCheck cancelLoading];
  assetForPlayabilityCheck = self->_assetForPlayabilityCheck;
  self->_assetForPlayabilityCheck = 0;

  self->_didCheckPlayabilitdouble y = 0;
}

- (BOOL)isPlaying
{
  playerController = self->_playerController;
  if (playerController) {
    LOBYTE(playerController) = [(CRLAVPlayerController *)playerController isPlaying];
  }
  return (char)playerController;
}

- (double)absoluteCurrentTime
{
  double v2 = [(CRLAudioRep *)self playerControllerForcingCreationIfNotPreExisting];
  [v2 absoluteCurrentTime];
  double v4 = v3;

  return v4;
}

- (void)processChangedProperty:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CRLAudioRep;
  -[CRLStyledRep processChangedProperty:](&v5, "processChangedProperty:");
  if ((uint64_t)a3 <= 41)
  {
    if (a3 == 18)
    {
      if (self->_playerController) {
        [(CRLAudioRep *)self p_teardownPlayerController];
      }
      [(CRLAudioRep *)self p_cancelPlayabilityCheck];
      [(CRLAudioRep *)self p_updatePlayabilityIfNecessary];
      [(CRLAudioRep *)self p_listenForAssetChangesIfAppropriate];
    }
    else if (a3 == 41)
    {
      [(CRLAudioRep *)self p_updateStartTime];
    }
  }
  else
  {
    switch(a3)
    {
      case '*':
        [(CRLAudioRep *)self p_updateEndTime];
        break;
      case ',':
        [(CRLAudioRep *)self p_updateVolume];
        break;
      case '4':
        [(CRLAudioRep *)self p_updateIsLooping];
        break;
    }
  }
}

- (void)p_updateVolume
{
  [(CRLAudioRep *)self volume];
  playerController = self->_playerController;

  -[CRLAVPlayerController setVolume:](playerController, "setVolume:");
}

- (void)p_updateStartTime
{
  double v3 = [(CRLAudioRep *)self movieItem];
  [v3 startTime];
  double v5 = v4;

  playerController = self->_playerController;

  [(CRLAVPlayerController *)playerController setStartTime:v5];
}

- (void)p_updateEndTime
{
  double v3 = [(CRLAudioRep *)self movieItem];
  [v3 endTime];
  double v5 = v4;

  playerController = self->_playerController;

  [(CRLAVPlayerController *)playerController setEndTime:v5];
}

- (void)p_updateIsLooping
{
  double v3 = [(CRLAudioRep *)self movieItem];
  unsigned int v4 = [v3 isLooping];

  id v5 = [(CRLAudioRep *)self playerControllerForcingCreationIfNotPreExisting];
  [v5 setRepeatMode:v4];
}

- (BOOL)shouldBecomeSelectedWhenPlaying
{
  double v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  unsigned int v4 = [v3 canvasEditor];
  id v5 = [(CRLCanvasRep *)self layout];
  unsigned int v6 = [v4 isLayoutSelectable:v5];

  if (v6) {
    unsigned int v7 = [v3 editingDisabled] ^ 1;
  }
  else {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (BOOL)p_shouldStopPlayingWhenDeselected
{
  return 1;
}

- (BOOL)noKnobTogglePlayAndMiniFormatter
{
  if (self->_isPlayable && ![(CRLAudioRep *)self i_playButtonFitsInFrame])
  {
    BOOL v3 = [(CRLCanvasRep *)self isSelected];
    if (v3)
    {
      [(CRLAudioRep *)self p_togglePlayPause];
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)wantsToHandleTapsWhenLocked
{
  return 1;
}

- (BOOL)handleDoubleTapAtPoint:(CGPoint)a3 inputType:(int64_t)a4
{
  return 1;
}

- (BOOL)p_togglePlayPause
{
  BOOL v3 = [(CRLAudioRep *)self isPlaying] ^ 1;
  if (self->_isPlayable)
  {
    unsigned int v4 = [(CRLAudioRep *)self playerControllerForcingCreationIfNotPreExisting];
    [v4 setPlaying:v3];
  }
  return v3;
}

- (id)p_selectionPath
{
  unsigned int v3 = [(CRLCanvasRep *)self isSelected];
  unsigned int v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = v4;
  if (v3)
  {
    unsigned int v6 = [v4 editorController];
    unsigned int v7 = [v6 selectionPath];
  }
  else
  {
    unsigned int v6 = [v4 canvasEditor];
    id v8 = [(CRLAudioRep *)self movieItem];
    unsigned int v7 = [v6 selectionPathWithInfo:v8];
  }

  return v7;
}

- (BOOL)shouldShowSelectionHighlight
{
  return 0;
}

- (BOOL)shouldHideSelectionHighlightDueToRectangularPath
{
  return 0;
}

- (id)resizedGeometryForTransform:(CGAffineTransform *)a3
{
  memset(&v12, 0, sizeof(v12));
  unsigned int v4 = [(CRLCanvasRep *)self layout];
  id v5 = [v4 originalPureGeometry];
  unsigned int v6 = v5;
  if (v5) {
    [v5 fullTransform];
  }
  else {
    memset(&t1, 0, sizeof(t1));
  }
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tdouble x = *(_OWORD *)&a3->tx;
  CGAffineTransformConcat(&v12, &t1, &v10);

  CGAffineTransform v10 = v12;
  id v8 = +[CRLCanvasInfoGeometry geometryFromFullTransform:&v10];

  return v8;
}

- (BOOL)shouldShowDownloadProgressIndicator
{
  return 0;
}

- (id)downloadProgressPlaceholderImage
{
  return 0;
}

- (BOOL)canDrawDownloadProgressPlaceholderImage
{
  return 0;
}

- (void)p_updatePlayPauseButton
{
  unsigned __int8 v3 = [(CRLAudioRep *)self i_playButtonFitsInFrame];
  unsigned int v4 = [(CRLCanvasRep *)self interactiveCanvasController];
  id v5 = [v4 layerHost];
  unsigned int v6 = [v5 asiOSCVC];
  unsigned int v7 = [v6 isCurrentlyInQuickSelectMode];

  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  if (v3) {
    [(CRLAudioRep *)self p_showPlayButton];
  }
  else {
    [(CRLAudioRep *)self p_hidePlayButton];
  }
  unint64_t playbackState = self->_playbackState;
  switch(playbackState)
  {
    case 2uLL:
      id v16 = [(CRLAudioRep *)self p_unpauseButtonImage];
      double v11 = +[CRLColor whiteColor];
      -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", [v11 CGColor]);
LABEL_10:
      uint64_t v12 = 0;
      goto LABEL_11;
    case 1uLL:
      double v13 = [(CRLAudioRep *)self p_pauseButtonImage];
      id v14 = +[CRLColor whiteColor];
      -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", [v14 CGColor]);

      double v11 = +[CRLColor blackColor];
      id v16 = [v13 compositedImageWithColor:v11 alpha:20 blendMode:1.0];

      goto LABEL_10;
    case 0uLL:
      id v9 = +[CRLMovieRep CRLMovieButtonFillColor];
      -[CRLCanvasRenderable setBackgroundColor:](self->_audioImageRenderable, "setBackgroundColor:", [v9 CGColor]);

      CGAffineTransform v10 = [(CRLAudioRep *)self p_playButtonImage];
      double v11 = +[CRLColor whiteColor];
      id v16 = [v10 compositedImageWithColor:v11 alpha:20 blendMode:1.0];

      uint64_t v12 = 1;
LABEL_11:

      [(CRLCanvasRenderable *)self->_progressRenderable setHidden:v12];
      goto LABEL_13;
  }
  id v16 = 0;
LABEL_13:
  [(CRLCanvasButtonKnob *)self->_playButtonKnob setImage:v16];
  if (self->_isPlayable)
  {
    double v15 = [(CRLCanvasRep *)self repForSelecting];
    [(CRLCanvasButtonKnob *)self->_playButtonKnob setEnabled:v15 == self];
  }
  else
  {
    [(CRLCanvasButtonKnob *)self->_playButtonKnob setEnabled:0];
  }
  [(CRLCanvasButtonKnob *)self->_playButtonKnob setEnabled:[(CRLCanvasButtonKnob *)self->_playButtonKnob isEnabled] & (v7 ^ 1)];
  +[CATransaction commit];
}

- (void)p_setUpSpinnerAnimationIfNeeded
{
  spinnerRenderable = self->_spinnerRenderable;
  if (spinnerRenderable)
  {
    unsigned int v4 = [(CRLCanvasRenderable *)spinnerRenderable animationForKey:@"spin"];

    if (!v4)
    {
      id v9 = +[CABasicAnimation animationWithKeyPath:@"transform.rotation"];
      [v9 setDelegate:0];
      [v9 setDuration:1.0];
      id v5 = +[NSNumber numberWithFloat:0.0];
      [v9 setFromValue:v5];

      LODWORD(v6) = 1086918619;
      unsigned int v7 = +[NSNumber numberWithFloat:v6];
      [v9 setToValue:v7];

      LODWORD(v8) = 1203982336;
      [v9 setRepeatCount:v8];
      [(CRLCanvasRenderable *)self->_spinnerRenderable addAnimation:v9 forKey:@"spin"];
    }
  }
}

- (id)dataForUpdateUploadIndicator
{
  double v2 = [(CRLAudioRep *)self movieItem];
  unsigned __int8 v3 = [v2 movieAssetPayload];

  if (v3)
  {
    double v6 = v3;
    unsigned int v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    unsigned int v4 = &__NSArray0__struct;
  }

  return v4;
}

- (double)uploadIndicatorInset
{
  return 2.0;
}

- (float)volume
{
  if (self->_isChangingDynamicVolume) {
    return self->_dynamicVolume;
  }
  unsigned __int8 v3 = [(CRLAudioRep *)self movieItem];
  [v3 volume];
  float v5 = v4;

  return v5;
}

- (void)dynamicVolumeChangeDidBegin
{
  [(CRLAudioRep *)self volume];
  self->_dynamicVolume = v3;
  self->_isChangingDynamicVolume = 1;
}

- (void)dynamicVolumeUpdateToValue:(float)a3
{
  self->_dynamicVolume = a3;
  [(CRLAudioRep *)self p_updateVolume];
}

- (void)dynamicVolumeChangeDidEnd
{
  self->_isChangingDynamicVolume = 0;
}

- (BOOL)p_shouldPlayerControllerExistThroughoutSelection
{
  return 0;
}

- (void)p_setUpPlayerControllerIfNecessary
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015013C0);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BF094();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1015013E0);
    }
    float v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]");
    float v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1228 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (!self->_playerController)
  {
    if (!self->_isPlayable)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501400);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BF00C();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501420);
      }
      double v6 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v6);
      }
      unsigned int v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]");
      double v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v7 file:v8 lineNumber:1230 isFatal:0 description:"Setting up player controller when audio isn't playable!"];
    }
    id v9 = [(CRLAudioRep *)self movieItem];
    CGAffineTransform v10 = [v9 movieAssetPayload];
    unsigned int v11 = [v10 needsDownload];

    if (v11)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501440);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BEF84();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501460);
      }
      uint64_t v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v12);
      }
      double v13 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]");
      id v14 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:v13 file:v14 lineNumber:1232 isFatal:0 description:"Setting up player controller for data that needs to be downloaded!"];
    }
    double v15 = [v9 makeAVAssetAndReturnError:0];
    if (v15)
    {
      id v16 = +[AVPlayerItem playerItemWithAsset:v15];
      double v17 = [[CRLAVPlayerController alloc] initWithPlayerItem:v16 delegate:self];
      playerController = self->_playerController;
      self->_playerController = v17;
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_101501480);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010BEEE8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1015014A0);
      }
      double v19 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10106590C(v19);
      }
      id v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_setUpPlayerControllerIfNecessary]");
      playerController = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, playerController, 1235, 0, "invalid nil value for '%{public}s'", "asset");
    }

    if (self->_playerController)
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1015014E0);
      }
      double v20 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
      {
        CGFloat v21 = self->_playerController;
        *(_DWORD *)buf = 134218240;
        double v35 = self;
        __int16 v36 = 2048;
        double v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "audio rep %p making audio player controller %p", buf, 0x16u);
      }
      [(CRLAudioRep *)self p_updateStartTime];
      [(CRLAudioRep *)self p_updateIsLooping];
      [v9 endTime];
      if (v22 != 0.0) {
        [(CRLAudioRep *)self p_updateEndTime];
      }
      [(CRLAudioRep *)self p_updateVolume];
      [(CRLAVPlayerController *)self->_playerController addObserver:self forKeyPath:@"playing" options:4 context:off_10166EA08];
      CFStringRef v32 = @"CRLInteractiveCanvasControllerMediaRepKey";
      double v33 = self;
      double v23 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v24 = [v23 mutableCopy];
      double v25 = v24;
      double v26 = self->_playerController;
      if (v26) {
        [v24 setObject:v26 forKeyedSubscript:@"CRLInteractiveCanvasControllerPlayerControllerKey"];
      }
      double v27 = +[NSNotificationCenter defaultCenter];
      double v28 = [(CRLCanvasRep *)self interactiveCanvasController];
      [v27 postNotificationName:@"CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification" object:v28 userInfo:v25];

      double v29 = [[CRLMediaPlayerTimeController alloc] initWithPlayerController:self->_playerController];
      timeController = self->_timeController;
      self->_timeController = v29;

      [(CRLMediaPlayerTimeController *)self->_timeController startObservingTime];
      [(CRLAVPlayerController *)self->_playerController addObserver:self forKeyPath:@"duration" options:4 context:off_10166EA10];
      [(CRLMediaPlayerTimeController *)self->_timeController addObserver:self forKeyPath:@"currentTime" options:0 context:off_10166EA18];
    }
    else
    {
      if (qword_101719CD0 != -1) {
        dispatch_once(&qword_101719CD0, &stru_1015014C0);
      }
      double v31 = off_10166D878;
      if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "audio rep attempted to set up the playerController but was unable to.", buf, 2u);
      }
    }
  }
}

- (void)p_teardownPlayerController
{
  if (!+[NSThread isMainThread])
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501500);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BF11C();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501520);
    }
    float v3 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v3);
    }
    float v4 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_teardownPlayerController]");
    float v5 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:v4 file:v5 lineNumber:1278 isFatal:0 description:"This operation must only be performed on the main thread."];
  }
  if (self->_playerController)
  {
    [(CRLMediaPlayerTimeController *)self->_timeController stopObservingTime];
    [(CRLMediaPlayerTimeController *)self->_timeController removeObserver:self forKeyPath:@"currentTime"];
    timeController = self->_timeController;
    self->_timeController = 0;

    if ([(CRLAVPlayerController *)self->_playerController isPlaying]) {
      [(CRLAVPlayerController *)self->_playerController setPlaying:0];
    }
    [(CRLAVPlayerController *)self->_playerController removeObserver:self forKeyPath:@"duration"];
    [(CRLAVPlayerController *)self->_playerController removeObserver:self forKeyPath:@"playing"];
    [(CRLAVPlayerController *)self->_playerController teardown];
    if (qword_101719CD0 != -1) {
      dispatch_once(&qword_101719CD0, &stru_101501540);
    }
    unsigned int v7 = off_10166D878;
    if (os_log_type_enabled((os_log_t)off_10166D878, OS_LOG_TYPE_DEFAULT))
    {
      playerController = self->_playerController;
      *(_DWORD *)buf = 134218240;
      id v16 = self;
      __int16 v17 = 2048;
      double v18 = playerController;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "audio rep %p clearing player controller %p in p_teardownPlayerController", buf, 0x16u);
    }
    id v9 = self->_playerController;
    self->_playerController = 0;

    CGAffineTransform v10 = +[NSNotificationCenter defaultCenter];
    unsigned int v11 = [(CRLCanvasRep *)self interactiveCanvasController];
    CFStringRef v13 = @"CRLInteractiveCanvasControllerMediaRepKey";
    id v14 = self;
    uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    [v10 postNotificationName:@"CRLInteractiveCanvasControllerDidUpdateMoviePlayerControllerNotification" object:v11 userInfo:v12];
  }
  if (self->_playbackState)
  {
    self->_unint64_t playbackState = 0;
    [(CRLAudioRep *)self p_updatePlayPauseButton];
  }
}

- (CRLMediaPlayerController)playerControllerForcingCreationIfNotPreExisting
{
  [(CRLAudioRep *)self p_setUpPlayerControllerIfNecessary];
  playerController = self->_playerController;

  return (CRLMediaPlayerController *)playerController;
}

- (void)pausePlaybackIfNeeded
{
  if ([(CRLAudioRep *)self isPlaying])
  {
    [(CRLAudioRep *)self i_togglePlayback];
  }
}

- (void)playerController:(id)a3 playbackDidFailWithError:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1004F5504;
  v6[3] = &unk_1014CBE78;
  v6[4] = self;
  id v7 = a4;
  id v4 = v7;
  Main = CFRunLoopGetMain();
  CFRunLoopPerformBlock(Main, kCFRunLoopDefaultMode, v6);
  CFRunLoopWakeUp(Main);
}

- (void)playbackDidStopForPlayerController:(id)a3
{
  self->_unint64_t playbackState = 0;
}

- (id)nowPlayingTitleWithPlaybackController:(id)a3
{
  if (self->_playerController == a3)
  {
    id v4 = [(CRLAudioRep *)self movieItem];
    float v3 = [v4 title];
  }
  else
  {
    float v3 = 0;
  }

  return v3;
}

- (id)nowPlayingImageProviderWithPlaybackController:(id)a3
{
  if (self->_playerController == a3)
  {
    float v3 = [(CRLAudioRep *)self imageProviderForAlbumArt];
  }
  else
  {
    float v3 = 0;
  }

  return v3;
}

- (void)p_listenForAssetChangesIfAppropriate
{
  downloadObserverIdentifier = self->_downloadObserverIdentifier;
  if (!downloadObserverIdentifier)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501560);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010BF1A4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_101501580);
    }
    id v4 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10106590C(v4);
    }
    float v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLAudioRep p_listenForAssetChangesIfAppropriate]");
    double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/BoardItems/CRLAudioRep.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 1362, 0, "invalid nil value for '%{public}s'", "_downloadObserverIdentifier");

    downloadObserverIdentifier = self->_downloadObserverIdentifier;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1004F5904;
  v13[3] = &unk_1014D3C48;
  v13[4] = self;
  void v13[5] = downloadObserverIdentifier;
  id v7 = downloadObserverIdentifier;
  double v8 = objc_retainBlock(v13);
  id v9 = [(CRLAudioRep *)self movieItem];
  CGAffineTransform v10 = [v9 movieAssetPayload];
  ((void (*)(void *, void *))v8[2])(v8, v10);

  unsigned int v11 = [(CRLAudioRep *)self movieItem];
  uint64_t v12 = [v11 posterImageAssetPayload];
  ((void (*)(void *, void *))v8[2])(v8, v12);
}

- (void)p_handleAssetPreparationCompletionForAsset:(id)a3
{
  id v4 = a3;
  if (![(CRLCanvasRep *)self hasBeenRemoved])
  {
    [(CRLStyledRep *)self setNeedsDisplay];
    float v5 = [(CRLCanvasRep *)self interactiveCanvasController];
    [v5 invalidateContentLayersForRep:self];

    [(CRLAudioRep *)self p_updateDownloadSpinnerState];
    [(CRLAudioRep *)self p_cancelPlayabilityCheck];
    [(CRLAudioRep *)self p_updatePlayabilityIfNecessary];
    double v6 = [(CRLAudioRep *)self movieItem];
    id v7 = [v6 movieAssetPayload];

    if (v7 == v4)
    {
      double v8 = +[NSNotificationCenter defaultCenter];
      id v9 = [(CRLCanvasRep *)self interactiveCanvasController];
      CFStringRef v11 = @"CRLInteractiveCanvasControllerMediaRepKey";
      uint64_t v12 = self;
      CGAffineTransform v10 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
      [v8 postNotificationName:@"CRLInteractiveCanvasControllerDidLoadAssetForMediaRepNotification" object:v9 userInfo:v10];
    }
  }
}

- (void)p_updateDownloadSpinnerState
{
  id v3 = [(CRLCanvasRep *)self interactiveCanvasController];
  [v3 invalidateContentLayersForRep:self];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10166EA08 == a6)
  {
    unsigned int v13 = [(CRLAudioRep *)self shouldBecomeSelectedWhenPlaying];
    id v14 = [(CRLAudioRep *)self playerControllerForcingCreationIfNotPreExisting];
    unsigned int v15 = [v14 isPlaying];

    if (v15)
    {
      if (![(CRLCanvasRep *)self isSelected] && ((v13 ^ 1) & 1) == 0)
      {
        id v16 = [(CRLAudioRep *)self p_selectionPath];
        __int16 v17 = [(CRLCanvasRep *)self interactiveCanvasController];
        double v18 = [v17 editorController];
        [v18 setSelectionPath:v16];
      }
      self->_unint64_t playbackState = 1;
    }
    else if (self->_playbackState == 1)
    {
      self->_unint64_t playbackState = 2;
      [(CRLMediaPlayerTimeController *)self->_timeController currentTime];
      double v25 = v24;
      [(CRLMediaPlayerTimeController *)self->_timeController updateInterval];
      double v27 = v25 + v26;
      [(CRLAVPlayerController *)self->_playerController duration];
      if (v27 > v28) {
        self->_unint64_t playbackState = 0;
      }
    }
    [(CRLAudioRep *)self p_updatePlayPauseButton];
  }
  else if (off_10166EA10 == a6)
  {
    double v19 = [(CRLCanvasRep *)self canvas];
    [v19 contentsScale];
    double v21 = v20 * 138.230077;

    [(CRLAVPlayerController *)self->_playerController duration];
    double v23 = v22 / (v21 * 4.0);
    if (v23 < 0.0166666667) {
      double v23 = 0.0166666667;
    }
    [(CRLMediaPlayerTimeController *)self->_timeController setUpdateInterval:v23];
  }
  else if (off_10166EA18 == a6)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    [(CRLMediaPlayerTimeController *)self->_timeController currentTime];
    double v30 = v29;
    [(CRLAVPlayerController *)self->_playerController duration];
    [(CRLCanvasShapeRenderable *)self->_progressRenderable setStrokeEnd:v30 / v31];
    +[CATransaction commit];
  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)CRLAudioRep;
    [(CRLAudioRep *)&v32 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)p_workspaceDidActivate:(id)a3
{
}

- (CRLCanvasShapeRenderable)audioImageRenderable
{
  return self->_audioImageRenderable;
}

- (BOOL)isPlayable
{
  return self->_isPlayable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioImageRenderable, 0);
  objc_storeStrong((id *)&self->_downloadObserverIdentifier, 0);
  objc_storeStrong((id *)&self->_progressRenderable, 0);
  objc_storeStrong((id *)&self->_playPauseRenderable, 0);
  objc_storeStrong((id *)&self->_spinnerRenderable, 0);
  objc_storeStrong((id *)&self->_playButtonKnob, 0);
  objc_storeStrong((id *)&self->_assetForPlayabilityCheck, 0);
  objc_storeStrong((id *)&self->_timeController, 0);

  objc_storeStrong((id *)&self->_playerController, 0);
}

- (double)ifFitsDrawTitleWithContext:(CGContext *)a3 rect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  id v10 = self;
  sub_100514AA4(v9, x, y, width, height);
  double v12 = v11;

  return v12;
}

- (double)ifFitsDrawCreatorWithContext:(CGContext *)a3 rect:(CGRect)a4 topPadding:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v11 = a3;
  double v12 = self;
  sub_100514E18(v11, x, y, width, height, a5);
  double v14 = v13;

  return v14;
}

- (double)p_creatorTextHeightWithRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = self;
  sub_1005151A0(x, y, width, height);
  double v9 = v8;

  return v9;
}

- (double)p_titleTextHeightWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  float v5 = self;
  sub_100515510(width, height);
  double v7 = v6;

  return v7;
}

- (BOOL)wantsToHandleDoubleTapsWhenLocked
{
  return 1;
}

- (void)prepareForPreview
{
  double v2 = self;
  if ([(CRLAudioRep *)v2 isPlaying]) {
    [(CRLAudioRep *)v2 pausePlaybackIfNeeded];
  }
}

- (void)enterPreviewMode
{
  double v2 = self;
  [(CRLAudioRep *)v2 prepareForPreview];
  sub_100FA4E10();
}

@end