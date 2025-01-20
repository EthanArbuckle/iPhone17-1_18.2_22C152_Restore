@interface VMAudioPlayerImp
- ($F24F406B2B787EFB06265DBA3D28CBD5)playableRange;
- (BOOL)looping;
- (BOOL)playing;
- (BOOL)silenceRemoverEnabled;
- (BOOL)startPlaying;
- (BOOL)stopPlaying;
- (BOOL)willPlayPendingPreparation;
- (NSError)playbackError;
- (NSString)recordingID;
- (RCSSavedRecordingAccessToken)playbackToken;
- (VMAudioPlayerController)controller;
- (VMAudioPlayerImp)init;
- (VMAudioService)service;
- (_TtC10VoiceMemos12VMPlayerItem)playerItem;
- (double)currentTime;
- (double)playerTime;
- (double)targetTime;
- (float)currentRate;
- (float)layerMix;
- (float)rate;
- (float)targetRate;
- (int)currentState;
- (int)targetState;
- (void)dealloc;
- (void)setController:(id)a3;
- (void)setCurrentRate:(float)a3;
- (void)setCurrentState:(int)a3;
- (void)setCurrentTime:(double)a3;
- (void)setLayerMix:(float)a3;
- (void)setLooping:(BOOL)a3;
- (void)setPlayableRange:(id)a3;
- (void)setPlaybackError:(id)a3;
- (void)setPlaybackToken:(id)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPlayerTime:(double)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRate:(float)a3;
- (void)setRecordingID:(id)a3;
- (void)setService:(id)a3;
- (void)setSilenceRemoverEnabled:(BOOL)a3;
- (void)setTargetRate:(float)a3;
- (void)setTargetState:(int)a3;
- (void)setTargetTime:(double)a3;
@end

@implementation VMAudioPlayerImp

- (VMAudioPlayerImp)init
{
  v3.receiver = self;
  v3.super_class = (Class)VMAudioPlayerImp;
  result = [(VMAudioPlayerImp *)&v3 init];
  if (result)
  {
    result->_targetRate = 1.0;
    result->_playableRange = ($93AB83F55FD8EAABF5C634313E89AB95)RCTimeRangeEverything;
  }
  return result;
}

- (void)dealloc
{
  [(VMAudioService *)self->_service stopPlaying:self];
  v3.receiver = self;
  v3.super_class = (Class)VMAudioPlayerImp;
  [(VMAudioPlayerImp *)&v3 dealloc];
}

- (void)setController:(id)a3
{
}

- (double)playerTime
{
  if ([(VMPlayerItem *)self->_playerItem seeking]) {
    return self->_targetTime;
  }
  playerItem = self->_playerItem;

  [(VMPlayerItem *)playerItem currentTime];
  return result;
}

- (void)setPlayerTime:(double)a3
{
  self->_targetTime = a3;
  -[VMAudioService setTime:controller:](self->_service, "setTime:controller:", self);
}

- (void)setCurrentRate:(float)a3
{
  self->_currentRate = a3;
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
}

- (void)setCurrentState:(int)a3
{
  int currentState = self->_currentState;
  self->_int currentState = a3;
  if ((a3 == 3) != [(VMAudioPlayerImp *)self playing]) {
    [(VMAudioPlayerImp *)self setPlaying:a3 == 3];
  }
  if (a3 == 4 && currentState == 3)
  {
    int targetState = self->_targetState;
    if (targetState == 4)
    {
      [(VMAudioPlayerImp *)self playerTime];
    }
    else
    {
      if (targetState != 3) {
        return;
      }
      double beginTime = self->_playableRange.beginTime;
    }
    self->_targetTime = beginTime;
  }
}

- (void)setPlaybackError:(id)a3
{
  objc_storeStrong((id *)&self->_playbackError, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  [WeakRetained setPlaybackError:v5];
}

- (BOOL)startPlaying
{
  self->_int targetState = 3;
  [(VMAudioService *)self->_service startPlaying:self];
  return 1;
}

- (BOOL)stopPlaying
{
  self->_int targetState = 4;
  return [(VMAudioService *)self->_service pausePlaying:self];
}

- (void)setLooping:(BOOL)a3
{
  BOOL v3 = a3;
  self->_looping = a3;
  v4 = [(VMAudioPlayerImp *)self playerItem];
  if (v4)
  {
    id v5 = v4;
    [v4 setLooping:v3];
    v4 = v5;
  }
}

- (float)rate
{
  return self->_targetRate;
}

- (void)setRate:(float)a3
{
  self->_targetRate = a3;
  -[VMAudioService setTargetRate:controller:](self->_service, "setTargetRate:controller:", self);
}

- (void)setSilenceRemoverEnabled:(BOOL)a3
{
  self->_silenceRemoverEnabled = a3;
  -[VMAudioService setSilenceRemoverEnabled:controller:](self->_service, "setSilenceRemoverEnabled:controller:");
}

- (void)setLayerMix:(float)a3
{
  self->_layerMix = a3;
  id v6 = [(VMAudioPlayerImp *)self playerItem];
  if (v6)
  {
    *(float *)&double v4 = a3;
    id v5 = sub_10005D850(v4);
    [v6 setTrackVolumes:v5];
  }
}

- (void)setPlayableRange:(id)a3
{
  double var1 = a3.var1;
  self->_playableRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
  double v4 = [(VMAudioPlayerImp *)self playerItem];
  if (v4)
  {
    id v5 = v4;
    [v4 setPlayableRangeEndTime:var1];
    double v4 = v5;
  }
}

- (BOOL)willPlayPendingPreparation
{
  if (self->_targetState != 3) {
    return 0;
  }
  if ((self->_currentState - 1) >= 2) {
    return [(VMPlayerItem *)self->_playerItem seeking];
  }
  return 1;
}

- (void)setPlayerItem:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_playerItem, a3);
  if (v7)
  {
    [v7 setLooping:self->_looping];
    *(float *)&double v5 = self->_layerMix;
    id v6 = sub_10005D850(v5);
    [v7 setTrackVolumes:v6];

    [v7 setPlayableRangeEndTime:self->_playableRange.endTime];
  }
}

- (float)targetRate
{
  return self->_targetRate;
}

- (void)setTargetRate:(float)a3
{
  self->_targetRate = a3;
}

- (double)targetTime
{
  return self->_targetTime;
}

- (void)setTargetTime:(double)a3
{
  self->_targetTime = a3;
}

- (int)targetState
{
  return self->_targetState;
}

- (void)setTargetState:(int)a3
{
  self->_int targetState = a3;
}

- (float)currentRate
{
  return self->_currentRate;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (int)currentState
{
  return self->_currentState;
}

- (NSString)recordingID
{
  return self->_recordingID;
}

- (void)setRecordingID:(id)a3
{
}

- (_TtC10VoiceMemos12VMPlayerItem)playerItem
{
  return self->_playerItem;
}

- (RCSSavedRecordingAccessToken)playbackToken
{
  return self->_playbackToken;
}

- (void)setPlaybackToken:(id)a3
{
}

- (NSError)playbackError
{
  return self->_playbackError;
}

- (VMAudioPlayerController)controller
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controller);

  return (VMAudioPlayerController *)WeakRetained;
}

- (BOOL)playing
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (BOOL)looping
{
  return self->_looping;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)playableRange
{
  double beginTime = self->_playableRange.beginTime;
  double endTime = self->_playableRange.endTime;
  result.double var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (BOOL)silenceRemoverEnabled
{
  return self->_silenceRemoverEnabled;
}

- (float)layerMix
{
  return self->_layerMix;
}

- (VMAudioService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_playbackError, 0);
  objc_storeStrong((id *)&self->_playbackToken, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);

  objc_storeStrong((id *)&self->_recordingID, 0);
}

@end