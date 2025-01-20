@interface MRAudioItem
- (AVPlayerItem)avPlayerItem;
- (MRAudioItem)initWithURL:(id)a3 startTime:(double)a4 andDuration:(double)a5;
- (double)duckInDuration;
- (double)duckOutDuration;
- (double)duration;
- (double)fadeInDuration;
- (double)fadeOutDuration;
- (double)localTimeOffset;
- (double)startTime;
- (float)duckLevel;
- (float)volume;
- (float)volumeAtTime:(double)a3;
- (void)dealloc;
- (void)gotoTime:(double)a3;
- (void)setDuckInDuration:(double)a3;
- (void)setDuckLevel:(float)a3;
- (void)setDuckOutDuration:(double)a3;
- (void)setFadeInDuration:(double)a3;
- (void)setFadeOutDuration:(double)a3;
- (void)setLocalTimeOffset:(double)a3;
- (void)setVolume:(float)a3;
- (void)syncVolumeToSong:(id)a3;
@end

@implementation MRAudioItem

- (MRAudioItem)initWithURL:(id)a3 startTime:(double)a4 andDuration:(double)a5
{
  v8 = [(MRAudioItem *)self init];
  if (v8)
  {
    v9 = +[AVPlayerItem playerItemWithURL:a3];
    v8->_avPlayerItem = v9;
    v8->_startTime = a4;
    v8->_duration = a5;
    if (v9)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v10 = [(AVPlayerItem *)v9 tracks];
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v18;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            if ((objc_msgSend(objc_msgSend(objc_msgSend(v15, "assetTrack"), "mediaType"), "isEqualToString:", AVMediaTypeAudio) & 1) == 0)objc_msgSend(v15, "setEnabled:", 0); {
          }
            }
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v12);
      }
      [(MRAudioItem *)v8 gotoTime:0.0];
    }
  }
  return v8;
}

- (void)dealloc
{
  self->_avPlayerItem = 0;
  v3.receiver = self;
  v3.super_class = (Class)MRAudioItem;
  [(MRAudioItem *)&v3 dealloc];
}

- (float)volumeAtTime:(double)a3
{
  double fadeInDuration = self->_fadeInDuration;
  float v4 = 1.0;
  float v5 = 1.0;
  if (fadeInDuration > 0.0) {
    float v5 = a3 / fadeInDuration;
  }
  double fadeOutDuration = self->_fadeOutDuration;
  if (fadeOutDuration > 0.0) {
    float v4 = (self->_duration - a3) / fadeOutDuration;
  }
  if (v5 >= self->_volume) {
    float result = self->_volume;
  }
  else {
    float result = v5;
  }
  if (v4 < result) {
    return v4;
  }
  return result;
}

- (void)gotoTime:(double)a3
{
  avPlayerItem = self->_avPlayerItem;
  CMTimeMake(&v8, (uint64_t)(a3 * 1000000.0), 1000000);
  long long v6 = *(_OWORD *)&kCMTimeZero.value;
  CMTimeEpoch epoch = kCMTimeZero.epoch;
  long long v4 = v6;
  CMTimeEpoch v5 = epoch;
  [(AVPlayerItem *)avPlayerItem seekToTime:&v8 toleranceBefore:&v6 toleranceAfter:&v4];
}

- (void)syncVolumeToSong:(id)a3
{
  [a3 volume];
  self->_volume = v5;
  [a3 fadeInDuration];
  self->_double fadeInDuration = v6;
  [a3 fadeOutDuration];
  self->_double fadeOutDuration = v7;
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (double)localTimeOffset
{
  return self->_localTimeOffset;
}

- (void)setLocalTimeOffset:(double)a3
{
  self->_localTimeOffset = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (double)fadeInDuration
{
  return self->_fadeInDuration;
}

- (void)setFadeInDuration:(double)a3
{
  self->_double fadeInDuration = a3;
}

- (double)fadeOutDuration
{
  return self->_fadeOutDuration;
}

- (void)setFadeOutDuration:(double)a3
{
  self->_double fadeOutDuration = a3;
}

- (float)duckLevel
{
  return self->_duckLevel;
}

- (void)setDuckLevel:(float)a3
{
  self->_duckLevel = a3;
}

- (double)duckInDuration
{
  return self->_duckInDuration;
}

- (void)setDuckInDuration:(double)a3
{
  self->_duckInDuration = a3;
}

- (double)duckOutDuration
{
  return self->_duckOutDuration;
}

- (void)setDuckOutDuration:(double)a3
{
  self->_duckOutDuration = a3;
}

@end