@interface NCAudioPlayerController
+ (void)initialize;
- (AVPlayer)player;
- (BOOL)isAudioSessionActive;
- (BOOL)shouldEnableProximityMonitoring;
- (BOOL)updateProximityMonitoring;
- (NCAudioPlayerController)initWithPlayer:(id)a3;
- (NCAudioPlayerController)initWithURL:(id)a3;
- (NCAudioPlayerControllerDelegate)delegate;
- (double)duration;
- (float)currentTime;
- (float)rate;
- (int64_t)playbackState;
- (int64_t)status;
- (int64_t)timeControlStatus;
- (void)activateAudioSession;
- (void)deactivateAudioSession;
- (void)dealloc;
- (void)handleAudioSessionInterruptionNotification:(id)a3;
- (void)handleAudioSessionRouteChangeNotification:(id)a3;
- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3;
- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)seekToTime:(float)a3;
- (void)setAudioSessionActive:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setPlaybackState:(int64_t)a3;
- (void)setPlayer:(id)a3;
- (void)setRate:(float)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTimeControlStatus:(int64_t)a3;
- (void)stop;
@end

@implementation NCAudioPlayerController

+ (void)initialize
{
  if (qword_100011980 != -1) {
    dispatch_once(&qword_100011980, &stru_10000C3D0);
  }
}

- (NCAudioPlayerController)initWithURL:(id)a3
{
  v4 = +[AVPlayer playerWithURL:a3];
  [v4 setActionAtItemEnd:1];
  [v4 setAllowsExternalPlayback:0];
  v5 = [(NCAudioPlayerController *)self initWithPlayer:v4];

  return v5;
}

- (NCAudioPlayerController)initWithPlayer:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NCAudioPlayerController;
  v6 = [(NCAudioPlayerController *)&v24 init];
  v7 = v6;
  if (v6)
  {
    v6->_audioSessionActive = 0;
    p_player = (id *)&v6->_player;
    objc_storeStrong((id *)&v6->_player, a3);
    v7->_playbackState = (int64_t)[v5 timeControlStatus];
    [v5 rate];
    v7->_rate = v9;
    v7->_status = (int64_t)[v5 status];
    objc_initWeak(&location, v7);
    player = v7->_player;
    CMTimeMake(&v22, 1, 100);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100003F88;
    v20[3] = &unk_10000C3F8;
    objc_copyWeak(&v21, &location);
    id v11 = [(AVPlayer *)player addPeriodicTimeObserverForInterval:&v22 queue:0 usingBlock:v20];
    id v12 = *p_player;
    v13 = NSStringFromSelector("rate");
    [v12 addObserver:v7 forKeyPath:v13 options:0 context:&off_10000C418];

    id v14 = *p_player;
    v15 = NSStringFromSelector("status");
    [v14 addObserver:v7 forKeyPath:v15 options:0 context:&off_10000C418];

    v16 = [*p_player currentItem];
    v17 = NSStringFromSelector("duration");
    [v16 addObserver:v7 forKeyPath:v17 options:0 context:&off_10000C418];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v7 selector:"handlePlayerItemDidPlayToEndTimeNotification:" name:AVPlayerItemDidPlayToEndTimeNotification object:0];
    [v18 addObserver:v7 selector:"handlePlayerItemFailedToPlayToEndTimeNotification:" name:AVPlayerItemFailedToPlayToEndTimeNotification object:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  [(NCAudioPlayerController *)self deactivateAudioSession];
  player = self->_player;
  v4 = NSStringFromSelector("rate");
  [(AVPlayer *)player removeObserver:self forKeyPath:v4 context:&off_10000C418];

  id v5 = self->_player;
  v6 = NSStringFromSelector("status");
  [(AVPlayer *)v5 removeObserver:self forKeyPath:v6 context:&off_10000C418];

  v7 = [(AVPlayer *)self->_player currentItem];
  v8 = NSStringFromSelector("duration");
  [v7 removeObserver:self forKeyPath:v8 context:&off_10000C418];

  float v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self];

  v10.receiver = self;
  v10.super_class = (Class)NCAudioPlayerController;
  [(NCAudioPlayerController *)&v10 dealloc];
}

- (float)currentTime
{
  memset(&v6, 0, sizeof(v6));
  v2 = [(NCAudioPlayerController *)self player];
  v3 = v2;
  if (v2) {
    [v2 currentTime];
  }
  else {
    memset(&v6, 0, sizeof(v6));
  }

  CMTime v5 = v6;
  return CMTimeGetSeconds(&v5);
}

- (double)duration
{
  CMTime v7 = kCMTimeIndefinite;
  v2 = [(NCAudioPlayerController *)self player];
  v3 = [v2 currentItem];

  if (v3) {
    [v3 duration];
  }
  CMTime v6 = v7;
  double Seconds = CMTimeGetSeconds(&v6);

  return Seconds;
}

- (void)pause
{
  id v2 = [(NCAudioPlayerController *)self player];
  [v2 pause];
}

- (void)play
{
  if (![(NCAudioPlayerController *)self isAudioSessionActive]) {
    [(NCAudioPlayerController *)self activateAudioSession];
  }
  if ([(NCAudioPlayerController *)self isAudioSessionActive])
  {
    id v3 = [(NCAudioPlayerController *)self player];
    [v3 play];
  }
}

- (void)stop
{
  id v3 = [(NCAudioPlayerController *)self player];
  [v3 pause];

  v4 = [(NCAudioPlayerController *)self player];
  long long v5 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  [v4 seekToTime:&v5];

  if ([(NCAudioPlayerController *)self isAudioSessionActive]) {
    [(NCAudioPlayerController *)self deactivateAudioSession];
  }
}

- (void)seekToTime:(float)a3
{
  long long v5 = [(NCAudioPlayerController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v6 = a3;
    [v5 playerController:self willSeekToTime:v6];
  }
  memset(&v10, 0, sizeof(v10));
  CMTimeMakeWithSeconds(&v10, a3, 1);
  CMTime v7 = [(NCAudioPlayerController *)self player];
  CMTime v9 = v10;
  [v7 seekToTime:&v9];

  if (objc_opt_respondsToSelector())
  {
    *(float *)&double v8 = a3;
    [v5 playerController:self didSeekToTime:v8];
  }
}

- (void)setPlaybackState:(int64_t)a3
{
  if (self->_playbackState != a3)
  {
    id v5 = [(NCAudioPlayerController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 playerController:self willChangeToPlaybackState:a3];
    }
    self->_playbackState = a3;
    if (objc_opt_respondsToSelector()) {
      [v5 playerController:self didChangeToPlaybackState:a3];
    }
  }
}

- (void)setRate:(float)a3
{
  if (self->_rate != a3)
  {
    id v8 = [(NCAudioPlayerController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      *(float *)&double v5 = a3;
      [v8 playerController:self willChangeToRate:v5];
    }
    self->_rate = a3;
    if (objc_opt_respondsToSelector())
    {
      *(float *)&double v6 = a3;
      [v8 playerController:self didChangeToRate:v6];
    }
    CMTime v7 = [(NCAudioPlayerController *)self player];
    -[NCAudioPlayerController setTimeControlStatus:](self, "setTimeControlStatus:", [v7 timeControlStatus]);
  }
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    id v5 = [(NCAudioPlayerController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 playerController:self willChangeToStatus:a3];
    }
    self->_status = a3;
    if (objc_opt_respondsToSelector()) {
      [v5 playerController:self didChangeToStatus:a3];
    }
  }
}

- (void)setAudioSessionActive:(BOOL)a3
{
  if (self->_audioSessionActive != a3)
  {
    self->_audioSessionActive = a3;
    id v4 = +[NSNotificationCenter defaultCenter];
    if (self->_audioSessionActive)
    {
      [v4 addObserver:self selector:"handleAudioSessionInterruptionNotification:" name:AVAudioSessionInterruptionNotification object:0];
      [v4 addObserver:self selector:"handleAudioSessionRouteChangeNotification:" name:AVAudioSessionRouteChangeNotification object:0];
      [v4 addObserver:self selector:"handleAudioSessionMediaServicesWereLostNotification:" name:AVAudioSessionMediaServicesWereLostNotification object:0];
      [v4 addObserver:self selector:"handleAudioSessionMediaServicesWereResetNotification:" name:AVAudioSessionMediaServicesWereResetNotification object:0];
    }
    else
    {
      [v4 removeObserver:self name:AVAudioSessionInterruptionNotification object:0];
      [v4 removeObserver:self name:AVAudioSessionRouteChangeNotification object:0];
      [v4 removeObserver:self name:AVAudioSessionMediaServicesWereLostNotification object:0];
      [v4 removeObserver:self name:AVAudioSessionMediaServicesWereResetNotification object:0];
    }
  }
}

- (void)activateAudioSession
{
  if (![(NCAudioPlayerController *)self isAudioSessionActive])
  {
    id v3 = +[AVAudioSession sharedInstance];
    uint64_t v4 = AVAudioSessionCategoryVoiceMail;
    id v5 = [v3 category];
    unsigned __int8 v6 = [v5 isEqualToString:v4];

    if ((v6 & 1) == 0)
    {
      id v30 = 0;
      unsigned __int8 v7 = [v3 setCategory:v4 error:&v30];
      id v8 = v30;
      CMTime v9 = v8;
      if ((v7 & 1) == 0)
      {
        if (v8)
        {
          CMTime v10 = qword_100011988;
          if (os_log_type_enabled((os_log_t)qword_100011988, OS_LOG_TYPE_ERROR)) {
            sub_100008168((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
          }
        }
      }
    }
    v17 = [v3 category];
    unsigned int v18 = [v17 isEqualToString:v4];

    if (v18)
    {
      id v29 = 0;
      unsigned int v19 = [v3 setActive:1 error:&v29];
      id v20 = v29;
      id v21 = v20;
      if (v19)
      {
        [(NCAudioPlayerController *)self setAudioSessionActive:1];
      }
      else if (v20)
      {
        CMTime v22 = qword_100011988;
        if (os_log_type_enabled((os_log_t)qword_100011988, OS_LOG_TYPE_ERROR)) {
          sub_100008168((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28);
        }
      }
    }
  }
}

- (void)deactivateAudioSession
{
  if ([(NCAudioPlayerController *)self isAudioSessionActive])
  {
    id v3 = +[AVAudioSession sharedInstance];
    id v14 = 0;
    unsigned int v4 = [v3 setActive:0 withOptions:1 error:&v14];
    id v5 = v14;
    unsigned __int8 v6 = v5;
    if (v4)
    {
      [(NCAudioPlayerController *)self setAudioSessionActive:0];
    }
    else if (v5)
    {
      unsigned __int8 v7 = qword_100011988;
      if (os_log_type_enabled((os_log_t)qword_100011988, OS_LOG_TYPE_ERROR)) {
        sub_1000081D4((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
  }
}

- (BOOL)shouldEnableProximityMonitoring
{
  id v2 = [(NCAudioPlayerController *)self player];
  id v3 = (char *)[v2 timeControlStatus];

  if ((unint64_t)(v3 - 1) > 1) {
    return 0;
  }
  unsigned int v4 = +[AVAudioSession sharedInstance];
  id v5 = [v4 currentRoute];
  unsigned __int8 v6 = [v5 outputs];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v13 = objc_msgSend(v12, "portType", (void)v19);
        unsigned __int8 v14 = [AVAudioSessionPortBuiltInReceiver isEqualToString:v13];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = [v12 portType];
          unsigned int v16 = [AVAudioSessionPortBuiltInSpeaker isEqualToString:v15];

          if (!v16 || !UIAccessibilityIsVoiceOverRunning()) {
            continue;
          }
        }
        BOOL v17 = 1;
        goto LABEL_15;
      }
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_15:

  return v17;
}

- (BOOL)updateProximityMonitoring
{
  uint64_t v2 = [(NCAudioPlayerController *)self shouldEnableProximityMonitoring];
  id v3 = +[UIDevice currentDevice];
  [v3 setProximityMonitoringEnabled:v2];
  LOBYTE(v2) = [v3 isProximityMonitoringEnabled];

  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v29 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = v11;
  if (a6 == &off_10000C418)
  {
    if (v11)
    {
      uint64_t v13 = [v11 objectForKeyedSubscript:NSKeyValueChangeNotificationIsPriorKey];
      objc_opt_class();
      unsigned int v14 = (objc_opt_isKindOfClass() & 1) != 0
          ? [&__kCFBooleanTrue isEqualToNumber:v13]
          : 0;
    }
    else
    {
      unsigned int v14 = 0;
    }
    if (v29)
    {
      id v15 = [v29 length];
      if (v10)
      {
        if (v15)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v16 = v10;
            BOOL v17 = [(NCAudioPlayerController *)self player];
            unsigned int v18 = [v16 isEqual:v17];

            if (v18)
            {
              long long v19 = NSStringFromSelector("rate");
              unsigned int v20 = [v29 isEqualToString:v19];

              if (v20)
              {
                if ((v14 & 1) == 0)
                {
                  [v16 rate];
                  -[NCAudioPlayerController setRate:](self, "setRate:");
                  [(NCAudioPlayerController *)self updateProximityMonitoring];
                }
              }
              else
              {
                uint64_t v27 = NSStringFromSelector("status");
                unsigned int v28 = [v29 isEqualToString:v27];

                if (((v28 ^ 1 | v14) & 1) == 0) {
                  -[NCAudioPlayerController setStatus:](self, "setStatus:", [v16 status]);
                }
              }
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_2;
            }
            id v21 = v10;
            long long v22 = [(NCAudioPlayerController *)self player];
            uint64_t v23 = [v22 currentItem];
            LODWORD(v21) = [v21 isEqual:v23];

            if (v21)
            {
              uint64_t v24 = NSStringFromSelector("duration");
              unsigned int v25 = [v29 isEqualToString:v24];

              if (v25)
              {
                uint64_t v26 = [(NCAudioPlayerController *)self delegate];
                if (v14)
                {
                  if (objc_opt_respondsToSelector())
                  {
                    [(NCAudioPlayerController *)self duration];
                    objc_msgSend(v26, "playerController:willChangeToDuration:", self);
                  }
                }
                else if (objc_opt_respondsToSelector())
                {
                  [(NCAudioPlayerController *)self duration];
                  objc_msgSend(v26, "playerController:didChangeToDuration:", self);
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_2:
}

- (void)handleAudioSessionInterruptionNotification:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  if (v4)
  {
    id v9 = v4;
    id v5 = [v4 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [v5 unsignedIntegerValue];
      if (v6 == (id)1)
      {
        [(NCAudioPlayerController *)self pause];
        [(NCAudioPlayerController *)self deactivateAudioSession];
      }
      else if (!v6)
      {
        id v7 = [v9 objectForKeyedSubscript:AVAudioSessionInterruptionOptionKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v8 = [v7 unsignedIntegerValue];

          if (v8 == (id)1) {
            [(NCAudioPlayerController *)self play];
          }
        }
        else
        {
        }
      }
    }

    unsigned int v4 = v9;
  }
}

- (void)handleAudioSessionRouteChangeNotification:(id)a3
{
  unsigned int v4 = [a3 userInfo];
  if (v4)
  {
    id v6 = v4;
    id v5 = [v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)[v5 unsignedIntegerValue] - 1 <= (char *)3) {
      [(NCAudioPlayerController *)self updateProximityMonitoring];
    }

    unsigned int v4 = v6;
  }
}

- (void)handlePlayerItemDidPlayToEndTimeNotification:(id)a3
{
  unsigned int v4 = [a3 object];
  if (v4)
  {
    id v7 = v4;
    id v5 = [(NCAudioPlayerController *)self player];
    id v6 = [v5 currentItem];

    unsigned int v4 = v7;
    if (v7 == v6)
    {
      [(NCAudioPlayerController *)self stop];
      unsigned int v4 = v7;
    }
  }
}

- (void)handlePlayerItemFailedToPlayToEndTimeNotification:(id)a3
{
  id v10 = a3;
  unsigned int v4 = [v10 object];
  if (v4)
  {
    id v5 = [(NCAudioPlayerController *)self player];
    id v6 = [v5 currentItem];

    if (v4 == v6)
    {
      id v7 = [v10 userInfo];
      id v8 = v7;
      if (v7)
      {
        id v9 = [v7 objectForKeyedSubscript:AVPlayerItemFailedToPlayToEndTimeErrorKey];
        objc_opt_class();
        objc_opt_isKindOfClass();
      }
      [(NCAudioPlayerController *)self stop];
    }
  }
}

- (NCAudioPlayerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCAudioPlayerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (int64_t)playbackState
{
  return self->_playbackState;
}

- (float)rate
{
  return self->_rate;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isAudioSessionActive
{
  return self->_audioSessionActive;
}

- (int64_t)timeControlStatus
{
  return self->_timeControlStatus;
}

- (void)setTimeControlStatus:(int64_t)a3
{
  self->_timeControlStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end