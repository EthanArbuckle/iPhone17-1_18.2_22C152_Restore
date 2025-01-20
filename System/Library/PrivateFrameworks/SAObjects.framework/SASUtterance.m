@interface SASUtterance
+ (id)utterance;
- (NSArray)interpretationIndices;
- (double)confidenceScore;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setConfidenceScore:(double)a3;
- (void)setInterpretationIndices:(id)a3;
@end

@implementation SASUtterance

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"Utterance";
}

+ (id)utterance
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (double)confidenceScore
{
  return AceObjectDoubleForProperty(self, @"confidenceScore");
}

- (void)setConfidenceScore:(double)a3
{
}

- (NSArray)interpretationIndices
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"interpretationIndices"];
}

- (void)setInterpretationIndices:(id)a3
{
}

@end