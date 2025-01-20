@interface SACardShowNextCard
+ (id)showNextCard;
- (BOOL)requiresResponse;
- (SACardSnippet)cardSnippet;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setCardSnippet:(id)a3;
@end

@implementation SACardShowNextCard

- (id)groupIdentifier
{
  return @"com.apple.ace.ui.card";
}

- (id)encodedClassName
{
  return @"ShowNextCard";
}

+ (id)showNextCard
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SACardSnippet)cardSnippet
{
  return (SACardSnippet *)AceObjectAceObjectForProperty(self, @"cardSnippet");
}

- (void)setCardSnippet:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end