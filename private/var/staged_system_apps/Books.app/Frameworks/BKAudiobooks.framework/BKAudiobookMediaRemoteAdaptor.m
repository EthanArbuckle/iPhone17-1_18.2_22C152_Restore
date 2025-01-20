@interface BKAudiobookMediaRemoteAdaptor
+ (id)startAdaptor;
+ (void)initialize;
- (BKAudiobookMediaRemoteAdaptor)initWithPlayer:(id)a3;
- (BKAudiobookPlayer)player;
- (MPRemoteCommandEvent)currentEvent;
- (id)_skipBackwardCommandEvent;
- (id)_skipForwardCommandEvent;
- (int64_t)onChangePlaybackPositionCommand:(id)a3;
- (int64_t)onChangePlaybackRateCommand:(id)a3;
- (int64_t)onNextTrackCommand:(id)a3;
- (int64_t)onPauseCommand:(id)a3;
- (int64_t)onPlayCommand:(id)a3;
- (int64_t)onPlayItemInQueueCommand:(id)a3;
- (int64_t)onPrevTrackCommand:(id)a3;
- (int64_t)onSeekBackwardCommand:(id)a3;
- (int64_t)onSeekForwardCommand:(id)a3;
- (int64_t)onSkipBackward:(id)a3;
- (int64_t)onSkipForward:(id)a3;
- (int64_t)onSpecialSeekBackwardCommand:(id)a3;
- (int64_t)onSpecialSeekForwardCommand:(id)a3;
- (int64_t)onTogglePlayPauseCommand:(id)a3;
- (int64_t)skipBehavior;
- (void)_setSkipBackwardCommand;
- (void)_setSkipForwardCommand;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)player:(id)a3 playbackRateDidChange:(float)a4;
- (void)setPlayer:(id)a3;
- (void)setSkipBehavior:(int64_t)a3;
- (void)skipControllerSettingsDidChange:(id)a3;
@end

@implementation BKAudiobookMediaRemoteAdaptor

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    CFStringRef v4 = @"BKRemoteSkipInsteadOfNextTrackDefaultKey";
    v5 = &__kCFBooleanTrue;
    v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
    [v2 registerDefaults:v3];
  }
}

+ (id)startAdaptor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1BA10;
  block[3] = &unk_3D0A0;
  block[4] = a1;
  if (qword_48F08 != -1) {
    dispatch_once(&qword_48F08, block);
  }
  v2 = (void *)qword_48F10;

  return v2;
}

- (BKAudiobookMediaRemoteAdaptor)initWithPlayer:(id)a3
{
  id v5 = a3;
  v49.receiver = self;
  v49.super_class = (Class)BKAudiobookMediaRemoteAdaptor;
  v6 = [(BKAudiobookMediaRemoteAdaptor *)&v49 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_player, a3);
    v7->_skipBehavior = 1;
    v8 = +[NSUserDefaults standardUserDefaults];
    unsigned int v9 = [v8 BOOLForKey:@"BKRemoteSkipInsteadOfNextTrackDefaultKey"];

    [(BKAudiobookMediaRemoteAdaptor *)v7 setSkipBehavior:v9 ^ 1];
    v10 = +[MPRemoteCommandCenter sharedCommandCenter];
    v11 = [v10 playCommand];
    [v11 addTarget:v7 action:"onPlayCommand:"];

    v12 = [v10 playCommand];
    [v12 setEnabled:1];

    v13 = [v10 pauseCommand];
    [v13 addTarget:v7 action:"onPauseCommand:"];

    v14 = [v10 pauseCommand];
    [v14 setEnabled:1];

    v15 = [v10 stopCommand];
    [v15 addTarget:v7 action:"onPauseCommand:"];

    v16 = [v10 stopCommand];
    [v16 setEnabled:1];

    v17 = [v10 togglePlayPauseCommand];
    [v17 addTarget:v7 action:"onTogglePlayPauseCommand:"];

    v18 = [v10 togglePlayPauseCommand];
    [v18 setEnabled:1];

    v19 = [v10 playItemInQueueCommand];
    [v19 addTarget:v7 action:"onPlayItemInQueueCommand:"];

    v20 = [v10 playItemInQueueCommand];
    [v20 setEnabled:1];

    v21 = [v10 nextTrackCommand];
    [v21 addTarget:v7 action:"onNextTrackCommand:"];

    v22 = [v10 nextTrackCommand];
    [v22 setEnabled:1];

    v23 = [v10 previousTrackCommand];
    [v23 addTarget:v7 action:"onPrevTrackCommand:"];

    v24 = [v10 previousTrackCommand];
    [v24 setEnabled:1];

    [(BKAudiobookMediaRemoteAdaptor *)v7 _setSkipForwardCommand];
    [(BKAudiobookMediaRemoteAdaptor *)v7 _setSkipBackwardCommand];
    v25 = [v10 seekForwardCommand];
    [v25 addTarget:v7 action:"onSeekForwardCommand:"];

    v26 = [v10 seekForwardCommand];
    [v26 setEnabled:1];

    v27 = [v10 seekBackwardCommand];
    [v27 addTarget:v7 action:"onSeekBackwardCommand:"];

    v28 = [v10 seekBackwardCommand];
    [v28 setEnabled:1];

    [(BKAudiobookPlayer *)v7->_player playbackRate];
    int v30 = v29;
    v31 = [v10 changePlaybackRateCommand];
    LODWORD(v32) = v30;
    [v31 setPreferredRate:v32];

    v33 = [(BKAudiobookPlayer *)v7->_player precisionRates];
    v34 = [v10 changePlaybackRateCommand];
    [v34 setSupportedPlaybackRates:v33];

    v35 = [v10 changePlaybackRateCommand];
    [v35 addTarget:v7 action:"onChangePlaybackRateCommand:"];

    v36 = [v10 changePlaybackRateCommand];
    [v36 setEnabled:1];

    v37 = [v10 changePlaybackPositionCommand];
    [v37 setCanBeControlledByScrubbing:1];

    v38 = [v10 changePlaybackPositionCommand];
    [v38 addTarget:v7 action:"onChangePlaybackPositionCommand:"];

    v39 = [v10 changePlaybackPositionCommand];
    [v39 setEnabled:1];

    v40 = [v10 specialSeekForwardCommand];
    [v40 addTarget:v7 action:"onSpecialSeekForwardCommand:"];

    v41 = [v10 specialSeekForwardCommand];
    [v41 setEnabled:1];

    v42 = [v10 specialSeekBackwardCommand];
    [v42 addTarget:v7 action:"onSpecialSeekBackwardCommand:"];

    v43 = [v10 specialSeekBackwardCommand];
    [v43 setEnabled:1];

    v44 = +[NSUserDefaults standardUserDefaults];
    [v44 addObserver:v7 forKeyPath:@"BKRemoteSkipInsteadOfNextTrackDefaultKey" options:1 context:off_48B88];

    v45 = [(BKAudiobookMediaRemoteAdaptor *)v7 player];
    [v45 addObserver:v7];

    v46 = [(BKAudiobookMediaRemoteAdaptor *)v7 player];
    v47 = [v46 skipController];
    [v47 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 removeObserver:self forKeyPath:@"BKRemoteSkipInsteadOfNextTrackDefaultKey" context:off_48B88];

  CFStringRef v4 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  [v4 removeObserver:self];

  id v5 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  v6 = [v5 skipController];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)BKAudiobookMediaRemoteAdaptor;
  [(BKAudiobookMediaRemoteAdaptor *)&v7 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_48B88 == a6)
  {
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1C24C;
    v18[3] = &unk_3D0C8;
    id v19 = v12;
    objc_copyWeak(&v20, &location);
    v13 = objc_retainBlock(v18);
    v14 = objc_retainBlock(v13);
    if (v14)
    {
      if (+[NSThread isMainThread])
      {
        v14[2](v14);
      }
      else
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1C2F8;
        block[3] = &unk_3C6C0;
        v17 = v14;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)BKAudiobookMediaRemoteAdaptor;
    [(BKAudiobookMediaRemoteAdaptor *)&v15 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (int64_t)onPlayCommand:(id)a3
{
  CFStringRef v4 = (MPRemoteCommandEvent *)a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "play", v11, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  objc_super v7 = v4;

  v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  [v8 play];

  unsigned int v9 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (int64_t)onPlayItemInQueueCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "play item in queue", buf, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  v8 = [v5 contentItemID];
  if ([v8 length])
  {
    unsigned int v9 = [(BKAudiobookMediaRemoteAdaptor *)self player];
    id v10 = [v9 currentAudiobook];
    id v11 = [v10 chapters];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1C5EC;
    v21[3] = &unk_3D0F0;
    id v12 = v8;
    v22 = v12;
    id v13 = [v11 indexOfObjectPassingTest:v21];

    if (v13 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = BKAudiobooksMediaRemoteLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_258A0((uint64_t)v12, v14);
      }
      int64_t v15 = 200;
    }
    else
    {
      v17 = [(BKAudiobookMediaRemoteAdaptor *)self player];
      id v18 = [v17 currentChapterIndex];

      if (v13 == v18)
      {
        int64_t v15 = 0;
LABEL_15:
        v16 = v22;
        goto LABEL_16;
      }
      v14 = [(BKAudiobookMediaRemoteAdaptor *)self player];
      [v14 playChapterAtIndex:v13];
      int64_t v15 = 0;
    }

    goto LABEL_15;
  }
  v16 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_2585C(v16);
  }
  int64_t v15 = 200;
LABEL_16:

  id v19 = *p_currentEvent;
  *p_currentEvent = 0;

  return v15;
}

- (int64_t)onPauseCommand:(id)a3
{
  CFStringRef v4 = (MPRemoteCommandEvent *)a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "pause", v11, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  objc_super v7 = v4;

  v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  [v8 pause];

  unsigned int v9 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (int64_t)onTogglePlayPauseCommand:(id)a3
{
  CFStringRef v4 = (MPRemoteCommandEvent *)a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "toggle playPause", v11, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  objc_super v7 = v4;

  v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  [v8 togglePlayPause];

  unsigned int v9 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (int64_t)onNextTrackCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v15 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "next track", v15, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self skipBehavior];
  if (v8)
  {
    if (v8 == 1)
    {
      unsigned int v9 = [(BKAudiobookMediaRemoteAdaptor *)self player];
      unsigned int v10 = [v9 nextChapterOrRestartAudiobook];

      if (v10) {
        int64_t v11 = 0;
      }
      else {
        int64_t v11 = 200;
      }
    }
    else
    {
      int64_t v11 = 200;
    }
  }
  else
  {
    id v12 = [(BKAudiobookMediaRemoteAdaptor *)self _skipForwardCommandEvent];
    int64_t v11 = [(BKAudiobookMediaRemoteAdaptor *)self onSkipForward:v12];
  }
  id v13 = *p_currentEvent;
  *p_currentEvent = 0;

  return v11;
}

- (int64_t)onPrevTrackCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v15 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "prev track", v15, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self skipBehavior];
  if (v8)
  {
    if (v8 == 1)
    {
      unsigned int v9 = [(BKAudiobookMediaRemoteAdaptor *)self player];
      unsigned int v10 = [v9 previousChapterOrRestartChapter];

      if (v10) {
        int64_t v11 = 0;
      }
      else {
        int64_t v11 = 200;
      }
    }
    else
    {
      int64_t v11 = 200;
    }
  }
  else
  {
    id v12 = [(BKAudiobookMediaRemoteAdaptor *)self _skipBackwardCommandEvent];
    int64_t v11 = [(BKAudiobookMediaRemoteAdaptor *)self onSkipBackward:v12];
  }
  id v13 = *p_currentEvent;
  *p_currentEvent = 0;

  return v11;
}

- (int64_t)onSkipForward:(id)a3
{
  CFStringRef v4 = (MPRemoteCommandEvent *)a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "skip forward", v13, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  objc_super v7 = v4;

  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  unsigned int v9 = [v8 skipController];

  [(MPRemoteCommandEvent *)v7 interval];
  if (objc_msgSend(v9, "singleSkip:interval:", 1)) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = 200;
  }
  int64_t v11 = self->_currentEvent;
  self->_currentEvent = 0;

  return v10;
}

- (int64_t)onSkipBackward:(id)a3
{
  CFStringRef v4 = (MPRemoteCommandEvent *)a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "skip backward", v13, 2u);
  }

  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  objc_super v7 = v4;

  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  unsigned int v9 = [v8 skipController];

  [(MPRemoteCommandEvent *)v7 interval];
  if (objc_msgSend(v9, "singleSkip:interval:", 0)) {
    int64_t v10 = 0;
  }
  else {
    int64_t v10 = 200;
  }
  int64_t v11 = self->_currentEvent;
  self->_currentEvent = 0;

  return v10;
}

- (int64_t)onSeekForwardCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v15 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "seek forward", v15, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  unsigned int v9 = [v8 skipController];

  int64_t v10 = (char *)[v5 type];
  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    unsigned int v11 = [v9 endSeek];
  }
  else
  {
    if (v10)
    {
      int64_t v12 = 200;
      goto LABEL_11;
    }
    unsigned int v11 = [v9 startSeek:1];
  }
  if (v11) {
    int64_t v12 = 0;
  }
  else {
    int64_t v12 = 200;
  }
LABEL_11:
  id v13 = *p_currentEvent;
  *p_currentEvent = 0;

  return v12;
}

- (int64_t)onSeekBackwardCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v15 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "seek backward", v15, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  unsigned int v9 = [v8 skipController];

  int64_t v10 = (char *)[v5 type];
  if (v10 == (unsigned char *)&dword_0 + 1)
  {
    unsigned int v11 = [v9 endSeek];
  }
  else
  {
    if (v10)
    {
      int64_t v12 = 200;
      goto LABEL_11;
    }
    unsigned int v11 = [v9 startSeek:0];
  }
  if (v11) {
    int64_t v12 = 0;
  }
  else {
    int64_t v12 = 200;
  }
LABEL_11:
  id v13 = *p_currentEvent;
  *p_currentEvent = 0;

  return v12;
}

- (int64_t)onSpecialSeekForwardCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "special seek forward", v16, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  if ([v5 type] != (char *)&dword_0 + 3)
  {
    int64_t v12 = BKAudiobooksMediaRemoteLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_25918(v5);
    }

LABEL_12:
    int64_t v11 = 200;
    goto LABEL_13;
  }
  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self skipBehavior];
  if (!v8)
  {
    int64_t v15 = [(BKAudiobookMediaRemoteAdaptor *)self _skipForwardCommandEvent];
    int64_t v11 = [(BKAudiobookMediaRemoteAdaptor *)self onSkipForward:v15];

    goto LABEL_13;
  }
  if (v8 != 1) {
    goto LABEL_12;
  }
  unsigned int v9 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  unsigned int v10 = [v9 nextChapterOrRestartAudiobook];

  if (v10) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = 200;
  }
LABEL_13:
  id v13 = *p_currentEvent;
  *p_currentEvent = 0;

  return v11;
}

- (int64_t)onSpecialSeekBackwardCommand:(id)a3
{
  id v5 = a3;
  v6 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "special seek backward", v16, 2u);
  }

  p_currentEvent = &self->_currentEvent;
  objc_storeStrong((id *)&self->_currentEvent, a3);
  if ([v5 type] != (char *)&dword_0 + 3)
  {
    int64_t v12 = BKAudiobooksMediaRemoteLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_25918(v5);
    }

LABEL_12:
    int64_t v11 = 200;
    goto LABEL_13;
  }
  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self skipBehavior];
  if (!v8)
  {
    int64_t v15 = [(BKAudiobookMediaRemoteAdaptor *)self _skipBackwardCommandEvent];
    int64_t v11 = [(BKAudiobookMediaRemoteAdaptor *)self onSkipBackward:v15];

    goto LABEL_13;
  }
  if (v8 != 1) {
    goto LABEL_12;
  }
  unsigned int v9 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  unsigned int v10 = [v9 previousChapterOrRestartChapter];

  if (v10) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = 200;
  }
LABEL_13:
  id v13 = *p_currentEvent;
  *p_currentEvent = 0;

  return v11;
}

- (int64_t)onChangePlaybackRateCommand:(id)a3
{
  id v4 = a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v11 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "change playback rate", v11, 2u);
  }

  [v4 playbackRate];
  int v7 = v6;

  int64_t v8 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  LODWORD(v9) = v7;
  [v8 setPlaybackRate:v9];

  return 0;
}

- (int64_t)onChangePlaybackPositionCommand:(id)a3
{
  id v4 = (MPRemoteCommandEvent *)a3;
  id v5 = BKAudiobooksMediaRemoteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "playback position", v17, 2u);
  }

  int v6 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  [v6 durationOfCurrentChapter];
  double v8 = v7;

  double v9 = v8 + -0.1;
  [(MPRemoteCommandEvent *)v4 positionTime];
  if (v9 < v10) {
    double v10 = v9;
  }
  double v11 = fmax(v10, 0.0);
  currentEvent = self->_currentEvent;
  self->_currentEvent = v4;
  id v13 = v4;

  v14 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  [v14 movePositionInCurrentChapter:0 completion:v11];

  int64_t v15 = self->_currentEvent;
  self->_currentEvent = 0;

  return 0;
}

- (id)_skipForwardCommandEvent
{
  v2 = +[MPRemoteCommandCenter sharedCommandCenter];
  v3 = [v2 skipForwardCommand];

  id v4 = [v3 preferredIntervals];
  id v5 = [v4 firstObject];

  [v5 doubleValue];
  id v6 = [v3 newCommandEventWithInterval:];

  return v6;
}

- (id)_skipBackwardCommandEvent
{
  v2 = +[MPRemoteCommandCenter sharedCommandCenter];
  v3 = [v2 skipBackwardCommand];

  id v4 = [v3 preferredIntervals];
  id v5 = [v4 firstObject];

  [v5 doubleValue];
  id v6 = [v3 newCommandEventWithInterval:];

  return v6;
}

- (void)_setSkipForwardCommand
{
  v3 = +[MPRemoteCommandCenter sharedCommandCenter];
  id v4 = [v3 skipForwardCommand];
  id v5 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  id v6 = [v5 skipController];
  [v6 forwardSkipTime];
  double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v9 = v7;
  double v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v4 setPreferredIntervals:v8];

  [v4 addTarget:self action:"onSkipForward:"];
  [v4 setEnabled:1];
}

- (void)_setSkipBackwardCommand
{
  v3 = +[MPRemoteCommandCenter sharedCommandCenter];
  id v4 = [v3 skipBackwardCommand];
  id v5 = [(BKAudiobookMediaRemoteAdaptor *)self player];
  id v6 = [v5 skipController];
  [v6 backwardSkipTime];
  double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  double v9 = v7;
  double v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v4 setPreferredIntervals:v8];

  [v4 addTarget:self action:"onSkipBackward:"];
  [v4 setEnabled:1];
}

- (void)skipControllerSettingsDidChange:(id)a3
{
  [(BKAudiobookMediaRemoteAdaptor *)self _setSkipForwardCommand];

  [(BKAudiobookMediaRemoteAdaptor *)self _setSkipBackwardCommand];
}

- (void)player:(id)a3 playbackRateDidChange:(float)a4
{
  id v7 = +[MPRemoteCommandCenter sharedCommandCenter];
  id v5 = [v7 changePlaybackRateCommand];
  *(float *)&double v6 = a4;
  [v5 setPreferredRate:v6];
}

- (MPRemoteCommandEvent)currentEvent
{
  return self->_currentEvent;
}

- (BKAudiobookPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (int64_t)skipBehavior
{
  return self->_skipBehavior;
}

- (void)setSkipBehavior:(int64_t)a3
{
  self->_skipBehavior = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);

  objc_storeStrong((id *)&self->_currentEvent, 0);
}

@end