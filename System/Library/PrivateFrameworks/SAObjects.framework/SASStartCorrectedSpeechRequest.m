@interface SASStartCorrectedSpeechRequest
+ (id)startCorrectedSpeechRequest;
- (BOOL)onDeviceUtterancesPresent;
- (BOOL)requiresResponse;
- (NSString)interactionId;
- (NSString)previousUtterance;
- (NSString)sessionId;
- (NSString)utteranceSource;
- (double)combinedScore;
- (double)originalScore;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)combinedRank;
- (int64_t)originalRank;
- (void)setCombinedRank:(int64_t)a3;
- (void)setCombinedScore:(double)a3;
- (void)setInteractionId:(id)a3;
- (void)setOnDeviceUtterancesPresent:(BOOL)a3;
- (void)setOriginalRank:(int64_t)a3;
- (void)setOriginalScore:(double)a3;
- (void)setPreviousUtterance:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setUtteranceSource:(id)a3;
@end

@implementation SASStartCorrectedSpeechRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"StartCorrectedSpeechRequest";
}

+ (id)startCorrectedSpeechRequest
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (int64_t)combinedRank
{
  return AceObjectIntegerForProperty(self, @"combinedRank");
}

- (void)setCombinedRank:(int64_t)a3
{
}

- (double)combinedScore
{
  return AceObjectDoubleForProperty(self, @"combinedScore");
}

- (void)setCombinedScore:(double)a3
{
}

- (NSString)interactionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionId"];
}

- (void)setInteractionId:(id)a3
{
}

- (BOOL)onDeviceUtterancesPresent
{
  return AceObjectBoolForProperty(self, @"onDeviceUtterancesPresent");
}

- (void)setOnDeviceUtterancesPresent:(BOOL)a3
{
}

- (int64_t)originalRank
{
  return AceObjectIntegerForProperty(self, @"originalRank");
}

- (void)setOriginalRank:(int64_t)a3
{
}

- (double)originalScore
{
  return AceObjectDoubleForProperty(self, @"originalScore");
}

- (void)setOriginalScore:(double)a3
{
}

- (NSString)previousUtterance
{
  return (NSString *)[(AceObject *)self propertyForKey:@"previousUtterance"];
}

- (void)setPreviousUtterance:(id)a3
{
}

- (NSString)sessionId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"sessionId"];
}

- (void)setSessionId:(id)a3
{
}

- (NSString)utteranceSource
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utteranceSource"];
}

- (void)setUtteranceSource:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 1;
}

@end