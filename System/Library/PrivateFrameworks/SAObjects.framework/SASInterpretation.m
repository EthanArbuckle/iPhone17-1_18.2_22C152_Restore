@interface SASInterpretation
+ (id)interpretation;
- (BOOL)doNotDedup;
- (NSArray)tokens;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDoNotDedup:(BOOL)a3;
- (void)setTokens:(id)a3;
@end

@implementation SASInterpretation

- (id)groupIdentifier
{
  return @"com.apple.ace.speech";
}

- (id)encodedClassName
{
  return @"Interpretation";
}

+ (id)interpretation
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)doNotDedup
{
  return AceObjectBoolForProperty(self, @"doNotDedup");
}

- (void)setDoNotDedup:(BOOL)a3
{
}

- (NSArray)tokens
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"tokens", v3);
}

- (void)setTokens:(id)a3
{
}

@end