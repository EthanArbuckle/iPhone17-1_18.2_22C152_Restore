@interface SAConfidenceScores
+ (id)confidenceScores;
- (BOOL)requiresResponse;
- (NSArray)scores;
- (NSNumber)scoringSchemeVersion;
- (NSString)assetVersion;
- (NSString)classifiedUser;
- (NSString)thresholdType;
- (NSString)userIdentityClassification;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)lowScoreThreshold;
- (int64_t)processedAudioDurationMilliseconds;
- (void)setAssetVersion:(id)a3;
- (void)setClassifiedUser:(id)a3;
- (void)setLowScoreThreshold:(int64_t)a3;
- (void)setProcessedAudioDurationMilliseconds:(int64_t)a3;
- (void)setScores:(id)a3;
- (void)setScoringSchemeVersion:(id)a3;
- (void)setThresholdType:(id)a3;
- (void)setUserIdentityClassification:(id)a3;
@end

@implementation SAConfidenceScores

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"ConfidenceScores";
}

+ (id)confidenceScores
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)assetVersion
{
  return (NSString *)[(AceObject *)self propertyForKey:@"assetVersion"];
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)classifiedUser
{
  return (NSString *)[(AceObject *)self propertyForKey:@"classifiedUser"];
}

- (void)setClassifiedUser:(id)a3
{
}

- (int64_t)lowScoreThreshold
{
  return AceObjectIntegerForProperty(self, @"lowScoreThreshold");
}

- (void)setLowScoreThreshold:(int64_t)a3
{
}

- (int64_t)processedAudioDurationMilliseconds
{
  return AceObjectIntegerForProperty(self, @"processedAudioDurationMilliseconds");
}

- (void)setProcessedAudioDurationMilliseconds:(int64_t)a3
{
}

- (NSArray)scores
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"scores", v3);
}

- (void)setScores:(id)a3
{
}

- (NSNumber)scoringSchemeVersion
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"scoringSchemeVersion"];
}

- (void)setScoringSchemeVersion:(id)a3
{
}

- (NSString)thresholdType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"thresholdType"];
}

- (void)setThresholdType:(id)a3
{
}

- (NSString)userIdentityClassification
{
  return (NSString *)[(AceObject *)self propertyForKey:@"userIdentityClassification"];
}

- (void)setUserIdentityClassification:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end