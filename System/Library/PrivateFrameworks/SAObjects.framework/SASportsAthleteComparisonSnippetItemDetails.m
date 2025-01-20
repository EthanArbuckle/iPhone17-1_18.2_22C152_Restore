@interface SASportsAthleteComparisonSnippetItemDetails
+ (id)athleteComparisonSnippetItemDetails;
- (SASportsMetadata)metadata;
- (SAUIAppPunchOut)leagueAppPunchOut;
- (SAUIAppPunchOut)providerPunchOut;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setLeagueAppPunchOut:(id)a3;
- (void)setMetadata:(id)a3;
- (void)setProviderPunchOut:(id)a3;
@end

@implementation SASportsAthleteComparisonSnippetItemDetails

- (id)groupIdentifier
{
  return @"com.apple.ace.sports";
}

- (id)encodedClassName
{
  return @"AthleteComparisonSnippetItemDetails";
}

+ (id)athleteComparisonSnippetItemDetails
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAUIAppPunchOut)leagueAppPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"leagueAppPunchOut");
}

- (void)setLeagueAppPunchOut:(id)a3
{
}

- (SASportsMetadata)metadata
{
  return (SASportsMetadata *)AceObjectAceObjectForProperty(self, @"metadata");
}

- (void)setMetadata:(id)a3
{
}

- (SAUIAppPunchOut)providerPunchOut
{
  return (SAUIAppPunchOut *)AceObjectAceObjectForProperty(self, @"providerPunchOut");
}

- (void)setProviderPunchOut:(id)a3
{
}

@end