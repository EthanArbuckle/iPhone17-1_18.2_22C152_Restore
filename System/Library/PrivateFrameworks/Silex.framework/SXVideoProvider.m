@interface SXVideoProvider
- (NSString)mediaIdentifier;
- (NSURL)URL;
- (SVTimeline)timeline;
- (SVVideoMetadata)metadata;
- (SXAnalyticsReporting)analyticsReporter;
- (SXVideoProvider)initWithURL:(id)a3;
- (double)pausedAtTime;
- (id)loadWithCompletionBlock:(id)a3;
- (unint64_t)playMethod;
- (void)muteStateChanged:(BOOL)a3;
- (void)playbackFailedWithError:(id)a3;
- (void)playbackFinished;
- (void)playbackInitiatedWithButtonTapped:(BOOL)a3;
- (void)playbackPassedQuartile:(unint64_t)a3;
- (void)playbackPaused;
- (void)playbackResumed;
- (void)playbackStarted;
- (void)setAnalyticsReporter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setPausedAtTime:(double)a3;
- (void)setPlayMethod:(unint64_t)a3;
@end

@implementation SXVideoProvider

- (SXVideoProvider)initWithURL:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SXVideoProvider;
  v6 = [(SXVideoProvider *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_URL, a3);
    v8 = (SVTimeline *)objc_alloc_init(MEMORY[0x263F6C6A0]);
    timeline = v7->_timeline;
    v7->_timeline = v8;

    v10 = objc_alloc_init(SXVideoMediaIdentifierGenerator);
    uint64_t v11 = [(SXVideoMediaIdentifierGenerator *)v10 identifierForURL:v5];
    mediaIdentifier = v7->_mediaIdentifier;
    v7->_mediaIdentifier = (NSString *)v11;
  }
  return v7;
}

- (id)loadWithCompletionBlock:(id)a3
{
  id v5 = a3;
  v6 = [(SXVideoProvider *)self URL];
  v7 = (*((void (**)(id, void *))a3 + 2))(v5, v6);

  [(SXVideoProvider *)self setMetadata:v7];
  return &__block_literal_global_58;
}

- (void)playbackInitiatedWithButtonTapped:(BOOL)a3
{
  if (a3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = 2;
  }
  [(SXVideoProvider *)self setPlayMethod:v4];
  v7 = objc_alloc_init(SXMediaEngageEvent);
  [(SXMediaEvent *)v7 setMediaType:2];
  [(SXMediaEngageEvent *)v7 setUserAction:4];
  [(SXMediaEvent *)v7 setVideoType:1];
  id v5 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v7 setMediaId:v5];

  [(SXMediaEngageEvent *)v7 setMediaPlayMethod:[(SXVideoProvider *)self playMethod]];
  [(SXAnalyticsEvent *)v7 determineEndDate];
  v6 = [(SXVideoProvider *)self analyticsReporter];
  [v6 reportEvent:v7];
}

- (void)playbackStarted
{
  v9 = objc_alloc_init(SXMediaEngageEvent);
  [(SXMediaEvent *)v9 setMediaType:2];
  v3 = [(SXVideoProvider *)self metadata];
  [v3 duration];
  -[SXMediaEngageEvent setMediaDuration:](v9, "setMediaDuration:");

  uint64_t v4 = [(SXVideoProvider *)self metadata];
  [v4 framerate];
  -[SXMediaEngageEvent setMediaFrameRate:](v9, "setMediaFrameRate:");

  [(SXMediaEngageEvent *)v9 setUserAction:1];
  [(SXMediaEvent *)v9 setVideoType:1];
  id v5 = [(SXVideoProvider *)self metadata];
  -[SXMediaEngageEvent setMuted:](v9, "setMuted:", [v5 muted]);

  v6 = [(SXVideoProvider *)self metadata];
  [v6 volume];
  -[SXMediaEngageEvent setVolume:](v9, "setVolume:");

  v7 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v9 setMediaId:v7];

  [(SXMediaEngageEvent *)v9 setMediaPlayMethod:[(SXVideoProvider *)self playMethod]];
  [(SXAnalyticsEvent *)v9 determineEndDate];
  v8 = [(SXVideoProvider *)self analyticsReporter];
  [v8 reportEvent:v9];
}

- (void)playbackPaused
{
  v12 = objc_alloc_init(SXMediaEngageEvent);
  [(SXMediaEvent *)v12 setMediaType:2];
  v3 = [(SXVideoProvider *)self metadata];
  [v3 duration];
  -[SXMediaEngageEvent setMediaDuration:](v12, "setMediaDuration:");

  uint64_t v4 = [(SXVideoProvider *)self metadata];
  [v4 framerate];
  -[SXMediaEngageEvent setMediaFrameRate:](v12, "setMediaFrameRate:");

  [(SXMediaEngageEvent *)v12 setUserAction:2];
  id v5 = [(SXVideoProvider *)self metadata];
  [v5 time];
  [(SXMediaEngageEvent *)v12 setMediaPausePosition:(unint64_t)v6];

  v7 = [(SXVideoProvider *)self metadata];
  [v7 timePlayed];
  -[SXMediaEngageEvent setMediaTimePlayed:](v12, "setMediaTimePlayed:");

  [(SXMediaEvent *)v12 setVideoType:1];
  v8 = [(SXVideoProvider *)self metadata];
  -[SXMediaEngageEvent setMuted:](v12, "setMuted:", [v8 muted]);

  v9 = [(SXVideoProvider *)self metadata];
  [v9 volume];
  -[SXMediaEngageEvent setVolume:](v12, "setVolume:");

  v10 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v12 setMediaId:v10];

  [(SXAnalyticsEvent *)v12 determineEndDate];
  uint64_t v11 = [(SXVideoProvider *)self analyticsReporter];
  [v11 reportEvent:v12];
}

- (void)playbackResumed
{
  v12 = objc_alloc_init(SXMediaEngageEvent);
  [(SXMediaEvent *)v12 setMediaType:2];
  v3 = [(SXVideoProvider *)self metadata];
  [v3 duration];
  -[SXMediaEngageEvent setMediaDuration:](v12, "setMediaDuration:");

  uint64_t v4 = [(SXVideoProvider *)self metadata];
  [v4 framerate];
  -[SXMediaEngageEvent setMediaFrameRate:](v12, "setMediaFrameRate:");

  [(SXMediaEngageEvent *)v12 setUserAction:3];
  id v5 = [(SXVideoProvider *)self metadata];
  [v5 time];
  [(SXMediaEngageEvent *)v12 setMediaResumePosition:(unint64_t)v6];

  v7 = [(SXVideoProvider *)self metadata];
  [v7 timePlayed];
  -[SXMediaEngageEvent setMediaTimePlayed:](v12, "setMediaTimePlayed:");

  [(SXMediaEvent *)v12 setVideoType:1];
  v8 = [(SXVideoProvider *)self metadata];
  -[SXMediaEngageEvent setMuted:](v12, "setMuted:", [v8 muted]);

  v9 = [(SXVideoProvider *)self metadata];
  [v9 volume];
  -[SXMediaEngageEvent setVolume:](v12, "setVolume:");

  v10 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v12 setMediaId:v10];

  [(SXAnalyticsEvent *)v12 determineEndDate];
  uint64_t v11 = [(SXVideoProvider *)self analyticsReporter];
  [v11 reportEvent:v12];
}

- (void)playbackFinished
{
  v8 = objc_alloc_init(SXMediaEngageCompleteEvent);
  [(SXMediaEvent *)v8 setMediaType:2];
  v3 = [(SXVideoProvider *)self metadata];
  [v3 timePlayed];
  -[SXMediaEngageCompleteEvent setMediaTimePlayed:](v8, "setMediaTimePlayed:");

  uint64_t v4 = [(SXVideoProvider *)self metadata];
  [v4 duration];
  -[SXMediaEngageCompleteEvent setMediaDuration:](v8, "setMediaDuration:");

  id v5 = [(SXVideoProvider *)self metadata];
  [v5 framerate];
  -[SXMediaEngageCompleteEvent setMediaFrameRate:](v8, "setMediaFrameRate:");

  [(SXMediaEvent *)v8 setVideoType:1];
  double v6 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v8 setMediaId:v6];

  [(SXAnalyticsEvent *)v8 determineEndDate];
  v7 = [(SXVideoProvider *)self analyticsReporter];
  [v7 reportEvent:v8];
}

- (void)playbackFailedWithError:(id)a3
{
  id v4 = a3;
  v7 = objc_alloc_init(SXMediaEngageEvent);
  [(SXMediaEvent *)v7 setMediaType:2];
  [(SXMediaEngageEvent *)v7 setUserAction:6];
  [(SXMediaEvent *)v7 setVideoType:1];
  [(SXMediaEngageEvent *)v7 setError:v4];

  id v5 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v7 setMediaId:v5];

  [(SXAnalyticsEvent *)v7 determineEndDate];
  double v6 = [(SXVideoProvider *)self analyticsReporter];
  [v6 reportEvent:v7];
}

- (void)muteStateChanged:(BOOL)a3
{
  v10 = objc_alloc_init(SXMediaEngageEvent);
  [(SXMediaEvent *)v10 setMediaType:2];
  id v4 = [(SXVideoProvider *)self metadata];
  [v4 duration];
  -[SXMediaEngageEvent setMediaDuration:](v10, "setMediaDuration:");

  [(SXMediaEngageEvent *)v10 setUserAction:5];
  id v5 = [(SXVideoProvider *)self metadata];
  [v5 timePlayed];
  -[SXMediaEngageEvent setMediaTimePlayed:](v10, "setMediaTimePlayed:");

  [(SXMediaEvent *)v10 setVideoType:1];
  double v6 = [(SXVideoProvider *)self metadata];
  -[SXMediaEngageEvent setMuted:](v10, "setMuted:", [v6 muted]);

  v7 = [(SXVideoProvider *)self metadata];
  [v7 volume];
  -[SXMediaEngageEvent setVolume:](v10, "setVolume:");

  v8 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v10 setMediaId:v8];

  [(SXAnalyticsEvent *)v10 determineEndDate];
  v9 = [(SXVideoProvider *)self analyticsReporter];
  [v9 reportEvent:v10];
}

- (void)playbackPassedQuartile:(unint64_t)a3
{
  double v6 = [[SXVideoQuartileEvent alloc] initWithQuartile:a3];
  [(SXMediaEvent *)v6 setVideoType:1];
  id v4 = [(SXVideoProvider *)self mediaIdentifier];
  [(SXMediaEvent *)v6 setMediaId:v4];

  [(SXAnalyticsEvent *)v6 determineEndDate];
  id v5 = [(SXVideoProvider *)self analyticsReporter];
  [v5 reportEvent:v6];
}

- (NSURL)URL
{
  return self->_URL;
}

- (SXAnalyticsReporting)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (SVVideoMetadata)metadata
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metadata);
  return (SVVideoMetadata *)WeakRetained;
}

- (void)setMetadata:(id)a3
{
}

- (SVTimeline)timeline
{
  return self->_timeline;
}

- (double)pausedAtTime
{
  return self->_pausedAtTime;
}

- (void)setPausedAtTime:(double)a3
{
  self->_pausedAtTime = a3;
}

- (NSString)mediaIdentifier
{
  return self->_mediaIdentifier;
}

- (unint64_t)playMethod
{
  return self->_playMethod;
}

- (void)setPlayMethod:(unint64_t)a3
{
  self->_playMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaIdentifier, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_destroyWeak((id *)&self->_metadata);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end