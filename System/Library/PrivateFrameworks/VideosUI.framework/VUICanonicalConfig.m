@interface VUICanonicalConfig
- (NSString)storeTabIdentifier;
- (NSString)tvShowsTabIdentifier;
- (VUICanonicalConfig)init;
- (double)playbackDelayInterval;
- (float)videoViewOffscreenThresholdToStopPlayback;
- (void)setPlaybackDelayInterval:(double)a3;
- (void)setStoreTabIdentifier:(id)a3;
- (void)setTvShowsTabIdentifier:(id)a3;
- (void)setVideoViewOffscreenThresholdToStopPlayback:(float)a3;
@end

@implementation VUICanonicalConfig

- (void)setVideoViewOffscreenThresholdToStopPlayback:(float)a3
{
  self->_videoViewOffscreenThresholdToStopPlayback = a3;
}

- (void)setTvShowsTabIdentifier:(id)a3
{
}

- (void)setPlaybackDelayInterval:(double)a3
{
  self->_playbackDelayInterval = a3;
}

- (VUICanonicalConfig)init
{
  v5.receiver = self;
  v5.super_class = (Class)VUICanonicalConfig;
  v2 = [(VUICanonicalConfig *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_videoViewOffscreenThresholdToStopPlayback = 0.5;
    v2->_playbackDelayInterval = 2.0;
    objc_storeStrong((id *)&v2->_storeTabIdentifier, @"store");
    objc_storeStrong((id *)&v3->_tvShowsTabIdentifier, @"tv");
  }
  return v3;
}

- (float)videoViewOffscreenThresholdToStopPlayback
{
  return self->_videoViewOffscreenThresholdToStopPlayback;
}

- (double)playbackDelayInterval
{
  return self->_playbackDelayInterval;
}

- (NSString)storeTabIdentifier
{
  return self->_storeTabIdentifier;
}

- (void)setStoreTabIdentifier:(id)a3
{
}

- (NSString)tvShowsTabIdentifier
{
  return self->_tvShowsTabIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tvShowsTabIdentifier, 0);
  objc_storeStrong((id *)&self->_storeTabIdentifier, 0);
}

@end