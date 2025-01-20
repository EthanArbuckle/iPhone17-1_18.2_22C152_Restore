@interface SASExtractSpeechData
+ (id)extractSpeechData;
- (BOOL)requiresResponse;
- (NSNumber)endTime;
- (NSNumber)startTime;
- (NSString)audioOutputType;
- (NSString)speechRequestId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAudioOutputType:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setSpeechRequestId:(id)a3;
- (void)setStartTime:(id)a3;
@end

@implementation SASExtractSpeechData

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"ExtractSpeechData";
}

+ (id)extractSpeechData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)audioOutputType
{
  return (NSString *)[(AceObject *)self propertyForKey:@"audioOutputType"];
}

- (void)setAudioOutputType:(id)a3
{
}

- (NSNumber)endTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"endTime"];
}

- (void)setEndTime:(id)a3
{
}

- (NSString)speechRequestId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speechRequestId"];
}

- (void)setSpeechRequestId:(id)a3
{
}

- (NSNumber)startTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startTime"];
}

- (void)setStartTime:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end