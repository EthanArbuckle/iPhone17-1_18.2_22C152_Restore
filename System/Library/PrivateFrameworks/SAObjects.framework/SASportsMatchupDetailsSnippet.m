@interface SASportsMatchupDetailsSnippet
+ (id)matchupDetailsSnippet;
- (BOOL)isModalView;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setIsModalView:(BOOL)a3;
@end

@implementation SASportsMatchupDetailsSnippet

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"MatchupDetailsSnippet";
}

+ (id)matchupDetailsSnippet
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)isModalView
{
  return AceObjectBoolForProperty(self, @"isModalView");
}

- (void)setIsModalView:(BOOL)a3
{
}

@end