@interface SASVInterpretationData
+ (id)interpretationData;
- (NSArray)tokenDataList;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setTokenDataList:(id)a3;
@end

@implementation SASVInterpretationData

- (id)groupIdentifier
{
  return @"com.apple.ace.vector";
}

- (id)encodedClassName
{
  return @"InterpretationData";
}

+ (id)interpretationData
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)tokenDataList
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"tokenDataList", v3);
}

- (void)setTokenDataList:(id)a3
{
}

@end