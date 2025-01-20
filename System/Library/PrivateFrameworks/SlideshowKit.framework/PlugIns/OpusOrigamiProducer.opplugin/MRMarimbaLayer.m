@interface MRMarimbaLayer
+ (BOOL)shouldRenderOnBackgroundThread;
+ (MRMarimbaLayer)allocWithZone:(_NSZone *)a3;
+ (MRMarimbaLayer)layerWithDocument:(id)a3;
+ (MRMarimbaLayer)layerWithDocument:(id)a3 size:(CGSize)a4;
+ (void)releaseResources;
- (BOOL)_effectRequestedSlides:(id)a3;
- (BOOL)_nearingEndForSerializer:(id)a3;
- (BOOL)bailTimeWatcher;
- (BOOL)beginLiveUpdateForHitBlob:(id)a3;
- (BOOL)correctsForAutorotation;
- (BOOL)displaysFPS;
- (BOOL)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5;
- (BOOL)enableSlideDidChangeNotification;
- (BOOL)endLiveUpdateForHitBlob:(id)a3;
- (BOOL)getOnScreenVertices:(CGPoint)a3[4] forHitBlob:(id)a4;
- (BOOL)interactivityIsEnabled;
- (BOOL)isAboutToPlay;
- (BOOL)isAsynchronous;
- (BOOL)isInTransition;
- (BOOL)isPlaying;
- (BOOL)isReadonly;
- (BOOL)nearingEndForSerializer:(id)a3;
- (BOOL)rendererSizeIsLocked;
- (BOOL)slidesAreReadonly;
- (BOOL)stopWithVideo;
- (BOOL)updateFramebuffer;
- (CGImage)snapshotAsCGImage;
- (CGImage)snapshotAsCGImageForTime:(double)a3 withSize:(CGSize)a4;
- (CGPoint)convertPoint:(CGPoint)a3 toHitBlob:(id)a4;
- (CGSize)size;
- (MPDocument)document;
- (MRMarimbaLayer)init;
- (MRRenderer)renderer;
- (double)framesPerSecond;
- (double)relativeTime;
- (double)relativeTimeForBackgroundAudio;
- (double)relativeTimeForLayer:(id)a3;
- (double)startTimeForSlide:(id)a3;
- (double)time;
- (double)timeForSlide:(id)a3;
- (double)timeRemaining;
- (double)volume;
- (id)_currentEffectContainer;
- (id)_currentEffectLayer;
- (id)_effectContainerForTime:(double)a3;
- (id)_firstEffectContainer;
- (id)blobHitAtPoint:(CGPoint)a3 fromObjectsForObjectIDs:(id)a4 localPoint:(CGPoint *)a5;
- (id)currentSlide;
- (id)currentSlides;
- (id)displayedEffectContainers;
- (id)lastSlideChange;
- (int64_t)_mainLayerIndex;
- (void)_postNotificationForSlideChange:(id)a3;
- (void)_reauthorForAspectRatioChange;
- (void)_slideDidAppear:(id)a3;
- (void)beginEditingOfText:(id)a3;
- (void)beginGesture:(id)a3;
- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5 switchToDocument:(id)a6;
- (void)callbackThread:(id)a3;
- (void)cancelGesture:(id)a3;
- (void)cleanup;
- (void)dealloc;
- (void)destroyFramebuffer;
- (void)didAddEffects:(id)a3;
- (void)didApplyStyle:(id)a3;
- (void)didLiveChanged:(id)a3;
- (void)doGesture:(id)a3;
- (void)endGesture:(id)a3;
- (void)endMorphing;
- (void)goBack;
- (void)goForth;
- (void)gotoBeginning;
- (void)gotoEnd;
- (void)gotoNextSlide;
- (void)gotoNextSlide:(BOOL)a3;
- (void)gotoNextSlideLegacy;
- (void)gotoPreviousSlide;
- (void)gotoPreviousSlide:(BOOL)a3;
- (void)gotoPreviousSlideLegacy;
- (void)gotoSlide:(id)a3;
- (void)gotoSlideLegacy:(id)a3;
- (void)gotoText:(id)a3;
- (void)moveToEffectContainer:(id)a3 withStartOffset:(double)a4 toStopOffset:(double)a5 blocking:(BOOL)a6;
- (void)moveToNextEffectContainer;
- (void)moveToPreviousEffectContainer;
- (void)moveToSubtitleForSlide:(id)a3;
- (void)moveToTitleSlide;
- (void)nextFrame;
- (void)pause;
- (void)pauseWhenStill;
- (void)play;
- (void)prevFrame;
- (void)removeEffectContainersBeforeTime:(double)a3;
- (void)requestRendering:(BOOL)a3;
- (void)setBailTimeWatcher:(BOOL)a3;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setCorrectsForAutorotation:(BOOL)a3;
- (void)setDisplaysFPS:(BOOL)a3;
- (void)setDocument:(id)a3;
- (void)setEnableSlideDidChangeNotification:(BOOL)a3;
- (void)setFramesPerSecond:(double)a3;
- (void)setInteractivityIsEnabled:(BOOL)a3;
- (void)setIsAboutToPlay:(BOOL)a3;
- (void)setIsReadonly:(BOOL)a3;
- (void)setLastSlideChange:(id)a3;
- (void)setRendererSizeIsLocked:(BOOL)a3;
- (void)setSlidesAreReadonly:(BOOL)a3;
- (void)setStopWithVideo:(BOOL)a3;
- (void)setSuspended:(BOOL)a3;
- (void)setTime:(double)a3;
- (void)setVolume:(double)a3;
- (void)setupFaceDetection;
- (void)togglePlayback;
- (void)touchesBegan:(id)a3;
- (void)touchesCancelled:(id)a3;
- (void)touchesEnded:(id)a3;
- (void)touchesMoved:(id)a3;
- (void)updateSizeOfRenderer:(id)a3;
- (void)warmupRenderer;
- (void)watcherThread:(id)a3;
- (void)whenTransitionIsFinishedSendAction:(SEL)a3 toTarget:(id)a4;
@end

@implementation MRMarimbaLayer

- (double)relativeTime
{
  [(MPDocument *)[(MRMarimbaLayer *)self document] duration];
  double v4 = v3;
  double result = 0.0;
  if (v4 > 0.0)
  {
    [(MRMarimbaLayer *)self time];
    long double v7 = v6;
    [(MPDocument *)[(MRMarimbaLayer *)self document] videoDuration];
    return fmod(v7, v8);
  }
  return result;
}

- (double)relativeTimeForBackgroundAudio
{
  objc_msgSend(-[MPDocument audioPlaylist](-[MRMarimbaLayer document](self, "document"), "audioPlaylist"), "duration");
  double v4 = v3;
  double result = 0.0;
  if (v4 > 0.0)
  {
    [(MRMarimbaLayer *)self time];
    long double v7 = v6;
    objc_msgSend(-[MPDocument audioPlaylist](-[MRMarimbaLayer document](self, "document"), "audioPlaylist"), "duration");
    return fmod(v7, v8);
  }
  return result;
}

- (double)relativeTimeForLayer:(id)a3
{
  if ((char *)[(MPDocument *)[(MRMarimbaLayer *)self document] loopingMode] == (char *)&dword_0 + 2)
  {
    [(MRMarimbaLayer *)self time];
    long double v6 = v5;
    [a3 timeIn];
    double v8 = v7;
    [a3 duration];
    return fmod(v6, v8 + v9);
  }
  else
  {
    [(MRMarimbaLayer *)self relativeTime];
  }
  return result;
}

- (id)displayedEffectContainers
{
  [(MRMarimbaLayer *)self relativeTime];
  double v4 = v3;
  double v5 = [(MRMarimbaLayer *)self document];
  return +[MPUtilities effectContainersForTime:v5 inDocument:v4];
}

- (void)moveToEffectContainer:(id)a3 withStartOffset:(double)a4 toStopOffset:(double)a5 blocking:(BOOL)a6
{
  BOOL v6 = a6;
  [a3 startTime];
  if (a4 == -1.0)
  {
    double v11 = v10 + 0.00001 + a5;
    [(MRMarimbaLayer *)self setTime:v11];
  }
  else
  {
    double v12 = v10 - a4;
    double v13 = v10 + 0.00001;
    [(MRMarimbaLayer *)self setTime:v12];
    BOOL v14 = [(MRMarimbaLayer *)self isPlaying];
    if (![(MRMarimbaLayer *)self isPlaying]) {
      [(MRMarimbaLayer *)self play];
    }
    double v15 = v13 + a5;
    [(MRMarimbaLayer *)self setBailTimeWatcher:0];
    if (v6)
    {
      v16 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15), +[NSNumber numberWithBool:v14], 0);
      [(MRMarimbaLayer *)self performSelector:"watcherThread:" withObject:v16];
    }
    else
    {
      v17 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15), +[NSNumber numberWithBool:v14], 0);
      +[NSThread detachNewThreadSelector:"watcherThread:" toTarget:self withObject:v17];
    }
  }
}

- (void)moveToNextEffectContainer
{
  id v3 = [(MRMarimbaLayer *)self _currentEffectContainer];
  if (v3)
  {
    double v4 = v3;
    id v5 = objc_msgSend(objc_msgSend(v3, "parentLayer"), "effectContainers");
    BOOL v6 = (char *)[v4 index];
    uint64_t v7 = (uint64_t)v6 < (uint64_t)((char *)[v5 count] - 1) ? (uint64_t)(v6 + 1) : 0;
    id v8 = [v5 objectAtIndex:v7];
    if (v8)
    {
      id v9 = v8;
      [v8 introTransitionDuration];
      [(MRMarimbaLayer *)self moveToEffectContainer:v9 withStartOffset:0 toStopOffset:-1.0 blocking:v10];
    }
  }
}

- (void)moveToPreviousEffectContainer
{
  id v3 = [(MRMarimbaLayer *)self _currentEffectContainer];
  if (v3)
  {
    double v4 = v3;
    id v5 = objc_msgSend(objc_msgSend(v3, "parentLayer"), "effectContainers");
    BOOL v6 = (char *)[v4 index];
    if ((uint64_t)v6 <= 0) {
      BOOL v6 = (char *)[v5 count];
    }
    id v7 = [v5 objectAtIndex:v6 - 1];
    if (v7)
    {
      id v8 = v7;
      [v7 introTransitionDuration];
      [(MRMarimbaLayer *)self moveToEffectContainer:v8 withStartOffset:0 toStopOffset:-1.0 blocking:v9];
    }
  }
}

- (void)moveToTitleSlide
{
  id v3 = [(MPDocument *)[(MRMarimbaLayer *)self document] titleEffect];
  if (v3)
  {
    double v4 = v3;
    id v5 = [v3 effectID];
    objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultPosterFrameTimeForEffectID:andPresetID:", v5, objc_msgSend(v4, "presetID"));
    double v7 = v6;
    if ((objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "posterTimeIsStaticForEffectID:andPresetID:", v5, objc_msgSend(v4, "presetID")) & 1) == 0)
    {
      id v8 = +[MREffectManager sharedManager];
      id v9 = [v4 formattedAttributes];
      id v10 = [v4 effectID];
      id v11 = [v4 slides];
      id v12 = [v4 texts];
      [(MPDocument *)[(MRMarimbaLayer *)self document] aspectRatio];
      id v13 = objc_msgSend(v8, "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", v10, v9, v11, v12);
      if (v13)
      {
        BOOL v14 = v13;
        [v4 fullDuration];
        double v16 = v15;
        [v14 mainDuration];
        double v18 = v17;
        [v14 phaseInDuration];
        double v20 = v18 + v19;
        [v14 phaseOutDuration];
        double v22 = v16 / (v20 + v21);
      }
      else
      {
        [v8 defaultMainDurationForEffectID:v5];
        double v24 = v23;
        [v8 defaultPhaseInDurationForEffectID:v5];
        double v26 = v25;
        [v8 defaultPhaseOutDurationForEffectID:v5];
        double v28 = v27;
        [v4 fullDuration];
        double v22 = v29 / (v24 + v26 + v28);
      }
      double v7 = v7 * v22;
    }
    [(MRMarimbaLayer *)self setTime:v7];
  }
}

- (void)moveToSubtitleForSlide:(id)a3
{
  id v4 = [a3 parentSubtitleEffect];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 effectID];
    objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "defaultPosterFrameTimeForEffectID:andPresetID:", v6, objc_msgSend(v5, "presetID"));
    double v8 = v7;
    id v9 = +[MREffectManager sharedManager];
    id v10 = [v5 formattedAttributes];
    id v11 = [v5 effectID];
    id v12 = [v5 slides];
    id v13 = [v5 texts];
    [(MPDocument *)[(MRMarimbaLayer *)self document] aspectRatio];
    id v14 = objc_msgSend(v9, "customTimingWithEffectID:effectAttributes:slideInformation:textInformation:inAspectRatio:", v11, v10, v12, v13);
    if (v14)
    {
      double v15 = v14;
      [v5 fullDuration];
      double v17 = v16;
      [v15 mainDuration];
      double v19 = v18;
      [v15 phaseInDuration];
      double v21 = v19 + v20;
      [v15 phaseOutDuration];
      double v23 = v17 / (v21 + v22);
    }
    else
    {
      [v9 defaultMainDurationForEffectID:v6];
      double v25 = v24;
      [v9 defaultPhaseInDurationForEffectID:v6];
      double v27 = v26;
      [v9 defaultPhaseOutDurationForEffectID:v6];
      double v29 = v28;
      [v5 fullDuration];
      double v23 = v30 / (v25 + v27 + v29);
    }
    double v31 = v8 * v23;
    objc_msgSend(objc_msgSend(v5, "parentContainer"), "startTime");
    double v33 = v31 + v32;
    [(MPDocument *)[(MRMarimbaLayer *)self document] videoDuration];
    if (v33 < v34) {
      double v34 = v33;
    }
    [(MRMarimbaLayer *)self setTime:v34];
  }
}

- (id)_currentEffectLayer
{
  id v3 = [(MRMarimbaLayer *)self document];
  id v4 = [(MRMarimbaLayer *)self _mainLayerIndex];
  id result = [(MPDocument *)v3 layers];
  if (result)
  {
    id v6 = result;
    id result = [result count];
    if (result)
    {
      if (v4 >= [v6 count]) {
        id v4 = (char *)[v6 count] - 1;
      }
      id v7 = [v6 objectAtIndex:v4];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        return v7;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (id)_currentEffectContainer
{
  id v3 = [(MRMarimbaLayer *)self document];
  id v4 = [(MRMarimbaLayer *)self displayedEffectContainers];
  if (!v4) {
    return 0;
  }
  id v5 = v4;
  if (![v4 count]) {
    return 0;
  }
  id v6 = [(MRMarimbaLayer *)self _mainLayerIndex];
  id v7 = [(MPDocument *)v3 layers];
  if (!v7) {
    return 0;
  }
  double v8 = v7;
  if (![v7 count]) {
    return 0;
  }
  if (v6 >= [v8 count]) {
    id v6 = (char *)[v8 count] - 1;
  }
  id v9 = [v8 objectAtIndex:v6];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (!v10) {
    goto LABEL_18;
  }
  id v11 = v10;
  id v12 = 0;
  uint64_t v13 = *(void *)v21;
  double v14 = -1.0;
  do
  {
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      if (*(void *)v21 != v13) {
        objc_enumerationMutation(v5);
      }
      double v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if (v9 == [v16 parentLayer])
      {
        [v16 startTime];
        if (v17 > v14)
        {
          [v16 startTime];
          double v14 = v18;
          id v12 = v16;
        }
      }
    }
    id v11 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v11);
  if (!v12)
  {
LABEL_18:
    id v12 = [(MRMarimbaLayer *)self _firstEffectContainer];
    if (!v12) {
      return [(MRMarimbaLayer *)self _effectContainerForTime:0.0];
    }
  }
  return v12;
}

- (BOOL)isInTransition
{
  id v3 = [(MRMarimbaLayer *)self _currentEffectContainer];
  if (v3)
  {
    id v4 = v3;
    id v3 = [v3 countOfEffects];
    if (v3)
    {
      id v3 = [v4 transition];
      if (v3)
      {
        id v5 = v3;
        [v3 duration];
        if (v6 == 0.0)
        {
          LOBYTE(v3) = 0;
        }
        else
        {
          [(MRMarimbaLayer *)self time];
          double v8 = v7;
          [v4 startTime];
          double v10 = v8 - v9;
          objc_msgSend(objc_msgSend(v4, "parentLayer"), "timeIn");
          double v12 = v10 - v11;
          [v5 duration];
          LOBYTE(v3) = v12 < v13;
        }
      }
    }
  }
  return (char)v3;
}

- (void)whenTransitionIsFinishedSendAction:(SEL)a3 toTarget:(id)a4
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  id v7 = [(MRMarimbaLayer *)self _currentEffectContainer];
  if (![v7 countOfEffects]) {
    goto LABEL_4;
  }
  id v8 = [v7 transition];
  if (!v8) {
    goto LABEL_4;
  }
  double v9 = v8;
  [v8 duration];
  if (v10 == 0.0) {
    goto LABEL_4;
  }
  [(MRMarimbaLayer *)self time];
  double v12 = v11;
  [v7 startTime];
  double v14 = v12 - v13;
  objc_msgSend(objc_msgSend(v7, "parentLayer"), "timeIn");
  double v16 = v14 - v15;
  [v9 duration];
  if (v16 <= v17 && v16 >= 0.0)
  {
    objc_msgSend(objc_msgSend(v7, "parentLayer"), "timeIn");
    double v19 = v18;
    [v7 startTime];
    double v21 = v19 + v20;
    [v9 duration];
    double v23 = v21 + v22;
    [(MRMarimbaLayer *)self setBailTimeWatcher:0];
    double v24 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:v23], a4, NSStringFromSelector(a3), 0);
    +[NSThread detachNewThreadSelector:"callbackThread:" toTarget:self withObject:v24];
  }
  else
  {
LABEL_4:
    [a4 performSelector:a3 withObject:self];
  }
}

- (id)_firstEffectContainer
{
  id v3 = [(MRMarimbaLayer *)self document];
  unint64_t v4 = [(MRMarimbaLayer *)self _mainLayerIndex];
  if (v4 >= (unint64_t)objc_msgSend(-[MPDocument layers](v3, "layers"), "count")) {
    return 0;
  }
  id v5 = objc_msgSend(-[MPDocument layers](v3, "layers"), "objectAtIndex:", v4);
  if ((uint64_t)[v5 countOfEffectContainers] < 1) {
    return 0;
  }
  id v6 = [v5 effectContainers];
  return [v6 objectAtIndex:0];
}

- (id)_effectContainerForTime:(double)a3
{
  id v5 = [(MRMarimbaLayer *)self document];
  id v6 = +[MPUtilities effectContainersForTime:v5 inDocument:a3];
  id v7 = objc_msgSend(-[MPDocument layers](v5, "layers"), "objectAtIndex:", -[MRMarimbaLayer _mainLayerIndex](self, "_mainLayerIndex"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8) {
    return [v6 anyObject];
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v15;
LABEL_3:
  uint64_t v11 = 0;
  while (1)
  {
    if (*(void *)v15 != v10) {
      objc_enumerationMutation(v6);
    }
    double v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
    if (v7 == [v12 parentLayer]) {
      return v12;
    }
    if (v9 == (id)++v11)
    {
      id v9 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        goto LABEL_3;
      }
      return [v6 anyObject];
    }
  }
}

- (int64_t)_mainLayerIndex
{
  id v3 = objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "indexOfMainLayerForStyleID:", -[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID"));
  if (v3 >= objc_msgSend(-[MPDocument layers](-[MRMarimbaLayer document](self, "document"), "layers"), "count")) {
    return (int64_t)objc_msgSend(-[MPDocument layers](-[MRMarimbaLayer document](self, "document"), "layers"), "count")- 1;
  }
  return (int64_t)v3;
}

- (void)callbackThread:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "doubleValue");
  double v7 = v6;
  id v8 = [a3 objectAtIndex:1];
  SEL v9 = NSSelectorFromString((NSString *)[a3 objectAtIndex:2]);
  while (1)
  {
    [(MRMarimbaLayer *)self time];
    if (v10 > v7) {
      break;
    }
    if (![(MRMarimbaLayer *)self isPlaying] || [(MRMarimbaLayer *)self bailTimeWatcher]) {
      goto LABEL_7;
    }
  }
  [v8 performSelectorOnMainThread:v9 withObject:self waitUntilDone:0];
LABEL_7:
}

- (void)watcherThread:(id)a3
{
  objc_msgSend(objc_msgSend(a3, "objectAtIndex:", 0), "doubleValue");
  double v7 = v6;
  while (1)
  {
    [(MRMarimbaLayer *)self time];
    if (v8 > v7) {
      break;
    }
    if (![(MRMarimbaLayer *)self isPlaying] || [(MRMarimbaLayer *)self bailTimeWatcher]) {
      goto LABEL_8;
    }
  }
  if ((objc_msgSend(objc_msgSend(a3, "lastObject"), "BOOLValue") & 1) == 0) {
    [(MRMarimbaLayer *)self pause];
  }
LABEL_8:
}

- (id)currentSlides
{
  id v3 = +[NSMutableArray array];
  id v4 = [(MRMarimbaLayer *)self _currentEffectContainer];
  if (!v4)
  {
    id v13 = [(MRMarimbaLayer *)self _currentEffectLayer];
    if (!v13) {
      return v3;
    }
    id v6 = v13;
    [(MRMarimbaLayer *)self relativeTime];
    double v10 = v14;
    double v12 = 0.0;
    double v8 = v6;
    goto LABEL_7;
  }
  id v5 = v4;
  if (!objc_msgSend(objc_msgSend(v4, "effects"), "count"))
  {
    [v5 parentLayer];
    return v3;
  }
  id v6 = objc_msgSend(objc_msgSend(v5, "effects"), "objectAtIndex:", 0);
  id v7 = [v5 parentLayer];
  if (v6)
  {
    double v8 = v7;
    [(MRMarimbaLayer *)self relativeTime];
    double v10 = v9;
    [v5 startTime];
    double v12 = v11;
LABEL_7:
    objc_msgSend(objc_msgSend(objc_msgSend(v8, "parent"), "liveLock"), "lock");
    id v15 = objc_msgSend(objc_msgSend(v6, "slides"), "copy");
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      double v18 = v10 - v12;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v15);
          }
          double v21 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          [v21 showTime];
          if (v18 >= v22)
          {
            double v23 = v22;
            [v21 showDuration];
            if (v18 < v23 + v24) {
              [v3 addObject:v21];
            }
          }
        }
        id v17 = [v15 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v17);
    }

    objc_msgSend(objc_msgSend(objc_msgSend(v8, "parent"), "liveLock"), "unlock");
  }
  return v3;
}

- (id)currentSlide
{
  id v3 = [(MRMarimbaLayer *)self _currentEffectContainer];
  id v4 = v3;
  if (v3)
  {
    if (objc_msgSend(objc_msgSend(v3, "effects"), "count"))
    {
      id v5 = objc_msgSend(objc_msgSend(v4, "effects"), "objectAtIndex:", 0);
      id v6 = [v4 parentLayer];
      if (v5)
      {
        id v7 = v6;
        [(MRMarimbaLayer *)self relativeTime];
        double v9 = v8;
        [v4 startTime];
        double v11 = v10;
        goto LABEL_7;
      }
    }
    else
    {
      [v4 parentLayer];
    }
    return 0;
  }
  id v12 = [(MRMarimbaLayer *)self _currentEffectLayer];
  if (!v12) {
    return 0;
  }
  id v7 = v12;
  [(MRMarimbaLayer *)self relativeTime];
  double v9 = v13;
  double v11 = 0.0;
  id v5 = v7;
LABEL_7:
  objc_msgSend(objc_msgSend(objc_msgSend(v7, "parent"), "liveLock"), "lock");
  id v14 = objc_msgSend(objc_msgSend(v5, "slides"), "copy");
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (!v15) {
    goto LABEL_31;
  }
  id v16 = v15;
  id v17 = 0;
  double v18 = v9 - v11;
  uint64_t v19 = *(void *)v29;
  double v20 = -1.0;
LABEL_9:
  double v21 = 0;
  double v22 = v20;
  while (1)
  {
    if (*(void *)v29 != v19) {
      objc_enumerationMutation(v14);
    }
    double v23 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v21);
    [v23 showDisplayTime];
    double v20 = v24;
    [(MRRenderer *)[(MRMarimbaLayer *)self renderer] timeQuantum];
    if (v18 < v20 - v25) {
      break;
    }
    if (v20 != v22 || v4 == 0) {
      id v17 = v23;
    }
    double v21 = (char *)v21 + 1;
    double v22 = v20;
    if (v16 == v21)
    {
      id v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16) {
        goto LABEL_9;
      }
      break;
    }
  }
  if (!v17)
  {
LABEL_31:
    if ([v14 count]) {
      id v17 = [v14 lastObject];
    }
    else {
      id v17 = 0;
    }
  }

  objc_msgSend(objc_msgSend(objc_msgSend(v7, "parent"), "liveLock"), "unlock");
  return v17;
}

- (void)removeEffectContainersBeforeTime:(double)a3
{
  id v4 = [(MRMarimbaLayer *)self _effectContainerForTime:a3];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v4 parentLayer];
    if ((uint64_t)[v6 countOfEffectContainers] >= 40)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1243D8;
      block[3] = &unk_1AB840;
      block[4] = v5;
      block[5] = self;
      block[6] = v6;
      dispatch_async((dispatch_queue_t)[(MRRenderer *)[(MRMarimbaLayer *)self renderer] renderDispatchQueue], block);
    }
  }
}

- (void)gotoNextSlide
{
}

- (void)gotoNextSlide:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MRRenderer *)[(MRMarimbaLayer *)self renderer] currentFocusedSlideAsset])
  {
    id v5 = [(MRMarimbaLayer *)self renderer];
    [(MRRenderer *)v5 gotoNextFocusedSlide:v3];
  }
  else
  {
    id v6 = [(MPDocument *)[(MRMarimbaLayer *)self document] styleID];
    if (([v6 isEqualToString:@"Floating"] & 1) != 0
      || ([v6 isEqualToString:@"ShiftingTiles"] & 1) != 0
      || ([v6 hasSuffix:@"Mobile"] & 1) != 0
      || [v6 isEqualToString:@"PhotoWall"])
    {
      [(MRMarimbaLayer *)self gotoNextSlideLegacy];
    }
    else
    {
      double v8 = [(MRMarimbaLayer *)self renderer];
      [(MRRenderer *)v8 gotoNextInterestingTime:v3];
    }
  }
}

- (void)gotoPreviousSlide
{
}

- (void)gotoPreviousSlide:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MRRenderer *)[(MRMarimbaLayer *)self renderer] currentFocusedSlideAsset])
  {
    id v5 = [(MRMarimbaLayer *)self renderer];
    [(MRRenderer *)v5 gotoPreviousFocusedSlide:v3];
  }
  else
  {
    id v6 = [(MPDocument *)[(MRMarimbaLayer *)self document] styleID];
    if (([v6 isEqualToString:@"Floating"] & 1) != 0
      || ([v6 isEqualToString:@"ShiftingTiles"] & 1) != 0
      || ([v6 hasSuffix:@"Mobile"] & 1) != 0
      || [v6 isEqualToString:@"PhotoWall"])
    {
      [(MRMarimbaLayer *)self gotoPreviousSlideLegacy];
    }
    else
    {
      double v8 = [(MRMarimbaLayer *)self renderer];
      [(MRRenderer *)v8 gotoPreviousInterestingTime:v3];
    }
  }
}

- (void)gotoSlide:(id)a3
{
  unsigned int v5 = [(MRMarimbaLayer *)self isAboutToPlay];
  if (((v5 & 1) != 0 || -[MRMarimbaLayer isPlaying](self, "isPlaying")) && [a3 hasMovie]) {
    [(MRMarimbaLayer *)self startTimeForSlide:a3];
  }
  else {
    [(MRMarimbaLayer *)self timeForSlide:a3];
  }
  double v7 = v6;
  if (v5) {
    [(MRRenderer *)[(MRMarimbaLayer *)self renderer] setTime:v6];
  }
  double v8 = [(MRMarimbaLayer *)self renderer];
  [(MRRenderer *)v8 setSlideshowTime:v7];
}

- (void)gotoText:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect", 0), "parentContainer"), "effects");
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    int v8 = 0;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        v8 |= [*(id *)(*((void *)&v12 + 1) + 8 * i) hasMovies];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  if ((objc_msgSend(-[MPDocument styleID](-[MRMarimbaLayer document](self, "document"), "styleID"), "isEqualToString:", @"KenBurns") & 1) != 0|| (v8)&& (-[MRMarimbaLayer isAboutToPlay](self, "isAboutToPlay") || -[MRMarimbaLayer isPlaying](self, "isPlaying")))
  {
    double v11 = [(MRMarimbaLayer *)self renderer];
    objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer"), "startTime");
  }
  else
  {
    double v11 = [(MRMarimbaLayer *)self renderer];
    +[MPUtilities displayTimeForText:a3];
  }
  -[MRRenderer setSlideshowTime:](v11, "setSlideshowTime:");
}

- (double)timeForSlide:(id)a3
{
  if (!a3)
  {
    double v6 = 0.0;
LABEL_15:
    [(MPDocument *)[(MRMarimbaLayer *)self document] fadeInDuration];
    BOOL v21 = v6 < v20;
    double result = v6;
    if (v21)
    {
      double v22 = [(MRMarimbaLayer *)self document];
      [(MPDocument *)v22 fadeInDuration];
    }
    return result;
  }
  [a3 parentEffect];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a3 showDisplayTime];
    double v6 = v5;
  }
  else
  {
    id v7 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
    if ([a3 hasMovie]
      && objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect"), "effectID"), "isEqualToString:", @"JustASlide"))
    {
      objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "posterTimeForAssetAtPath:", objc_msgSend(a3, "absolutePath"));
      double v9 = v8;
      [v7 introTransitionDuration];
      double v11 = v10;
      if (v9 >= v10)
      {
        [v7 duration];
        if (v9 <= v12) {
          double v11 = v9;
        }
      }
      [v7 startTime];
      double v6 = v11 + v13 + 0.00001;
    }
    else
    {
      unsigned int v14 = [a3 hasMovie];
      [v7 startTime];
      double v16 = v15;
      [a3 showDisplayTime];
      double v18 = v16 + v17;
      if (v14) {
        double v6 = v18;
      }
      else {
        double v6 = v18 + 0.1;
      }
    }
  }
  double result = 0.0;
  if (v6 >= 0.0) {
    goto LABEL_15;
  }
  return result;
}

- (double)startTimeForSlide:(id)a3
{
  double result = 0.0;
  if (a3)
  {
    objc_msgSend(a3, "parentEffect", 0.0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 showDisplayStartTime];
    }
    else
    {
      objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer"), "startTime");
      double v6 = v5;
      [a3 showDisplayStartTime];
      double result = v6 + v7;
    }
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (void)gotoNextSlideLegacy
{
  id v3 = [(MPDocument *)[(MRMarimbaLayer *)self document] styleID];
  unsigned int v4 = [(MRMarimbaLayer *)self isPlaying];
  if (v4) {
    [(MRMarimbaLayer *)self pause];
  }
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "navigationIncrementForStyleID:", v3);
  if (v5 <= 0.0)
  {
    [(MRMarimbaLayer *)self relativeTime];
    double v9 = v8;
    id v10 = [(MRMarimbaLayer *)self currentSlide];
    BOOL v11 = v10 == 0;
    if (v10)
    {
      do
      {
        id v12 = [v10 parentEffect];
        double v13 = [v10 index];
        if (v13 == (char *)objc_msgSend(objc_msgSend(objc_msgSend(v10, "parentEffect"), "slides"), "count") - 1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 || (id v14 = [v12 parentContainer]) == 0)
          {
            BOOL v18 = 1;
          }
          else
          {
            double v15 = v14;
            double v16 = (char *)[v14 index];
            double v17 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(v15, "parentLayer"), "effectContainers"), "count") - 1;
            BOOL v18 = v16 == v17;
            if (v16 == v17)
            {
              id v19 = objc_msgSend(objc_msgSend(objc_msgSend(v15, "parentLayer"), "effectContainers"), "objectAtIndex:", 0);
            }
            else
            {
              long long v27 = (char *)[v15 index] + 1;
              id v28 = objc_msgSend(objc_msgSend(v15, "parentLayer"), "effectContainers");
              long long v29 = (char *)[v15 index] + 1;
              id v30 = v28;
              while (1)
              {
                id v19 = [v30 objectAtIndex:v29];
                if (v27 >= (char *)objc_msgSend(objc_msgSend(objc_msgSend(v19, "parentLayer"), "effectContainers"), "count")- 1|| objc_msgSend(objc_msgSend(v19, "effects"), "count"))
                {
                  break;
                }
                ++v27;
                id v30 = objc_msgSend(objc_msgSend(v19, "parentLayer"), "effectContainers");
                long long v29 = v27;
              }
            }
            id v12 = objc_msgSend(objc_msgSend(v19, "effects"), "objectAtIndex:", 0);
          }
          if (!objc_msgSend(objc_msgSend(v12, "slides"), "count")) {
            goto LABEL_33;
          }
          id v10 = objc_msgSend(objc_msgSend(v12, "slides"), "objectAtIndex:", 0);
          if (!v10) {
            goto LABEL_33;
          }
        }
        else
        {
          id v10 = objc_msgSend(objc_msgSend(v12, "slides"), "objectAtIndex:", (char *)objc_msgSend(v10, "index") + 1);
          BOOL v18 = 0;
          if (!v10) {
            goto LABEL_33;
          }
        }
        id v20 = [v10 parentEffect];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (id v21 = [v20 parentContainer]) == 0)
        {
          [v10 showDisplayTime];
        }
        else
        {
          [v21 startTime];
          double v23 = v22;
          [v10 showDisplayTime];
          double v25 = v23 + v24 + 0.00001;
        }
        BOOL v26 = !v18;
        if (v25 > v9) {
          BOOL v26 = 0;
        }
      }
      while (v26);
      BOOL v11 = 0;
    }
    if (v11)
    {
LABEL_33:
      id v31 = [(MRMarimbaLayer *)self _currentEffectContainer];
      if (v31)
      {
        double v32 = v31;
        id v33 = [v31 parentLayer];
        double v34 = (char *)[v32 index];
        v35 = (char *)objc_msgSend(objc_msgSend(v33, "effectContainers"), "count");
        for (id i = 0; ; id i = [v37 objectAtIndex:v34 - v38])
        {
          ++v34;
          if (i)
          {
            if (objc_msgSend(objc_msgSend(i, "effects"), "count")) {
              break;
            }
          }
          id v37 = [v33 effectContainers];
          if ((uint64_t)v34 >= (uint64_t)v35) {
            v38 = v35;
          }
          else {
            v38 = 0;
          }
        }
        if (objc_msgSend(objc_msgSend(i, "effects"), "count"))
        {
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v39 = objc_msgSend(i, "effects", 0);
          id v40 = [v39 countByEnumeratingWithState:&v48 objects:v52 count:16];
          if (v40)
          {
            id v41 = v40;
            uint64_t v42 = *(void *)v49;
            while (2)
            {
              for (j = 0; j != v41; j = (char *)j + 1)
              {
                if (*(void *)v49 != v42) {
                  objc_enumerationMutation(v39);
                }
                v44 = *(void **)(*((void *)&v48 + 1) + 8 * (void)j);
                if (objc_msgSend(objc_msgSend(v44, "slides"), "count"))
                {
                  v47 = v44;
                  goto LABEL_55;
                }
              }
              id v41 = [v39 countByEnumeratingWithState:&v48 objects:v52 count:16];
              if (v41) {
                continue;
              }
              break;
            }
          }
        }
LABEL_59:
        [(MRMarimbaLayer *)self moveToNextEffectContainer];
        if (!v4) {
          return;
        }
LABEL_57:
        [(MRMarimbaLayer *)self play];
        return;
      }
      id v45 = [(MRMarimbaLayer *)self _currentEffectLayer];
      if (!v45) {
        goto LABEL_59;
      }
      id v46 = v45;
      if (!objc_msgSend(objc_msgSend(v45, "slides"), "count")) {
        goto LABEL_59;
      }
      v47 = v46;
LABEL_55:
      id v10 = objc_msgSend(objc_msgSend(v47, "slides"), "objectAtIndex:", 0);
      if (!v10) {
        goto LABEL_59;
      }
    }
    [(MRMarimbaLayer *)self gotoSlideLegacy:v10];
    if (!v4) {
      return;
    }
    goto LABEL_57;
  }
  double v6 = v5;
  [(MRMarimbaLayer *)self time];
  [(MRMarimbaLayer *)self setTime:v6 + v7];
  if (v4)
  {
    [(MRMarimbaLayer *)self play];
  }
}

- (void)gotoPreviousSlideLegacy
{
  id v3 = [(MPDocument *)[(MRMarimbaLayer *)self document] styleID];
  unsigned int v4 = [(MRMarimbaLayer *)self isPlaying];
  if (v4) {
    [(MRMarimbaLayer *)self pause];
  }
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "navigationIncrementForStyleID:", v3);
  if (v5 > 0.0)
  {
    double v6 = v5;
    [(MRMarimbaLayer *)self time];
    double v8 = v7 - v6;
    objc_msgSend(objc_msgSend(objc_msgSend(-[MRMarimbaLayer currentSlides](self, "currentSlides"), "lastObject"), "parentEffect"), "lowestDisplayTime");
    if (v8 >= v9) {
      double v9 = v8;
    }
    if (v9 < 0.0) {
      double v9 = 0.0;
    }
    [(MRMarimbaLayer *)self setTime:v9];
    if (v4) {
      goto LABEL_57;
    }
    return;
  }
  [(MRMarimbaLayer *)self relativeTime];
  double v11 = v10;
  id v12 = [(MRMarimbaLayer *)self currentSlides];
  id v13 = v12;
  if (v12)
  {
    if ([v12 count]) {
      id v13 = [v13 objectAtIndex:0];
    }
    else {
      id v13 = 0;
    }
  }
  if (objc_msgSend(+[MPEffectManager sharedManager](MPEffectManager, "sharedManager"), "effectDoesAccumulate:", objc_msgSend(objc_msgSend(v13, "parentEffect"), "effectID")))id v14 = objc_msgSend(-[MRMarimbaLayer currentSlides](self, "currentSlides"), "lastObject"); {
  else
  }
    id v14 = [(MRMarimbaLayer *)self currentSlide];
  id v15 = v14;
  double v16 = v11;
  if (v14)
  {
    id v17 = [v14 parentEffect];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (id v18 = [v17 parentContainer]) == 0)
    {
      [v15 showDisplayTime];
      double v16 = v22;
    }
    else
    {
      [v18 startTime];
      double v20 = v19;
      [v15 showDisplayTime];
      double v16 = v20 + v21;
    }
  }
  BOOL v23 = 0;
  do
  {
    BOOL v24 = v11 < v16 || v15 == 0;
    if (v24 || v23) {
      goto LABEL_51;
    }
    id v25 = [v15 parentEffect];
    if ([v15 index])
    {
      id v15 = objc_msgSend(objc_msgSend(v25, "slides"), "objectAtIndex:", (char *)objc_msgSend(v15, "index") - 1);
      BOOL v23 = 0;
      if (!v15) {
        goto LABEL_49;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (id v26 = [v25 parentContainer]) == 0)
      {
        BOOL v23 = 1;
        id v31 = v25;
      }
      else
      {
        long long v27 = v26;
        id v28 = [v26 index];
        BOOL v23 = v28 == 0;
        if (v28)
        {
          long long v29 = (char *)[v27 index];
          id v30 = objc_msgSend(objc_msgSend(objc_msgSend(v27, "parentLayer"), "effectContainers"), "objectAtIndex:", (char *)objc_msgSend(v27, "index") - 1);
          if ((uint64_t)v29 >= 2)
          {
            do
            {
              if (objc_msgSend(objc_msgSend(v30, "effects"), "count")) {
                break;
              }
              id v30 = objc_msgSend(objc_msgSend(objc_msgSend(v30, "parentLayer"), "effectContainers"), "objectAtIndex:", v29 - 2);
              --v29;
            }
            while ((uint64_t)v29 > 1);
          }
        }
        else
        {
          id v30 = objc_msgSend(objc_msgSend(objc_msgSend(v27, "parentLayer"), "effectContainers"), "lastObject");
        }
        id v31 = objc_msgSend(objc_msgSend(v30, "effects"), "objectAtIndex:", 0);
      }
      if (!objc_msgSend(objc_msgSend(v31, "slides"), "count"))
      {
        id v15 = 0;
        goto LABEL_49;
      }
      id v15 = objc_msgSend(objc_msgSend(v31, "slides"), "lastObject");
      if (!v15) {
        goto LABEL_49;
      }
    }
    id v32 = [v15 parentEffect];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (id v33 = [v32 parentContainer]) == 0)
    {
      [v15 showDisplayTime];
    }
    else
    {
      [v33 startTime];
      double v35 = v34;
      [v15 showDisplayTime];
      double v37 = v35 + v36;
    }
    double v11 = v37 + 0.00001;
LABEL_49:
    [v25 lowestDisplayTime];
  }
  while (v11 >= v38);
  [v25 lowestDisplayTime];
  if (v39 < 0.0)
  {
LABEL_51:
    if (v15)
    {
      [(MRMarimbaLayer *)self gotoSlideLegacy:v15];
      if (!v4) {
        return;
      }
    }
    else
    {
      [(MRMarimbaLayer *)self moveToPreviousEffectContainer];
      if (!v4) {
        return;
      }
    }
    goto LABEL_57;
  }
  -[MRMarimbaLayer setTime:](self, "setTime:");
  if (!v4) {
    return;
  }
LABEL_57:
  [(MRMarimbaLayer *)self play];
}

- (void)gotoSlideLegacy:(id)a3
{
  double v4 = 0.0;
  if (a3)
  {
    objc_msgSend(a3, "parentEffect", 0.0);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a3 showDisplayTime];
    }
    else
    {
      id v6 = objc_msgSend(objc_msgSend(a3, "parentEffect"), "parentContainer");
      if ([a3 hasMovie]
        && objc_msgSend(objc_msgSend(objc_msgSend(a3, "parentEffect"), "effectID"), "isEqualToString:", @"JustASlide"))
      {
        objc_msgSend(+[MPAssetManager sharedManager](MPAssetManager, "sharedManager"), "posterTimeForAssetAtPath:", objc_msgSend(a3, "absolutePath"));
        double v8 = v7;
        [v6 introTransitionDuration];
        double v10 = v9;
        if (v8 >= v9)
        {
          [v6 duration];
          if (v8 <= v11) {
            double v10 = v8;
          }
        }
        [v6 startTime];
        double v13 = v10 + v12;
        double v14 = 0.00001;
      }
      else
      {
        [v6 startTime];
        double v16 = v15;
        [a3 showDisplayTime];
        double v13 = v16 + v17;
        double v14 = 0.1;
      }
      double v4 = v13 + v14;
    }
  }
  if (v4 < 0.0) {
    double v4 = 0.0;
  }
  [(MRMarimbaLayer *)self setTime:v4];
}

- (void)_slideDidAppear:(id)a3
{
  double v5 = (MRRenderer *)[a3 object];
  if (v5 == [(MRMarimbaLayer *)self renderer])
  {
    id v6 = [a3 userInfo];
    [v6 objectForKey:@"layer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_msgSend(objc_msgSend(objc_msgSend(v6, "objectForKey:", @"slide"), "asset"), "path");
      if ((objc_msgSend(v7, "isEqualToString:", -[MRMarimbaLayer lastSlideChange](self, "lastSlideChange")) & 1) == 0)
      {
        [(MRMarimbaLayer *)self setLastSlideChange:v7];
        +[NSThread detachNewThreadSelector:"_postNotificationForSlideChange:" toTarget:self withObject:v6];
      }
    }
  }
}

- (void)_postNotificationForSlideChange:(id)a3
{
  id v6 = [a3 objectForKey:@"layer"];
  id v7 = [a3 objectForKey:@"slide"];
  id v8 = [(MPDocument *)[(MRMarimbaLayer *)self document] montage];
  [v8 lock];
  id v9 = objc_msgSend(+[MPUtilities effectForMCContainerEffect:inDocument:](MPUtilities, "effectForMCContainerEffect:inDocument:", objc_msgSend(v6, "container"), -[MRMarimbaLayer document](self, "document")), "slideForMCSlide:", v7);
  [v8 unlock];
  if (v9) {
    [+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter") postNotificationName:@"kMRNotificationSlideDidChange" object:self userInfo:+[NSDictionary dictionaryWithObject:v9 forKey:@"slide"]];
  }
}

- (id)blobHitAtPoint:(CGPoint)a3 fromObjectsForObjectIDs:(id)a4 localPoint:(CGPoint *)a5
{
  double y = a3.y;
  double x = a3.x;
  [(MRMarimbaLayer *)self size];
  id v11 = -[MRRenderer layerHitAtPoint:onlyIfHitElement:localPoint:]([(MRMarimbaLayer *)self renderer], "layerHitAtPoint:onlyIfHitElement:localPoint:", 1, a5, x, v10 - y);
  if (!v11) {
    return 0;
  }
  id v12 = v11;
  double v13 = (NSString *)objc_msgSend(v11, "elementHitAtPoint:localPoint:", a5, a5->x, a5->y);
  if (!v13) {
    return 0;
  }
  double v14 = v13;
  id v15 = v12;
  double v16 = v13;
  while (1)
  {
    id v17 = objc_msgSend(a4, "objectForKey:", objc_msgSend(objc_msgSend(v15, "plug"), "objectID"));
    if (v17) {
      break;
    }
    double v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%@", objc_msgSend(objc_msgSend(v15, "plugAsParallel"), "idInSupercontainer"), v16);
    id v15 = [v15 superlayer];
    if (!v15) {
      return 0;
    }
  }
  id v20 = v17;
  id v18 = objc_alloc_init(MRHitBlob);
  [(MRHitBlob *)v18 setEffectLayer:v12];
  [(MRHitBlob *)v18 setOuterLayer:v15];
  [(MRHitBlob *)v18 setClientObject:v20];
  [(MRHitBlob *)v18 setInnerPath:v16];
  [(MRHitBlob *)v18 setElementID:v14];
  return v18;
}

- (BOOL)getOnScreenVertices:(CGPoint)a3[4] forHitBlob:(id)a4
{
  id v6 = [a4 outerLayer];
  if (a3) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL v8 = !v7;
  if (!v7)
  {
    id v9 = v6;
    [(MRMarimbaLayer *)self size];
    double v11 = v10 * 0.5;
    [(MRMarimbaLayer *)self size];
    double v13 = v12 * 0.5;
    objc_msgSend(v9, "convertLocalPoint:", -1.0, -1.0);
    a3->double x = v11 * (v14 + 1.0);
    a3->double y = v13 * (1.0 - v15);
    objc_msgSend(v9, "convertLocalPoint:", 1.0, -1.0);
    a3[1].double x = v11 * (v16 + 1.0);
    a3[1].double y = v13 * (1.0 - v17);
    objc_msgSend(v9, "convertLocalPoint:", 1.0, 1.0);
    a3[2].double x = v11 * (v18 + 1.0);
    a3[2].double y = v13 * (1.0 - v19);
    objc_msgSend(v9, "convertLocalPoint:", -1.0, 1.0);
    a3[3].double x = v11 * (v20 + 1.0);
    a3[3].double y = v13 * (1.0 - v21);
  }
  return v8;
}

- (CGPoint)convertPoint:(CGPoint)a3 toHitBlob:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = [a4 outerLayer];
  if (v7)
  {
    BOOL v8 = v7;
    [(MRMarimbaLayer *)self size];
    double v10 = v9 * 0.5;
    [(MRMarimbaLayer *)self size];
    objc_msgSend(v8, "convertGlobalPoint:", (x - v10) / v10, (v11 * 0.5 - y) / (v11 * 0.5));
  }
  else
  {
    double v12 = CGPointZero.x;
    double v13 = CGPointZero.y;
  }
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)beginLiveUpdateForHitBlob:(id)a3
{
  id v5 = [a3 effectLayer];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3052000000;
    v12[3] = sub_125C5C;
    v12[4] = sub_125C6C;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_125C78;
    v11[3] = &unk_1AACB8;
    v11[4] = v12;
    v12[5] = v11;
    sub_125C78((uint64_t)v11, v6);
    _Block_object_dispose(v12, 8);
    return 0;
  }
  id v7 = [a3 elementID];
  if ([v7 hasPrefix:@"image"])
  {
    id v8 = objc_msgSend(objc_msgSend(v6, "slideProvidersForElementIDs"), "objectForKey:", v7);
    if (!v8)
    {
      NSLog(@"No slide provider for elementID %@", v7);
      return 0;
    }
    return [v8 beginLiveUpdate];
  }
  else
  {
    if (![v7 hasPrefix:@"text"])
    {
      NSLog(@"Invalid element ID %@", v7);
      return 0;
    }
    double v10 = [(MRMarimbaLayer *)self renderer];
    return [(MRRenderer *)v10 beginTextEditingOfElement:v7 inLayer:v6 callDelegate:1];
  }
}

- (BOOL)endLiveUpdateForHitBlob:(id)a3
{
  id v5 = [a3 effectLayer];
  if (!v5) {
    return (char)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x3052000000;
    v10[3] = sub_125C5C;
    v10[4] = sub_125C6C;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_126008;
    v9[3] = &unk_1AACB8;
    v9[4] = v10;
    v10[5] = v9;
    sub_126008((uint64_t)v9, v5);
    _Block_object_dispose(v10, 8);
    goto LABEL_13;
  }
  id v6 = [a3 elementID];
  if (![v6 hasPrefix:@"image"])
  {
    if ([v6 hasPrefix:@"text"])
    {
      LOBYTE(v5) = 1;
      [(MRRenderer *)[(MRMarimbaLayer *)self renderer] endTextEditing:1];
      return (char)v5;
    }
    NSLog(@"Invalid element ID %@", v6);
LABEL_13:
    LOBYTE(v5) = 0;
    return (char)v5;
  }
  id v7 = objc_msgSend(objc_msgSend(v5, "slideProvidersForElementIDs"), "objectForKey:", v6);
  if (!v7)
  {
    NSLog(@"No slide provider for elementID %@", v6);
    goto LABEL_13;
  }
  return [v7 endLiveUpdate];
}

- (void)beginGesture:(id)a3
{
  id v5 = [a3 hitBlob];
  [(MRMarimbaLayer *)self beginLiveUpdateForHitBlob:v5];
  id v6 = [v5 proxyForSlide];
  -[MZMediaManagement resolutionForAssetAtPath:](-[MRRenderer assetManagementDelegate](-[MRMarimbaLayer renderer](self, "renderer"), "assetManagementDelegate"), "resolutionForAssetAtPath:", [v6 path]);
  BOOL v9 = v8 <= 0.0 || v7 <= 0.0;
  double v10 = v7 / v8;
  if (v9) {
    double v11 = 1.0;
  }
  else {
    double v11 = v10;
  }
  [a3 locationInViewAtStart];
  -[MRMarimbaLayer convertPoint:toHitBlob:](self, "convertPoint:toHitBlob:", v5);
  double v13 = v12;
  double v15 = v14;
  [v6 center];
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(a3, "setSlideCenterAtStart:");
  [v6 rotation];
  double v21 = v20;
  objc_msgSend(a3, "setSlideRotationAtStart:");
  [v6 scale];
  double v23 = v22;
  objc_msgSend(a3, "setSlideScaleAtStart:");
  [a3 setLinearScaleAtStart:v23];
  id v24 = [v6 sizingMode];
  if (!v24 || [v24 isEqualToString:@"Crop to Fit"])
  {
    [v5 aspectRatio];
    double v26 = v25;
    [a3 linearScaleAtStart];
    double v28 = v27;
    if (v26 >= v11)
    {
      [a3 linearScaleAtStart];
      double v33 = v32;
      [v5 aspectRatio];
      double v31 = v33 * v34 / v11;
    }
    else
    {
      [v5 aspectRatio];
      double v28 = v11 * v28 / v29;
      [a3 linearScaleAtStart];
      double v31 = v30;
    }
    [a3 setLinearScaleAtStart:v28];
    double v17 = v17 + (0.5 - v17) / v28;
    double v19 = v19 + (0.5 - v19) / v31;
  }
  float v35 = v21;
  __float2 v36 = __sincosf_stret(v35);
  [a3 linearScaleAtStart];
  double v38 = v36.__cosval * 0.5 / v37;
  [a3 linearScaleAtStart];
  double v40 = v36.__sinval * 0.5 / v39;
  [v5 aspectRatio];
  objc_msgSend(a3, "setLocationInSlideAtStart:", v17 + v13 * v38 + v15 * v40 * (1.0 / v41), v19 + (v15 * v38 * (1.0 / v41) - v13 * v40) * v11);
  objc_msgSend(a3, "setCurrentTranslation:", CGPointZero.x, CGPointZero.y);
  [a3 setCurrentRotation:0.0];
  [a3 setCurrentScale:1.0];
}

- (void)doGesture:(id)a3
{
  id v5 = [a3 hitBlob];
  id v6 = [v5 proxyForSlide];
  -[MZMediaManagement resolutionForAssetAtPath:](-[MRRenderer assetManagementDelegate](-[MRMarimbaLayer renderer](self, "renderer"), "assetManagementDelegate"), "resolutionForAssetAtPath:", [v6 path]);
  BOOL v9 = v8 <= 0.0 || v7 <= 0.0;
  double v10 = v7 / v8;
  if (v9) {
    double v11 = 1.0;
  }
  else {
    double v11 = v10;
  }
  double v63 = v11;
  [a3 locationInViewAtStart];
  double v13 = v12;
  [a3 currentTranslation];
  double v15 = v13 + v14;
  [a3 locationInViewAtStart];
  double v17 = v16;
  [a3 currentTranslation];
  -[MRMarimbaLayer convertPoint:toHitBlob:](self, "convertPoint:toHitBlob:", v5, v15, v17 + v18);
  double v64 = v20;
  double v65 = v19;
  [a3 slideRotationAtStart];
  double v22 = v21;
  [a3 currentRotation];
  double v24 = v22 - v23;
  [v5 aspectRatio];
  double v66 = v24;
  float v25 = v24;
  double v27 = 1.0 / v26;
  __float2 v28 = __sincosf_stret(v25);
  [a3 linearScaleAtStart];
  double v30 = v29;
  [a3 currentScale];
  double v32 = v30 * v31;
  double v33 = fabs(v28.__cosval);
  double v34 = fabs(v28.__sinval);
  double v35 = v33 + v34 * v27;
  double v36 = v34 + v33 * v27;
  double v37 = v11 * v36;
  if (v35 >= v11 * v36) {
    double v38 = v35;
  }
  else {
    double v38 = v11 * v36;
  }
  if (v32 >= v38) {
    double v39 = v32;
  }
  else {
    double v39 = v38;
  }
  double v40 = v28.__cosval * 0.5 / v39;
  double v41 = v28.__sinval * 0.5 / v39;
  [a3 locationInSlideAtStart];
  double v62 = v42 - (v27 * (v64 * v41) + v65 * v40);
  [a3 locationInSlideAtStart];
  double v44 = v43 - (v27 * (v64 * v40) - v65 * v41) * v11;
  double v45 = v35 * 0.5;
  double v46 = v62;
  double v47 = v45 / v39;
  double v48 = v37 * 0.5 / v39;
  if (v62 < v47 || (double v47 = 1.0 - v47, v62 > v47)) {
    double v46 = v47;
  }
  if (v44 < v48 || (double v48 = 1.0 - v48, v44 > v48)) {
    double v44 = v48;
  }
  id v49 = [v6 sizingMode];
  if (v49 && ![v49 isEqualToString:@"Crop to Fit"])
  {
    double v54 = v46;
  }
  else
  {
    [v5 aspectRatio];
    double v51 = v50;
    [v5 aspectRatio];
    double v53 = 0.5;
    double v54 = 0.5;
    double v55 = v39 * v52 / v63;
    if (v39 != 1.0) {
      double v54 = (v46 * v39 + -0.5) / (v39 + -1.0);
    }
    if (v55 != 1.0) {
      double v53 = (v44 * v55 + -0.5) / (v55 + -1.0);
    }
    if (v51 < v63) {
      double v39 = v55;
    }
    double v44 = v53;
  }
  [v6 rotation];
  if (v66 != v56) {
    [v6 setRotation:v66];
  }
  [v6 scale];
  if (v39 != v57) {
    [v6 setScale:v39];
  }
  [v6 center];
  if (v54 != v59 || v44 != v58) {
    objc_msgSend(v6, "setCenter:", v54, v44);
  }
  v61 = [(MRMarimbaLayer *)self renderer];
  [(MRRenderer *)v61 requestRendering:0];
}

- (void)endGesture:(id)a3
{
  -[MRMarimbaLayer endLiveUpdateForHitBlob:](self, "endLiveUpdateForHitBlob:", [a3 hitBlob]);
  double v4 = [(MRMarimbaLayer *)self renderer];
  [(MRRenderer *)v4 requestRendering:0];
}

- (void)cancelGesture:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "hitBlob"), "proxyForSlide");
  [a3 slideCenterAtStart];
  objc_msgSend(v5, "setCenter:");
  [a3 slideRotationAtStart];
  objc_msgSend(v5, "setRotation:");
  [a3 slideScaleAtStart];
  objc_msgSend(v5, "setScale:");
  [(MRMarimbaLayer *)self endGesture:a3];
}

+ (MRMarimbaLayer)layerWithDocument:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v7 = (MRMarimbaLayer *)+[MRMarimbaLayer layer];
  -[MRMarimbaLayer setFrame:](v7, "setFrame:", 0.0, 0.0, width, height);
  [(MRMarimbaLayer *)v7 setDocument:a3];
  return v7;
}

+ (MRMarimbaLayer)layerWithDocument:(id)a3
{
  double v4 = (MRMarimbaLayer *)+[MRMarimbaLayer layer];
  [(MRMarimbaLayer *)v4 setDocument:a3];
  return v4;
}

+ (void)releaseResources
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  uint64_t v3 = qword_1F1460;
  if (!qword_1F1460)
  {
    objc_msgSend(+[MREffectManager sharedManager](MREffectManager, "sharedManager"), "releaseResources");
    objc_msgSend(+[MRTransitionManager sharedManager](MRTransitionManager, "sharedManager"), "releaseResources");
    objc_msgSend(+[MRShaderManager sharedManager](MRShaderManager, "sharedManager"), "releaseResources");
    objc_msgSend(+[MRFrameManager sharedManager](MRFrameManager, "sharedManager"), "releaseResources");
    +[MUPoolObject clearAllPools];
  }
  byte_1F1468 = v3 != 0;
  objc_sync_exit(v2);
}

+ (MRMarimbaLayer)allocWithZone:(_NSZone *)a3
{
  id v5 = objc_opt_class();
  objc_sync_enter(v5);
  ++qword_1F1460;
  objc_sync_exit(v5);
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MRMarimbaLayer;
  return (MRMarimbaLayer *)objc_msgSendSuper2(&v7, "allocWithZone:", a3);
}

- (MRMarimbaLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)MRMarimbaLayer;
  v2 = [(MRMarimbaLayer *)&v5 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_correctsForAutorotation = 1;
    [(MRMarimbaLayer *)v2 setOpaque:1];
    [(MRMarimbaLayer *)v3 setNeedsDisplayOnBoundsChange:0];
    [(MRMarimbaLayer *)v3 setDrawableProperties:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", &__kCFBooleanFalse, kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, 0)];
  }
  return v3;
}

- (void)dealloc
{
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  [(MRMarimbaLayer *)self cleanup];

  self->_faceDetector = 0;
  if (self->_context)
  {
    [(MRMarimbaLayer *)self destroyFramebuffer];
    uint64_t v3 = +[EAGLContext currentContext];
    context = self->_context;
    if (v3 == context)
    {
      +[EAGLContext setCurrentContext:0];
      context = self->_context;
    }

    self->_context = 0;
  }
  objc_super v5 = objc_opt_class();
  objc_sync_enter(v5);
  if (!--qword_1F1460 && byte_1F1468 == 1) {
    [(id)objc_opt_class() releaseResources];
  }
  objc_sync_exit(v5);
  v6.receiver = self;
  v6.super_class = (Class)MRMarimbaLayer;
  [(MRMarimbaLayer *)&v6 dealloc];
}

- (void)cleanup
{
  lastSlideChange = self->_lastSlideChange;
  if (lastSlideChange)
  {

    self->_lastSlideChange = 0;
  }
  if (self->_faceDetector)
  {
    [(NSTimer *)self->_faceTimer invalidate];

    self->_faceTimer = 0;
    [(MPFaceDetector *)self->_faceDetector stop];

    self->_faceDetector = 0;
  }
  objc_sync_enter(self);
  if (self->_renderer)
  {
    [(MRMarimbaLayer *)self endMorphing];
    [(MRRenderer *)self->_renderer cleanup];

    self->_renderer = 0;
  }
  objc_sync_exit(self);
  document = self->_document;
  if (document)
  {

    self->_document = 0;
  }
}

- (MPDocument)document
{
  return self->_document;
}

- (BOOL)isAsynchronous
{
  return 1;
}

+ (BOOL)shouldRenderOnBackgroundThread
{
  return 1;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(MRMarimbaLayer *)self bounds];
  BOOL v10 = height != v9 || width != v8;
  v13.receiver = self;
  v13.super_class = (Class)MRMarimbaLayer;
  -[MRMarimbaLayer setBounds:](&v13, "setBounds:", x, y, width, height);
  if (self->_renderer)
  {
    if (self->_rendererSizeIsLocked)
    {
      self->_sizeChangedWhileRendererSizeWasLocked |= v10;
    }
    else if (self->_document)
    {
      if (v10)
      {
        double v11 = [(MRRenderer *)self->_renderer renderDispatchQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_126E18;
        block[3] = &unk_1AA6F8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)v11, block);
      }
      else
      {
        -[MRMarimbaLayer updateSizeOfRenderer:](self, "updateSizeOfRenderer:");
      }
    }
  }
}

- (CGSize)size
{
  [(MRMarimbaLayer *)self bounds];
  double v3 = v2;
  double v5 = v4;
  result.double height = v5;
  result.double width = v3;
  return result;
}

- (void)updateSizeOfRenderer:(id)a3
{
  double width = self->_frameBufferSize.width;
  double height = self->_frameBufferSize.height;
  [(MRMarimbaLayer *)self affineTransform];
  if (1.0 == 0.0)
  {
    uint64_t v6 = 4;
  }
  else if (-1.0 == 0.0)
  {
    uint64_t v6 = 3;
  }
  else if (1.0 == 0.0)
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v6 = 1;
  }
  if (!objc_msgSend(a3, "orientation", 0.0)) {
    [a3 setOrientation:v6];
  }
  if (v6 >= 3) {
    double v7 = height;
  }
  else {
    double v7 = width;
  }
  if (v6 >= 3) {
    double v8 = width;
  }
  else {
    double v8 = height;
  }
  objc_msgSend(a3, "setSize:", v8, v7);
}

- (void)setRendererSizeIsLocked:(BOOL)a3
{
  if (self->_rendererSizeIsLocked != a3)
  {
    self->_rendererSizeIsLocked = a3;
    if (!a3 && self->_document)
    {
      if (self->_sizeChangedWhileRendererSizeWasLocked)
      {
        double v4 = [(MRRenderer *)self->_renderer renderDispatchQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_127028;
        block[3] = &unk_1AA6F8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)v4, block);
      }
      else
      {
        [(MRMarimbaLayer *)self updateSizeOfRenderer:self->_renderer];
      }
    }
    self->_sizeChangedWhileRendererSizeWasLocked = 0;
  }
}

- (void)setContentsScale:(double)a3
{
  [(MRMarimbaLayer *)self contentsScale];
  if (v5 != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)MRMarimbaLayer;
    [(MRMarimbaLayer *)&v8 setContentsScale:a3];
    if (self->_document)
    {
      renderer = self->_renderer;
      if (renderer)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_127144;
        block[3] = &unk_1AA6F8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)[(MRRenderer *)renderer renderDispatchQueue], block);
      }
    }
  }
}

- (void)setDocument:(id)a3
{
  if (self->_document)
  {
    if (self->_renderer)
    {
      [(MRMarimbaLayer *)self endMorphing];
      [(MRRenderer *)self->_renderer setMontage:0];
    }
    [+[NSNotificationCenter defaultCenter] removeObserver:self];

    self->_document = 0;
  }
  double v5 = (MPDocument *)a3;
  self->_document = v5;
  if (v5)
  {
    document = v5;
    renderer = self->_renderer;
    objc_super v8 = renderer;
    if (!renderer)
    {
      objc_super v8 = [[MRRenderer alloc] initWithParameters:+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_isReadonly), @"readonly", &__kCFBooleanFalse, @"noAudio", +[NSNumber numberWithBool:self->_slidesAreReadonly], @"slidesAreReadonly", 0)];
      document = self->_document;
    }
    [(MRRenderer *)v8 setAssetManagementDelegate:document];
    [(MRRenderer *)v8 setFeatureDelegate:self->_document];
    [(MRRenderer *)v8 setLiveSlideshowDelegate:self];
    [(MRRenderer *)v8 setAsynchronousOperationsDelegate:self];
    [(MRRenderer *)v8 setIsEditing:0];
    LODWORD(v9) = 1.0;
    [(MRRenderer *)v8 setVolume:v9];
    -[MRRenderer setMontage:](v8, "setMontage:", [a3 montage]);
    [(MRRenderer *)v8 setRequestRenderingOnChanges:1];
    [(MRRenderer *)v8 setInteractivityIsEnabled:self->_interactivityIsEnabled];
    objc_msgSend(objc_msgSend(objc_msgSend(-[MPDocument mainLayers](self->_document, "mainLayers"), "lastObject"), "plug"), "container");
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
      -[MRRenderer setTransitionLayerPlugObjectID:](v8, "setTransitionLayerPlugObjectID:", objc_msgSend(objc_msgSend(objc_msgSend(-[MPDocument mainLayers](self->_document, "mainLayers"), "lastObject"), "plug"), "objectID"));
    }
    [+[NSNotificationCenter defaultCenter] addObserver:self selector:"didLiveChanged:" name:@"kMPAuthoringLiveDidChangeNotification" object:self->_document];
    [+[NSNotificationCenter defaultCenter] addObserver:self selector:"didAddEffects:" name:@"kMPAuthoringLiveDidAddEffectsNotification" object:self->_document];
    [+[NSNotificationCenter defaultCenter] addObserver:self selector:"didApplyStyle:" name:@"kMPAuthoringDidFinishApplyingStyleNotification" object:self->_document];
    if (self->_enableSlideDidChangeNotification)
    {
      BOOL v10 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v10 addObserver:self selector:"_slideDidAppear:" name:kMRNotificationSlideIsOn object:0];
    }
    [(MRMarimbaLayer *)self bounds];
    double v12 = v11;
    if (self->_context)
    {
      [(MRRenderer *)v8 setEAGLContext:0];
      [(MRMarimbaLayer *)self destroyFramebuffer];
      objc_super v13 = +[EAGLContext currentContext];
      context = self->_context;
      if (v13 == context)
      {
        +[EAGLContext setCurrentContext:0];
        context = self->_context;
      }

      self->_context = 0;
    }
    double v15 = (EAGLContext *)[objc_alloc((Class)EAGLContext) initWithAPI:2];
    self->_context = v15;
    if (v15)
    {
      [(MRRenderer *)v8 setEAGLContext:v15];
      if (v12 > 0.0)
      {
        [(MRMarimbaLayer *)self updateFramebuffer];
        if (self->_context) {
          [(MRMarimbaLayer *)self updateSizeOfRenderer:v8];
        }
      }
    }
    if (!renderer)
    {
      objc_sync_enter(self);
      self->_renderer = v8;
      objc_sync_exit(self);
    }
  }
  if ([(MPDocument *)self->_document detectFacesInBackground])
  {
    [(MRMarimbaLayer *)self setupFaceDetection];
  }
}

- (void)setupFaceDetection
{
  if (self->_faceDetector)
  {
    [(NSTimer *)self->_faceTimer invalidate];

    self->_faceTimer = 0;
    [(MPFaceDetector *)self->_faceDetector stop];

    self->_faceDetector = 0;
  }
  double v3 = objc_alloc_init(MPFaceDetector);
  self->_faceDetector = v3;
  [(MPFaceDetector *)v3 setDocument:self->_document];
  [(MPFaceDetector *)self->_faceDetector setRenderer:self];
  [(MPFaceDetector *)self->_faceDetector setIsCancelled:0];
  objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "delayFaceDetectionForStyleID:", -[MPDocument styleID](self->_document, "styleID"));
  if (v4 == 0.0)
  {
    faceDetector = self->_faceDetector;
    [(MPFaceDetector *)faceDetector start];
  }
  else
  {
    self->_faceTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self->_faceDetector, "start", 0, 0);
  }
}

- (void)didLiveChanged:(id)a3
{
  objc_msgSend(objc_msgSend(objc_msgSend(-[MPDocument mainLayers](self->_document, "mainLayers", a3), "lastObject"), "plug"), "container");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    -[MRRenderer setTransitionLayerPlugObjectID:](self->_renderer, "setTransitionLayerPlugObjectID:", objc_msgSend(objc_msgSend(objc_msgSend(-[MPDocument mainLayers](self->_document, "mainLayers"), "lastObject"), "plug"), "objectID"));
  }
  renderer = self->_renderer;
  [(MRRenderer *)renderer setLiveSlideshowDelegate:self];
}

- (void)togglePlayback
{
  if ([(MRRenderer *)self->_renderer isPlaying])
  {
    [(MRMarimbaLayer *)self pause];
  }
  else
  {
    [(MRMarimbaLayer *)self play];
  }
}

- (void)setInteractivityIsEnabled:(BOOL)a3
{
  self->_interactivityIsEnabled = a3;
  renderer = self->_renderer;
  if (renderer) {
    -[MRRenderer setInteractivityIsEnabled:](renderer, "setInteractivityIsEnabled:");
  }
}

- (BOOL)isPlaying
{
  return [(MRRenderer *)self->_renderer isPlaying];
}

- (void)play
{
  if (self->_stopWithVideo)
  {
    renderer = self->_renderer;
    [(MPDocument *)self->_document videoDuration];
    [(MRRenderer *)renderer setMasterStartTime:0 andDuration:0.0 mode:v4 + 0.00001];
  }
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  [(MRRenderer *)self->_renderer resume];
  [(MRRenderer *)self->_renderer resumeSlideshow];
  faceDetector = self->_faceDetector;
  if (faceDetector && !self->_wasSuspended)
  {
    [(MPFaceDetector *)faceDetector resume];
  }
}

- (void)pause
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  [(MRRenderer *)self->_renderer pause];
  faceDetector = self->_faceDetector;
  if (faceDetector)
  {
    self->_wasSuspended = [(MPFaceDetector *)faceDetector suspended];
    double v4 = self->_faceDetector;
    [(MPFaceDetector *)v4 suspend];
  }
}

- (void)pauseWhenStill
{
}

- (BOOL)stopWithVideo
{
  return self->_stopWithVideo;
}

- (void)setStopWithVideo:(BOOL)a3
{
  self->_stopWithVideo = a3;
  renderer = self->_renderer;
  if (a3)
  {
    [(MPDocument *)self->_document videoDuration];
    double v5 = v4;
    uint64_t v6 = renderer;
    uint64_t v7 = 0;
  }
  else
  {
    double v5 = -1.0;
    uint64_t v6 = self->_renderer;
    uint64_t v7 = 1;
  }
  [(MRRenderer *)v6 setMasterStartTime:v7 andDuration:0.0 mode:v5];
}

- (BOOL)displaysFPS
{
  return [(MRRenderer *)self->_renderer displaysFPS];
}

- (void)setDisplaysFPS:(BOOL)a3
{
}

- (double)time
{
  [(MRRenderer *)self->_renderer time];
  return result;
}

- (void)setTime:(double)a3
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  renderer = self->_renderer;
  [(MRRenderer *)renderer setTime:a3];
}

- (double)timeRemaining
{
  [(MPDocument *)self->_document duration];
  double v4 = v3;
  [(MRRenderer *)self->_renderer time];
  return v4 - v5;
}

- (double)volume
{
  [(MRRenderer *)self->_renderer volume];
  return v2;
}

- (void)setVolume:(double)a3
{
  *(float *)&a3 = a3;
  [(MRRenderer *)self->_renderer setVolume:a3];
}

- (void)setSuspended:(BOOL)a3
{
  faceDetector = self->_faceDetector;
  if (a3) {
    [(MPFaceDetector *)faceDetector suspend];
  }
  else {
    [(MPFaceDetector *)faceDetector resume];
  }
}

- (BOOL)isAboutToPlay
{
  return self->_isAboutToPlay;
}

- (void)setIsAboutToPlay:(BOOL)a3
{
  self->_isAboutToPladouble y = a3;
}

- (void)goBack
{
}

- (void)goForth
{
}

- (void)gotoEnd
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  [(MCPlug *)[(MCMontage *)[(MRRenderer *)self->_renderer montage] rootPlug] fullDuration];
  renderer = self->_renderer;
  -[MRRenderer setTime:](renderer, "setTime:");
}

- (void)gotoBeginning
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  renderer = self->_renderer;
  [(MRRenderer *)renderer setTime:0.0];
}

- (void)nextFrame
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  renderer = self->_renderer;
  [(MRRenderer *)renderer time];
  double v5 = v4 + 0.0166666667;
  [(MRRenderer *)renderer setTime:v5];
}

- (void)prevFrame
{
  [(MRMarimbaLayer *)self setBailTimeWatcher:1];
  renderer = self->_renderer;
  [(MRRenderer *)renderer time];
  double v5 = v4 + -0.0166666667;
  [(MRRenderer *)renderer setTime:v5];
}

- (MRRenderer)renderer
{
  objc_sync_enter(self);
  double v3 = self->_renderer;
  objc_sync_exit(self);
  return v3;
}

- (double)framesPerSecond
{
  [(MRRenderer *)self->_renderer timeQuantum];
  return 1.0 / v2;
}

- (void)setFramesPerSecond:(double)a3
{
}

- (void)requestRendering:(BOOL)a3
{
}

- (void)warmupRenderer
{
  double v2 = [(MRMarimbaLayer *)self renderer];
  [(MRRenderer *)v2 warmupVideo:1];
}

- (void)beginMorphingToAspectRatio:(double)a3 andOrientation:(int)a4 withDuration:(double)a5 switchToDocument:(id)a6
{
  if ((a4 - 1) <= 3)
  {
    uint64_t v8 = *(void *)&a4;
    [(MRRenderer *)self->_renderer size];
    if (v11 / v12 != a3 || [(MRRenderer *)self->_renderer orientation] != v8)
    {
      if (self->_morphingToAspectRatio == 0.0)
      {
        if (self->_correctsForAutorotation)
        {
          +[CATransaction begin];
          +[CATransaction setAnimationDuration:a5];
          uint64_t v23 = 0;
          long long v24 = xmmword_165180;
          uint64_t v25 = 0x400921FB54442D18;
          uint64_t v26 = 0;
          CGAffineTransformMakeRotation(&v22, *((CGFloat *)&v23 + v8));
          CGAffineTransform v21 = v22;
          [(MRMarimbaLayer *)self setAffineTransform:&v21];
          +[CATransaction commit];
        }
        renderer = self->_renderer;
        if (renderer)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_127FD0;
          block[3] = &unk_1AAC40;
          block[4] = a6;
          void block[5] = self;
          *(double *)&block[6] = a3;
          *(double *)&void block[7] = a5;
          dispatch_async((dispatch_queue_t)[(MRRenderer *)renderer renderDispatchQueue], block);
        }
        self->_morphingToAspectRatio = a3;
      }
      else
      {
        nextMorphInfo = self->_nextMorphInfo;
        if (nextMorphInfo) {

        }
        id v14 = objc_alloc((Class)NSDictionary);
        *(float *)&double v15 = a3;
        double v16 = +[NSNumber numberWithFloat:v15];
        double v17 = +[NSNumber numberWithInt:v8];
        *(float *)&double v18 = a5;
        self->_nextMorphInfo = (NSDictionary *)objc_msgSend(v14, "initWithObjectsAndKeys:", v16, @"aspectRatio", v17, @"orientation", +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18), @"duration", a6, @"nextDocument", 0);
      }
    }
  }
}

- (void)endMorphing
{
  if (self->_morphingToAspectRatio != 0.0)
  {
    self->_morphingToAspectRatio = 0.0;
    [(MRRenderer *)self->_renderer endMorphing];
    nextMorphInfo = self->_nextMorphInfo;
    if (nextMorphInfo)
    {
      objc_msgSend(-[NSDictionary objectForKey:](nextMorphInfo, "objectForKey:", @"duration"), "floatValue");
      double v5 = v4;
      objc_msgSend(-[NSDictionary objectForKey:](self->_nextMorphInfo, "objectForKey:", @"aspectRatio"), "floatValue");
      -[MRMarimbaLayer beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:](self, "beginMorphingToAspectRatio:andOrientation:withDuration:switchToDocument:", objc_msgSend(-[NSDictionary objectForKey:](self->_nextMorphInfo, "objectForKey:", @"orientation"), "intValue"), -[NSDictionary objectForKey:](self->_nextMorphInfo, "objectForKey:", @"nextDocument"), v6, v5);
      [(MRMarimbaLayer *)self performSelector:"endMorphing" withObject:0 afterDelay:v5];

      self->_nextMorphInfo = 0;
    }
  }
}

- (void)_reauthorForAspectRatioChange
{
  renderer = self->_renderer;
  if (renderer)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_128390;
    block[3] = &unk_1AA6F8;
    block[4] = self;
    dispatch_sync((dispatch_queue_t)[(MRRenderer *)renderer renderDispatchQueue], block);
  }
}

- (BOOL)nearingEndForSerializer:(id)a3
{
  if ([(MRMarimbaLayer *)self isPlaying])
  {
    if ([(MPDocument *)self->_document isLive])
    {
      id v5 = [(MRMarimbaLayer *)self _currentEffectContainer];
      if (v5)
      {
        float v6 = v5;
        [v5 introTransitionDuration];
        if (v7 != 0.0 || ([v6 outroTransitionDuration], v8 != 0.0))
        {
          [(MRMarimbaLayer *)self relativeTime];
          double v10 = v9;
          [v6 startTime];
          double v12 = v10 - v11;
          objc_msgSend(objc_msgSend(v6, "parentLayer"), "timeIn");
          double v14 = v12 - v13;
          [v6 introTransitionDuration];
          if (v14 < v15)
          {
            [v6 introTransitionDuration];
LABEL_10:
            [(MRMarimbaLayer *)self performSelector:"_nearingEndForSerializer:" withObject:a3 afterDelay:v16 - v14 + 0.1];
            return 0;
          }
          [v6 duration];
          double v18 = v17;
          [v6 outroTransitionDuration];
          if (v14 > v18 - v19 + -0.3)
          {
            [v6 duration];
            goto LABEL_10;
          }
        }
      }
    }
  }
  return [(MRMarimbaLayer *)self _nearingEndForSerializer:a3];
}

- (BOOL)_nearingEndForSerializer:(id)a3
{
  if ([(MPDocument *)self->_document isLive])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithObjectsAndKeys:", a3, @"container", 0);
    BOOL v6 = [(MPDocument *)self->_document nearingEndWithOptions:v5];
  }
  else
  {
    BOOL v6 = 0;
  }
  if (self->_stopWithVideo)
  {
    renderer = self->_renderer;
    [(MPDocument *)self->_document videoDuration];
    [(MRRenderer *)renderer setMasterStartTime:0 andDuration:0.0 mode:v8];
  }
  return v6;
}

- (BOOL)effect:(id)a3 requestedNumberOfSlides:(unint64_t)a4 firstSlideIndexStillNeeded:(unint64_t)a5
{
  BOOL v6 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4), @"requestedNumberOfSlides", +[NSNumber numberWithInteger:a5], @"firstSlideIndexStillNeeded", a3, @"container", 0);
  if ([(MRMarimbaLayer *)self isPlaying])
  {
    id v7 = [(MRMarimbaLayer *)self _currentEffectContainer];
    if (v7)
    {
      double v8 = v7;
      [v7 introTransitionDuration];
      if (v9 != 0.0 || ([v8 outroTransitionDuration], v10 != 0.0))
      {
        [(MRMarimbaLayer *)self relativeTime];
        double v12 = v11;
        [v8 startTime];
        double v14 = v12 - v13;
        objc_msgSend(objc_msgSend(v8, "parentLayer"), "timeIn");
        double v16 = v14 - v15;
        [v8 introTransitionDuration];
        if (v16 < v17)
        {
          [v8 introTransitionDuration];
LABEL_9:
          [(MRMarimbaLayer *)self performSelector:"_effectRequestedSlides:" withObject:v6 afterDelay:v18 - v16 + 0.1];
          return 0;
        }
        [v8 duration];
        double v20 = v19;
        [v8 outroTransitionDuration];
        if (v16 > v20 - v21 + -0.3)
        {
          [v8 duration];
          goto LABEL_9;
        }
      }
    }
  }
  return [(MRMarimbaLayer *)self _effectRequestedSlides:v6];
}

- (BOOL)_effectRequestedSlides:(id)a3
{
  BOOL v4 = [(MPDocument *)self->_document nearingEndWithOptions:a3];
  if (self->_stopWithVideo)
  {
    renderer = self->_renderer;
    [(MPDocument *)self->_document videoDuration];
    [(MRRenderer *)renderer setMasterStartTime:0 andDuration:0.0 mode:v6];
  }
  return v4;
}

- (void)didApplyStyle:(id)a3
{
  BOOL v4 = (MPDocument *)[a3 object];
  if (v4 == self->_document)
  {
    if ([(MPDocument *)v4 detectFacesInBackground])
    {
      if (objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "needsFaceDetectionForStyleID:", -[MPDocument styleID](self->_document, "styleID")))
      {
        if (self->_faceDetector)
        {
          [(NSTimer *)self->_faceTimer invalidate];

          self->_faceTimer = 0;
          [(MPFaceDetector *)self->_faceDetector setIsCancelled:0];
        }
        else
        {
          id v5 = objc_alloc_init(MPFaceDetector);
          self->_faceDetector = v5;
          [(MPFaceDetector *)v5 setDocument:self->_document];
          [(MPFaceDetector *)self->_faceDetector setRenderer:self];
          [(MPFaceDetector *)self->_faceDetector setIsCancelled:0];
          objc_msgSend(+[MPStyleManager sharedManager](MPStyleManager, "sharedManager"), "delayFaceDetectionForStyleID:", -[MPDocument styleID](self->_document, "styleID"));
          if (v6 != 0.0)
          {
            self->_faceTimer = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self->_faceDetector, "start", 0, 0);
            return;
          }
        }
        faceDetector = self->_faceDetector;
        [(MPFaceDetector *)faceDetector start];
      }
    }
    else if (self->_faceDetector)
    {
      [(NSTimer *)self->_faceTimer invalidate];

      self->_faceTimer = 0;
      [(MPFaceDetector *)self->_faceDetector stop];

      self->_faceDetector = 0;
    }
  }
}

- (void)didAddEffects:(id)a3
{
  if (self->_stopWithVideo)
  {
    renderer = self->_renderer;
    [(MPDocument *)self->_document videoDuration];
    [(MRRenderer *)renderer setMasterStartTime:0 andDuration:0.0 mode:v4];
  }
}

- (CGImage)snapshotAsCGImageForTime:(double)a3 withSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = [[MRSnapshotter alloc] initWithMontage:[(MPDocument *)self->_document montage] andAssetManagementDelegate:self->_document isReadOnly:1];
  -[MRSnapshotter setSize:](v7, "setSize:", width, height);
  double v8 = [(MRSnapshotter *)v7 CGImageSnapshotAtTime:a3];

  return v8;
}

- (CGImage)snapshotAsCGImage
{
  return [(MRRenderer *)self->_renderer currentFrameAsCGImage];
}

- (void)touchesBegan:(id)a3
{
}

- (void)touchesMoved:(id)a3
{
}

- (void)touchesEnded:(id)a3
{
}

- (void)touchesCancelled:(id)a3
{
}

- (void)setEnableSlideDidChangeNotification:(BOOL)a3
{
  if (self->_enableSlideDidChangeNotification != a3)
  {
    BOOL v3 = a3;
    self->_enableSlideDidChangeNotification = a3;
    id v5 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      double v6 = kMRNotificationSlideIsOn;
      [(NSNotificationCenter *)v5 addObserver:self selector:"_slideDidAppear:" name:v6 object:0];
    }
    else
    {
      id v7 = kMRNotificationSlideIsOn;
      [(NSNotificationCenter *)v5 removeObserver:self name:v7 object:0];
    }
  }
}

- (void)beginEditingOfText:(id)a3
{
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"text%d", [a3 index]);
  id v6 = [a3 nearestPlug];
  [(MRRenderer *)self->_renderer requestRenderingWithin:10.0];
  renderer = self->_renderer;
  [(MRRenderer *)renderer beginTextEditingOfElement:v5 inPlug:v6 callDelegate:1];
}

- (BOOL)isReadonly
{
  return self->_isReadonly;
}

- (void)setIsReadonly:(BOOL)a3
{
  self->_isReadonldouble y = a3;
}

- (BOOL)slidesAreReadonly
{
  return self->_slidesAreReadonly;
}

- (void)setSlidesAreReadonly:(BOOL)a3
{
  self->_slidesAreReadonldouble y = a3;
}

- (BOOL)enableSlideDidChangeNotification
{
  return self->_enableSlideDidChangeNotification;
}

- (BOOL)rendererSizeIsLocked
{
  return self->_rendererSizeIsLocked;
}

- (BOOL)correctsForAutorotation
{
  return self->_correctsForAutorotation;
}

- (void)setCorrectsForAutorotation:(BOOL)a3
{
  self->_correctsForAutorotation = a3;
}

- (BOOL)interactivityIsEnabled
{
  return self->_interactivityIsEnabled;
}

- (id)lastSlideChange
{
  return self->_lastSlideChange;
}

- (void)setLastSlideChange:(id)a3
{
  lastSlideChange = self->_lastSlideChange;
  if (lastSlideChange)
  {

    self->_lastSlideChange = 0;
  }
  self->_lastSlideChange = (NSString *)[a3 copy];
}

- (BOOL)bailTimeWatcher
{
  return self->_bailTimeWatcher;
}

- (void)setBailTimeWatcher:(BOOL)a3
{
  self->_bailTimeWatcher = a3;
}

- (void)destroyFramebuffer
{
  id v7 = +[EAGLContext currentContext];
  BOOL v3 = v7;
  if (v7 != self->_context) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:");
  }
  if (self->_viewFramebuffer) {
    glDeleteFramebuffers(1, &self->_viewFramebuffer);
  }
  self->_viewFramebuffer = 0;
  if (self->_viewRenderbuffer) {
    glDeleteRenderbuffers(1, &self->_viewRenderbuffer);
  }
  self->_viewRenderbuffer = 0;
  p_depthBuffer = &self->_depthBuffer;
  if (*p_depthBuffer) {
    glDeleteRenderbuffers(1, p_depthBuffer);
  }
  unsigned int *p_depthBuffer = 0;
  id v5 = +[EAGLContext currentContext];
  id v6 = v7;
  if (v5 != v7)
  {
    id v5 = (EAGLContext *)+[EAGLContext setCurrentContext:v7];
    id v6 = v7;
  }
  _objc_release_x1(v5, v6);
}

- (BOOL)updateFramebuffer
{
  BOOL v3 = +[EAGLContext currentContext];
  double v4 = v3;
  if (v3 != self->_context) {
    +[EAGLContext setCurrentContext:](EAGLContext, "setCurrentContext:");
  }
  p_viewFramebuffer = &self->_viewFramebuffer;
  if (!self->_viewFramebuffer) {
    glGenFramebuffers(1, &self->_viewFramebuffer);
  }
  p_viewRenderbuffer = &self->_viewRenderbuffer;
  if (!self->_viewRenderbuffer) {
    glGenRenderbuffers(1, &self->_viewRenderbuffer);
  }
  glBindFramebuffer(0x8D40u, *p_viewFramebuffer);
  glLabelObjectEXT(0x8D40u, *p_viewFramebuffer, 0, "Marimba Framebuffer");
  glBindRenderbuffer(0x8D41u, *p_viewRenderbuffer);
  glLabelObjectEXT(0x8D41u, *p_viewRenderbuffer, 0, "Marimba Renderbuffer");
  [(EAGLContext *)self->_context renderbufferStorage:36161 fromDrawable:self];
  glFramebufferRenderbuffer(0x8D40u, 0x8CE0u, 0x8D41u, *p_viewRenderbuffer);
  *(void *)params = 0;
  glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &params[1]);
  glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, params);
  p_unsigned int depthBuffer = &self->_depthBuffer;
  unsigned int depthBuffer = self->_depthBuffer;
  if (!depthBuffer)
  {
    glGenRenderbuffers(1, &self->_depthBuffer);
    unsigned int depthBuffer = *p_depthBuffer;
  }
  glBindRenderbuffer(0x8D41u, depthBuffer);
  glLabelObjectEXT(0x8D41u, *p_depthBuffer, 0, "Marimba Depthbuffer");
  glRenderbufferStorage(0x8D41u, 0x81A5u, params[1], params[0]);
  glFramebufferRenderbuffer(0x8D40u, 0x8D00u, 0x8D41u, *p_depthBuffer);
  glBindRenderbuffer(0x8D41u, *p_viewRenderbuffer);
  GLenum v9 = glCheckFramebufferStatus(0x8D40u);
  self->_frameBufferSize = CGSizeZero;
  if (v9 == 36053)
  {
    CGFloat v10 = (double)params[0];
    self->_frameBufferSize.double width = (double)params[1];
    self->_frameBufferSize.double height = v10;
  }
  else
  {
    uint64_t v11 = glCheckFramebufferStatus(0x8D40u);
    NSLog(@"failed to make complete framebuffer object %x", v11);
    GLint v49 = 0;
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD0u, &v49);
    uint64_t v12 = v49;
    uint64_t Error = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, %x, %x"), v12, Error);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD1u, &v49);
    uint64_t v14 = v49;
    uint64_t v15 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, %x, %x"), v14, v15);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD2u, &v49);
    uint64_t v16 = v49;
    uint64_t v17 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, %x, %x"), v16, v17);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8CE0u, 0x8CD3u, &v49);
    uint64_t v18 = v49;
    uint64_t v19 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE, %x, %x"), v18, v19);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD0u, &v49);
    uint64_t v20 = v49;
    uint64_t v21 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, %x, %x"), v20, v21);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD1u, &v49);
    uint64_t v22 = v49;
    uint64_t v23 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, %x, %x"), v22, v23);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD2u, &v49);
    uint64_t v24 = v49;
    uint64_t v25 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, %x, %x"), v24, v25);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D00u, 0x8CD3u, &v49);
    uint64_t v26 = v49;
    uint64_t v27 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE, %x, %x"), v26, v27);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD0u, &v49);
    uint64_t v28 = v49;
    uint64_t v29 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE, %x, %x"), v28, v29);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD1u, &v49);
    uint64_t v30 = v49;
    uint64_t v31 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME, %x, %x"), v30, v31);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD2u, &v49);
    uint64_t v32 = v49;
    uint64_t v33 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL, %x, %x"), v32, v33);
    glGetFramebufferAttachmentParameteriv(0x8D40u, 0x8D20u, 0x8CD3u, &v49);
    uint64_t v34 = v49;
    uint64_t v35 = glGetError();
    NSLog(@"GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT, GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE, %x, %x"), v34, v35);
    glBindRenderbuffer(0x8D41u, *p_viewRenderbuffer);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v49);
    uint64_t v36 = v49;
    uint64_t v37 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, %x, %x"), v36, v37);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v49);
    uint64_t v38 = v49;
    uint64_t v39 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, %x, %x"), v38, v39);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D44u, &v49);
    uint64_t v40 = v49;
    uint64_t v41 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_INTERNAL_FORMAT, %x, %x"), v40, v41);
    glBindRenderbuffer(0x8D41u, *p_depthBuffer);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D42u, &v49);
    uint64_t v42 = v49;
    uint64_t v43 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, %x, %x"), v42, v43);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D43u, &v49);
    uint64_t v44 = v49;
    uint64_t v45 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, %x, %x"), v44, v45);
    glGetRenderbufferParameteriv(0x8D41u, 0x8D44u, &v49);
    uint64_t v46 = v49;
    uint64_t v47 = glGetError();
    NSLog(@"GL_RENDERBUFFER, GL_RENDERBUFFER_INTERNAL_FORMAT, %x, %x"), v46, v47);
    glBindRenderbuffer(0x8D41u, *p_viewRenderbuffer);
  }
  if (+[EAGLContext currentContext] != v3) {
    +[EAGLContext setCurrentContext:v3];
  }

  return v9 == 36053;
}

@end