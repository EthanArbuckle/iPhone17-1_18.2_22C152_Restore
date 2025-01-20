@interface THWAVController
+ (id)sharedController;
- (BOOL)hasAVControllerActive;
- (BOOL)p_shouldHandleVantageDidChangeNotification:(id)a3;
- (NSMutableArray)activeTransportControllers;
- (NSMutableSet)autoplayingTransportControllers;
- (THWAVController)init;
- (THWAVTransportControllable)playingTransportController;
- (id)newTransportController;
- (id)p_documentNavigatorFromNotification:(id)a3;
- (unint64_t)currentAbsolutePageIndex;
- (void)audioPlaybackWillStart:(id)a3;
- (void)dealloc;
- (void)handleNotificationVantageDidChange:(id)a3;
- (void)setActiveTransportControllers:(id)a3;
- (void)setAutoplayingTransportControllers:(id)a3;
- (void)setCurrentAbsolutePageIndex:(unint64_t)a3;
- (void)setPlayingTransportController:(id)a3;
- (void)stopPlayer;
- (void)stopPlayerNotInDocumentRoot:(id)a3;
- (void)togglePlayPause;
- (void)transportControllerDidBecomeInvalid:(id)a3;
- (void)transportControllerDidStartAutoplaying:(id)a3;
- (void)transportControllerDidStartPlaying:(id)a3;
- (void)transportControllerDidStopAutoplaying:(id)a3;
- (void)transportControllerDidStopPlaying:(id)a3;
@end

@implementation THWAVController

+ (id)sharedController
{
  id result = (id)qword_5732F8;
  if (!qword_5732F8)
  {
    id result = objc_alloc_init(THWAVController);
    qword_5732F8 = (uint64_t)result;
  }
  return result;
}

- (THWAVController)init
{
  v4.receiver = self;
  v4.super_class = (Class)THWAVController;
  v2 = [(THWAVController *)&v4 init];
  if (v2)
  {
    [(THWAVController *)v2 setActiveTransportControllers:+[NSMutableArray array]];
    [(THWAVController *)v2 setAutoplayingTransportControllers:+[NSMutableSet set]];
    [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"handleNotificationVantageDidChange:" name:@"THVantageDidChangeNotification" object:0];
    [+[BCAudioMuxingCoordinator sharedInstance] addAudioMuxingObserver:v2];
  }
  return v2;
}

- (void)dealloc
{
  [+[BCAudioMuxingCoordinator sharedInstance] removeAudioMuxingObserver:self];
  [(THWAVController *)self setActiveTransportControllers:0];
  [(THWAVController *)self setAutoplayingTransportControllers:0];
  [+[NSNotificationCenter defaultCenter] removeObserver:self name:@"THVantageDidChangeNotification" object:0];
  v3.receiver = self;
  v3.super_class = (Class)THWAVController;
  [(THWAVController *)&v3 dealloc];
}

- (id)newTransportController
{
  objc_super v3 = objc_alloc_init(THWAVTransportController);
  [(NSMutableArray *)[(THWAVController *)self activeTransportControllers] addObject:v3];
  return v3;
}

- (BOOL)hasAVControllerActive
{
  return [(THWAVController *)self playingTransportController] != 0;
}

- (void)togglePlayPause
{
  if ([(THWAVController *)self playingTransportController])
  {
    objc_super v3 = [(THWAVController *)self playingTransportController];
    [(THWAVTransportControllable *)v3 togglePlayPause];
  }
}

- (void)stopPlayer
{
  if ([(THWAVController *)self playingTransportController])
  {
    objc_super v3 = [(THWAVController *)self playingTransportController];
    [(THWAVTransportControllable *)v3 stop];
  }
}

- (void)stopPlayerNotInDocumentRoot:(id)a3
{
  if ([(THWAVController *)self playingTransportController]
    && [(THWAVTransportControllable *)[(THWAVController *)self playingTransportController] documentRoot] != a3)
  {
    v5 = [(THWAVController *)self playingTransportController];
    [(THWAVTransportControllable *)v5 stop];
  }
}

- (void)transportControllerDidStartPlaying:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_16D07C;
  v3[3] = &unk_456F28;
  v3[5] = self;
  v3[6] = a3;
  [+[BCAudioMuxingCoordinator sharedInstance] beginLongAudioSessionWithIdentifier:@"THWAVController" completion:v3];
}

- (void)transportControllerDidStopPlaying:(id)a3
{
  if ([(THWAVController *)self playingTransportController] == a3) {
    [(THWAVController *)self setPlayingTransportController:0];
  }
  else {
    [(NSMutableSet *)[(THWAVController *)self autoplayingTransportControllers] removeObject:a3];
  }
  v5 = +[BCAudioMuxingCoordinator sharedInstance];

  [(BCAudioMuxingCoordinator *)v5 endLongAudioSessionWithIdentifier:@"THWAVController"];
}

- (void)transportControllerDidBecomeInvalid:(id)a3
{
  [(NSMutableArray *)[(THWAVController *)self activeTransportControllers] removeObject:a3];
  if ([(THWAVController *)self playingTransportController] == a3) {
    [(THWAVController *)self setPlayingTransportController:0];
  }
  v5 = +[BCAudioMuxingCoordinator sharedInstance];

  [(BCAudioMuxingCoordinator *)v5 endLongAudioSessionWithIdentifier:@"THWAVController"];
}

- (void)transportControllerDidStartAutoplaying:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_16D2B8;
  v3[3] = &unk_456F28;
  v3[5] = self;
  v3[6] = a3;
  [+[BCAudioMuxingCoordinator sharedInstance] beginLongAudioSessionWithIdentifier:@"THWAVController" completion:v3];
}

- (void)transportControllerDidStopAutoplaying:(id)a3
{
  [(NSMutableSet *)[(THWAVController *)self autoplayingTransportControllers] removeObject:a3];
  objc_super v3 = +[BCAudioMuxingCoordinator sharedInstance];

  [(BCAudioMuxingCoordinator *)v3 endLongAudioSessionWithIdentifier:@"THWAVController"];
}

- (id)p_documentNavigatorFromNotification:(id)a3
{
  objc_opt_class();
  [a3 object];
  id result = (id)TSUDynamicCast();
  if (!result)
  {
    [a3 object];
    v5 = (void *)TSUProtocolCast();
    return [v5 documentNavigator];
  }
  return result;
}

- (BOOL)p_shouldHandleVantageDidChangeNotification:(id)a3
{
  id v5 = objc_msgSend(objc_msgSend(a3, "userInfo"), "valueForKey:", @"THVantageChangeReason");
  if (objc_msgSend(-[THWAVTransportControllable movieLayout](-[THWAVController playingTransportController](self, "playingTransportController"), "movieLayout"), "isExpanded"))
  {
    return [v5 isEqualToString:@"THVantageChangeReasonNavigation"];
  }
  else
  {
    id v7 = [[self p_documentNavigatorFromNotification:a3] currentAbsolutePageIndex];
    if (([v5 isEqualToString:@"THVantageChangeReasonWindowResize"] & 1) != 0
      || ([v5 isEqualToString:@"THVantageChangeReasonRotation"] & 1) != 0)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      unsigned int v8 = [v5 isEqualToString:@"THVantageChangeReasonScrolling"] ^ 1;
    }
    if ([v5 isEqualToString:@"THVantageChangeReasonScrolling"]) {
      LOBYTE(v8) = v7 != self->_currentAbsolutePageIndex;
    }
    self->_currentAbsolutePageIndex = (unint64_t)v7;
    return v8;
  }
}

- (void)handleNotificationVantageDidChange:(id)a3
{
  if ([(THWAVController *)self p_shouldHandleVantageDidChangeNotification:a3]&& [(THWAVController *)self playingTransportController])
  {
    [(THWAVTransportControllable *)[(THWAVController *)self playingTransportController] stop];
    [(THWAVController *)self setPlayingTransportController:0];
  }
}

- (void)audioPlaybackWillStart:(id)a3
{
  objc_opt_class();
  id v5 = (void *)TSUDynamicCast();
  if (v5)
  {
    v6 = v5;
    unsigned __int8 v7 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "movieInfo"), "movieRemoteURL"), "isEqual:", objc_msgSend(objc_msgSend(-[THWAVTransportControllable movieLayout](-[THWAVController playingTransportController](self, "playingTransportController"), "movieLayout"), "movieInfo"), "movieRemoteURL"));
    id v8 = objc_msgSend(objc_msgSend(v6, "movieInfo"), "movieData");
    id v9 = [[-[THWAVController playingTransportController](self, "playingTransportController") movieLayout] movieInfo].movieData;
    if (v7) {
      return;
    }
    unsigned __int8 v10 = [v8 isEqual:v9];
    if (a3 == self || (v10 & 1) != 0) {
      return;
    }
  }
  else if (a3 == self)
  {
    return;
  }

  [(THWAVController *)self stopPlayer];
}

- (NSMutableArray)activeTransportControllers
{
  return self->activeTransportControllers;
}

- (void)setActiveTransportControllers:(id)a3
{
}

- (THWAVTransportControllable)playingTransportController
{
  return self->_playingTransportController;
}

- (void)setPlayingTransportController:(id)a3
{
  self->_playingTransportController = (THWAVTransportControllable *)a3;
}

- (NSMutableSet)autoplayingTransportControllers
{
  return self->_autoplayingTransportControllers;
}

- (void)setAutoplayingTransportControllers:(id)a3
{
}

- (unint64_t)currentAbsolutePageIndex
{
  return self->_currentAbsolutePageIndex;
}

- (void)setCurrentAbsolutePageIndex:(unint64_t)a3
{
  self->_currentAbsolutePageIndex = a3;
}

@end