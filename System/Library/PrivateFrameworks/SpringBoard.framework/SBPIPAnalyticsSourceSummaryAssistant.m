@interface SBPIPAnalyticsSourceSummaryAssistant
- (SBPIPAnalyticsSourceSummaryAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6;
- (id)_generateMutableAnalyticsPayload;
- (id)analyticsIdentifier;
- (void)invalidate;
- (void)noteBecameActiveAtTime:(double)a3;
- (void)notePIPBecamePossibleAtTime:(double)a3;
- (void)notePIPBecameProhibitedAtTime:(double)a3;
@end

@implementation SBPIPAnalyticsSourceSummaryAssistant

- (SBPIPAnalyticsSourceSummaryAssistant)initWithBundleIdentifier:(id)a3 contentType:(int64_t)a4 isAutoPIPEnabled:(BOOL)a5 invalidationBlock:(id)a6
{
  v7.receiver = self;
  v7.super_class = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  result = [(SBPIPAnalyticsAssistant *)&v7 initWithBundleIdentifier:a3 contentType:a4 isAutoPIPEnabled:a5 invalidationBlock:a6];
  if (result) {
    result->_possibleTimestamp = NAN;
  }
  return result;
}

- (id)analyticsIdentifier
{
  return @"com.apple.SpringBoard.PictureInPictureSourceLifecycleSummary";
}

- (void)notePIPBecamePossibleAtTime:(double)a3
{
}

- (void)notePIPBecameProhibitedAtTime:(double)a3
{
  self->_possibleDuration  = a3 - self->_possibleTimestamp + self->_possibleDuration;
  self->_possibleTimestamp  = NAN;
}

- (void)noteBecameActiveAtTime:(double)a3
{
  self->_PIPBecameActive  = 1;
  v3.receiver  = self;
  v3.super_class  = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  [(SBPIPAnalyticsAssistant *)&v3 noteBecameActiveAtTime:a3];
}

- (id)_generateMutableAnalyticsPayload
{
  v7.receiver  = self;
  v7.super_class  = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  v3  = [(SBPIPAnalyticsAssistant *)&v7 _generateMutableAnalyticsPayload];
  v4  = [NSNumber numberWithBool:self->_PIPBecameActive];
  [v3 setObject:v4 forKeyedSubscript:@"PIPBecameActive"];

  v5  = [NSNumber numberWithDouble:self->_possibleDuration];
  [v3 setObject:v5 forKeyedSubscript:@"PossibleOrActiveDuration"];

  return v3;
}

- (void)invalidate
{
  [(SBPIPAnalyticsSourceSummaryAssistant *)self notePIPBecameProhibitedAtTime:CFAbsoluteTimeGetCurrent()];
  v3.receiver  = self;
  v3.super_class  = (Class)SBPIPAnalyticsSourceSummaryAssistant;
  [(SBPIPAnalyticsAssistant *)&v3 invalidate];
}

@end