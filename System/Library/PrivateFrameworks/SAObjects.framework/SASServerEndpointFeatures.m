@interface SASServerEndpointFeatures
+ (id)serverEndpointFeatures;
- (BOOL)requiresResponse;
- (NSArray)pauseCounts;
- (NSString)taskName;
- (double)eosLikelihood;
- (double)silenceProbability;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)numOfWords;
- (int64_t)processedAudioDurationMs;
- (int64_t)trailingSilenceDuration;
- (void)setEosLikelihood:(double)a3;
- (void)setNumOfWords:(int64_t)a3;
- (void)setPauseCounts:(id)a3;
- (void)setProcessedAudioDurationMs:(int64_t)a3;
- (void)setSilenceProbability:(double)a3;
- (void)setTaskName:(id)a3;
- (void)setTrailingSilenceDuration:(int64_t)a3;
@end

@implementation SASServerEndpointFeatures

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ServerEndpointFeatures";
}

+ (id)serverEndpointFeatures
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)eosLikelihood
{
  return AceObjectDoubleForProperty(self, @"eosLikelihood");
}

- (void)setEosLikelihood:(double)a3
{
}

- (int64_t)numOfWords
{
  return AceObjectIntegerForProperty(self, @"numOfWords");
}

- (void)setNumOfWords:(int64_t)a3
{
}

- (NSArray)pauseCounts
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"pauseCounts"];
}

- (void)setPauseCounts:(id)a3
{
}

- (int64_t)processedAudioDurationMs
{
  return AceObjectIntegerForProperty(self, @"processedAudioDurationMs");
}

- (void)setProcessedAudioDurationMs:(int64_t)a3
{
}

- (double)silenceProbability
{
  return AceObjectDoubleForProperty(self, @"silenceProbability");
}

- (void)setSilenceProbability:(double)a3
{
}

- (NSString)taskName
{
  return (NSString *)[(AceObject *)self propertyForKey:@"taskName"];
}

- (void)setTaskName:(id)a3
{
}

- (int64_t)trailingSilenceDuration
{
  return AceObjectIntegerForProperty(self, @"trailingSilenceDuration");
}

- (void)setTrailingSilenceDuration:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end