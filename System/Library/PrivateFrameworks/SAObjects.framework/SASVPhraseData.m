@interface SASVPhraseData
+ (id)phraseData;
- (NSArray)interpretationDataList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInterpretationDataList:(id)a3;
@end

@implementation SASVPhraseData

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"PhraseData";
}

+ (id)phraseData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)interpretationDataList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"interpretationDataList", v3);
}

- (void)setInterpretationDataList:(id)a3
{
}

@end