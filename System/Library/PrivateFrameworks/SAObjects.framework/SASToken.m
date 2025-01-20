@interface SASToken
+ (id)token;
- (BOOL)addSpaceAfter;
- (BOOL)removeSpaceAfter;
- (BOOL)removeSpaceBefore;
- (NSNumber)confidenceScore;
- (NSNumber)endTime;
- (NSNumber)silenceStartTime;
- (NSNumber)startTime;
- (NSString)ipaPhoneSequence;
- (NSString)originalText;
- (NSString)phoneSequence;
- (NSString)recognitionStability;
- (NSString)text;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAddSpaceAfter:(BOOL)a3;
- (void)setConfidenceScore:(id)a3;
- (void)setEndTime:(id)a3;
- (void)setIpaPhoneSequence:(id)a3;
- (void)setOriginalText:(id)a3;
- (void)setPhoneSequence:(id)a3;
- (void)setRecognitionStability:(id)a3;
- (void)setRemoveSpaceAfter:(BOOL)a3;
- (void)setRemoveSpaceBefore:(BOOL)a3;
- (void)setSilenceStartTime:(id)a3;
- (void)setStartTime:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SASToken

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"Token";
}

+ (id)token
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)addSpaceAfter
{
  return AceObjectBoolForProperty(self, @"addSpaceAfter");
}

- (void)setAddSpaceAfter:(BOOL)a3
{
}

- (NSNumber)confidenceScore
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"confidenceScore"];
}

- (void)setConfidenceScore:(id)a3
{
}

- (NSNumber)endTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"endTime"];
}

- (void)setEndTime:(id)a3
{
}

- (NSString)ipaPhoneSequence
{
  return (NSString *)[(AceObject *)self propertyForKey:@"ipaPhoneSequence"];
}

- (void)setIpaPhoneSequence:(id)a3
{
}

- (NSString)originalText
{
  return (NSString *)[(AceObject *)self propertyForKey:@"originalText"];
}

- (void)setOriginalText:(id)a3
{
}

- (NSString)phoneSequence
{
  return (NSString *)[(AceObject *)self propertyForKey:@"phoneSequence"];
}

- (void)setPhoneSequence:(id)a3
{
}

- (NSString)recognitionStability
{
  return (NSString *)[(AceObject *)self propertyForKey:@"recognitionStability"];
}

- (void)setRecognitionStability:(id)a3
{
}

- (BOOL)removeSpaceAfter
{
  return AceObjectBoolForProperty(self, @"removeSpaceAfter");
}

- (void)setRemoveSpaceAfter:(BOOL)a3
{
}

- (BOOL)removeSpaceBefore
{
  return AceObjectBoolForProperty(self, @"removeSpaceBefore");
}

- (void)setRemoveSpaceBefore:(BOOL)a3
{
}

- (NSNumber)silenceStartTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"silenceStartTime"];
}

- (void)setSilenceStartTime:(id)a3
{
}

- (NSNumber)startTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"startTime"];
}

- (void)setStartTime:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(AceObject *)self propertyForKey:@"text"];
}

- (void)setText:(id)a3
{
}

@end