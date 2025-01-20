@interface THWAVTransportController
+ (id)transportControllerLayoutsForLayouts:(id)a3;
+ (void)createTransportControllerForLayouts:(id)a3;
- (BOOL)exitingExpanded;
- (BOOL)isCompact;
- (BOOL)isCurrentlyCompact;
- (BOOL)isMuted;
- (BOOL)isStopped;
- (BOOL)movieIsAtEnd;
- (BOOL)movieIsPlaying;
- (CGRect)frameOfHUDFor:(id)a3;
- (NSTimer)exitExpandedTimer;
- (THHUDHosting)currentHudHost;
- (THWAVTransportControllerDelegate)delegate;
- (THWAVTransportLayout)transportLayout;
- (THWAVTransportUI)transportUI;
- (THWAudioRep)audioRep;
- (THWButtonControlLayout)playButtonLayout;
- (THWMovieLayout)movieLayout;
- (TSKDocumentRoot)documentRoot;
- (double)currentTime;
- (double)duration;
- (double)onCanvasScale;
- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5;
- (id)computeLayoutGeometryForTransportLayout:(id)a3;
- (id)controlLayouts;
- (id)layoutGeometryForLayout:(id)a3;
- (id)movieRep;
- (id)playButtonRep;
- (int)controlStyle;
- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4;
- (void)buttonControlWasPressed:(id)a3;
- (void)changeCurrentTimeTo:(double)a3;
- (void)control:(id)a3 repWasAdded:(id)a4;
- (void)createTransportUI;
- (void)dealloc;
- (void)didExitExpanded;
- (void)durationChanged:(double)a3;
- (void)exitExpanded;
- (void)hideTransportHUDFor:(id)a3;
- (void)mediaDidPlayToEnd;
- (void)mediaWasPressed;
- (void)mediaWillBeRemoved;
- (void)moviePlayedToEnd;
- (void)p_cancelExitExpandedTimer;
- (void)pause;
- (void)play;
- (void)rateChanged:(double)a3;
- (void)setCurrentHudHost:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExitExpandedTimer:(id)a3;
- (void)setExitingExpanded:(BOOL)a3;
- (void)setIsCurrentlyCompact:(BOOL)a3;
- (void)setMovieLayout:(id)a3;
- (void)setPlayButtonLayout:(id)a3;
- (void)setTransportLayout:(id)a3;
- (void)setTransportUI:(id)a3;
- (void)showTransportHUDFor:(id)a3;
- (void)stop;
- (void)timeChanged:(double)a3;
- (void)toggleMute;
- (void)togglePlayPause;
- (void)viewScaleDidChange;
- (void)willExitExpandedShouldPause:(BOOL)a3;
@end

@implementation THWAVTransportController

+ (void)createTransportControllerForLayouts:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = (char *)[a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        v8 = (void *)TSUDynamicCast();
        if (v8)
        {
          v9 = v8;
          if (![v8 mediaListener])
          {
            id v10 = [[THWAVController sharedController] newTransportController];
            [v10 setMovieLayout:v9];
            [v9 setMediaListener:v10];
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = (char *)[a3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

+ (id)transportControllerLayoutsForLayouts:(id)a3
{
  id v4 = +[NSMutableArray array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v5 = (char *)[a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(a3);
        }
        objc_opt_class();
        v9 = (void *)TSUDynamicCast();
        if (v9)
        {
          id v10 = v9;
          if (![v9 mediaListener])
          {
            id v11 = [[THWAVController sharedController] newTransportController];
            [v11 setMovieLayout:v10];
            [v10 setMediaListener:v11];
          }
          objc_opt_class();
          [v10 mediaListener];
          long long v12 = (void *)TSUDynamicCast();
          objc_opt_class();
          [v10 info];
          long long v13 = (void *)TSUDynamicCast();
          if ((![v13 isAudioOnly]
             || [v13 isAudioOnly]
             && [v13 controlStyle] == 1
             && ![v13 posterImageData])
            && ![v12 transportLayout])
          {
            if (([v13 isAudioOnly] & 1) != 0
              || ([v10 isExpanded] & 1) != 0
              || [v13 autoplayConfig]
              && (objc_msgSend(objc_msgSend(v13, "autoplayConfig"), "enabled") & 1) != 0)
            {
              long long v14 = 0;
            }
            else
            {
              long long v14 = [(THWControlLayout *)[THWButtonControlLayout alloc] initWithTag:0];
              [(THWButtonControlLayout *)v14 invalidateFrame];
            }
            v15 = objc_alloc_init(THWAVTransportLayout);
            [(THWAVTransportLayout *)v15 invalidateFrame];
            [v12 setPlayButtonLayout:v14];
            [v12 setTransportLayout:v15];
            [(THWAVTransportLayout *)v15 setTransportController:v12];
          }
          objc_msgSend(v4, "addObjectsFromArray:", objc_msgSend(objc_msgSend(v10, "mediaListener"), "controlLayouts"));
        }
        ++v8;
      }
      while (v6 != v8);
      v16 = (char *)[a3 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v6 = v16;
    }
    while (v16);
  }
  return v4;
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"p_hideUI:" object:self];
  [(THWAVTransportController *)self p_cancelExitExpandedTimer];

  [(THWAVTransportLayout *)self->_transportLayout setTransportController:0];
  v3.receiver = self;
  v3.super_class = (Class)THWAVTransportController;
  [(THWAVTransportController *)&v3 dealloc];
}

- (BOOL)isCompact
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController");
  objc_super v3 = (void *)TSUDynamicCast();
  if ([v3 isCompactWidth]) {
    return 1;
  }

  return [v3 isCompactHeight];
}

- (double)onCanvasScale
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController");
  objc_super v3 = (void *)TSUDynamicCast();
  if (!v3) {
    return 1.0;
  }

  [v3 viewScale];
  return result;
}

- (void)showTransportHUDFor:(id)a3
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController");
  -[THWAVTransportController setCurrentHudHost:](self, "setCurrentHudHost:", objc_msgSend(objc_msgSend(objc_msgSend((id)TSUDynamicCast(), "layerHost"), "viewController"), "im_ancestorViewControllerConformingToProtocol:", &OBJC_PROTOCOL___THHUDHosting));
  v5 = [(THWAVTransportController *)self currentHudHost];

  [(THHUDHosting *)v5 showHUDForVendor:a3];
}

- (void)hideTransportHUDFor:(id)a3
{
  id v4 = [(THWAVTransportController *)self currentHudHost];

  [(THHUDHosting *)v4 hideHUDForVendor:a3];
}

- (CGRect)frameOfHUDFor:(id)a3
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWAVTransportLayout layoutController](-[THWAVTransportController transportLayout](self, "transportLayout"), "layoutController"), "canvas"), "canvasController");
  id v5 = [[[TSUDynamicCast() layerHost] viewController] im_ancestorViewControllerConformingToProtocol:&OBJC_PROTOCOL___THHUDHosting];

  [v5 frameForHUDFromVendor:a3];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)viewScaleDidChange
{
  BOOL v3 = [(THWAVTransportController *)self isCompact];
  if (v3 != [(THWAVTransportController *)self isCurrentlyCompact])
  {
    [(THWAVTransportController *)self setIsCurrentlyCompact:v3];
    id v4 = [(THWAVTransportController *)self transportUI];
    [(THWAVTransportUI *)v4 compactnessChanged];
  }
}

- (id)controlLayouts
{
  id v3 = +[NSMutableArray array];
  if ([(THWAVTransportController *)self playButtonLayout]) {
    [v3 addObject:[self playButtonLayout]];
  }
  if ([(THWAVTransportController *)self transportLayout]) {
    [v3 addObject:[self transportLayout]];
  }
  return v3;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  if (![a3 tag])
  {
    objc_opt_class();
    id v5 = (void *)TSUDynamicCast();
    [v5 setDelegate:self];
  }
}

- (void)createTransportUI
{
  if (!self->_transportUI)
  {
    if (objc_msgSend(-[THWMovieLayout movieInfo](-[THWAVTransportController movieLayout](self, "movieLayout"), "movieInfo"), "isAudioOnly"))
    {
      id v3 = [(THWAVTransportUI *)[THWAVAudioUI alloc] initWithTransportController:self];
      [(THWAVTransportController *)self setTransportUI:v3];
    }
    else
    {
      id v4 = +[TSUAssertionHandler currentHandler];
      id v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAVTransportController createTransportUI]");
      double v6 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWAVTransportController.m"];
      [v4 handleFailureInFunction:v5 file:v6 lineNumber:248 description:@"Should never be asked to create a transport UI in this case"];
    }
  }
}

- (id)playButtonRep
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWButtonControlLayout layoutController](-[THWAVTransportController playButtonLayout](self, "playButtonLayout"), "layoutController"), "canvas"), "repForLayout:", -[THWAVTransportController playButtonLayout](self, "playButtonLayout"));

  return (id)TSUDynamicCast();
}

- (THWAudioRep)audioRep
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWMovieLayout layoutController](-[THWAVTransportController movieLayout](self, "movieLayout"), "layoutController"), "canvas"), "repForLayout:", -[THWAVTransportController movieLayout](self, "movieLayout"));

  return (THWAudioRep *)TSUDynamicCast();
}

- (id)movieRep
{
  objc_opt_class();
  objc_msgSend(objc_msgSend(-[THWMovieLayout layoutController](-[THWAVTransportController movieLayout](self, "movieLayout"), "layoutController"), "canvas"), "repForLayout:", -[THWAVTransportController movieLayout](self, "movieLayout"));

  return (id)TSUDynamicCast();
}

- (TSKDocumentRoot)documentRoot
{
  CGRect result = [(THWAVTransportController *)self audioRep];
  if (result)
  {
    id v4 = [(THWAudioRep *)[(THWAVTransportController *)self audioRep] interactiveCanvasController];
    return (TSKDocumentRoot *)[v4 documentRoot];
  }
  return result;
}

- (id)computeLayoutGeometryForTransportLayout:(id)a3
{
  [(THWMovieLayout *)[(THWAVTransportController *)self movieLayout] validate];
  [(-[THWAVTransportController movieLayout](self, "movieLayout")) geometry].size;
  TSDRectWithSize();
  id v8 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v4, v5, v6, v7];

  return v8;
}

- (id)layoutGeometryForLayout:(id)a3
{
  double v4 = (void *)TSUProtocolCast();
  if (!v4 || [v4 tag]) {
    return 0;
  }
  [(-[THWAVTransportController movieLayout](self, "movieLayout")) geometry].size
  TSDRectWithSize();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  if ([(THWAVTransportController *)self shouldShowPlayButton])
  {
    double v7 = v7 + (v11 + -86.0) * 0.5;
    double v9 = v9 + (v13 + -86.0) * 0.5;
    double v14 = 86.0;
  }
  else
  {
    double v14 = 0.1;
  }
  id v15 = [objc_alloc((Class)TSDLayoutGeometry) initWithFrame:v7, v9, v14, v14];

  return v15;
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v7 = THBundle();
  CFStringRef v8 = @"ib_media_btn_small_pause-N";
  if (v5) {
    CFStringRef v8 = @"ib_media_btn_small_pause-P";
  }
  CFStringRef v9 = @"ib_media_movie_play-N";
  if (v5) {
    CFStringRef v9 = @"ib_media_movie_play-P";
  }
  if (a4) {
    CFStringRef v10 = v8;
  }
  else {
    CFStringRef v10 = v9;
  }

  return +[TSUImage imageNamed:v10 inBundle:v7];
}

- (void)buttonControlWasPressed:(id)a3
{
  id v5 = [a3 layout];
  if (![v5 tag])
  {
    if ([a3 state])
    {
      [(THWAVTransportController *)self pause];
    }
    else
    {
      [(THWAVTransportController *)self play];
      [(THWAVTransportController *)self duration];
      -[THWAVTransportController durationChanged:](self, "durationChanged:");
    }
    [v5 invalidateFrame];
    double v6 = [(THWAVTransportController *)self movieLayout];
    [(THWMovieLayout *)v6 invalidate];
  }
}

- (void)buttonControl:(id)a3 didUpdateLayer:(id)a4
{
  [a4 setMinificationFilter:kCAFilterTrilinear];

  [a4 setMagnificationFilter:kCAFilterTrilinear];
}

- (void)timeChanged:(double)a3
{
  double v4 = [(THWAVTransportController *)self transportUI];

  [(THWAVTransportUI *)v4 timeChanged:a3];
}

- (void)durationChanged:(double)a3
{
  double v4 = [(THWAVTransportController *)self transportUI];

  [(THWAVTransportUI *)v4 durationChanged:a3];
}

- (void)rateChanged:(double)a3
{
  -[THWAVTransportController configurePlayButtonForRate:](self, "configurePlayButtonForRate:");
  [(THWAVTransportUI *)[(THWAVTransportController *)self transportUI] rateChanged:a3];
  if ([(THWAVTransportController *)self isStopped]) {
    [(THWButtonControlLayout *)[(THWAVTransportController *)self playButtonLayout] invalidateFrame];
  }
  if (a3 == 0.0 && [(THWAVTransportController *)self movieIsAtEnd])
  {
    [(THWAVTransportController *)self moviePlayedToEnd];
  }
}

- (void)mediaDidPlayToEnd
{
  v2 = [(THWAVTransportController *)self transportUI];

  [(THWAVTransportUI *)v2 mediaDidPlayToEnd];
}

- (void)mediaWillBeRemoved
{
  [(THWAVTransportController *)self p_cancelExitExpandedTimer];
  [+[THWAVController sharedController](THWAVController, "sharedController") transportControllerDidBecomeInvalid:self];

  [(THWAVTransportController *)self setDelegate:0];
}

- (void)mediaWasPressed
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1DA2B4;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Media Pressed", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)willExitExpandedShouldPause:(BOOL)a3
{
  BOOL v3 = a3;
  [(THWAVTransportController *)self p_cancelExitExpandedTimer];
  objc_msgSend(objc_msgSend(-[THWMovieLayout info](-[THWAVTransportController movieLayout](self, "movieLayout"), "info"), "geometry"), "size");
  if ([(THWAVTransportUI *)[(THWAVTransportController *)self transportUI] shouldPlayOnMainCanvasWithSize:v5])
  {
    if (v3)
    {
      [(THWAVTransportController *)self pause];
    }
  }
  else
  {
    [(THWAVTransportController *)self stop];
  }
}

- (void)didExitExpanded
{
}

- (void)moviePlayedToEnd
{
  if ([(THWAVTransportController *)self delegate]
    && ![(THWAVTransportController *)self exitingExpanded])
  {
    [(THWAVTransportController *)self p_cancelExitExpandedTimer];
  }
}

- (BOOL)movieIsAtEnd
{
  [(THWAVTransportController *)self duration];
  double v4 = v3;
  [(THWAVTransportController *)self currentTime];
  return v4 - v5 < 0.2;
}

- (BOOL)isStopped
{
  return 1;
}

- (double)duration
{
  [self movieLayout].movieInfo.endTime
  double v4 = v3;
  [(-[THWAVTransportController movieLayout](self, "movieLayout")) movieInfo].startTime;
  return v4 - v5;
}

- (double)currentTime
{
  if (![(THWAVTransportController *)self audioRep]) {
    return 0.0;
  }
  double v3 = [(THWAVTransportController *)self audioRep];

  [(THWAudioRep *)v3 currentTime];
  return result;
}

- (BOOL)movieIsPlaying
{
  double v3 = [(THWAVTransportController *)self audioRep];
  if (v3)
  {
    double v4 = [(THWAVTransportController *)self audioRep];
    LOBYTE(v3) = [(THWAudioRep *)v4 isPlaying];
  }
  return (char)v3;
}

- (void)toggleMute
{
  unsigned int v3 = [(THWAVTransportController *)self isMuted];
  if ([(THWAVTransportController *)self audioRep])
  {
    double v4 = [(THWAVTransportController *)self audioRep];
    [(THWAudioRep *)v4 setMuted:v3 ^ 1];
  }
}

- (BOOL)isMuted
{
  unsigned int v3 = [(THWAVTransportController *)self audioRep];
  if (v3)
  {
    double v4 = [(THWAVTransportController *)self audioRep];
    LOBYTE(v3) = [(THWAudioRep *)v4 isMuted];
  }
  return (char)v3;
}

- (void)play
{
  if ([(THWAVTransportController *)self audioRep])
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1DA6A4;
    activity_block[3] = &unk_456DE0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "Audio Rep Play", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)pause
{
  if ([(THWAVTransportController *)self audioRep])
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1DA764;
    activity_block[3] = &unk_456DE0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "Audio Rep Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)stop
{
  if ([(THWAVTransportController *)self audioRep])
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_1DA89C;
    activity_block[3] = &unk_456DE0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "Audio Rep Stop", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  if ([(THWAVTransportController *)self movieRep])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1DA8C8;
    v3[3] = &unk_456DE0;
    v3[4] = self;
    _os_activity_initiate(&dword_0, "Movie Rep Stop", OS_ACTIVITY_FLAG_DEFAULT, v3);
  }
  [(THWAVTransportUI *)[(THWAVTransportController *)self transportUI] mediaDidStop];
}

- (void)togglePlayPause
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_1DA974;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "Toggle Play Pause", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)changeCurrentTimeTo:(double)a3
{
  if ([(THWAVTransportController *)self audioRep])
  {
    double v5 = [(THWAVTransportController *)self audioRep];
    [(THWAudioRep *)v5 changeCurrentTimeTo:a3];
  }
}

- (void)exitExpanded
{
  [(THWAVTransportController *)self setExitingExpanded:1];
  if (![(THWAVTransportController *)self delegate]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWAVTransportController exitExpanded]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Movie/THWAVTransportController.m") lineNumber:640 description:@"invalid nil value for '%s'", "self.delegate"];
  }
  [(THWAVTransportControllerDelegate *)[(THWAVTransportController *)self delegate] exitAVPresentation:self];
  [(THWAVTransportController *)self p_cancelExitExpandedTimer];
  if (![(THWMovieLayout *)[(THWAVTransportController *)self movieLayout] isIntroMedia]) {
    [(THWAVTransportController *)self setDelegate:0];
  }

  [(THWAVTransportController *)self setExitingExpanded:0];
}

- (int)controlStyle
{
  id v2 = [(THWMovieLayout *)[(THWAVTransportController *)self movieLayout] movieInfo];

  return [v2 controlStyle];
}

- (void)p_cancelExitExpandedTimer
{
  [(NSTimer *)[(THWAVTransportController *)self exitExpandedTimer] invalidate];

  [(THWAVTransportController *)self setExitExpandedTimer:0];
}

- (THWButtonControlLayout)playButtonLayout
{
  return self->_playButtonLayout;
}

- (void)setPlayButtonLayout:(id)a3
{
}

- (THWMovieLayout)movieLayout
{
  return self->_movieLayout;
}

- (void)setMovieLayout:(id)a3
{
  self->_movieLayout = (THWMovieLayout *)a3;
}

- (THWAVTransportLayout)transportLayout
{
  return self->_transportLayout;
}

- (void)setTransportLayout:(id)a3
{
}

- (THWAVTransportUI)transportUI
{
  return self->_transportUI;
}

- (void)setTransportUI:(id)a3
{
}

- (THWAVTransportControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWAVTransportControllerDelegate *)a3;
}

- (NSTimer)exitExpandedTimer
{
  return self->_exitExpandedTimer;
}

- (void)setExitExpandedTimer:(id)a3
{
}

- (BOOL)exitingExpanded
{
  return self->_exitingExpanded;
}

- (void)setExitingExpanded:(BOOL)a3
{
  self->_exitingExpanded = a3;
}

- (BOOL)isCurrentlyCompact
{
  return self->_isCurrentlyCompact;
}

- (void)setIsCurrentlyCompact:(BOOL)a3
{
  self->_isCurrentlyCompact = a3;
}

- (THHUDHosting)currentHudHost
{
  return self->_currentHudHost;
}

- (void)setCurrentHudHost:(id)a3
{
  self->_currentHudHost = (THHUDHosting *)a3;
}

@end