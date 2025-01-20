@interface SAGuidanceGuideUpdate
+ (id)guideUpdate;
- (BOOL)mutatingCommand;
- (BOOL)requiresResponse;
- (NSNumber)guideTag;
- (NSString)languageCode;
- (SAGuidanceGuideSnippet)guideSnippet;
- (SAGuidanceSuggestedUtterances)suggestedUtterances;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setGuideSnippet:(id)a3;
- (void)setGuideTag:(id)a3;
- (void)setLanguageCode:(id)a3;
- (void)setSuggestedUtterances:(id)a3;
@end

@implementation SAGuidanceGuideUpdate

- (id)groupIdentifier
{
  return @"com.apple.ace.guidance";
}

- (id)encodedClassName
{
  return @"GuideUpdate";
}

+ (id)guideUpdate
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (SAGuidanceGuideSnippet)guideSnippet
{
  return (SAGuidanceGuideSnippet *)AceObjectAceObjectForProperty(self, @"guideSnippet");
}

- (void)setGuideSnippet:(id)a3
{
}

- (NSNumber)guideTag
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"guideTag"];
}

- (void)setGuideTag:(id)a3
{
}

- (NSString)languageCode
{
  return (NSString *)[(AceObject *)self propertyForKey:@"languageCode"];
}

- (void)setLanguageCode:(id)a3
{
}

- (SAGuidanceSuggestedUtterances)suggestedUtterances
{
  return (SAGuidanceSuggestedUtterances *)AceObjectAceObjectForProperty(self, @"suggestedUtterances");
}

- (void)setSuggestedUtterances:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

- (BOOL)mutatingCommand
{
  return 0;
}

@end