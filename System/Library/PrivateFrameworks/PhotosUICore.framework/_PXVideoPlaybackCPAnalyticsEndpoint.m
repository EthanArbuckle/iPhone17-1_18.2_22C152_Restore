@interface _PXVideoPlaybackCPAnalyticsEndpoint
- (NSString)loggingIdentifier;
- (void)playbackRequested;
- (void)sendPayload:(_PXVideoPlaybackReporterPayload *)a3;
- (void)setLoggingIdentifier:(id)a3;
@end

@implementation _PXVideoPlaybackCPAnalyticsEndpoint

- (void).cxx_destruct
{
}

- (void)setLoggingIdentifier:(id)a3
{
}

- (NSString)loggingIdentifier
{
  return self->loggingIdentifier;
}

- (void)sendPayload:(_PXVideoPlaybackReporterPayload *)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a3->var3 == 1)
  {
    int64_t signpost = self->_signpost;
    if (signpost)
    {
      v5 = (void *)MEMORY[0x1E4F56658];
      uint64_t v6 = *MEMORY[0x1E4F56440];
      uint64_t v8 = *MEMORY[0x1E4F56580];
      v9[0] = @"com.apple.photos.CPAnalytics.videoSessionPlaybackLatency";
      v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [v5 endSignpost:signpost forEventName:v6 withPayload:v7];

      self->_int64_t signpost = 0;
    }
  }
}

- (void)playbackRequested
{
  self->_int64_t signpost = [MEMORY[0x1E4F56658] startSignpost];
}

@end