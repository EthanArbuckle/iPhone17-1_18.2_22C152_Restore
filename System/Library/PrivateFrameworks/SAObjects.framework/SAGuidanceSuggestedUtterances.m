@interface SAGuidanceSuggestedUtterances
+ (id)suggestedUtterances;
- (NSArray)utterances;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setUtterances:(id)a3;
@end

@implementation SAGuidanceSuggestedUtterances

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"SuggestedUtterances";
}

+ (id)suggestedUtterances
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)utterances
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"utterances"];
}

- (void)setUtterances:(id)a3
{
}

@end