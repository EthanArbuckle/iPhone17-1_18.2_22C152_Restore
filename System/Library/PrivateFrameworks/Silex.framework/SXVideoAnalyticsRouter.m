@interface SXVideoAnalyticsRouter
- (BOOL)hasReroutedInitiatedPlaybackEvent;
- (NSMutableDictionary)reporters;
- (SXVideoAnalyticsRouter)initWithInitiatedPlaybackLocation:(unint64_t)a3 analyticsReporter:(id)a4;
- (id)analyticsReporterForEvent:(id)a3;
- (id)reporterForPlaybackLocation:(unint64_t)a3;
- (unint64_t)currentPlaybackLocation;
- (unint64_t)initiatedPlaybackLocation;
- (void)reportEvent:(id)a3;
- (void)setAnalyticsReporter:(id)a3 forPlaybackLocation:(unint64_t)a4;
- (void)setCurrentPlaybackLocation:(unint64_t)a3;
- (void)setHasReroutedInitiatedPlaybackEvent:(BOOL)a3;
@end

@implementation SXVideoAnalyticsRouter

- (SXVideoAnalyticsRouter)initWithInitiatedPlaybackLocation:(unint64_t)a3 analyticsReporter:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SXVideoAnalyticsRouter;
  v7 = [(SXVideoAnalyticsRouter *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    reporters = v7->_reporters;
    v7->_reporters = (NSMutableDictionary *)v8;

    v7->_currentPlaybackLocation = a3;
    v7->_initiatedPlaybackLocation = a3;
    [(SXVideoAnalyticsRouter *)v7 setAnalyticsReporter:v6 forPlaybackLocation:a3];
  }

  return v7;
}

- (void)setAnalyticsReporter:(id)a3 forPlaybackLocation:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v8 = [(SXVideoAnalyticsRouter *)self reporters];
    v7 = [NSNumber numberWithUnsignedInteger:a4];
    [v8 setObject:v6 forKey:v7];
  }
}

- (id)reporterForPlaybackLocation:(unint64_t)a3
{
  v4 = [(SXVideoAnalyticsRouter *)self reporters];
  v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)reportEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SXVideoAnalyticsRouter *)self analyticsReporterForEvent:v4];
  [v5 reportEvent:v4];
}

- (id)analyticsReporterForEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(SXVideoAnalyticsRouter *)self reporterForPlaybackLocation:[(SXVideoAnalyticsRouter *)self currentPlaybackLocation]];
  unint64_t v6 = [(SXVideoAnalyticsRouter *)self currentPlaybackLocation];
  if (v6 != [(SXVideoAnalyticsRouter *)self initiatedPlaybackLocation]
    && ![(SXVideoAnalyticsRouter *)self hasReroutedInitiatedPlaybackEvent])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 userAction] == 4)
    {
      uint64_t v7 = [(SXVideoAnalyticsRouter *)self reporterForPlaybackLocation:[(SXVideoAnalyticsRouter *)self initiatedPlaybackLocation]];

      [(SXVideoAnalyticsRouter *)self setHasReroutedInitiatedPlaybackEvent:1];
      id v5 = (void *)v7;
    }
  }

  return v5;
}

- (unint64_t)currentPlaybackLocation
{
  return self->_currentPlaybackLocation;
}

- (void)setCurrentPlaybackLocation:(unint64_t)a3
{
  self->_currentPlaybackLocation = a3;
}

- (unint64_t)initiatedPlaybackLocation
{
  return self->_initiatedPlaybackLocation;
}

- (NSMutableDictionary)reporters
{
  return self->_reporters;
}

- (BOOL)hasReroutedInitiatedPlaybackEvent
{
  return self->_hasReroutedInitiatedPlaybackEvent;
}

- (void)setHasReroutedInitiatedPlaybackEvent:(BOOL)a3
{
  self->_hasReroutedInitiatedPlaybackEvent = a3;
}

- (void).cxx_destruct
{
}

@end