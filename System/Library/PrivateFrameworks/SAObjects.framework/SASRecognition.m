@interface SASRecognition
+ (id)recognition;
- (NSArray)phrases;
- (NSArray)utterances;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)sentenceConfidence;
- (void)setPhrases:(id)a3;
- (void)setSentenceConfidence:(int64_t)a3;
- (void)setUtterances:(id)a3;
@end

@implementation SASRecognition

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"Recognition";
}

+ (id)recognition
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)phrases
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"phrases", v3);
}

- (void)setPhrases:(id)a3
{
}

- (int64_t)sentenceConfidence
{
  return AceObjectIntegerForProperty(self, @"sentenceConfidence");
}

- (void)setSentenceConfidence:(int64_t)a3
{
}

- (NSArray)utterances
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"utterances", v3);
}

- (void)setUtterances:(id)a3
{
}

@end