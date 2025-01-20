@interface THWKeynoteShowRep
- (BOOL)canHandleGesture:(id)a3;
- (BOOL)handleGesture:(id)a3;
- (BOOL)kpfPlayer:(id)a3 handleURL:(id)a4;
- (BOOL)ownsShow;
- (BOOL)wasStoppedByScrolling;
- (CALayer)showLayer;
- (KPFPlayerControllerProtocol)kpfPlayer;
- (NSArray)supportedGestureKinds;
- (THWKeynoteShowRep)initWithLayout:(id)a3 canvas:(id)a4;
- (TSWTransportControlClone)transportControlClone;
- (UISwipeGestureRecognizer)swipeLeftGR;
- (UISwipeGestureRecognizer)swipeRightGR;
- (id)p_documentNavigatorFromNotification:(id)a3;
- (unint64_t)currentAbsolutePageIndex;
- (unint64_t)playingOnAbsolutePageIndex;
- (void)addAdditionalChildLayersToArray:(id)a3;
- (void)dealloc;
- (void)handleNotificationVantageDidChange:(id)a3;
- (void)handleNotificationVantageWillChange:(id)a3;
- (void)p_handleSwipeGesture:(id)a3;
- (void)playPreparedShow;
- (void)replaceContentsFromRep:(id)a3;
- (void)setCurrentAbsolutePageIndex:(unint64_t)a3;
- (void)setKpfPlayer:(id)a3;
- (void)setOwnsShow:(BOOL)a3;
- (void)setPlayingOnAbsolutePageIndex:(unint64_t)a3;
- (void)setShowLayer:(id)a3;
- (void)setSwipeLeftGR:(id)a3;
- (void)setSwipeRightGR:(id)a3;
- (void)setWasStoppedByScrolling:(BOOL)a3;
- (void)stopShow;
- (void)updateFromLayout;
- (void)wasAddedToParent;
- (void)willBeRemoved;
- (void)willBeRemovedFromParent;
- (void)willReplaceContentsFromRep:(id)a3;
@end

@implementation THWKeynoteShowRep

- (THWKeynoteShowRep)initWithLayout:(id)a3 canvas:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)THWKeynoteShowRep;
  v4 = [(THWKeynoteShowRep *)&v7 initWithLayout:a3 canvas:a4];
  v5 = v4;
  if (v4)
  {
    v4->_ownsShow = 1;
    v4->_currentAbsolutePageIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[THWKeynoteShowRep setSwipeLeftGR:](v4, "setSwipeLeftGR:", [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:v4 action:"p_handleSwipeGesture:"]);
    [(UISwipeGestureRecognizer *)[(THWKeynoteShowRep *)v5 swipeLeftGR] setDirection:2];
    objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](v5, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", -[THWKeynoteShowRep swipeLeftGR](v5, "swipeLeftGR"));
    -[THWKeynoteShowRep setSwipeRightGR:](v5, "setSwipeRightGR:", [objc_alloc((Class)UISwipeGestureRecognizer) initWithTarget:v5 action:"p_handleSwipeGesture:"]);
    [(UISwipeGestureRecognizer *)[(THWKeynoteShowRep *)v5 swipeRightGR] setDirection:1];
    objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](v5, "interactiveCanvasController"), "canvasView"), "addGestureRecognizer:", -[THWKeynoteShowRep swipeRightGR](v5, "swipeRightGR"));
    [+[NSNotificationCenter defaultCenter] addObserver:v5 selector:"handleNotificationVantageWillChange:" name:@"THVantageWillChangeNotification" object:0];
    [+[NSNotificationCenter defaultCenter] addObserver:v5 selector:"handleNotificationVantageDidChange:" name:@"THVantageDidChangeNotification" object:0];
  }
  return v5;
}

- (void)dealloc
{
  [(THWKeynoteShowRep *)self setSwipeLeftGR:0];
  [(THWKeynoteShowRep *)self setSwipeRightGR:0];
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  [(THWKeynoteShowRep *)&v3 dealloc];
}

- (TSWTransportControlClone)transportControlClone
{
  return (TSWTransportControlClone *)TSUProtocolCast();
}

- (NSArray)supportedGestureKinds
{
  if (TSUSupportsTextInteraction())
  {
    uint64_t v5 = TSWPImmediatePress;
    v2 = &v5;
  }
  else
  {
    uint64_t v4 = TSWPImmediateSingleTap;
    v2 = &v4;
  }
  return +[NSArray arrayWithObjects:v2 count:1];
}

- (void)playPreparedShow
{
  if ([(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] isTransitioningToStop])[(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] prepareWithEndShowHandler:0]; {
  [(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] playPreparedShow];
  }
  unint64_t v3 = [(THWKeynoteShowRep *)self currentAbsolutePageIndex];

  [(THWKeynoteShowRep *)self setPlayingOnAbsolutePageIndex:v3];
}

- (void)stopShow
{
  v2 = [(THWKeynoteShowRep *)self kpfPlayer];

  [(KPFPlayerControllerProtocol *)v2 endshow];
}

- (void)wasAddedToParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  [(THWKeynoteShowRep *)&v3 wasAddedToParent];
  [+[NSNotificationCenter defaultCenter] addObserver:self selector:"p_keynoteShowDidUpdate:" name:@"kTSWTransportControlCloneDidUpdateNotification" object:0];
}

- (void)willBeRemovedFromParent
{
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  [(THWKeynoteShowRep *)&v3 willBeRemovedFromParent];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"kTSWTransportControlCloneDidUpdateNotification" object:0];
}

- (void)willBeRemoved
{
  if (self->_ownsShow)
  {
    [(KPFPlayerControllerProtocol *)self->_kpfPlayer endshow];
    [(KPFPlayerControllerProtocol *)self->_kpfPlayer tearDownShow];
  }
  objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "removeGestureRecognizer:", -[THWKeynoteShowRep swipeLeftGR](self, "swipeLeftGR"));
  objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "canvasView"), "removeGestureRecognizer:", -[THWKeynoteShowRep swipeRightGR](self, "swipeRightGR"));
  [+[NSNotificationCenter defaultCenter] removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)THWKeynoteShowRep;
  [(THWKeynoteShowRep *)&v3 willBeRemoved];
}

- (void)updateFromLayout
{
  v4.receiver = self;
  v4.super_class = (Class)THWKeynoteShowRep;
  [(THWKeynoteShowRep *)&v4 updateFromLayout];
  if (self->_ownsShow && !self->_kpfPlayer && objc_msgSend(-[THWKeynoteShowRep info](self, "info"), "sourceURL"))
  {
    self->_showLayer = (CALayer *)objc_alloc_init((Class)CALayer);
    [(CALayer *)self->_showLayer setDelegate:+[THNoAnimationLayerDelegate sharedInstance]];
    [self layout].showSize;
    TSDRectWithSize();
    -[CALayer setBounds:](self->_showLayer, "setBounds:");
    [+[UIScreen mainScreen] scale];
    -[CALayer setContentsScale:](self->_showLayer, "setContentsScale:");
    objc_super v3 = +[KPFPlayer createPlayerWithKPFDocument:bundle:layer:](KPFPlayer, "createPlayerWithKPFDocument:bundle:layer:", [THWKeynoteShowRep layout](self, "layout"), [NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", [THWKeynoteShowRep info](self, "info"), "sourceURL"), self->_showLayer);
    self->_kpfPlayer = v3;
    [(KPFPlayerControllerProtocol *)v3 prepareWithEndShowHandler:0];
    [(THWKeynoteShowRep *)self kpfPlayer];
    if (objc_opt_respondsToSelector()) {
      [(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] setKpfPlayerControllerDelegate:self];
    }
  }
}

- (void)willReplaceContentsFromRep:(id)a3
{
  objc_opt_class();
  objc_super v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    if (([v4 ownsShow] & 1) == 0) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep willReplaceContentsFromRep:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m") lineNumber:195 description:@"unexpected show ownership before replacing contents"];
    }
    objc_msgSend(-[THWKeynoteShowRep layout](self, "layout"), "setKpfDocument:", objc_msgSend(objc_msgSend(v5, "layout"), "kpfDocument"));
    -[THWKeynoteShowRep setKpfPlayer:](self, "setKpfPlayer:", [v5 kpfPlayer]);
    [(THWKeynoteShowRep *)self kpfPlayer];
    if (objc_opt_respondsToSelector()) {
      [(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] setKpfPlayerControllerDelegate:self];
    }
    [(THWKeynoteShowRep *)self setOwnsShow:0];
  }
}

- (void)replaceContentsFromRep:(id)a3
{
  objc_opt_class();
  objc_super v4 = (void *)TSUDynamicCast();
  if (v4)
  {
    uint64_t v5 = v4;
    if (![v4 ownsShow] || -[THWKeynoteShowRep ownsShow](self, "ownsShow")) {
      [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep replaceContentsFromRep:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m") lineNumber:215 description:@"unexpected show ownership while replacing contents"];
    }
    -[THWKeynoteShowRep setShowLayer:](self, "setShowLayer:", [v5 showLayer]);
    [self canvas].invalidateLayers;
    [v5 setOwnsShow:0];
    [(THWKeynoteShowRep *)self setOwnsShow:1];
  }
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if (self->_ownsShow && self->_showLayer)
  {
    [self layout].frame;
    TSDRectWithSize();
    -[THWKeynoteShowRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    double v6 = v5;
    double v8 = v7;
    [(CALayer *)self->_showLayer bounds];
    double v11 = THScaleNeededToFitSizeInSize(v9, v10, v6, v8);
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    TSDCenterOfRect();
    -[CALayer setPosition:]([(THWKeynoteShowRep *)self showLayer], "setPosition:", v12, v13);
    CATransform3DMakeScale(&v16, v11, v11, 1.0);
    v14 = [(THWKeynoteShowRep *)self showLayer];
    CATransform3D v15 = v16;
    [(CALayer *)v14 setTransform:&v15];
    +[CATransaction commit];
    [a3 addObject:[self showLayer]];
    if ([(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] isTransitioningToStop])[(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] prepareWithEndShowHandler:0]; {
  }
    }
}

- (BOOL)canHandleGesture:(id)a3
{
  if (!self->_ownsShow)
  {
LABEL_8:
    LOBYTE(v11) = 0;
    return v11;
  }
  [a3 boundsLocationForICC:[self interactiveCanvasController]];
  -[CALayer convertPoint:fromLayer:](self->_showLayer, "convertPoint:fromLayer:", objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "layer"), v5, v6);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CALayer *)self->_showLayer bounds];
  v17.x = v8;
  v17.y = v10;
  BOOL v11 = CGRectContainsPoint(v18, v17);
  if (v11)
  {
    if (TSUSupportsTextInteraction()
      && (id v12 = [a3 gestureKind], v12 == (id)TSWPImmediatePress)
      || (id v13 = [a3 gestureKind], v13 == (id)TSWPImmediateSingleTap)
      || (id v14 = [a3 gestureKind], v14 == (id)TSWPImmediateDoubleTap)
      || (id v15 = [a3 gestureKind], v15 == (id)TSWPDoubleTapAndTouch))
    {
      LOBYTE(v11) = 1;
      return v11;
    }
    goto LABEL_8;
  }
  return v11;
}

- (BOOL)handleGesture:(id)a3
{
  if (!self->_ownsShow) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep handleGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m") lineNumber:280 description:@"shouldn't be handling gestures when we don't own the show"];
  }
  id v5 = [a3 gestureKind];
  id v6 = (id)TSWPImmediateSingleTap;
  if (v5 != (id)TSWPImmediateSingleTap)
  {
    id v7 = [a3 gestureKind];
    if (v7 != (id)TSWPImmediateDoubleTap)
    {
      id v8 = [a3 gestureKind];
      if (v8 != (id)TSWPDoubleTapAndTouch)
      {
        id v9 = [a3 gestureKind];
        if (v9 != (id)TSWPImmediatePress) {
          [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWKeynoteShowRep handleGesture:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/Keynote/THWKeynoteShowRep.m") lineNumber:281 description:@"don't know how to handle this gesture kind"];
        }
      }
    }
  }
  if ([a3 gestureKind] == v6
    || (id v10 = [a3 gestureKind], v10 == (id)TSWPImmediateDoubleTap)
    || (id v11 = [a3 gestureKind], v11 == (id)TSWPDoubleTapAndTouch)
    || (id v12 = [a3 gestureKind], v12 == (id)TSWPImmediatePress))
  {
    if ([a3 gestureState] == 3)
    {
      [a3 boundsLocationForICC:[self interactiveCanvasController]];
      -[CALayer convertPoint:fromLayer:](self->_showLayer, "convertPoint:fromLayer:", objc_msgSend(objc_msgSend(-[THWKeynoteShowRep interactiveCanvasController](self, "interactiveCanvasController"), "layerHost"), "layer"), v13, v14);
      if ((-[KPFPlayerControllerProtocol handleTouchAtLocation:](self->_kpfPlayer, "handleTouchAtLocation:") & 1) == 0)
      {
        unsigned int v15 = [(KPFPlayerControllerProtocol *)self->_kpfPlayer transportControlCloneCanGotoNext];
        kpfPlayer = self->_kpfPlayer;
        if (v15) {
          [(KPFPlayerControllerProtocol *)kpfPlayer transportControlCloneGotoNext];
        }
        else {
          [(KPFPlayerControllerProtocol *)kpfPlayer transportControlCloneGotoFirst];
        }
      }
    }
  }
  return 1;
}

- (BOOL)kpfPlayer:(id)a3 handleURL:(id)a4
{
  if ([(THWKeynoteShowRep *)self kpfPlayer] != a3) {
    return 0;
  }
  [(THWKeynoteShowRep *)self parentRep];
  id v7 = (void *)TSUProtocolCast();

  return [v7 keynoteShowRep:self handleURL:a4];
}

- (id)p_documentNavigatorFromNotification:(id)a3
{
  objc_opt_class();
  [a3 object];
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    [a3 object];
    id v5 = (void *)TSUProtocolCast();
    return [v5 documentNavigator];
  }
  return result;
}

- (void)handleNotificationVantageWillChange:(id)a3
{
  if (self->_ownsShow)
  {
    id v4 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", @"THVantageChangeReason");
    if (([v4 isEqualToString:@"THVantageChangeReasonBookOpen"] & 1) == 0
      && ([v4 isEqualToString:@"THVantageChangeReasonScrolling"] & 1) == 0
      && ([v4 isEqualToString:@"THVantageChangeReasonNavigation"] & 1) == 0)
    {
      kpfPlayer = self->_kpfPlayer;
      [(KPFPlayerControllerProtocol *)kpfPlayer pauseBackgroundSoundtrack];
    }
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  if (self->_ownsShow)
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", @"THVantageChangeReason");
    id v6 = [self p_documentNavigatorFromNotification:a3].currentAbsolutePageIndex;
    if ([v5 isEqualToString:@"THVantageChangeReasonScrolling"]) {
      BOOL v7 = v6 != self->_currentAbsolutePageIndex;
    }
    else {
      BOOL v7 = 0;
    }
    self->_currentAbsolutePageIndex = (unint64_t)v6;
    if (([v5 isEqualToString:@"THVantageChangeReasonNavigation"] & 1) != 0 || v7)
    {
      if ((([(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] isPlaying] & 1) != 0|| [(KPFPlayerControllerProtocol *)[(THWKeynoteShowRep *)self kpfPlayer] isBackgroundSoundPlaying])&& (id)[(THWKeynoteShowRep *)self playingOnAbsolutePageIndex] != v6)
      {
        [(KPFPlayerControllerProtocol *)self->_kpfPlayer pauseMediaPlayback];
        [(KPFPlayerControllerProtocol *)self->_kpfPlayer pauseBackgroundSoundtrack];
        id v9 = self;
        uint64_t v10 = 1;
      }
      else
      {
        if (![(THWKeynoteShowRep *)self wasStoppedByScrolling]
          || (id)[(THWKeynoteShowRep *)self playingOnAbsolutePageIndex] != v6)
        {
          return;
        }
        [(KPFPlayerControllerProtocol *)self->_kpfPlayer resumeMediaPlayback];
        [(KPFPlayerControllerProtocol *)self->_kpfPlayer resumeBackgroundSoundtrack];
        id v9 = self;
        uint64_t v10 = 0;
      }
      [(THWKeynoteShowRep *)v9 setWasStoppedByScrolling:v10];
    }
    else if (([v5 isEqualToString:@"THVantageChangeReasonBookOpen"] & 1) == 0)
    {
      kpfPlayer = self->_kpfPlayer;
      [(KPFPlayerControllerProtocol *)kpfPlayer resumeBackgroundSoundtrack];
    }
  }
}

- (void)p_handleSwipeGesture:(id)a3
{
  if ([(THWKeynoteShowRep *)self swipeLeftGR] == a3)
  {
    kpfPlayer = self->_kpfPlayer;
    [(KPFPlayerControllerProtocol *)kpfPlayer gotoNextEvent];
  }
  else if ([(THWKeynoteShowRep *)self swipeRightGR] == a3)
  {
    id v6 = self->_kpfPlayer;
    [(KPFPlayerControllerProtocol *)v6 gotoPreviousSlide];
  }
}

- (KPFPlayerControllerProtocol)kpfPlayer
{
  return self->_kpfPlayer;
}

- (void)setKpfPlayer:(id)a3
{
}

- (CALayer)showLayer
{
  return self->_showLayer;
}

- (void)setShowLayer:(id)a3
{
}

- (BOOL)ownsShow
{
  return self->_ownsShow;
}

- (void)setOwnsShow:(BOOL)a3
{
  self->_ownsShow = a3;
}

- (BOOL)wasStoppedByScrolling
{
  return self->_wasStoppedByScrolling;
}

- (void)setWasStoppedByScrolling:(BOOL)a3
{
  self->_wasStoppedByScrolling = a3;
}

- (unint64_t)playingOnAbsolutePageIndex
{
  return self->_playingOnAbsolutePageIndex;
}

- (void)setPlayingOnAbsolutePageIndex:(unint64_t)a3
{
  self->_playingOnAbsolutePageIndex = a3;
}

- (unint64_t)currentAbsolutePageIndex
{
  return self->_currentAbsolutePageIndex;
}

- (void)setCurrentAbsolutePageIndex:(unint64_t)a3
{
  self->_currentAbsolutePageIndex = a3;
}

- (UISwipeGestureRecognizer)swipeLeftGR
{
  return self->_swipeLeftGR;
}

- (void)setSwipeLeftGR:(id)a3
{
}

- (UISwipeGestureRecognizer)swipeRightGR
{
  return self->_swipeRightGR;
}

- (void)setSwipeRightGR:(id)a3
{
}

@end