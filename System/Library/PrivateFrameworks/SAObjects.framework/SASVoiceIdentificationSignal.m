@interface SASVoiceIdentificationSignal
+ (id)voiceIdentificationSignal;
- (BOOL)recordUserAudio;
- (BOOL)requiresResponse;
- (NSString)resultCandidateId;
- (NSString)selectedSharedUserId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setRecordUserAudio:(BOOL)a3;
- (void)setResultCandidateId:(id)a3;
- (void)setSelectedSharedUserId:(id)a3;
@end

@implementation SASVoiceIdentificationSignal

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"VoiceIdentificationSignal";
}

+ (id)voiceIdentificationSignal
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)recordUserAudio
{
  return AceObjectBoolForProperty(self, @"recordUserAudio");
}

- (void)setRecordUserAudio:(BOOL)a3
{
}

- (NSString)resultCandidateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"resultCandidateId"];
}

- (void)setResultCandidateId:(id)a3
{
}

- (NSString)selectedSharedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectedSharedUserId"];
}

- (void)setSelectedSharedUserId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end