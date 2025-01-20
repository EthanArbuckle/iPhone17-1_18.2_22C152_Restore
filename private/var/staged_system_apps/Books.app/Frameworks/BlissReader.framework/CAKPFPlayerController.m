@interface CAKPFPlayerController
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
- (CAKPFPlayerController)initWithKPFDocument:(id)a3 showLayer:(id)a4;
- (CAKPFSession)session;
- (KPFMovie)soundTrack;
- (KPFPlayerControllerDelegateProtocol)kpfPlayerControllerDelegate;
- (id)accessibilityLabelForCurrentEvent;
- (id)accessibilityRegionsForCurrentEvent;
- (id)hyperlinksRectArray;
- (unint64_t)transportControlCloneCount;
- (unint64_t)transportControlCloneIndex;
- (void)dealloc;
- (void)endshow;
- (void)gotoEventIndex:(unint64_t)a3;
- (void)gotoFirstEvent;
- (void)gotoLastEvent;
- (void)gotoNextEvent;
- (void)gotoPreviousEvent;
- (void)gotoPreviousSlide;
- (void)gotoSlideIndex:(unint64_t)a3;
- (void)layoutIfNeeded;
- (void)p_animationEnded;
- (void)p_announceStateUpdate;
- (void)p_gotoEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4 shouldAutoPlay:(BOOL)a5;
- (void)p_handleURL:(id)a3;
- (void)p_playSoundtrack;
- (void)p_triggerNextEvent;
- (void)pauseBackgroundSoundtrack;
- (void)pauseMediaPlayback;
- (void)playPreparedShow;
- (void)prepareWithEndShowHandler:(id)a3;
- (void)resetToFirstEventAndShouldAutoPlay:(BOOL)a3;
- (void)resumeBackgroundSoundtrack;
- (void)resumeMediaPlayback;
- (void)retreatToPreviousSlide;
- (void)setAllowsShowToEndInternally:(BOOL)a3;
- (void)setKpfPlayerControllerDelegate:(id)a3;
- (void)setPlaysAutomaticEvents:(BOOL)a3;
- (void)showThumbnail;
- (void)stopAllAnimations;
- (void)tearDownShow;
- (void)transportControlCloneEnableSound:(BOOL)a3;
- (void)transportControlCloneGotoFirst;
- (void)transportControlCloneGotoIndex:(unint64_t)a3;
- (void)transportControlCloneGotoLast;
- (void)transportControlCloneGotoNext;
- (void)transportControlCloneGotoPrev;
- (void)transportControlCloneToggleSound;
@end

@implementation CAKPFPlayerController

- (CAKPFPlayerController)initWithKPFDocument:(id)a3 showLayer:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CAKPFPlayerController;
  v6 = [(CAKPFPlayerController *)&v8 init];
  if (v6) {
    v6->mSession = [[CAKPFSession alloc] initWithKPFDocument:a3 showLayer:a4];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CAKPFPlayerController;
  [(CAKPFPlayerController *)&v3 dealloc];
}

- (void)prepareWithEndShowHandler:(id)a3
{
  if ([(CAKPFSession *)self->mSession playbackState] == 1)
  {
    self->mEndShowHandler = [a3 copy];
    [(CALayer *)[(CAKPFSession *)self->mSession showLayer] setSublayers:0];
    [(CAKPFSession *)self->mSession setPlaybackStatus:2];
    [(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] renderEventWithSession:self->mSession];
    [(CAKPFSession *)self->mSession setPlaybackStatus:1];
    mSession = self->mSession;
    [(CAKPFSession *)mSession setPlaybackState:2];
  }
}

- (BOOL)isTransitioningToStop
{
  unsigned int v3 = [(CAKPFSession *)self->mSession playbackState];
  if (v3 != 1) {
    LOBYTE(v3) = [(CAKPFSession *)self->mSession playbackState] == 4;
  }
  return v3;
}

- (void)playPreparedShow
{
  if ([(CAKPFSession *)self->mSession playbackState] == 2)
  {
    [(CAKPFPlayerController *)self p_playSoundtrack];
    if ([(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] isAutomatic]) {
      [(CAKPFPlayerController *)self p_triggerNextEvent];
    }
    mSession = self->mSession;
    [(CAKPFSession *)mSession setPlaybackState:3];
  }
}

- (BOOL)isPlaying
{
  return [(CAKPFSession *)self->mSession playbackState] == 3;
}

- (BOOL)isBackgroundSoundPlaying
{
  return [(KPFMovie *)self->mSoundtrack isPlaying];
}

- (void)endshow
{
  if ([(CAKPFSession *)self->mSession playbackState] == 3)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_78EB8;
    activity_block[3] = &unk_456DE0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "KPFPlayer End Show", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)tearDownShow
{
  if ([(CAKPFSession *)self->mSession playbackState] == 4)
  {
    [(CALayer *)[(CAKPFSession *)self->mSession showLayer] setSublayers:0];
    [(CAKPFSession *)self->mSession setPlaybackState:1];
    mSession = self->mSession;
    [(CAKPFSession *)mSession tearDown];
  }
}

- (void)gotoNextEvent
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_79004;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Next Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gotoPreviousEvent
{
  if ([[(CAKPFSession *)self->mSession KPFDocument] showMode] != 2)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_790FC;
    activity_block[3] = &unk_456DE0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "KPFPlayer Previous Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (void)p_gotoEventIndex:(unint64_t)a3 skipBreadCrumb:(BOOL)a4 shouldAutoPlay:(BOOL)a5
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_79234;
  activity_block[3] = &unk_458228;
  activity_block[4] = self;
  void activity_block[5] = a3;
  BOOL v6 = a4;
  BOOL v7 = a5;
  _os_activity_initiate(&dword_0, "KPFPlayer Goto Event Index", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gotoEventIndex:(unint64_t)a3
{
}

- (void)retreatToPreviousSlide
{
  unint64_t v3 = [[(CAKPFSession *)self->mSession KPFDocument] eventIndexForSlideIndex:[(CAKPFSession *)self->mSession previousSlideIndex]];

  [(CAKPFPlayerController *)self p_gotoEventIndex:v3 skipBreadCrumb:1 shouldAutoPlay:1];
}

- (void)gotoFirstEvent
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_793CC;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer First Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)resetToFirstEventAndShouldAutoPlay:(BOOL)a3
{
  BOOL v3 = a3;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self];
  [(CAKPFSession *)self->mSession resetBreadCrumbs];
  [(CAKPFSession *)self->mSession setPlaybackState:2];

  [(CAKPFPlayerController *)self p_gotoEventIndex:0 skipBreadCrumb:0 shouldAutoPlay:v3];
}

- (void)gotoLastEvent
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_794C0;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Last Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)gotoSlideIndex:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_79584;
  v3[3] = &unk_457250;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_0, "KPFPlayer Goto Slide", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

- (void)gotoPreviousSlide
{
  if ([[(CAKPFSession *)self->mSession KPFDocument] showMode] != 2)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_79670;
    activity_block[3] = &unk_456DE0;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "KPFPlayer Previous Slide", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
}

- (BOOL)isAnimating
{
  v2 = [(CAKPFSession *)self->mSession currentEvent];

  return [(KPFEvent *)v2 isAnimating];
}

- (void)stopAllAnimations
{
  [(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] stopAllAnimations];
  mSoundtrack = self->mSoundtrack;
  if (mSoundtrack)
  {
    [(KPFMovie *)mSoundtrack stop];

    self->mSoundtrack = 0;
  }
}

- (void)pauseMediaPlayback
{
  [(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] pauseMoviePlayback];
  if ([(KPFMovie *)self->mSoundtrack isPlaying])
  {
    mSoundtrack = self->mSoundtrack;
    [(KPFMovie *)mSoundtrack pause];
  }
}

- (void)resumeMediaPlayback
{
}

- (void)pauseBackgroundSoundtrack
{
  if ([(KPFMovie *)self->mSoundtrack isPlaying])
  {
    mSoundtrack = self->mSoundtrack;
    [(KPFMovie *)mSoundtrack pause];
  }
}

- (void)resumeBackgroundSoundtrack
{
}

- (void)showThumbnail
{
  id v3 = objc_alloc_init((Class)CALayer);
  [(CALayer *)[(CAKPFSession *)self->mSession showLayer] bounds];
  [v3 setBounds:];
  [(CALayer *)[(CAKPFSession *)self->mSession showLayer] bounds];
  TSDCenterOfRect();
  [v3 setPosition:];
  [v3 setContents:[-[CAKPFSession KPFDocument](self->mSession, "KPFDocument") thumbnailImage]];
  [(CALayer *)[(CAKPFSession *)self->mSession showLayer] setSublayers:0];
  [(CALayer *)[(CAKPFSession *)self->mSession showLayer] addSublayer:v3];
}

- (id)hyperlinksRectArray
{
  id result = [(CAKPFSession *)self->mSession currentEvent];
  if (result)
  {
    return [result hyperlinksRectArray];
  }
  return result;
}

- (BOOL)handleTouchAtLocation:(CGPoint)a3
{
  uint64_t v7 = 0;
  objc_super v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_79A4C;
  v5[3] = &unk_458250;
  CGPoint v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  _os_activity_initiate(&dword_0, "KPF Player Handle Touch", OS_ACTIVITY_FLAG_DEFAULT, v5);
  char v3 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)accessibilityLabelForCurrentEvent
{
  return +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", [(id)THBundle() localizedStringForKey:@"%1$lu of %2$lu" value:&stru_46D7E8 table:0], (char *)-[CAKPFSession currentEventIndex](self->mSession, "currentEventIndex") + 1, -[KPFDocument eventCount](-[CAKPFSession KPFDocument](self->mSession, "KPFDocument"), "eventCount"));
}

- (id)accessibilityRegionsForCurrentEvent
{
  v2 = [(CAKPFSession *)self->mSession currentEvent];

  return [(KPFEvent *)v2 accessibilityArray];
}

- (void)layoutIfNeeded
{
}

- (void)transportControlCloneGotoPrev
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_79CD8;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Previous", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneGotoNext
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_79DAC;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Next", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneGotoFirst
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_79E80;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport First", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneGotoLast
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_79F58;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Last", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

- (void)transportControlCloneToggleSound
{
  NSLog(@"sound toggle not implemented", a2);

  [(CAKPFPlayerController *)self p_announceStateUpdate];
}

- (void)transportControlCloneEnableSound:(BOOL)a3
{
  NSLog(@"sound enable/disable not implemented", a2, a3);

  [(CAKPFPlayerController *)self p_announceStateUpdate];
}

- (void)transportControlCloneGotoIndex:(unint64_t)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_7A0AC;
  v3[3] = &unk_457250;
  v3[4] = self;
  v3[5] = a3;
  _os_activity_initiate(&dword_0, "KPFPlayer Transport Goto Index", OS_ACTIVITY_FLAG_DEFAULT, v3);
}

- (void)p_announceStateUpdate
{
  char v3 = +[NSNotificationCenter defaultCenter];

  [(NSNotificationCenter *)v3 postNotificationName:@"kTSWTransportControlCloneDidUpdateNotification" object:self];
}

- (BOOL)transportControlCloneCanGotoPrev
{
  unint64_t v3 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] visibleEventIndex];
  if (v3) {
    LOBYTE(v3) = [[(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument] showMode] != 2;
  }
  return v3;
}

- (BOOL)transportControlCloneCanGotoNext
{
  unint64_t v3 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] visibleEventIndex];
  return v3 < (char *)[[(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument] eventCount]- 1&& [[(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument] showMode] != 2;
}

- (BOOL)transportControlCloneCanGotoFirst
{
  unint64_t v3 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] visibleEventIndex];
  if (v3) {
    LOBYTE(v3) = [[(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument] showMode] != 2;
  }
  return v3;
}

- (BOOL)transportControlCloneCanGotoLast
{
  unint64_t v3 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] visibleEventIndex];
  return v3 < (char *)[[(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument] eventCount]- 1&& [[(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument] showMode] != 2;
}

- (BOOL)transportControlCloneCanMute
{
  return 0;
}

- (unint64_t)transportControlCloneIndex
{
  unint64_t v3 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument];
  unint64_t v4 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] visibleEventIndex];

  return [(KPFDocument *)v3 slideIndexForEventIndex:v4];
}

- (unint64_t)transportControlCloneCount
{
  v2 = [(CAKPFSession *)[(CAKPFPlayerController *)self session] KPFDocument];

  return [(KPFDocument *)v2 slideCount];
}

- (BOOL)transportControlCloneSupportsSound
{
  return 0;
}

- (BOOL)allowsShowToEndInternally
{
  return self->mAllowsShowToEndInternally;
}

- (void)setAllowsShowToEndInternally:(BOOL)a3
{
  self->mAllowsShowToEndInternally = a3;
}

- (BOOL)playsAutomaticEvents
{
  return self->mPlaysAutomaticEvents;
}

- (void)setPlaysAutomaticEvents:(BOOL)a3
{
  self->mPlaysAutomaticEvents = a3;
}

- (CAKPFSession)session
{
  return self->mSession;
}

- (KPFMovie)soundTrack
{
  return self->mSoundtrack;
}

- (KPFPlayerControllerDelegateProtocol)kpfPlayerControllerDelegate
{
  return self->kpfPlayerControllerDelegate;
}

- (void)setKpfPlayerControllerDelegate:(id)a3
{
  self->kpfPlayerControllerDelegate = (KPFPlayerControllerDelegateProtocol *)a3;
}

- (void)p_handleURL:(id)a3
{
  unint64_t v4 = +[NSURL URLWithString:a3];
  v5 = [(CAKPFPlayerController *)self kpfPlayerControllerDelegate];

  [(KPFPlayerControllerDelegateProtocol *)v5 kpfPlayer:self handleURL:v4];
}

- (void)p_playSoundtrack
{
  if ([[(CAKPFSession *)self->mSession KPFDocument] soundtrackName])
  {
    mSoundtrack = self->mSoundtrack;
    if (mSoundtrack)
    {
      [(KPFMovie *)mSoundtrack stop];

      self->mSoundtrack = 0;
    }
    unint64_t v4 = [[(CAKPFSession *)self->mSession KPFDocument] newSoundtrack];
    self->mSoundtrack = v4;
    [(KPFMovie *)v4 playAfterDelay:0.0];
  }
}

- (void)p_animationEnded
{
  unint64_t v3 = [(CAKPFSession *)self->mSession nextEvent];
  if (v3)
  {
    unint64_t v4 = v3;
    [(CAKPFSession *)self->mSession setPlaybackStatus:4];
    if (self->mQueuedTrigger || [(KPFEvent *)v4 isAutomatic])
    {
      [(CAKPFPlayerController *)self performSelector:"p_triggerNextEvent" withObject:0 afterDelay:0.0];
      self->mQueuedTrigger = 0;
    }
    else if (![(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] containsMovie])
    {
      [(CAKPFSession *)self->mSession setPlaybackStatus:2];
      [(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] tearDown];
      if ([(CAKPFSession *)self->mSession incrementCurrentEventIndex])
      {
        [(KPFEvent *)[(CAKPFSession *)self->mSession currentEvent] renderEventWithSession:self->mSession];
        [(CAKPFSession *)self->mSession setPlaybackStatus:1];
      }
    }

    [(CAKPFPlayerController *)self p_announceStateUpdate];
  }
  else
  {
    [(CAKPFPlayerController *)self endshow];
  }
}

- (void)p_triggerNextEvent
{
  activity_block[0] = _NSConcreteStackBlock;
  activity_block[1] = 3221225472;
  activity_block[2] = sub_7A59C;
  activity_block[3] = &unk_456DE0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_0, "KPFPlayer Trigger Next Event", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

@end