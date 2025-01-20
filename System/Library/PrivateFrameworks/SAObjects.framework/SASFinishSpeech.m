@interface SASFinishSpeech
+ (id)finishSpeech;
- (BOOL)requiresResponse;
- (NSArray)featuresAtEndpoint;
- (NSArray)orderedContext;
- (NSDictionary)serverFeatureLatencyDistribution;
- (NSString)endpoint;
- (double)totalAudioRecorded;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)packetCount;
- (void)setEndpoint:(id)a3;
- (void)setFeaturesAtEndpoint:(id)a3;
- (void)setOrderedContext:(id)a3;
- (void)setPacketCount:(int64_t)a3;
- (void)setServerFeatureLatencyDistribution:(id)a3;
- (void)setTotalAudioRecorded:(double)a3;
@end

@implementation SASFinishSpeech

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"FinishSpeech";
}

+ (id)finishSpeech
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)endpoint
{
  return (NSString *)[(AceObject *)self propertyForKey:@"endpoint"];
}

- (void)setEndpoint:(id)a3
{
}

- (NSArray)featuresAtEndpoint
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"featuresAtEndpoint"];
}

- (void)setFeaturesAtEndpoint:(id)a3
{
}

- (NSArray)orderedContext
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"orderedContext"];
}

- (void)setOrderedContext:(id)a3
{
}

- (int64_t)packetCount
{
  return AceObjectIntegerForProperty(self, @"packetCount");
}

- (void)setPacketCount:(int64_t)a3
{
}

- (NSDictionary)serverFeatureLatencyDistribution
{
  return (NSDictionary *)[(AceObject *)self propertyForKey:@"serverFeatureLatencyDistribution"];
}

- (void)setServerFeatureLatencyDistribution:(id)a3
{
}

- (double)totalAudioRecorded
{
  return AceObjectDoubleForProperty(self, @"totalAudioRecorded");
}

- (void)setTotalAudioRecorded:(double)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end