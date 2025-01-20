@interface KPFGingerPlayerController
- (BOOL)allowsShowToEndInternally;
- (BOOL)handleTouchAtLocation:(CGPoint)a3;
- (BOOL)isAnimating;
- (BOOL)isBackgroundSoundPlaying;
- (BOOL)isPlaying;
- (BOOL)isTransitioningToStop;
- (BOOL)playsAutomaticEvents;
- (BOOL)transportControlCloneCanGotoFirst;
- (BOOL)transportControlCloneCanGotoLast;
- (BOOL)transportControlCloneCanGotoNext;
- (BOOL)transportControlCloneCanGotoPrev;
- (BOOL)transportControlCloneCanMute;
- (BOOL)transportControlCloneSupportsSound;
- (KPFGingerPlayerController)initWithKPFDocument:(id)a3 showLayer:(id)a4;
- (KPFPlayerControllerDelegateProtocol)kpfPlayerControllerDelegate;
- (id)accessibilityLabelForCurrentEvent;
- (id)accessibilityRegionsForCurrentEvent;
- (id)hyperlinksRectArray;
- (unint64_t)transportControlCloneCount;
- (unint64_t)transportControlCloneIndex;
- (void)dealloc;
- (void)endshow;
- (void)gotoFirstSlide;
- (void)gotoLastSlide;
- (void)gotoNextSlide;
- (void)gotoPreviousEvent;
- (void)gotoPreviousSlide;
- (void)gotoSlideAtIndex:(unint64_t)a3 shouldAutoPlay:(BOOL)a4;
- (void)p_animationEnded;
- (void)p_announceStateUpdate;
- (void)p_goToSlideWithSlideTag:(id)a3;
- (void)p_handleURL:(id)a3;
- (void)p_hyperlinkAnimationEnded;
- (void)p_resetToFirstSlideAndShouldAutoPlay:(BOOL)a3;
- (void)p_triggerEvent;
- (void)pauseBackgroundSoundtrack;
- (void)pauseMediaPlayback;
- (void)playPreparedShow;
- (void)prepareWithEndShowHandler:(id)a3;
- (void)resumeBackgroundSoundtrack;
- (void)resumeMediaPlayback;
- (void)retreatToPreviousSlide;
- (void)setAllowsShowToEndInternally:(BOOL)a3;
- (void)setKpfPlayerControllerDelegate:(id)a3;
- (void)setPlaysAutomaticEvents:(BOOL)a3;
- (void)tearDownShow;
- (void)transportControlCloneEnableSound:(BOOL)a3;
- (void)transportControlCloneGotoFirst;
- (void)transportControlCloneGotoLast;
- (void)transportControlCloneGotoNext;
- (void)transportControlCloneGotoPrev;
- (void)transportControlCloneToggleSound;
@end

@implementation KPFGingerPlayerController

- (KPFGingerPlayerController)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)KPFGingerPlayerController;
  v6 = [(KPFGingerPlayerController *)&v8 init];
  if (v6) {
    v6->mSession = [[KPFSession alloc] initWithKPFDocument:a3 showLayer:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)KPFGingerPlayerController;
  [(KPFGingerPlayerController *)&v3 dealloc];
}

- (BOOL)isAnimating
{
  return [(KPFSession *)self->mSession playbackState] == 1
      && [(KPFSession *)self->mSession playbackState] == 6;
}

- (void)playPreparedShow
{
  if ([(KPFSession *)self->mSession showLayer]
    && [(KPFSession *)self->mSession playbackState] == 2)
  {
    [(KPFSession *)self->mSession setupAndPlaySoundtrackAfterDelay:0.0];
    if ([(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isAutomatic])
    {
      [(KPFGingerPlayerController *)self p_triggerEvent];
    }
    mSession = self->mSession;
    [(KPFSession *)mSession setPlaybackState:3];
  }
}

- (BOOL)isPlaying
{
  return [(KPFSession *)self->mSession playbackState] == 3;
}

- (BOOL)isBackgroundSoundPlaying
{
  return [(KPFSession *)self->mSession hasBackgroundSoundtrack];
}

- (void)prepareWithEndShowHandler:(id)a3
{
  if ([(KPFSession *)self->mSession showLayer]
    && [(KPFSession *)self->mSession playbackState] == 1)
  {
    [(CALayer *)[(KPFSession *)self->mSession showLayer] setSublayers:0];
    [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderSlideWithSession:self->mSession];
    mSession = self->mSession;
    [(KPFSession *)mSession setPlaybackState:2];
  }
}

- (void)endshow
{
  [(KPFSession *)self->mSession setPlaybackState:6];
  [(KPFSession *)self->mSession stopAllAnimations];
  mSession = self->mSession;

  [(KPFSession *)mSession setPlaybackState:1];
}

- (void)tearDownShow
{
  if ([(KPFSession *)self->mSession playbackState] == 1)
  {
    objc_super v3 = [(KPFSession *)self->mSession showLayer];
    [(CALayer *)v3 setSublayers:0];
  }
}

- (BOOL)isTransitioningToStop
{
  unsigned int v3 = [(KPFSession *)self->mSession playbackState];
  if (v3 != 1) {
    LOBYTE(v3) = [(KPFSession *)self->mSession playbackState] == 6;
  }
  return v3;
}

- (void)p_handleURL:(id)a3
{
  v4 = +[NSURL URLWithString:a3];
  v5 = [(KPFGingerPlayerController *)self kpfPlayerControllerDelegate];

  [(KPFPlayerControllerDelegateProtocol *)v5 kpfPlayer:self handleURL:v4];
}

- (void)retreatToPreviousSlide
{
  unint64_t v3 = [(KPFSession *)self->mSession previousSlideIndex];

  [(KPFGingerPlayerController *)self gotoSlideAtIndex:v3 shouldAutoPlay:1];
}

- (BOOL)handleTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(KPFSession *)self->mSession playbackState] == 3
    || [(KPFSession *)self->mSession playbackState] == 2)
  {
    id v6 = -[KPFGingerEvent hyperlinkAtLocation:]([(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent], "hyperlinkAtLocation:", x, y);
    v7 = v6;
    if (v6)
    {
      if ([v6 hasPrefix:@"?slideid="])
      {
        id v8 = [v7 substringFromIndex:9];
        self->mHyperlinkSlideTag = (NSString *)v8;
        [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderHyperLinkedSlideWithSlideTag:v8 withSession:self->mSession];
        v9 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] hyperLinkedEvent];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_9FC08;
        v11[3] = &unk_456DE0;
        v11[4] = self;
        [(KPFGingerEvent *)v9 setAnimationEndHandler:v11];
        [(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] hyperLinkedEvent] animateWithSession:self->mSession];
        goto LABEL_19;
      }
      if (![v7 isEqualToString:@"?action=exitpresentation"])
      {
        if (![v7 isEqualToString:@"?action=retreat"])
        {
          if ([v7 isEqualToString:@"?slide=first"])
          {
            [(KPFGingerPlayerController *)self gotoFirstSlide];
            goto LABEL_19;
          }
          if ([v7 isEqualToString:@"?slide=last"])
          {
            [(KPFGingerPlayerController *)self gotoLastSlide];
            goto LABEL_19;
          }
          if ([v7 isEqualToString:@"?slide=next"])
          {
            [(KPFGingerPlayerController *)self gotoNextSlide];
            goto LABEL_19;
          }
          if (![v7 isEqualToString:@"?slide=previous"])
          {
            [(KPFGingerPlayerController *)self p_handleURL:v7];
            goto LABEL_19;
          }
        }
        [(KPFGingerPlayerController *)self retreatToPreviousSlide];
LABEL_19:
        LOBYTE(v7) = 1;
        return (char)v7;
      }
      LOBYTE(v7) = 1;
      [(KPFGingerPlayerController *)self p_resetToFirstSlideAndShouldAutoPlay:1];
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return (char)v7;
}

- (void)pauseMediaPlayback
{
}

- (void)resumeMediaPlayback
{
}

- (void)pauseBackgroundSoundtrack
{
}

- (void)resumeBackgroundSoundtrack
{
}

- (id)accessibilityLabelForCurrentEvent
{
  id v3 = +[NSMutableArray array];
  [v3 addObject:[NSString localizedStringWithFormat:@"localizedStringWithFormat:", [NSString localizedStringWithFormat:@"localizedStringWithFormat:", [THBundle localizedStringForKey:@"Slide %1$lu of %2$lu" value:[KPFSession currentSlideIndex] table:nil], [KPFSession KPFSlideList count]]]];
  if ([(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] eventCount] >= 2) {
    [v3 addObject:[NSString localizedStringWithFormat:@"localizedStringWithFormat:", [THBundle localizedStringForKey:@"Build %1$lu of %2$lu" value:nil table:nil], [KPFGingerSlide curentEventIndex:[KPFSession currentSlide] curentEventIndex], [KPFGingerSlide eventCount:[KPFSession currentSlide] eventCount]]];
  }

  return [v3 componentsJoinedByString:@", "];
}

- (id)accessibilityRegionsForCurrentEvent
{
  v2 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent];

  return [(KPFGingerEvent *)v2 accessibilityArray];
}

- (void)gotoPreviousEvent
{
  if ([(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] decrementCurrentEventIndex])
  {
    self->mQueuedTrigger = 0;
    [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderCurrentEventWithSession:self->mSession];
    [(KPFSession *)self->mSession setPlaybackState:3];
    if ([(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isAutomatic])
    {
      [(KPFGingerPlayerController *)self p_triggerEvent];
    }
  }
  else
  {
    [(KPFGingerPlayerController *)self gotoPreviousSlide];
  }
}

- (void)gotoSlideAtIndex:(unint64_t)a3 shouldAutoPlay:(BOOL)a4
{
  BOOL v4 = a4;
  [(KPFSession *)self->mSession setSlideIndex:a3];
  [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderSlideWithSession:self->mSession];
  [(KPFSession *)self->mSession setPlaybackState:3];
  self->mQueuedTrigger = 0;
  if ([(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isAutomatic])
  {
    BOOL v6 = !v4;
  }
  else
  {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [(KPFGingerPlayerController *)self p_triggerEvent];
  }
}

- (void)p_goToSlideWithSlideTag:(id)a3
{
  [(KPFSession *)self->mSession setSlideWithSlideTag:a3];
  [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderSlideWithSession:self->mSession];
  [(KPFSession *)self->mSession setPlaybackState:3];
  self->mQueuedTrigger = 0;
  if ([(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isAutomatic])
  {
    [(KPFGingerPlayerController *)self p_triggerEvent];
  }
}

- (void)gotoNextSlide
{
  if ([(KPFSession *)self->mSession incrementCurrentSlideIndex])
  {
    [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderSlideWithSession:self->mSession];
    [(KPFSession *)self->mSession setPlaybackState:3];
    self->mQueuedTrigger = 0;
    if ([(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isAutomatic])
    {
      [(KPFGingerPlayerController *)self p_triggerEvent];
    }
  }
}

- (void)gotoPreviousSlide
{
  unint64_t v3 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] curentEventIndex];
  BOOL v4 = [(KPFSession *)self->mSession currentSlide];
  if (v3) {
    goto LABEL_2;
  }
  if (![(KPFGingerSlide *)v4 curentEventIndex]
    && [(KPFSession *)self->mSession decrementCurrentSlideIndex])
  {
    BOOL v4 = [(KPFSession *)self->mSession currentSlide];
LABEL_2:
    [(KPFGingerSlide *)v4 renderSlideWithSession:self->mSession];
    [(KPFSession *)self->mSession setPlaybackState:3];
    self->mQueuedTrigger = 0;
  }
}

- (void)gotoFirstSlide
{
}

- (void)gotoLastSlide
{
  unint64_t v3 = (char *)[(NSMutableArray *)[(KPFSession *)self->mSession KPFSlideList] count] - 1;

  [(KPFGingerPlayerController *)self gotoSlideAtIndex:v3 shouldAutoPlay:1];
}

- (void)p_resetToFirstSlideAndShouldAutoPlay:(BOOL)a3
{
  BOOL v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  [(KPFSession *)self->mSession stopAllAnimations];
  [(KPFGingerPlayerController *)self gotoSlideAtIndex:0 shouldAutoPlay:v3];
  [(KPFSession *)self->mSession setupAndPlaySoundtrackAfterDelay:0.0];
  mSession = self->mSession;

  [(KPFSession *)mSession setPlaybackState:2];
}

- (void)transportControlCloneGotoPrev
{
  if ([(KPFGingerPlayerController *)self transportControlCloneCanGotoPrev]) {
    [(KPFGingerPlayerController *)self gotoPreviousSlide];
  }

  [(KPFGingerPlayerController *)self p_announceStateUpdate];
}

- (void)transportControlCloneGotoNext
{
  if ([(KPFGingerPlayerController *)self transportControlCloneCanGotoNext]) {
    [(KPFGingerPlayerController *)self gotoNextEvent];
  }

  [(KPFGingerPlayerController *)self p_announceStateUpdate];
}

- (void)transportControlCloneGotoFirst
{
  if ([(KPFGingerPlayerController *)self transportControlCloneCanGotoFirst])
  {
    [(KPFGingerPlayerController *)self p_resetToFirstSlideAndShouldAutoPlay:0];
    [(KPFGingerPlayerController *)self p_announceStateUpdate];
  }
}

- (void)transportControlCloneGotoLast
{
  if ([(KPFGingerPlayerController *)self transportControlCloneCanGotoLast]) {
    [(KPFGingerPlayerController *)self gotoLastSlide];
  }

  [(KPFGingerPlayerController *)self p_announceStateUpdate];
}

- (void)transportControlCloneToggleSound
{
}

- (void)transportControlCloneEnableSound:(BOOL)a3
{
}

- (void)p_announceStateUpdate
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v3 postNotificationName:@"kTSWTransportControlCloneDidUpdateNotification" object:self];
}

- (BOOL)transportControlCloneCanGotoPrev
{
  return [(KPFSession *)self->mSession currentSlideIndex] != 0;
}

- (BOOL)transportControlCloneCanGotoNext
{
  unint64_t v3 = [(KPFSession *)self->mSession currentSlideIndex];
  return v3 < (unint64_t)[(NSMutableArray *)[(KPFSession *)self->mSession KPFSlideList] count];
}

- (BOOL)transportControlCloneCanGotoFirst
{
  return 1;
}

- (BOOL)transportControlCloneCanGotoLast
{
  return 0;
}

- (BOOL)transportControlCloneCanMute
{
  return 0;
}

- (unint64_t)transportControlCloneIndex
{
  return [(KPFSession *)self->mSession currentSlideIndex];
}

- (unint64_t)transportControlCloneCount
{
  v2 = [(KPFSession *)self->mSession KPFSlideList];

  return (unint64_t)[(NSMutableArray *)v2 count];
}

- (BOOL)transportControlCloneSupportsSound
{
  return 0;
}

- (id)hyperlinksRectArray
{
  id result = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent];
  if (result)
  {
    return [result hyperlinksRectArray];
  }
  return result;
}

- (void)p_hyperlinkAnimationEnded
{
}

- (void)p_animationEnded
{
  unint64_t v3 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] nextEvent];
  if (!v3)
  {
    if (![(KPFSession *)self->mSession nextSlide])
    {
      unsigned int v4 = 0;
      goto LABEL_5;
    }
    unint64_t v3 = [(KPFGingerSlide *)[(KPFSession *)self->mSession nextSlide] currentEvent];
  }
  unsigned int v4 = [(KPFGingerEvent *)v3 isAutomatic];
LABEL_5:
  [(KPFSession *)self->mSession setPlaybackState:5];
  if (self->mQueuedTrigger || v4)
  {
    [(KPFGingerPlayerController *)self performSelector:"p_triggerEvent" withObject:0 afterDelay:0.0];
    self->mQueuedTrigger = 0;
    goto LABEL_12;
  }
  if (![(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] containsMovie]
    && [(KPFSession *)self->mSession playbackState] == 5)
  {
    unsigned int v5 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] incrementCurrentEventIndex];
    mSession = self->mSession;
    if (v5)
    {
      [(KPFGingerSlide *)[(KPFSession *)mSession currentSlide] renderCurrentEventWithSession:self->mSession];
LABEL_18:
      [(KPFSession *)self->mSession setPlaybackState:3];
      goto LABEL_12;
    }
    if ([(KPFSession *)mSession incrementCurrentSlideIndex])
    {
      [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderSlideWithSession:self->mSession];
      goto LABEL_18;
    }
    [(KPFGingerPlayerController *)self p_resetToFirstSlideAndShouldAutoPlay:0];
  }
LABEL_12:

  [(KPFGingerPlayerController *)self p_announceStateUpdate];
}

- (void)p_triggerEvent
{
  if ([(KPFSession *)self->mSession playbackState] == 2) {
    [(KPFSession *)self->mSession setPlaybackState:3];
  }
  if ([(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] containsMovie]
    && [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] mediaPlaybackIsPaused])
  {
    unint64_t v3 = [(KPFSession *)self->mSession currentSlide];
    [(KPFGingerSlide *)v3 resumeMediaPlayback];
    return;
  }
  if ([(KPFSession *)self->mSession playbackState] == 5)
  {
    unsigned int v4 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] incrementCurrentEventIndex];
    mSession = self->mSession;
    if (v4)
    {
      [(KPFGingerSlide *)[(KPFSession *)mSession currentSlide] renderCurrentEventWithSession:self->mSession];
LABEL_13:
      [(KPFSession *)self->mSession setPlaybackState:3];
      goto LABEL_15;
    }
    if ([(KPFSession *)mSession incrementCurrentSlideIndex])
    {
      [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] renderSlideWithSession:self->mSession];
      goto LABEL_13;
    }
    [(KPFGingerPlayerController *)self p_resetToFirstSlideAndShouldAutoPlay:0];
  }
LABEL_15:
  if (!self->mQueuedTrigger)
  {
    if ([(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isMoviePlaying]|| [(KPFGingerEvent *)[(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent] isAnimating])
    {
      self->mQueuedTrigger = 1;
    }
    else if ([(KPFSession *)self->mSession playbackState] == 3)
    {
      BOOL v6 = [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] currentEvent];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_A068C;
      v7[3] = &unk_456DE0;
      v7[4] = self;
      [(KPFGingerEvent *)v6 setAnimationEndHandler:v7];
      [(KPFSession *)self->mSession setPlaybackState:4];
      [(KPFGingerSlide *)[(KPFSession *)self->mSession currentSlide] animateSlideWithSession:self->mSession];
    }
  }
}

- (BOOL)allowsShowToEndInternally
{
  return self->mAllowsShowToEndInternally;
}

- (void)setAllowsShowToEndInternally:(BOOL)a3
{
  self->mAllowsShowToEndInternalldouble y = a3;
}

- (BOOL)playsAutomaticEvents
{
  return self->mPlaysAutomaticEvents;
}

- (void)setPlaysAutomaticEvents:(BOOL)a3
{
  self->mPlaysAutomaticEvents = a3;
}

- (KPFPlayerControllerDelegateProtocol)kpfPlayerControllerDelegate
{
  return self->kpfPlayerControllerDelegate;
}

- (void)setKpfPlayerControllerDelegate:(id)a3
{
  self->kpfPlayerControllerDelegate = (KPFPlayerControllerDelegateProtocol *)a3;
}

@end