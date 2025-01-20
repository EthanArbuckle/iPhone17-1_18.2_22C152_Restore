@interface VUIUpsellOnExitPolicy
- (BOOL)showUpsell;
- (NSArray)rateLimitPolicies;
- (NSNumber)playbackThreshold;
- (VUIUpsellOnExitPolicy)initWithDictionary:(id)a3;
- (int64_t)thresholdValueType;
- (void)setPlaybackThreshold:(id)a3;
- (void)setRateLimitPolicies:(id)a3;
- (void)setShowUpsell:(BOOL)a3;
- (void)setThresholdValueType:(int64_t)a3;
@end

@implementation VUIUpsellOnExitPolicy

- (VUIUpsellOnExitPolicy)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VUIUpsellOnExitPolicy;
  v5 = [(VUIUpsellOnExitPolicy *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"displayPolicy"];
    uint64_t v7 = [v4 objectForKey:@"rateLimitPolicies"];
    rateLimitPolicies = v5->_rateLimitPolicies;
    v5->_rateLimitPolicies = (NSArray *)v7;

    v9 = [v4 objectForKey:@"showExitUpsell"];
    v5->_showUpsell = [v9 BOOLValue];

    if (v6 && v5->_rateLimitPolicies)
    {
      uint64_t v10 = [v6 objectForKey:@"playbackInSeconds"];
      uint64_t v11 = [v6 objectForKey:@"playbackPercentage"];
      if (v11 | v10)
      {
        if (v11)
        {
          v5->_thresholdValueType = 0;
          v12 = (void *)v11;
        }
        else
        {
          v5->_thresholdValueType = 1;
          v12 = (void *)v10;
        }
        objc_storeStrong((id *)&v5->_playbackThreshold, v12);
      }
      else
      {
        v5->_showUpsell = 0;
      }
    }
    else
    {
      v5->_showUpsell = 0;
    }
  }
  return v5;
}

- (int64_t)thresholdValueType
{
  return self->_thresholdValueType;
}

- (void)setThresholdValueType:(int64_t)a3
{
  self->_thresholdValueType = a3;
}

- (NSNumber)playbackThreshold
{
  return self->_playbackThreshold;
}

- (void)setPlaybackThreshold:(id)a3
{
}

- (NSArray)rateLimitPolicies
{
  return self->_rateLimitPolicies;
}

- (void)setRateLimitPolicies:(id)a3
{
}

- (BOOL)showUpsell
{
  return self->_showUpsell;
}

- (void)setShowUpsell:(BOOL)a3
{
  self->_showUpsell = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitPolicies, 0);
  objc_storeStrong((id *)&self->_playbackThreshold, 0);
}

@end